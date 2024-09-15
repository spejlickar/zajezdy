<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <title>Vyvořit fotku</title>

</head>
<body>

    <g:form action="uploadPhoto" enctype="multipart/form-data" method="post">
        <input type="file" name="photo"/>
        <input type="submit" value="Nahrát fotku"/>
    </g:form>


</body>
</html>