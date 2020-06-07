<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Faça sua conta</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Faça sua conta</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <g:if test='${flash.sucmessage}'>
                    <div class="alert alert-success" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">

                    <div class="form-group">
                        <label for="fullname">Nome completo</label>
                        <input type="text" placeholder="Nome completo" class="form-control" name="fullname" id="fullname" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="username">Email</label>
                        <input type="email" placeholder="Seu e-mail" class="form-control" name="username" id="username" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Senha</label>
                        <input type="password" placeholder="Escolha uma senha" class="form-control" name="password" id="password"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Confirmação da Senha</label>
                        <input type="password" placeholder="Digite novamente a senha" class="form-control" name="repassword" id="repassword"/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Registre-se</button>
                    <hr class="my-4">
                    <p>Já possui uma conta? <g:link controller="login" action="auth">Entrar</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['email'].focus();
    });
</script>
</body>
</html>