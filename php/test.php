<?php
echo $_GET["msg"] ?? "";
echo "\n";
$human = $_GET["human"] ?? false;
if ($human == true) {
	return;
} else {
	echo "It's not a human!";
}
?>