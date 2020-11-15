"use strict";
let inputBox = document.querySelector("#input");
let toType = document.querySelector("#toType");
let outputTyping = document.querySelector("#output");
let wpmCount = document.querySelector("#wpm");
let wordsAmount = 10;
var charactersTyped = 0;
var started = false;
var startTime;
const replaceCorrect = /<\/span><span class='correct'>/g;
const replaceIncorrect = /<\/span><span class='incorrect'>/g;

function getWords() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", "https://gist.githubusercontent.com/deekayen/4148741/raw/98d35708fa344717d8eee15d11987de6c8e26d7d/1-1000.txt", false);
    xmlHttp.send(null);
    return xmlHttp.responseText.split("\n");
}

function highlight(text) {
    var input = inputBox.value;
    var newInnerHTML = "";
    for (var i in text) {
        if (parseInt(i) + 1 > input.length) {
            newInnerHTML += text[i];
        }
        else {
            newInnerHTML += `<span class='${input[i] === text[i] ? "correct" : "incorrect"}'>${text[i]}</span>`;
        }
    }
    toType.innerHTML = newInnerHTML;
}

let words = getWords();

function randomWords() {
    var wordsChoice = [];
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

toType.innerText = randomWords();
inputBox.addEventListener('keyup', e => {
    highlight(toType.innerText);
    if (toType.innerText + " " === inputBox.value) {
        toType.innerText = randomWords();
        inputBox.value = "";
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