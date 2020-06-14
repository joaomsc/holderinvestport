<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Criar Empresa</title>
</head>

<body>
<div id="create-company" class="content" role="main">
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
            Criar Empresa
        </div>

        <div class="card-body">
            <g:uploadForm resource="${this.company}" method="POST">
                <div class="form-group">
                    <td><g:img class="side-img" dir="images" file="company-default.jpeg" width="110" height="110"/></td>
                    <input type="file" name="imageFile" id="imageFile" class="side-image-float-left"/>
                </div>

                <div class="form-group above-image-float">
                    <label for="name">Razão Social</label>
                    <input type="text" placeholder="Razão Social" class="form-control" name="name" id="name" autocapitalize="none"/>
                </div>

                <div class="form-group">
                    <label for="tradingName">Nome</label>
                    <input type="text" placeholder="Nome da Empresa" class="form-control" name="tradingName"
                           id="tradingName" autocapitalize="none"/>
                </div>

                <div class="form-group">
                    <label for="description">Descriçao</label>
                    <textarea type="text" rows="3" placeholder="Descreva a Empresa"
                              class="form-control" name="description" id="description"></textarea>
                </div>

                <g:submitButton id="submit" name="create" class="btn btn-lg btn-primary btn-block text-uppercase"
                                value="Criar"/>
            </g:uploadForm>
        </div>
    </div>
</div>
</body>
</html>