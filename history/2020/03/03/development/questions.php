<!DOCTYPE html>
<html>
<head>
<title>JacksonChen666 - Thanks for q</title>
<script type="text/javascript" src="../javascript.js"></script>
<link rel="stylesheet" type="text/css" href="./main.css">
</head>
<body>

<h1>thx for q</h1>
<button onclick="goBack()">back</button>

<?php
$file = fopen("questions.txt", "a") or die("No file open");
$txt = $_POST["question"];
fwrite($file, $txt);
fclose($file);
?>

</body>
</html>