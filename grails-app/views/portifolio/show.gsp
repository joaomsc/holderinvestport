<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Minha Carteira</title>
</head>

<body>
<div class="card">
    <div class="card-header">
        Minha Carteira
    </div>

    <div id="list-portifolio-company" class="card-body" role="main">
        <div id="list-portifolio-company-wrapper" class="card-columns">
            <g:each in="${this.portifolio.companies}" var="company">
                    <div class="card company-card" style="width: 18rem;">
                        <g:if test="${company.image}">
                            <td><g:img alt="Card image cap" class="card-img-top" dir="company-images" file="${company.image.split("/").last()}"/></td>
                        </g:if>
                        <g:else>
                            <td><g:img alt="Card image cap" class="card-img-top" dir="images" file="company-default.jpeg"/></td>
                        </g:else>
                        <div class="card-body">
                            <h5 class="card-title"><a href="/company/${company.id}/show">${company.tradingName}</a>
                            </h5>
                            <h6 class="card-subtitle mb-2 text-muted">${company.name}</h6>

                            <p class="card-text">${company.description.take(100)} ...</p>

                            <form action="/portifolio/remove/${company.id}" method="put"
                                  class="portf-company-action">
                                <input type="submit" class="btn btn-danger" value="Remover da Carteira"/>
                            </form>
                        </div>
                    </div>
            </g:each>
        </div>
    </div>
</div>
</body>
</html>
