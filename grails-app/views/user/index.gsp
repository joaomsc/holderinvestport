<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Usuários</title>
</head>

<body>
<div class="card">
    <div class="card-header">
        Lista de Usuários
    </div>

    <div id="list-user" class="card-body" role="main">

        <div id="list-user-wrapper" class="dataTables_wrapper dt-bootstrap4">
            <table id="user-list-table" data-search="true" class="table table-striped table-bordered list-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${userList}" var="user">
                    <tr>
                        <td class="col-sm-1">${user.id}</td>
                        <td class="col-sm-4"><a href="/user/${user.id}/show">${user.fullname}</a></td>
                        <td class="col-sm-4">${user.username}</td>
                        <td class="col-sm-2">
                            <div class="float-right">
                                <g:form resource="${user}" method="DELETE">
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