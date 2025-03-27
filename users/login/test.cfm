<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Submit Test</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<form id="registrationForm">
    <div class="form-group">
        <label for="firstname">First Name</label>
        <input type="text" id="firstname" name="firstname">
    </div>
    <button type="submit">Register</button>
</form>

<script>
    $(document).ready(function() {
        console.log("jQuery loaded and document is ready");

        $('#registrationForm').on('submit', function(e) {
            e.preventDefault();  // Prevent form submission
            console.log("Form submission prevented");
        });
    });
</script>

</body>
</html>
