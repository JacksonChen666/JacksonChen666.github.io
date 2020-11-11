function getWords() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", "https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt", false);
    xmlHttp.send(null);
    return xmlHttp.responseText.split("\n");
}

let words = getWords();

function randomWords() {
    var wordsChoice = [];
    while (wordsChoice.join(" ").length != 100) {
        if (wordsChoice.join(" ").length > 100) {
            wordsChoice.pop();
        }
        wordsChoice.push(words[parseInt(Math.random() * words.length + 1)]);
    }
    return wordsChoice.join(" ");
}

document.querySelector("#toType").innerText = randomWords();