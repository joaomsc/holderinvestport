<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes do Usuário</title>
</head>

<body>
<div id="show-user" class="content scaffold-show" role="main">
    <div class="card">
        <div class="card-header">
            Detalhes do Usuário
        </div>

        <div class="card-body">
            <g:img class="side-img" dir="images" file="user-default.png" width="110" height="110"/>
            <div class="side-image-float-left">
                <h5 class="card-title">${this.user.fullname}</h5>

                <p class="card-text"><label class="label"><b>E-mail:</b></label>${this.user.username}</p>
            </div>

            <div class="above-image-float">
                <g:form resource="${this.user}" method="DELETE">
                    <input class="btn btn-danger" type="submit" value="Deletar"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Você tem certeza?')}');"/>
                </g:form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>

