---
title: Looper Commands
description: Loops ffmpeg
layout: default
---
<style type="text/css">
    main{font-family:arial;font-size:1.2rem;}
    input:invalid{background-color:red;}
    input[type=text]{width: 200px;}
    textarea{width:99%;height:17px;resize:none;max-height:200px;}
    #percent{width:40px;}
</style>
<script type="text/javascript">
    function rsplit(string, split) {
        var index;
        if ((index = string.lastIndexOf(".")) === -1) return string;
        return string.substring(0, index);
    }

    function oppositeRound(float) { // rounding in the opposite way
        return float - parseInt(float) >= 0.5 ? Math.floor(float) : Math.ceil(float);
    }

    function createCommand(form) {
        "use strict";
        console.log("%cScreenshot should start here", "font-size:1.5rem;");
        var command = [];

        var loopVid = form.loopVideo.value;
        var mkvLoopVid = rsplit(loopVid, '.') + '.mkv';
        var loopVidMS = toMS(form.loopVideoLength.value);

        var userRequestedMS = toMS(form.videoLength.value);

        var outName = form.outName.value;
        var newOutName = rsplit(outName, '.');
        var extraOptions = outOrNull(form.extraOptions.value);

        if (loopVid !== mkvLoopVid) {
            command.push(`ffmpeg -i "${loopVid}" -c copy "temp.mkv";`);
        }

        var loops = userRequestedMS / loopVidMS;
        var roundedLoops = oppositeRound(loops);

        command.push(`ffmpeg -stream_loop ${roundedLoops} -i "${loopVid !== mkvLoopVid ? "temp.mkv" : mkvLoopVid}"`);
        if (form.forceEnd.checked) {
            command.push(`-t ${form.videoLength.value}`);
        }
        if (extraOptions) {
            command.push(form.extraOptions.value);
        }
        command.push(`"${newOutName}.mkv";`);
        if (loopVid !== mkvLoopVid) {
            command.push(`rm temp.mkv`);
        }

        var output = document.getElementById("output");
        output.value = command.join(" ");
        console.debug(
            "Variables:\n" +
            `Command array: ${command}\n` +
            `Loop-video name: ${loopVid}\n` +
            `Loop-video length: ${loopVidMS}\n` +
            `User requested ms: ${userRequestedMS}\n` +
            `Loops: ${loops}\n` +
            `Rounded Loops: ${roundedLoops}\n` +
            `Output name: ${outName}\n` +
            `Extra options: ${extraOptions}\n` +
            `Output command: ${output.value}\n`
        );
        console.log("%cScreenshot should end here", "font-size:1.5rem;");
        auto_grow(output);
    }

    function outOrNull(input) {
        return input == "" ? null : input;
    }

    function toMS(string) {
        if (outOrNull(string) == null) {
            return null;
        }
        const timeRegex = /(\d{2,}):(\d{2,}):(\d{2,})[.,](\d{2,})/;
        var t = timeRegex.exec(string);
        for (var i = 1; i < t.length; i++) {
            t[i] = parseInt(t[i]);
        }
        return ((t[1] * 60 + t[2]) * 60 + t[3]) * 1000 + (t[4] * 10);
    }

    function auto_grow(element) {
        element.style.height = "5px";
        element.style.height = (element.scrollHeight) + "px";
    }
</script>
## Looper commands
### What's this?
Basically for a video on [how to loop something extremely long (and also high quality, e.g. Yoshi 1 hour).](https://youtu.be/mXWGVZVrAig) I used the command line to do the looping, but I think there are some people who want to do this, and may not be familiar with the command line (and I hate it when they don't know how to use tech). So I made this exact tool that "generates" a command that would help the user loop a video. <small>i also made this at 2 am it's fine</small><br>
do note that this will only work with the most common bash and zsh. If you're on windows, well then sorry.
<form action="javascript:createCommand(this.formLol);" method="post" name="formLol">
    <label>Looping video file name / path</label><input type="text" name="loopVideo" required><br>
    <label>Looping video length</label><input type="text" pattern="\d{2,}:\d{2,}:\d{2,}[.,]\d{2,}" placeholder="hh:mm:ss.ms" name="loopVideoLength" required><br>
    <label>Total wanted video length</label><input type="text" name="videoLength" pattern="\d{2,}:\d{2,}:\d{2,}[.,]\d{2,}" required placeholder="hh:mm:ss.ms"><br>
    <label>Output file name</label><input type="text" name="outName" required><br>
    <label>Custom extra ffmpeg options</label><input type="text" name="extraOptions"><br>
    <label>Force cut off video</label><input type="checkbox" name="forceEnd"><br>
    <input type="submit" value="Create command">
</form>
<textarea readonly placeholder="Output command. Click to copy." onclick="this.setSelectionRange(0, this.value.length);document.execCommand('copy');" id="output"></textarea>
<script>
    var devMode = false;
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    async function autoSubmit() {
        document.formLol.loopVideo.value = "in.mp4";
        document.formLol.loopVideoLength.value = "00:00:00.99";
        document.formLol.videoLength.value = "00:01:00.00";
        document.formLol.outName.value = "out.mp4";
        document.formLol.submit();
        await sleep(10000);
        location.reload();
    }
    if (devMode) {
        autoSubmit();
    }
</script>