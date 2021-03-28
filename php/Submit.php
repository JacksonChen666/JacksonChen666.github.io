---
title: Submittion
layout: external
---
<?php
$back = "<a href='javascript:history.back();'>back</a>";
if (isset($_POST['q'])) {
	$submission = writeFile("question", $_POST['q']);
}
else if (isset($_POST['i'])) {
	$submission = writeFile("udea", $_POST['i']);
}
else {
	echo "<h2>tip of the day</h2><p>try and actually type something</p>" . $back;
	error_log("Submit.php: empty submission found", 0);
	exit;
}
echo "<h2>thank</h2><p>i will check</p>" . $back;
exit;

function writeFile($Type, $TextToWrite) {
	$FileName = "./stuff/" . $Type; 
	$exists = file_exists($FileName . ".csv");
	$file = fopen($FileName . ".csv", "a") or die("can't open file F");
	if ($exists == 0) {
		if ($Type == "question" || $Type == "idea") {
			fwrite($file, "unix_time," . $Type . ",response\n");
		} else {
			fwrite($file, "unix_time, data\n");
		}
	}
	fwrite($file, time().",\"{$TextToWrite}\",\"\"\n");
	fclose($file);
	chmod($FileName . ".csv", 0777);
	return $TextToWrite;
}
?>