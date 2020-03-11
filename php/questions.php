<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
</head>
<body>

<h1>processing q..</h1>
<!-- <button onclick="goBack()">back</button> -->

<?php
$txt = $_POST["question"];
if(empty($txt)) {
	echo "you must actually ask ノಠ益ಠノ彡┻━┻";
}
else {
	$file = fopen("questions.txt", "a") or die("can't open file F");
	fwrite($file, time());
	fwrite($file, ": ");
	fwrite($file, $txt);
	fwrite($file, "\n\n");
	fclose($file);
	echo "done";
}
?>
<script type="text/javascript">
// some kind of javascript so i can redirect to a thank you page
</script>
<p><a href="https://JacksonChen666.github.io/questions.html">Go back to questions</a></p>
<p><a href="https://github.com/JacksonChen666/JacksonChen666.github.io/issues/new?assignees=&labels=bug&template=bug_report.md&title=question.php%20Problems">Report bugs on this page (errors, and other stuff)</a></p><br><br>
<p style="font-size= 3px">\(°_o)/¯</p>
</body>
</html>