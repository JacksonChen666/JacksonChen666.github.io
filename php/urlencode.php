<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="{{ site.url }}{{ site.baseurl }}main.css">
        <meta description="">
        <meta keywords="">
        <style>
            body *{margin-left:5px;}
        </style>
        <title>{{ site.title }} - URL Encoder</title>
    </head>
    <body>
    <h1>URL Encoder</h1>
    <form action="" method="POST">
        <textarea name="encode" cols="100" rows="40" for='urlencode' placeholder="Enter text"></textarea><br>
        <input type="submit" value="Convert" name="formSubmit" for='submit'><br>
    </form>
    <br>
    </body>
</html>

<?php
    error_reporting(0);
    $txt = $_POST["encode"];
    function urlEncoding($contents) {
        echo(urlencode($contents));
    }
    urlEncoding($txt);
?>