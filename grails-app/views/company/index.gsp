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

    <div id="list-user" class="card-body" role="main">

        <div id="list-company-wrapper" class="dataTables_wrapper dt-bootstrap4">
            <table id="company-list-table" data-search="true" class="table table-striped table-bordered list-table">
                <thead>
                <tr>
                    <th>Nome Fantasia</th>
                    <th>Razão Social</th>
                    <th>Sobre</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${companyList}" var="company">
                    <tr>
                        <td class="col-sm-2"><a href="/company/${company.id}/show">${company.tradingName}</a></td>
                        <td class="col-sm-2">${company.name}</td>
                        <td class="col-sm-6">${company.description}</td>
                        <td class="col-sm-2">
                            <div class="float-right">
                                <g:form resource="${company}" method="DELETE">
                                    <a class="btn btn-primary" href="/company/${company.id}/edit">Editar</a>
                                    <input class="btn btn-danger" type="submit" value="Deletar"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');"/>
                                </g:form>
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