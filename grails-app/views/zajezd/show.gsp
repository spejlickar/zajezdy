<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <title>${zajezd.nazev}</title>

</head>
<body>
    <h1>${zajezd.nazev}</h1>
    <p>${zajezd.popis}</p>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <g:each in="${zajezd.fotky}" var="fotka">
                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                    <img src="${fotka.url}" class="d-block w-100" alt="${fotka.popis}">
                </div>
            </g:each>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Předchozí</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Další</span>
        </a>
    </div>
    <g:link class="btn btn-primary" controller="zajezd" action="edit" id="${zajezd.id}">Upravit zájezd</g:link>
    <g:link class="btn btn-secondary" controller="zajezd" action="index">Zpět na seznam</g:link>

</body>
</html>