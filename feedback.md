---
title: Video Feedback and Criticism
---
## Video Feedback and Criticism
Maybe you can influence my video style to what more people would say as a more enjoyable experience.

Limited to 10000 characters because people would have not much, and I need my time too.

**Note:** Misuse of this page will result in deletion of your submission, if not remotely related to my YouTube channel, content, or your feedback completely pointless.
<style>
    #video {
        resize: none;
    }
    input[type=url]:invalid, textarea:invalid {
        border: 2px dashed red;
    }
    input[type=url]:valid, textarea:valid {
        border: 2px solid lime;
    }
    form textarea {
        width: min(99%, 705px);
    }
</style>
<form action="https://JacksonChen666.000webhostapp.com/Submit.php" method="post">
    <label>youtu.be video link to give feedback about</label><br>
    <input type="url" name="extra" minlength="28" maxlength="28" pattern="^https:\/\/youtu\.be\/[a-zA-Z0-9_\-]{11}$" placeholder="https://youtu.be/dQw4w9WgXcQ" required id="video"><br><br>
    <label>Feedback you want to send</label><br>
    <textarea name="content" minlength="50" maxlength="10000" placeholder="I don't like how you..." rows="22" cols="90" required id="feedback"></textarea><br>
    <input type="hidden" name="content_type" value="feedback">
    <input type="submit" value="Feedback" name="formSubmit">
</form>
<script>
    videoID = new URLSearchParams(window.location.search).get("video")
    if (videoID != null)
        document.getElementById("video").value = `https://youtu.be/${videoID}`;
    document.getElementById("feedback").value = "";
</script>
<br>
{% if site.data.feedback.size %}
{% include questions_ideas_csv.md csv_file=site.data.feedback amount=100 offset=0 %}
{% else %}
**Note:** As of 2021/06/15, absolutely nothing is wrong other than there's no feedback as it's new.

Ummmm, something might be wrong. Please contact the website owner for more about no feedback at all.
{% endif %}