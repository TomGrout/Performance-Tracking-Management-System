<?php
    $target_dir = "../uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    // check if method is post
    if (isset($_POST["submit"])) {
        // move file
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            // rename to uuid
            rename($target_file, $target_dir.uniqid('miros-',true).".".$fileType);
            echo "The file ". htmlspecialchars(basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
?>
<!-- Todo: 
- integrage into database
- Add css to page
-->
<form action="fileupload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload file" name="submit">
</form>