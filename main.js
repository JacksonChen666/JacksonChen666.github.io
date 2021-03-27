'use strict';
function setData(name, value) {
    localStorage.setItem(name, value)
}

function getData(name) {
    localStorage.getItem(name)
}

function toggleTheme() {
    var lightMode = (function() { return getData("lightTheme"); })();
    if (lightMode == "true") {
        setData.body.setAttribute('theme', 'dark');
        setCookie("lightTheme", false);
    } else {
        document.body.setAttribute('theme', 'light');
        setData("lightTheme", true);
    }
    return lightMode;
}

function checkTheme() {
    var lightMode = (function() { return getCookie("lightTheme"); })();
    if (lightMode == "true") { document.body.setAttribute('theme', 'light'); }
    return lightMode;
}

window.addEventListener("load", checkTheme);
