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

<g:form enctype="multipart/form-data" action="save">
    
    
    <div class="form-group">
        <label for="photo">Přidat foto:</label>
        <input type="file" name="photo" class="form-control"/>
    </div>
    
    <g:submitButton name="submit" class="btn btn-primary" value="Uložit"/>
</g:form>

  <g:form enctype="multipart/form-data" action="update" id="${zajezd.id}" method="POST">
    <fieldset class="form">
      <g:field type="text" name="nazev" value="${zajezd?.nazev}" />
      <g:field type="text" name="popis" value="${zajezd?.popis}" />
      
      <g:if test="${zajezd != null}">
        <g:set var="fotografie" value="${zajezd.fotografie.sort{it.id}}" />
        <div class="container mt-4">
          <g:set var="pocitadloFotek" value="${0}" />
          <g:set var="max" value="${fotografie.size()}" />
          <g:while test="${pocitadloFotek < max}">
            <div class="row">
              <g:set var="pocitadloSloupcu" value="${0}" />
              <g:while test="${(pocitadloFotek < max) && (pocitadloSloupcu++ < 3)}">
                <g:set var="foto" value="${fotografie[pocitadloFotek]}" />
                <div class="col-lg-4 col-md-6 mb-4">
                  <div class="card">
                    <g:img file="${foto.url}" class="card-img-top" alt="${foto.popis}" />
                    <div class="card-body">
                      
                      <g:field type="hidden" name="fotografie[${pocitadloFotek}].id" value="${foto.id}"/>
                      <g:field type="hidden" name="fotografie[${pocitadloFotek}].url" value="${foto.url}"/>
                      <g:field type="text" name="fotografie[${pocitadloFotek++}].popis" value="${foto.popis}" />

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
      <g:submitButton name="update"  value="ulož" />
    </fieldset>
  </g:form>

</body>

</html>