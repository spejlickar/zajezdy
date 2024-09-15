<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>Seznam zájezdů</title>

</head>
<body>

    <g:each in="${zajezdList}" var="zajezd">
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">${zajezd.nazev}</h5>
                <p class="card-text">${zajezd.popis}</p>
                <g:link class="btn btn-primary" controller="zajezd" action="show" id="${zajezd.id}">Detail</g:link>
                <g:link class="btn btn-secondary" controller="zajezd" action="edit" id="${zajezd.id}">Upravit</g:link>
                <g:link class="btn btn-danger" controller="zajezd" action="delete" id="${zajezd.id}">Smazat</g:link>
            </div>
        </div>
    </g:each>

</body>
</html>