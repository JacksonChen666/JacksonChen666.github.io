function getWords() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", "https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt", true);
    xmlHttp.send(null);
    return xmlHttp.responseText.split("\n");
}
console.log(getWords());