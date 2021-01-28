<!DOCTYPE php>
<html lang="en">
	<head>
		<title>JacksonChen666 - Submittion</title>
		<link rel="stylesheet" type="text/css" href="https://jacksonchen666.github.io/main.css">
		<script src="https://jacksonchen666.github.io/main.js"></script>
	</head>
	<body>
		<nav class="navbar" w3-include-html="nav.html">
			<script>
				includeHTML();
			</script>
		</nav>
		<main>
			<h1>Jackson Chen</h1>
			<?php
				$back = "<a href='javascript:history.back();'>back</a>";
				if (isset($_POST['q'])) {
					$submission = writeFile("Question", $_POST['q']);
				}
				else if (isset($_POST['i'])) {
					$submission = writeFile("Idea", $_POST['i']);
				}
				else {
					echo "<h2>tip of the day</h2><p>try and actually type something</p>" . $back;
					error_log("Submit.php: empty submission found", 0);
					exit;
				}
				echo "<h2>thank</h2><p>i will check</p>" . $back;
				exit;

				function writeFile($Type, $TextToWrite) {
					$FileName = "../stuff/" . $Type;
					$exists = file_exists($FileName . ".csv");
					$file = fopen($FileName . ".csv", "a") or die("can't open file F");
					if ($exists == 0) {
						if ($Type == "Question" || $Type == "Idea") {
							fwrite($file, "Unix Time," . $Type . ",Response\n");
						} else {
							fwrite($file, "Unix Time, Data\n");
						}
					}
					fwrite($file, time().",\"{$TextToWrite}\",\"\"\n");
					fclose($file);
					chmod($FileName . ".csv", 0777);
					return $TextToWrite;
				}
			?>
		</main>
	</body>
</html>