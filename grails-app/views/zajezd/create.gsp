<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <title>Vyvořit zájezdu</title>

</head>
<body>
    <!--<g:hasErrors bean="${this.zajezd}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.zajezd}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
    <g:form resource="${this.zajezd}" method="POST">
                    <fieldset class="form">
                    <g:if test="${zajezd?.id == null}">
                         null
                    </g:if>
                    <g:else>
                         not null
                    </g:else>

                        <f:all bean="zajezd" />
                        
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="ulož" />
                    </fieldset>
                </g:form>-->
    <g:form method="POST">
        <fieldset class="form">
            <g:field type="text" name="nazev" value="${zajezd?.nazev}"/>
            <g:field type="text" name="popis" value="${zajezd?.popis}"/>  
            <g:if test="${zajezd.fotografie != null}">
                <g:set var="x" value="${0}"/>
                <g:each in="${zajezd.fotografie}" var="foto">
                <div>
                    <span>Poradi: ${x++}</span>
                    <span>Id: ${foto.id}</span>
                    <span>Url: ${foto.url}</span>
                    <span>Popis: ${foto.popis}</span>
                </div>
                </g:each>  
                <g:img  file="f0.jpg" width = "100" height = "100"/>
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