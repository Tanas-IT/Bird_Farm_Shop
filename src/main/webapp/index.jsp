<!-- upload.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Upload Image</title>
</head>
<body>
    <h1>Upload Image</h1>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="file" accept="image/*" required><br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>