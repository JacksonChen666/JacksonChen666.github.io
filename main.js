function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires="+d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
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

function toggleTheme(){
	if ((function(){return getCookie("lightTheme");})() == "true") {
		document.body.setAttribute('theme', 'dark');
		setCookie("lightTheme", false, 10000);
	} else if ((function(){return getCookie("lightTheme");})() == "false") {
		document.body.setAttribute('theme', 'light');
		setCookie("lightTheme", true, 10000);
	} else {
		document.body.setAttribute('theme', 'light');
		setCookie("lightTheme", true, 10000);
	}
	return (function(){return getCookie("lightTheme");})();
}

function checkTheme(){
	if ((function(){return getCookie("lightTheme");})() == "true") {
		document.body.setAttribute('theme', 'light');
	}
	return (function(){return getCookie("lightTheme");})();
}

window.addEventListener("load", checkTheme);