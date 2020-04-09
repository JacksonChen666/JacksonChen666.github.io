<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for idea</title>
<link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
</head>
<body>

<?php
$txt = $_POST[$thingy];

function redirectTo($URLToRedirect) {
	echo '<META HTTP-EQUIV="refresh" content="0;URL=' . $URLToRedirect . '">';
}

function writeFile($TextToWrite) {
	$file = fopen("ideas.csv", "a") or die("can't open file F");
	fwrite($file, time().",{$TextToWrite},\n");
	fclose($file);
}

if(empty($txt)) {
	redirectTo("https://JacksonChen666.github.io/must-do-it.html");
}

else {
	writeFile($txt);
	redirectTo("https://JacksonChen666.github.io/thank-you.html");
}
?>
</body>
</html>