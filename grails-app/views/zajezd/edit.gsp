<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Editace zájezdu</title>

</head>
<body>
    <g:form controller="zajezd" action="update" id="${zajezd.id}">
        <div class="form-group">
            <label for="nazev">Název</label>
            <g:textField name="nazev" value="${zajezd?.nazev}" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="popis">Popis</label>
            <g:textArea name="popis" value="${zajezd?.popis}" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Uložit změny</button>
    </g:form>
</body>
</html>