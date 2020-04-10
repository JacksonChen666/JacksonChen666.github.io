var dSettings = {
	'refreshInterval': 750,
	'autoRefresh': true,
	'instantRefresh': false,
	'tabSize': 4,
	'fontSize': 15,
	'wrapping': false,
	'lightMode': false
};
var settings = dSettings;
var instantRefresh;
var saved = false; // As an actual file
var fileName;
var wideLocalStorageName = "RTE_HTML"; // Let's just stick with it
var mainFunctions = [];
var windowExternalWindow;
var windowFeatures = "menubar=yes,location=no,resizable=yes,scrollbars=no,status=yes,fullscreen=yes";
var childWindowChecking;
var allowRefresh = sessionStorage.allowRefresh;

function settingsCheck() {
	if (typeof localStorage.getItem("settings") === null || typeof localStorage.getItem("settings") === undefined || localStorage.getItem('settings') == '') {
		localStorage.setItem("settings", JSON.stringify(dSettings));
		return dSettings;
	} else {
		var TempSettings = localStorage.getItem("settings");
		settings = JSON.parse(TempSettings); // https://stackoverflow.com/a/2010948/13104233
		instantRefreshCheck();
		document.getElementById('editor-textarea').style.fontSize = settings.fontSize;
		document.getElementById('editor-textarea').style.tabSize = settings.tabSize;
		wrapping();
		wrapping();	
		checkLightMode();
	}
}

function settingsSave() {
	localStorage.setItem("settings", JSON.stringify(settings));
	return settings;
}

function settingsReset() {
	localStorage.removeItem("settings");
	localStorage.setItem("settings",JSON.stringify(dSettings));
	location.reload(true);
}

function settingsChange(setting, value) {
	settings[setting] = value;
	settingsSave();
	console.log("Settings changed");
	console.log(settings);
}

function toggleLightMode(){
	if (settings.lightMode){
		document.body.setAttribute('data-theme','dark');
		document.getElementById('editor-textarea').setAttribute('data-theme','dark');
		document.getElementById('viewer').setAttribute('data-theme','dark');
		settingsChange('lightMode',false);
	} else if (settings.lightMode === false){
		document.body.setAttribute('data-theme','light');
		document.getElementById('editor-textarea').setAttribute('data-theme','light');
		document.getElementById('viewer').setAttribute('data-theme','light');
		settingsChange('lightMode',true);
	} else {
		settingsChange('lightMode',false);
	}
	return settings.lightMode;
}

function checkLightMode(){
	if (settings.lightMode){
		document.body.setAttribute('data-theme','light');
		document.getElementById('editor-textarea').setAttribute('data-theme','light');
		document.getElementById('viewer').setAttribute('data-theme','light');
	}
	return settings.lightMode;
}

function instantRefreshCheck() {
	if (settings.instantRefresh) {
		document.getElementById('instant-refresh-btn').innerHTML = "Disable Instant Refresh";
		return settings.instantRefresh;
	} else {
		return settings.instantRefresh;
	}
}
// https://www.abeautifulsite.net/adding-and-removing-elements-on-the-fly-using-javascript
function removeElement(elementId) {
	// Removes an element from the document
	var element = document.getElementById(elementId);
	element.parentNode.removeChild(element);
}

function antiLag() { // Use not found, but still not made
	// Uses change timing function to reduce lag between typing if it takes over 100ms or more to finish reloading the page or toggle instant refresh
	// Can be enabled or disabled by the user
}

function toggleInstantRefresh() {
	if (settings.instantRefresh) {
		document.getElementById('instant-refresh-btn').innerHTML = "Enable Instant Refresh";
		settingsChange("instantRefresh", false);
	} else if (settings.instantRefresh === false) {
		document.getElementById('instant-refresh-btn').innerHTML = "Disable Instant Refresh";
		if (settings.autoRefresh === false) {
			stopRefresh();
		}
		settingsChange("instantRefresh", true);
		return settings.instantRefresh;
	}
}

function refresh(time, downUp) {
	saved = false;
	if (settings.autoRefresh) {
		if (settings.instantRefresh) {
			refreshING();
			eRefreshING();
		} else {
			mainFunctions.forEach(clearTimeout); // https://stackoverflow.com/questions/54277835/how-to-stop-calling-a-function-js/54277902#54277902
			mainFunctions.length = 0;
			console.log("Detected " + downUp + " typing");
			mainFunctions.push(setTimeout(refreshING, time));
			mainFunctions.push(setTimeout(eRefreshING, time));
		}
	} else if (downUp == 'forced') {
		refreshING();
		eRefreshING();
	} else {
		saveLocal();
		return;
	}
}

function refreshING() {
	saved = false;
	var textContent = document.getElementById('editor-textarea').value;
	try {
		document.getElementById('viewer').srcdoc = textContent;
	} catch (err) {
		return err;
	}
	emptyAndLog("Refreshed");
	saveLocal();
}

function eRefreshING() {
	saved = false;
	var textContent = document.getElementById('editor-textarea').value;
	try {
		windowExternalWindow.document.getElementById('e-viewer').srcdoc = textContent;
	} catch (err) {
		return err;
	}
	emptyAndLog("Refreshed Externally");
	saveLocal();
}

function reloading() {
	try {
		windowExternalWindow.close();
		saveLocal();
		location.reload(true);
	} catch (err) {
		saveLocal();
		location.reload(true);
	}
	return;
}

function stopRefresh() {
	if (settings.autoRefresh) {
		settingsChange("autoRefresh", false);
		document.getElementById('stopRefresh').innerHTML = "Start Auto Refresh";
		if (settings.instantRefresh) {
			toggleInstantRefresh();
		}
		return settings.autoRefresh;
	} else {
		settingsChange("autoRefresh", true);
		document.getElementById('stopRefresh').innerHTML = "Stop Auto Refresh";
		return settings.autoRefresh;
	}
}

function setRefreshTime() {
	var timeOfRefresh = parseInt(prompt("How long until refresh?", 750));
	if (typeof timeOfRefresh === null) {
		return timeOfRefresh;
	}
	settingsChange("refreshInterval", timeOfRefresh);
}

function wrapping(){
	if(settings.wrapping || typeof settings.wrapping === null || typeof settings.wrapping === undefined || typeof settings.wrapping === ''){
		document.getElementById('editor-textarea').style.whiteSpace = "normal"; // Allow
		document.getElementById('wrapping_btn').innerHTML = "Disable Wrapping";
		settingsChange("wrapping",false);
	} else if (settings.wrapping == false){
		document.getElementById('editor-textarea').style.whiteSpace = "nowrap"; // Disallow
		document.getElementById('wrapping_btn').innerHTML = "Enable Wrapping";
		settingsChange("wrapping",true);
	} 
	return settings.wrapping;
}

function saveLocal(localStorageName = wideLocalStorageName) {
	localStorage.setItem(localStorageName, document.getElementById('editor-textarea').value);
	logAndEmpty("Saved");
}

function loadLocal() {
	if (typeof localStorage.getItem("RTE_HTML") === undefined || typeof localStorage.getItem("RTE_HTML") === null || localStorage.getItem("RTE_HTML") === '') {
		saved = true;
		return localStorage.getItem("RTE_HTML");
	} else {
		document.getElementById('editor-textarea').value = localStorage.getItem("RTE_HTML");
		refreshING();
		return localStorage.getItem("RTE_HTML");
	}
}

function oldLoadLocal(oldLocalStorageName) {
	if (localStorage.getItem(oldLocalStorageName) == 'undefined' || localStorage.getItem(oldLocalStorageName) == 'null') {
		console.log('Old local storage not found! ' + oldLocalStorageName);
		return false;
	} else {
		document.getElementById('editor-textarea').value = localStorage.getItem(oldLocalStorageName);
		console.log("Loaded from old local storage! '" + localStorage.getItem(oldLocalStorageName) + "'");
		localStorage.removeItem(oldLocalStorageName);
		console.log("Converted from old local storage! " + oldLocalStorageName);
		refreshING();
		return true;
	}
}

function allOfOldLoadLocal() {
	oldLoadLocal("RTE_HTML_File");
}
// https://www.html5rocks.com/en/tutorials/file/dndfiles/
// Check for the various File API support.
if (window.File && window.FileReader && window.FileList && window.Blob) {
	// ok supported
} else {
	alert('The File APIs are not fully supported in this browser. The file functions might not work correctly.');
}
// Open the file
// https://www.javascripture.com/FileReader
var openFile = function(event) {
	fileName = document.getElementById('file').value.replace("C:\\fakepath\\", "");
	console.log(fileName);
	var input = event.target;
	backupHTML();
	var reader = new FileReader();
	reader.onload = function() {
		var text = reader.result;
		var editor = document.getElementById('editor-textarea');
		editor.value = text;
		refreshING();
		fileForm.reset(); // https://www.geeksforgeeks.org/how-to-reset-a-form-using-jquery-with-reset-method/
	};
	reader.readAsText(input.files[0]);
};

function downloadHTML(fileNames = fileName) {
	fileNames = prompt("Choose a name for your file", fileNames);
	if (fileNames == 'null') {
		return;
	} else {
		download(fileNames + ".html", document.getElementById('editor-textarea').value);
		return;
	}
}

function backupHTML() {
	if (saved) {
		return;
	} else {
		download("backupHTML.html", document.getElementById('editor-textarea').value);
		return;
	}
}

function download(filename, text) { // https://stackoverflow.com/questions/3665115/how-to-create-a-file-in-memory-for-user-to-download-but-not-through-server
	var element = document.createElement('a');
	element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
	element.setAttribute('download', filename);
	element.style.display = 'none';
	document.body.appendChild(element);
	element.click();
	document.body.removeChild(element);
	saved = true;
}

function openExternalWindow() {
	if (typeof windowExternalWindow === "undefined") {
		childWindowChecking = setInterval(childWindowCheck, 1000);
		windowExternalWindow = window.open("about:blank", "External HTML Live View", windowFeatures);
		windowExternalWindow.document.write("<style>body {margin: 0px; overflow: hidden;} iframe {width: 100%;height: 100%;border:0px;}</style> <script>function confirmExit(){return '';}window.onbeforeunload=confirmExit;<\/script> <iframe id=\"e-viewer\"></iframe>");
		removeElement("viewer");
		eRefreshING();
	}
}

function childWindowCheck() { // Use not found, but is used on line 2 of openExternalWindow() function
	if (windowExternalWindow.closed) {
		saveLocal();
		reloading();
	}
}

function resetText() {
	backupHTML();
	editor.reset();
	refreshING();
}

function emptyAndLog(text) {
	console.log('');
	console.log(text);
}

function logAndEmpty(text) {
	console.log(text);
	console.log('');
}

function setIndentSize() {
	var indentSize = parseInt(prompt("How many spaces for indenting?", settings.tabSize));
	document.getElementById('editor-textarea').style.tabSize = indentSize;
	settingsChange("tabSize", indentSize);
	return settings.tabSize;
}

function fontSize() {
	var fontSize = parseInt(prompt("What would you like the font size to be?", settings.fontSize));
	document.getElementById('editor-textarea').style.fontSize = fontSize;
	settingsChange("fontSize", fontSize);
	return settings.fontSize;
}

function insertAtCaret(areaId, text) { // https://stackoverflow.com/questions/1064089/inserting-a-text-where-cursor-is-using-javascript-jquery
	var txtarea = document.getElementById(areaId);
	if (!txtarea) {
		return;
	}
	var scrollPos = txtarea.scrollTop;
	var strPos = 0;
	var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? "ff" : (document.selection ? "ie" : false));
	if (br == "ie") {
		txtarea.focus();
		var range = document.selection.createRange();
		range.moveStart('character', -txtarea.value.length);
		strPos = range.text.length;
	} else if (br == "ff") {
		strPos = txtarea.selectionStart;
	}
	var front = (txtarea.value).substring(0, strPos);
	var back = (txtarea.value).substring(strPos, txtarea.value.length);
	txtarea.value = front + text + back;
	strPos = strPos + text.length;
	if (br == "ie") {
		txtarea.focus();
		var ieRange = document.selection.createRange();
		ieRange.moveStart('character', -txtarea.value.length);
		ieRange.moveStart('character', strPos);
		ieRange.moveEnd('character', 0);
		ieRange.select();
	} else if (br == "ff") {
		txtarea.selectionStart = strPos;
		txtarea.selectionEnd = strPos;
		txtarea.focus();
	}
	txtarea.scrollTop = scrollPos;
}

function changeKeyPress(elementID, keyCode, text) {
	document.getElementById(elementID).addEventListener("keydown", function(event) {
		if (event.keyCode == keyCode) {
			event.preventDefault();
			insertAtCaret(elementID, text);
		} else {
			return;
		}
	});
}

function load() {
	var t0 = performance.now();
	console.clear();
	loadLocal();
	settingsCheck();
	changeKeyPress('editor-textarea', 9, "	");
	localStorage.removeItem("instantRefresh");
	var t1 = performance.now();
	console.log("Took " + (t1 - t0) + "ms to load");
}
load();