// Ideas:
// Allow custom numbers (with history)
// undo reset
// preventn change

var time = 0;
var text1 = "You have pressed the space bar";
var text2 = "times";
var text1B = text1;
var text2B = text2;
var space = " ";
var cheat = 0;
var prompts = 0;

async function spacebarGame() {
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
	time = 0;
	spacebarGame();
}

function set() {
	prompts = prompt("How much do you want to add?")
	if (prompts == null) {
		return
	}
	else {
		cheat += prompts;
		time += prompts;
		console.log("Cheater! Your number changed by " + cheat);
		console.log("Debug" + prompts + space + cheat + space + time)
		prompts = 0;
		parseInt(cheat);
		cheat = 0;
		parseInt(time);
		time = time;
		spacebarGame();
	}
}

function destruction () {
	while (true) {
		true
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
	text1 = text1B;
	text2 = text2B;
	spacebarGame();
	var presses = document.querySelector( '.time' );
	document.body.onkeyup = function(e) {
		if (e.keyCode == 32) {
			add()
		}
	}
	console.log("Loaded!");
}
load()