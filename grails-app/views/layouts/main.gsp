<!doctype html>
<html lang="br" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
        <g:layoutTitle default="A carteira do Holder Raiz"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar nav-bar-bnh navbar-expand-sm navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="bnhlogo.png" class="bnh-logo" alt="Buy n Hold logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
            <sec:ifLoggedIn>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <sec:loggedInUserInfo field='fullname'/>
                    </a>

                    <div class="dropdown-menu navbar-light">
                        <g:form controller="logout">
                            <g:submitButton class="dropdown-item navbar-light color-light" name="Submit" value="Logout"
                                            style="color:gray"/>
                        </g:form>
                    </div>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>

</nav>

<div class="container">
    <div class="container">
        <g:if test="${flash.message}">
            <div class="message alert alert-secondary" role="status">${flash.message}</div>
        </g:if>
    </div>
    <sec:ifLoggedIn>
        <div id="nav-main-links" class="nav" role="navigation">
            <ul>
                <sec:ifNotGranted roles="ROLE_ADMIN">
                    <li><a class="dashboard" href="${createLink(uri: '/portifolio/show')}">Minha Carteira</a></li>
                </sec:ifNotGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><a class="list" href="${createLink(uri: '/user')}">Usuários</a></li>
                </sec:ifAllGranted>
                <li><a class="list" href="${createLink(uri: '/company')}">Empresas</a></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><a class="save" href="${createLink(uri: '/company/create')}">Criar Empresa</a></li>
                </sec:ifAllGranted>
            </ul>
        </div>
    </sec:ifLoggedIn>
    <g:layoutBody/>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>