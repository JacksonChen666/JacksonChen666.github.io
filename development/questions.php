<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="./main.css">
</head>
<body>

<h1>processing q..</h1>
<!-- <button onclick="goBack()">back</button> -->
<p style="font-size: 5px">(if you see undefined index errors you shouldn't be here)</p>
<p><a href="https://github.com/JacksonChen666/JacksonChen666.github.io/issues/new?assignees=&labels=bug&template=bug_report.md&title=question.php%20Problems">Report bugs on this page (errors, and other stuff)</a>

<?php
$txt = $_POST["question"];
if(empty($txt)) {
	echo "you must actually ask >:(";
}
else {
	$file = fopen("questions.txt", "a") or die("can't open file F");
	fwrite($file, time());
	fwrite($file, ": ");
	fwrite($file, $txt);
	fwrite($file, "\n\n");
	fclose($file);
	echo "ok done, you can go back :)";
}
?>

<p><a href="https://JacksonChen666.github.io/published/questions.html">Go back to questions</a></p>
</body>
</html>