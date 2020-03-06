function test() {
	document.findElementById("").innerHTML = ""
}

function goBack() {
	window.history.back()
}

function redirectWaitThenShow() {
	// sleep(3);
	document.getElementById("homeR").innerHTML = "Redirecting...";
	document.getElementById("homeR3").innerHTML = "Click here if you aren't being redirected";
}

function hnav() {
	$(function(){
	  $("#hnav").load("header-and-nav.html"); 
	});
}