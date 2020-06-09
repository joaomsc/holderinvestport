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
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
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
                            <g:submitButton class="dropdown-item navbar-light color-light" name="Submit" value="Logout" style="color:gray" />
                        </g:form>
                    </div>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>

</nav>

<div class="container">
    <g:layoutBody/>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>