let inputBox = document.querySelector("#input");
let toTypeText = document.querySelector("#toType");
let outputTyping = document.querySelector("#output");
let wpmCount = document.querySelector("#wpm");
let wordsAmount = 10;
var charactersTyped = 0;
var started = false;
var startTime;

function getWords() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", "https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt", false);
    xmlHttp.send(null);
    return xmlHttp.responseText.split("\n");
}

let words = getWords();

function randomWords(existing) {
    var wordsChoice = existing;
    while (wordsChoice.length != wordsAmount) {
        wordsChoice.push(words[parseInt(Math.random() * words.length + 1)]);
    }
    return wordsChoice.join(" ");
}

function calculateWPM() {
    if (!started) {
        return;
    }
    wpmCount.innerText = Math.round((charactersTyped / 5) / ((Date.now() - startTime) / 1000 / 60), 0);
}

toTypeText.innerText = randomWords([]);
inputBox.addEventListener('keyup', e => {
    if (e.key === " ") {
        var temp = toTypeText.innerText.split(" ");
        var wordsTyped = inputBox.value.split(" ");
        for (i in wordsTyped) {
            if (temp[i] == wordsTyped[i]) {
                temp.shift();
                wordsTyped.shift();
            }
        }
        toTypeText.innerText = randomWords(temp);
        inputBox.value = wordsTyped.join(" ");
    }
    if (e.keyCode < 32) {
        outputTyping.value += `<${e.key}>`
    }
    else {
        outputTyping.value += e.key;
        if (!started) {
            started = true;
            startTime = Date.now();
        }
        charactersTyped++;;
    }
});
setInterval(calculateWPM, 100)