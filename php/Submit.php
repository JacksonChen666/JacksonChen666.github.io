---
layout: none
---
<?php
header("Cache-Control: no-cache", TRUE);
$content = $_POST['content'];
$type = $_POST['content_type'];
$extra = $_POST['extra'];
$typeMapping = array(
	'q' => 'question',
	'i' => 'idea'
);

// right below is a combination of email and url regex i took from https://stackoverflow.com/a/3809435 and https://stackoverflow.com/a/201378. because i am me and regex is regex, this combined regex might fail out of nowhere.
$URLOrEmailMatches = preg_match("/(?:https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*))|(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|\"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/", $content);
switch ($URLOrEmailMatches) {
	case 1:
		header("Location: https://www.youtube.com/watch?v=FXPKJUE86d0", TRUE, 301); // banned (spam submission)
		writeSubmission("spam", $content);
		exit();
		break;
	case 0:
		break;
	case false:
	default:
		die("Something went wrong. Send to maintainer of the website: MVNAG52M");
}

if (
	(empty($content) || empty($type)) ||
	($type === 'feedback' && !empty($extra))
) {
	header('Location: https://youtu.be/dQw4w9WgXcQ', TRUE, 303);
	error_log('Submit.php: empty submission found', 0);
	exit;
}

if ($type === 'feedback') {
	writeSubmission($type, $content, $extra);
} else {
	writeSubmission($typeMapping[$type], $content);
}

header("Location: {{ '/submitted' | absolute_url }}", TRUE, 303);
exit;

function writeSubmission($type, $userInput, $youtubeVideo = null) {
	$filename = "../stuff/" . $type;
	$exists = file_exists($filename . ".csv");
	$file = fopen($filename . ".csv", "a") or die("can't open file F");
	if ($exists === 0) {
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