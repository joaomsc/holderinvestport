Holder Investment Portfolio
==============================

O sistema proporciona ao usuário Investidor criar uma carteira contendo um conjunto de empresas(criadas e mantidas pelo usuário administrador) através de buscas pela listagem de empresas do sistema. Além disso, o usuário administrador pode listar e deletar usuários que se cadastraram no sistema.

Instruções para uso:
=============================================

1 - Clone o projeto usando o GIT ou faça o download em:
https://github.com/joaomsc/holderinvestport

2 - Edite o application.yml a partir da linha 101 para utilizar o seu banco de dados que desejar ou deixe as configurações como estão para utilizaro banco H2 padrão(salvo em memória)

3 - Rode o comando abaixo na raiz do projeto(a aplicação está rodando na porta 8080)
	
	grails <<env>>* run-app
	
Instruções para testes:
=============================================

Quando iniciada a aplicação já alimenta o banco de dados com alguns poucos dados. Assim, já é possivel visualizar 3 empresas com o usuário investidor padrão e adicioná-las à sua careteira de investimentos. Além disso, é possivel listar os usuários do sistema e manter as empresas com o usuário administrador. Segue as credenciais:

Usuário administrador | login: "admin@admin.com" | senha: "adminP@ss"
Usuário investidor | login: "johndoo@johndoo.com" | senha: "12345"