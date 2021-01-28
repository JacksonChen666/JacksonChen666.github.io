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
    var lightMode = (function () { return getCookie("lightTheme"); })();
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
    var lightMode = (function () { return getCookie("lightTheme"); })();
    if (lightMode == "true") { document.body.setAttribute('theme', 'light'); }
    return lightMode;
}

function antiHTML() {
    history.replaceState("", "", location.pathname.replace(".html", ""));
}

function removeHTML() {
    function removingHTML(e) {
        var temp1 = e.href.toLowerCase();
        var loc = location.origin.toLowerCase();
        if (temp1.indexOf(loc) !== -1 && temp1.indexOf(".html") !== -1) {
            e.href = e.href.replace(".html", "");
        }
    }
    Array.prototype.slice.call(document.links).forEach(removingHTML);
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

function includeHTML() {
    var z, i, elmnt, file, xhttp;
    /* Loop through a collection of all HTML elements: */
    z = document.getElementsByTagName("*");
    for (i = 0; i < z.length; i++) {
        elmnt = z[i];
        /*search for elements with a certain atrribute:*/
        file = elmnt.getAttribute("w3-include-html");
        if (file) {
            /* Make an HTTP request using the attribute value as the file name: */
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    if (this.status == 200) { elmnt.innerHTML = this.responseText; }
                    if (this.status == 404) { elmnt.innerHTML = "Page not found."; }
                    /* Remove the attribute, and call this function once more: */
                    elmnt.removeAttribute("w3-include-html");
                    includeHTML();
                }
            }
            xhttp.open("GET", file, true);
            xhttp.send();
            /* Exit the function: */
            return;
        }
    }
}
