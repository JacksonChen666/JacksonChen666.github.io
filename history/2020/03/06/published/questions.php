<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="./main.css">
</head>
<body>

<h1>processing..</h1>
<!-- <button onclick="goBack()">back</button> -->
<p style="font-size: 5px">(if you see undefined index errors you shouldn't be here)</p>

<?php
$txt = $_POST["question"];
if($_POST['formSubmit'] == "ASK") {
	$file = fopen("questions.txt", "a") or die("can't open file F");
	// echo "file open\n";
	fwrite($file, $txt);
	fwrite($file, "\n");
	// echo "q written\n";
	fclose($file);
	// echo "file closed\n";
	echo "ok done, you can go back :)";
}
if(empty($txt)) {
	echo "you must actually ask >:(";
}
?>

<p><a href="https://JacksonChen666.github.io/published/questions.html">Go back to questions</a></p>

</body>
</html>