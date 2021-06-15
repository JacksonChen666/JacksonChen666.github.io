---
title: Submission
layout: external
---
<?php
$back = "<a href='javascript:history.back();'>back</a>";
if (isset($_POST['q'])) {
	$submission = writeFile("question", $_POST['q']);
} else if (isset($_POST['i'])) {
	$submission = writeFile("idea", $_POST['i']);
} else if (isset($_POST['f'])) {
	$submission = writeFile("feedback", $_POST['f']);
} else {
	echo "<h2>tip of the day</h2><p>try and actually type something</p>" . $back;
	error_log("Submit.php: empty submission found", 0);
	exit;
}
echo "<h2>thank</h2><p>i will check</p>" . $back;
exit;

function writeFile($type, $userInput) {
	$FileName = "../stuff/" . $type; 
	$exists = file_exists($FileName . ".csv");
	$file = fopen($FileName . ".csv", "a") or die("can't open file F");
	if ($exists == 0) {
		fwrite($file, "input_unix_time,input,output_unix_time,output\n");
	}
	fwrite($file, time().",\"{$userInput}\",,\"\"\n");
	fclose($file);
	chmod($FileName . ".csv", 0600);
	return $userInput;
}
?>