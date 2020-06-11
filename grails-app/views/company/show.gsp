<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes da Empresa</title>
</head>

<body>
<div id="show-company" class="content scaffold-show" role="main">
    <div class="card">
        <div class="card-header">
            Detalhes da Empresa
        </div>

        <div class="card-body">
            <h5 class="card-title">${this.company.name}</h5>

            <p class="card-text">${this.company.description}</p>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:form resource="${this.company}" method="DELETE">
                    <a class="btn btn-primary" href="/company/${this.company.id}/edit">Editar</a>
                    <input class="btn btn-danger" type="submit" value="Deletar"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');"/>
                </g:form>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="ROLE_ADMIN">
                <g:companyNotInPortifolio company="${company}">
                    <form action="/portifolio/add/${company.id}" method="put" class="portf-company-action">
                        <input type="submit" class="btn btn-success" value="Adicionar na Carteira" />
                    </form>
                </g:companyNotInPortifolio>

                <g:companyInPortifolio company="${company}">
                    <form action="/portifolio/remove/${company.id}" method="put" class="portf-company-action">
                        <input type="submit" class="btn btn-danger" value="Remover da Carteira" />
                    </form>
                </g:companyInPortifolio>
            </sec:ifNotGranted>
        </div>
    </div>
</div>
</body>
</html>
