// Ideas:
// custom text

var time = 0;

function spacebarGame() {
	document.getElementById("text1").innerHTML = "You have pressed the space bar " + time + " times";
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

function coolReset() {
	while (true) {
	if (time > 0) {
		console.log("Over")
		time -= 1;
		setTimeout(spacebarGame(),10)
	}
	else {
		if (time < 0) {
			console.log("under")
			time = 0;
			setTimeout(spacebarGame(),10)
		}
		else {return}
		}
	}
}

function sleep(milliseconds) {
  const date = Date.now();
  let currentDate = null;
  do {
    currentDate = Date.now();
  } while (currentDate - date < milliseconds);
}

spacebarGame();
var presses = document.querySelector( '.time' );
document.body.onkeyup = function(e) {
	if (e.keyCode == 32) {
		add()
	}
}
console.log("Loaded!");