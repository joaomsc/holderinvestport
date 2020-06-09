<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Faça o Login</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Faça o Login</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                    <div class="form-group">
                        <label for="username">E-mail</label>
                        <input type="email" class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" onclick="passwordDisplayToggle()" id="passwordToggler"/> Mostrar Senha
                            </label>
                        </div>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Entrar</button>
                    <hr class="my-4">
                    <p>Ainda não tem uma conta? <g:link controller="register">Faça sua conta</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>