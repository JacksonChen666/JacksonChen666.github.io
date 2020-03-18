// Ideas:
// Allow custom numbers (with history, basiclly cheat)
// undo reset

var time = 0;
var timeB = 0;
var previousReset = 0;
var text1 = "You have pressed the space bar";
var text2 = "times";
var space = " ";

function spacebarGame() {
	document.getElementById("text1").innerHTML = text1 + space + time + space + text2;
}

function add() {
	time += 1;
	spacebarGame();
}

function remove() {
	time -= 1;
	spacebarGame();
}

function reset() {
	previousReset = timeB;
	time = 0;
	timeB = 0;
	spacebarGame();
}

function undoReset() {
	console.log(previousReset)
	if (previousReset > 0) {
		time = previousReset;
		timeB = previousReset;
		previousReset = 0;
		spacebarGame();
	}
	else {return}
}

function destruction () {
	while (true) {
		true;
	}
}

function removeNav() {
    var a = document.getElementById("header-and-nav");
    var b = document.getElementById("remove-han");
    a.parentNode.removeChild(a);
    b.parentNode.removeChild(b);
}

async function cText() {
	text1 = prompt("Beginning text", text1);
	if (text1 == null) {
		text1 = "";
		return;
	}
	else {spacebarGame();}
	text2 = prompt("Ending text", text2);
	if (text2 == null) {
		text2 = "";
		return;
	}
	else {spacebarGame();}
}

function load() {
	spacebarGame();
	document.body.onkeyup = function(e) {
		if (e.keyCode == 32) {
			timeB += 1;
			add();
		}
	}
	console.log("Loaded!");
}
load();