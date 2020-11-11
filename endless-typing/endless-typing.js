let inputBox = document.querySelector("#input");
let toTypeText = document.querySelector("#toType");
let wordsAmount = 10;

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
    console.log(`keyup event fired for key: ${e.key}`);
});