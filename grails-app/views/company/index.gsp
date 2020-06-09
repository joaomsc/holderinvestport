<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a class="list" href="${createLink(uri: '/user')}">Usuários</a></li>
                <li><a class="list" href="${createLink(uri: '/company')}">Empresas</a></li>
                <li><g:link class="create" action="create"><g:message code="Criar Empresa" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-company" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${companyList}" />

            <div class="pagination">
                <g:paginate total="${companyCount ?: 0}" />
            </div>
        </div>
    </body>
</html>