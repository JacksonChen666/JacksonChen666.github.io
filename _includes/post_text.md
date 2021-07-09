<form action="https://JacksonChen666.000webhostapp.com/Submit.php" method="post">
    <textarea name="content" maxlength="{{ include.textarea_max_length }}" cols="{{ include.textarea_columns }}" rows="{{ include.textarea_rows }}" placeholder="{{ include.textarea_placeholder }}" required id="input"></textarea><br>
    <input type="hidden" name="content_type" value="{{ include.textarea_name }}">
    <input type="hidden" name="extra" value="">
    <input type="submit" value="{{ include.submit_value }}" name="formSubmit">
</form>
<script>
    document.getElementById("input").value = "";
</script>