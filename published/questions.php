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
<p><a href="https://JacksonChen666.github.io/published/questions.html">Go back to questions</a><br>
if you see undefined index errors you shouldn't be here<br>
</p>

<?php
$txt = $_POST["question"];
if($_POST['formSubmit'] == "Ask")
{
	$file = fopen("questions.txt", "a") or die("can't open file F");
	fwrite($file, $txt);
	fclose($file);
	echo "ok good :)";
}
if(empty($txt)) {
	echo "you must actually ask >:(";
}
?>

</body>
</html>