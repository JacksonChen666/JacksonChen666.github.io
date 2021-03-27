<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="{{ 'main.css' | absolute_url }}">
        <style>
            body * {margin-left: 5px;}
        </style>
		<title>{{ site.title }} (External) - AppleScript URL Encoder</title>
	</head>
	<body>
    <h1>AppleScript URL Encoder (<a href="urlencode.php">URL Encoder</a>)</h1>
    <form action="" method="POST">
        <textarea name="script" cols="50" rows="10" for='applescript' placeholder="Put your AppleScript here without changes" id="applescriptStuff"></textarea><br>
        <input type="submit" value="Convert" name="formSubmit" for='submit' id="JSLess"><br>
    </form>
    <br>
    <p id="ASText"></p>
	</body>
    <script>
        // https://www.abeautifulsite.net/adding-and-removing-elements-on-the-fly-using-javascript
        function removeElement(elementId) {
            // Removes an element from the document
            var element = document.getElementById(elementId);
            element.parentNode.removeChild(element);
            return element;
        }
        function addElement(parentId, elementTag, elementId, html) {
            // Adds an element to the document
            var p = document.getElementById(parentId);
            var newElement = document.createElement(elementTag);
            newElement.setAttribute('id', elementId);
            newElement.innerHTML = html;
            p.appendChild(newElement);
        }

        function onLoad(){
            removeELement("JSLess");
            addElement("applescriptStuff", "button", "JS", "onclick=\"convertToURLAndAS(\"applescriptStuff\",\"ASText\")\", value=\"Convert\"");
        }
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
        onLoad();
    </script>
</html>

<?php 
        function urlEncoding($contents) {
            echo "Your script:";
            echo "<a href=\"applescript://com.apple.scripteditor?action=new&script=" . urlencode($contents) . "\">applescript://com.apple.scripteditor?action=new&script=" . urlencode($contents) . "</a>";
        }
        if (!empty($_GET)){
            $txt = $_GET["script"];
            urlEncoding($txt);
        } else if (!empty($_POST)) {
            $txt = $_POST["script"];
            urlEncoding($txt);
        }
?>