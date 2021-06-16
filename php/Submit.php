---
title: Submission
layout: external
---
<?php
$back = "<a href='javascript:history.back();'>back</a>";
if (!empty($_POST['q'])) {
	writeSubmission("question", $_POST['q']);
} else if (!empty($_POST['i'])) {
	writeSubmission("idea", $_POST['i']);
} else if (!empty($_POST['user_feedback']) && !empty($_POST['feedback_video'])) {
	writeSubmission("feedback", $_POST['user_feedback'], $_POST['feedback_video']);
} else {
	echo "<h2>tip of the day</h2><p>try and actually type something</p>" . $back;
	error_log("Submit.php: empty submission found", 0);
	exit;
}
echo "<h2>thank</h2><p>i will check</p>" . $back;
exit;

function writeSubmission($type, $userInput, $youtubeVideo = null) {
	$filename = "../stuff/" . $type;
	$exists = file_exists($filename . ".csv");
	$file = fopen($filename . ".csv", "a") or die("can't open file F");
	if ($exists == 0) {
		fwrite($file, "input_unix_time,input,output_unix_time,output");
		if ($type === "feedback") {
			fwrite($file, ",youtube_video");
		}
		fwrite($file, "\n");
	}
	fwrite($file, time().",\"{$userInput}\",,\"\"");
	if ($type === "feedback") {
		fwrite($file, ",\"{$youtubeVideo}\"");
	}
	fwrite($file, "\n");
	fclose($file);
	chmod($filename . ".csv", 0600);
	return $userInput;
}
?>