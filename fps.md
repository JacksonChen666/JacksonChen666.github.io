---
title: FPS test
description: Seeing your browser FPS
layout: none
---
<html lang="en">
<head>
    <style>
        html {
            font-family: Arial, Helvetica, sans-serif;
        }
        main div {
            text-align: center;
        }
    </style>
</head>
<body>
<main>
<div>
    <p>Your FPS is:</p>
    <p id="fps"></p>
    <p>When you specify to lag, javascript will start dividing random numbers 10 million times when it's running.</p>
    <button id="lagButton">Lag</button>
</div>
<script>
    var prev;
    const htmlFPSElement = document.getElementById("fps");
    const lagButton = document.getElementById("lagButton");
    var lag = false;
    lagButton.onclick = () => {
        lag = !lag;
    }
    function drawCallback(time) {
        if (prev != undefined) {
            htmlFPSElement.innerHTML = `${Math.round(1000/(time - prev))}`;
        }
        if (lag) {
            for (var i = 0; i < 10000000; i++) {
                Math.random() / Math.random();
            }
        }
        prev = time;
        window.requestAnimationFrame(drawCallback);
    }
    window.requestAnimationFrame(drawCallback);
</script>
</main>
</body>
</html>