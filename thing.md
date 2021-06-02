---
title: Thing
description: Space bar and something happens
---
<noscript>This page requires javascript to run (!!!!!!!!!!!!!!!!!!!!!!!)</noscript>
<style>
    button{margin-left:5px}
    #text1{text-align:center;font-size:23px;}
    #cheatText{text-align:center}
</style>
<br><br>
<div id="thing">
    <p id="text1"></p>
    <p id="cheatText"></p>
    <br>
    <button id="remove-han" onclick="removeNav()">Remove header and nav</button>
    <button id="mobileCount" onclick="add()">Count</button>
    <button id="customText" onclick="cText()">Custom text</button>
    <button id="cheat" onclick="set()">Set number</button>
    <button id="resetBTN" onclick="reset()">Reset</button>
    <button id="undoReset" onclick="undoReset()">Undo reset</button>
    <br><br><br><br><br>
    <button id="hardReset" onclick="hardReset(true)">Hard reset</button>
</div>
<script src="thing.js"></script>
