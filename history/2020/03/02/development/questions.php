<!DOCTYPE html>
<html>
<head>
<title>?</title>
</head>
<body>

<?php
$myfile = fopen("questions.txt", "a") or die("No file open");
$txt = "Question\n"
fwrite($myfile, $txt);
$txt = "Question2\n";
fwrite($myfile, $txt);
fclose($myfile);
?>

hi
your q: <?php echo $_GET["question"]; ?>

</body>
</html>