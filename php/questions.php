<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
</head>
<body>

<!-- <h1>processing q..</h1> -->
<!-- <button onclick="goBack()">back</button> -->

<?php

$thingy = "questions";
$extension = ".csv";
$txt = $_POST[$thingy];

function redirectTo($URLToRedirect = "") {
	echo '<META HTTP-EQUIV="refresh" content="0;URL=' . $URLToRedirect . '">';
}

function writeFile($TextToWrite) {
	$file = fopen($thingy . $extension, "a") or die("can't open file F");
	// fwrite($file, time());
	// fwrite($file, ": ");
	// fwrite($file, $TextToWrite);
	// fwrite($file, "\n\n");
	fwrite($file, "{time()},{$TextToWrite},\n");
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