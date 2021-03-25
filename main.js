'use strict';
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function toggleTheme() {
    var lightMode = (function() { return getCookie("lightTheme"); })();
    if (lightMode == "true") {
        document.body.setAttribute('theme', 'dark');
        setCookie("lightTheme", false, 10000);
    } else if (location.protocol == "file:") {
        // check if user opened it from file system
        document.body.setAttribute('theme', 'dark');
        setCookie("lightTheme", false, 10000);
        var themeButton = document.getElementById("theme");
        themeButton.parentNode.removeChild(themeButton);
        console.error("%cThemes don't work properly if you use \"file:\" protocol%c(Opening html from file system, which makes cookies not work)", "color:red;font-size:5rem", "font-size:0.5rem;color:white;");
        debugger;
    } else {
        document.body.setAttribute('theme', 'light');
        setCookie("lightTheme", true, 10000);
    }
    return lightMode;
}

function checkTheme() {
    var lightMode = (function() { return getCookie("lightTheme"); })();
    if (lightMode == "true") { document.body.setAttribute('theme', 'light'); }
    return lightMode;
}

function requireHTML(HTMLrequired) {
    setCookie("requireHTML", HTMLrequired, 10000);
    return HTMLrequired;
}

window.addEventListener("load", checkTheme);
if (!(getCookie("requireHTML") == "true" || location.protocol == "file:" || location.host == "localhost" || location.host == "127.0.0.1")) {
    document.addEventListener("load", antiHTML);
    document.addEventListener("load", removeHTML);
}