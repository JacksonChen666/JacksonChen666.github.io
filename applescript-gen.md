---
title: AppleScript to URL
layout: none
---
<html lang="en">
<head>
	<style>
		body {
			background: black;
			color: white;
			overflow: hidden;
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}
		body * {
			background: black;
			color: white;
			margin-left: 5px;
		}
	</style>
</head>
<body>

<h1>AppleScript to URL</h1>
<noscript>This place won't work without JavaScript. <a href="https://jacksonchen666.000webhostapp.com/applescript.php">Convert without using JavaScript Here</a></noscript>
<textarea id="applescript" placeholder="AppleScript as text" rows="20" cols="50" spellcheck="false" autofocus="true"></textarea><br>
<button onclick="convertToURLAndAS('applescript','outputURL')">Change to URL</button>
<p id="outputURL"></p>
<script>
function convertToURLAndAS(inputID,outputID){
	var input = document.getElementById(inputID).value;
	var output;
	var ASPre = "applescript://com.apple.scripteditor?action=new&script="
	input = encodeURIComponent(input);
	var appleScriptOutput = ASPre + input
	output = "<a href=\"" + appleScriptOutput + "\">" + appleScriptOutput + "</a>"
	document.getElementById(outputID).innerHTML = output;
	document.getElementById(inputID).value = "";
}
</script>
</body>
</html>