<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
		<meta description="">
		<meta keywords="">
        <style>
            body * {margin-left: 5px;}
        </style>
		<title>JacksonChen666 - AppleScript URL Encoder</title>
	</head>
	<body>
    <h1>AppleScript URL Maker (<a href="./urlencode.php">URL Encoder</a>)</h1>
    <form action="./applescript.php" method="POST">
        <textarea name="script" cols="100" rows="80" for='applescript' placeholder="Put your AppleScript here without changes"></textarea><br>
        <input type="submit" value="Convert" name="formSubmit" for='submit'><br>
    </form>
    <br>
	</body>
</html>

<?php
        error_reporting(0);
        $txt = $_POST["script"];
        function urlEncoding($contents) {
            echo ("<a href=\"applescript://com.apple.scripteditor?action=new&script=" . urlencode($contents) . "\">applescript://com.apple.scripteditor?action=new&script=" . urlencode($contents) . "</a>");
        }
        urlEncoding($txt);
?>