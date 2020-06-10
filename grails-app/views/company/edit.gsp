<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Editar Empresa</title>
</head>

<body>
<div id="edit-company" class="content" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.company}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.company}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="card">
        <div class="card-header">
            Editar Empresa
        </div>

        <div class="card-body">
            <g:form resource="${this.company}" method="PUT">
                <div class="form-group">
                    <label for="name">Razão Social</label>
                    <input type="text" value="${this.company.name}" placeholder="Razão Social" class="form-control"
                           id="name" autocapitalize="none"/>
                </div>

                <div class="form-group">
                    <label for="tradingName">Nome</label>
                    <input type="text" value="${this.company.tradingName}" placeholder="Nome da Empresa"
                           class="form-control" name="tradingName" id="tradingName" autocapitalize="none"/>
                </div>

                <div class="form-group">
                    <label for="description">Descriçao</label>
                    <textarea type="text" rows="3" placeholder="Descreva a Empresa"
                           class="form-control" name="description" id="description">${this.company.description}</textarea>
                </div>

                <input class="save btn btn-lg btn-primary btn-block text-uppercase" type="submit" value="Salvar"/>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
