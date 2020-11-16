"use strict";
let inputBox = document.querySelector("#input");
let toType = document.querySelector("#toType");
let toTypeNext = document.querySelector("#toTypeNext");
let outputTyping = document.querySelector("#output");
let wpmCount = document.querySelector("#wpm");
let wordsAmount = 10;
var charactersTyped = 0;
var started = false;
var startTime;
var held = [];

function getWords() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", "https://gist.githubusercontent.com/deekayen/4148741/raw/98d35708fa344717d8eee15d11987de6c8e26d7d/1-1000.txt", false);
    xmlHttp.send(null);
    return xmlHttp.responseText.split("\n");
}

function highlight(text) {
    var input = inputBox.value;
    var newInnerHTML = "";
    for (var i = 0; text.length > i; i++) {
        if (parseInt(i) + 1 > input.length) {
            break;
        }
        newInnerHTML += `<span class='${input[i] === text[i] ? "correct" : "incorrect"}'>${text[i]}</span>`;
    }
    newInnerHTML += text.substring(parseInt(i));
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
toTypeNext.innerText = randomWords();
inputBox.addEventListener('keyup', e => {
    held[e.keyCode] = false;
    highlight(toType.innerText);
    if (toType.innerText + " " === inputBox.value) {
        toType.innerText = toTypeNext.innerText;
        toTypeNext.innerText = randomWords();
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
inputBox.addEventListener('keydown', e => {
    if (held[e.keyCode] && e.keyCode > 32) {
        e.preventDefault();
        return;
    }
    held[e.keyCode] = true;
})
setInterval(calculateWPM, 100);