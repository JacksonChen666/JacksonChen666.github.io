"use strict";
let inputBox = document.querySelector("#input");
let toType = document.querySelector("#toType");
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

function randomWords(wordsChoice) {
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

toType.innerText = randomWords([]);
inputBox.addEventListener('keyup', e => {
    if (e.keyCode === 13) { // skip word
        var temp = toType.innerText.split(" ");
        temp.shift();
        inputBox.value = "";
        toType.innerText = randomWords(temp);
        outputTyping.value += "<Skip>";
        return;
    }
    else if (e.key === " ") {
        var toTypeWords = toType.innerText.split(" ");
        var wordsTyped = inputBox.value.split(" ").filter(word => word.length > 0);
        while (wordsTyped.length > 0 && toTypeWords[0] === wordsTyped[0]) {
            toTypeWords.shift();
            wordsTyped.shift();
        }
        toType.innerText = randomWords(toTypeWords);
        inputBox.value = wordsTyped.join(" ");
    }
    if (e.key.length !== 1) {
        outputTyping.value += `<${e.key}>`
    }
    else {
        outputTyping.value += e.key;
        if (started === false) {
            started = true;
            startTime = Date.now();
        }
        charactersTyped++;;
    }
});
setInterval(calculateWPM, 100);