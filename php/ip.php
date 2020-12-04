<?php
$FileName = "../stuff/" . $Type;
$exists = file_exists($FileName . ".csv");
$file = fopen($FileName . ".csv", "a") or die("can't open file F");
if ($exists == 0) {
	fwrite($file, "Unix Time, IP Address\n");
}
fwrite($file, time().",{$_SERVER['REMOTE_ADDR']}\n");
fclose($file);
chmod($FileName . ".csv", 0777);
http_response_code(204);
?>