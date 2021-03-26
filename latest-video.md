---
---
<script src="youtube-latest.js"></script>
<script>
    getLatestVideoID(function(id) {
        location.replace("https://youtube.com/watch?v=" + id);
    });
</script>