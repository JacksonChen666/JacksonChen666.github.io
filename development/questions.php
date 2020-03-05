<!DOCTYPE html>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="./main.css">
</head>
<body>

<h1>thx for q</h1>
<!-- <button onclick="goBack()">back</button> -->
<p><a href="../questions.html">Go back to questions</a></p>

<?php
$txt = $_POST["question"];
$errorMessage = "";
if($_POST['formSubmit'] == "Ask")
{
	$file = fopen("questions.txt", "a") or die("No file open");
	fwrite($file, $txt);
	fclose($file);
	echo "succsessful";
}
if(empty($txt)) {
	echo "it's empty"
}
?>

</body>
</html>