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
      <g:field type="text" name="nazev" value="${zajezd?.nazev}" />
      <g:field type="text" name="popis" value="${zajezd?.popis}" />
      <g:if test="${zajezd.fotografie != null}">
        <div class="container mt-4">

          <g:set var="pocitadlo" value="${0}" />
          <g:set var="max" value="${zajezd.fotografie.size()}" />
          <g:while test="${pocitadlo < max}">

            <div class="row">
              <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                  <g:if test="${pocitadlo < max}">
                    <g:img file="${zajezd.fotografie.get(pocitadlo).url}" class="card-img-top" alt="Obrázek 1" />
                    <div class="card-body">
                      <h5 class="card-title">${zajezd.fotografie.get(pocitadlo).popis}</h5>
                    </div>
                  </g:if>
                  <% pocitadlo++ %>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                  <g:if test="${pocitadlo < max}">
                    <g:img file="${zajezd.fotografie.get(pocitadlo).url}" class="card-img-top" alt="Obrázek 1" />
                    <div class="card-body">
                      <h5 class="card-title">${zajezd.fotografie.get(pocitadlo).popis}</h5>
                    </div>
                  </g:if>
                  <% pocitadlo++ %>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                  <g:if test="${pocitadlo < max}">
                    <g:img file="${zajezd.fotografie.get(pocitadlo).url}" class="card-img-top" alt="Obrázek 1" />
                    <div class="card-body">
                      <h5 class="card-title">${zajezd.fotografie.get(pocitadlo).popis}</h5>
                    </div>
                  </g:if>
                  <% pocitadlo++ %>
                </div>
              </div>
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