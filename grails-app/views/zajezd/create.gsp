<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="layout" content="main" />
  <g:if test="${zajezd.id}">
    <title>Upravit zájezd</title>
  </g:if>
  <g:else>
    <title>Vyvořit zájezdu</title>
  </g:else>
</head>

<body>
  <g:form method="POST">
    <fieldset class="form">
      <g:field type="text" name="nazev" value="${zajezd?.nazev}" />
      <g:field type="text" name="popis" value="${zajezd?.popis}" />
      
      <g:if test="${fotky != null}">
      <g:set var="fotky" value="${zajezd.fotografie.sort{it.id}}" />
        <div class="container mt-4">
          <g:set var="pocitadlo" value="${0}" />
          <g:set var="max" value="${fotky.size()}" />
          <g:while test="${pocitadlo < max}">
            <div class="row">
              <g:set var="pocitadloRady" value="${1}" />
              <g:while test="${(pocitadlo <= max)&&(pocitadloRady++ < 3)}">
                <g:set var="foto" value="${fotky[pocitadlo++]}" />
                <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <g:img file="${foto.url}" class="card-img-top" alt="${foto.popis}" />
                    <div class="card-body">
                    <g:field type="text" name="popis" value="${foto.popis}" />
                      
                    </div>
                </div>
              </div>
              </g:while>
              </div>
             </g:while> 
        </div>
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