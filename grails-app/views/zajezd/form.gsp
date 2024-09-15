<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <title>Vyvořit zájezdu</title>

</head>
<body>
    <g:form method="POST">
        <fieldset class="form">
            <g:field type="text" name="nazev" value="${zajezd?.nazev}"/>
            <g:field type="text" name="popis" value="${zajezd?.popis}"/>  
            <g:if test="${zajezd?.fotografie !=null}">
                <g:each in="zajezd.fotografie" var="foto">
                    <p>${foto.popis}</p>
                </g:each>  
            </g:if>
            <g:else>
                <p>nejsou fotky</p>
            </g:else>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="ulož" />
        </fieldset>
    </g:form>

</body>
</html>