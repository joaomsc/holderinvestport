<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Empresas</title>
</head>

<body>
<div class="card">
    <div class="card-header">
        Lista de Empresas
    </div>

    <div id="list-company" class="card-body" role="main">

        <div id="list-company-wrapper" class="dataTables_wrapper dt-bootstrap4">
            <table id="company-list-table" data-search="true" class="table table-striped table-bordered list-table">
                <thead>
                <tr>
                    <th></th>
                    <th>Nome Fantasia</th>
                    <th>Razão Social</th>
                    <th>Sobre</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${companyList}" var="company">
                    <tr>
                        <g:if test="${company.image}">
                            <td><g:img class="side-img" dir="images" file="${company.image.split("/").last()}" width="30" height="30"/></td>
                        </g:if>
                        <g:else>
                            <td><g:img class="list-img" dir="images" file="company-default.jpeg" width="30" height="30"/></td>
                        </g:else>
                        <td class="col-sm-2"><a href="/company/${company.id}/show">${company.tradingName}</a></td>
                        <td class="col-sm-2">${company.name}</td>
                        <td class="col-sm-6">${company.description}</td>
                        <td class="col-sm-2">
                            <div class="float-right">
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <g:form resource="${company}" method="DELETE">
                                        <a class="btn btn-primary" href="/company/${company.id}/edit">Editar</a>
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
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>