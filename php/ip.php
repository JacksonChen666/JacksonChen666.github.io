<?php
if (isset($_POST['ip'])) {
    writeFile("IP", $_POST['ip']);
    http_response_code(204);
    exit;
}
http_response_code(400);

function writeFile($Type, $TextToWrite) {
	$FileName = $Type;
	$exists = file_exists($FileName . ".csv");
	$file = fopen($FileName . ".csv", "a") or die("can't open file F");
	if ($exists == 0) {
        fwrite($file, "Unix Time, IP Address\n");
	}
	fwrite($file, time().",{$TextToWrite},\n");
	fclose($file);
	chmod($FileName . ".csv", 0777);
}
?>