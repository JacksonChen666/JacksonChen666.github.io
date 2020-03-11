<!DOCTYPE php>
<html>
<head>
<title>JacksonChen666 - Thanks for idea</title>
<!-- <script type="text/javascript" src="../javascript.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
</head>
<body>

<h1>processing idea..</h1>
<!-- <button onclick="goBack()">back</button> -->

<?php
$txt = $_POST["ideas"];
$URLhate = "https://JacksonChen666.github.io/must-do-it.html";
$URLthank = "https://JacksonChen666.github.io/thank-you.html";
if(empty($txt)) {
	echo '<META HTTP-EQUIV="refresh" content="0;URL=' . $URLhate . '">';
	echo "you must actually giv idea ノಠ益ಠノ彡┻━┻";
}
else {
	$file = fopen("ideas.txt", "a") or die("can't open file F");
	fwrite($file, time());
	fwrite($file, ": ");
	fwrite($file, $txt);
	fwrite($file, "\n\n");
	fclose($file);
	echo '<META HTTP-EQUIV="refresh" content="0;URL=' . $URLthank . '">';
	echo "done";
}
?>
<script type="text/javascript">
// some kind of javascript so i can redirect to a thank you page
</script>
<p><a href="https://JacksonChen666.github.io/ideas.html">Go back to ideas</a></p>
<p><a href="https://github.com/JacksonChen666/JacksonChen666.github.io/issues/new?assignees=&labels=bug&template=bug_report.md&title=ideas.php%20Problems">Report bugs on this page (errors, and other stuff)</a><br><br></p>
<p style="font-size= 3px">\(°_o)/¯</p>
</body>
</html>