Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades do sistema

    Background: Acessar a página de registro de usuário
        Given acessei a página de registro de usuário

        Scenario: Cadastrar usuário com sucesso
            When registro os dados corretos do usuário
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "User available"
            And sou direcionado para a página de login

        Scenario: Cadastrar usuário sem email
            When registro os dados do usuário sem preencher o campo email
            |    mailUsuario     |                     |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Email is required!"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem nome completo
            When registro os dados do usuário sem preencher o campo nome completo
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |                     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Full name is required!"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem nome de usuário
            When registro os dados do usuário sem preencher o campo nome usuário
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |                     |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "User name is required!"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário sem senha
            When registro os dados do usuário sem preencher o campo senha
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      ElmaChips      |
            |    senhaUsuario    |                     |
            Then visualizo a mensagem "Password is required!"
            And permaneço na página de registro do usuário

        Scenario: Cadastrar usuário com um nome de usuário já existentente
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            When registro os dados do usuário utilizando um email já existente
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Username already taken"
            And permaneço na página de registro do usuário


       Scenario Outline: Cadastrar usuário com formato de email inválido
            When registro o email do usuário em <formato_invalido>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            | formato_invalido        |       mensagem     |
            |    elmachips            |   "Invalid e-mail" | 
            |    elmachips@           |   "Invalid e-mail" | 
            |    elmachips@teste.     |   "Invalid e-mail" | 
            |    elmachips@teste.com. |   "Invalid e-mail" |     

        Scenario Outline: Cadastrar nome completo com quantidade de caracteres fora da especificação
            When registro o nome de usuário com <quant_caracteres_nome_completo>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            |         quant_caracteres_nome_completo    |        mensagem        |
            |                     E                     | "Mininum length is 2"  | 
            | Elma Chips Chips Chips Chips Chips Chipss | "Maximun length is 40" | 

        Scenario Outline: Cadastrar nome de usuário com quantidade de caracteres fora da especificação
            When registro o nome de usuário com <quant_caracteres_nome_usuario>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            |   quant_caracteres_nome_usuario     |        mensagem        |
            |               E                     | "Mininum length is 2"  | 
            |  elmachipschipschipschipschipss     |     "User available"   | 
            |  elmachipschipschipschipschipsss    | "Maximun length is 30" | 

        Scenario Outline: Cadastrar email de usuário com quantidade de caracteres fora da especificação
            When registro o nome de usuário com <quant_caracteres_email_usuario>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            |                                                                                                                          quant_caracteres_nome_usuario                                                                                                          |     mensagem      |
            |                                                                                            elmachipschipschipschipschipschipschipschipschipschipschipschipsc@teste.com.br                                                                                       | "Invalid e-mail"  | 
            |                                                      elmachipschipschipschipschipschipschipschipschipschipschipschips@testetestetestetestetestetestetestetestetestetestetestetestetest.com.br                                                                   | "Invalid e-mail"  |
            | elmachipschipschipschipschipschipschipschipschipschipschipschips@testetestetestetestetestetestetestetestetestetestetestetestetes.comcomcomcomcomcomcomcomcomcomcomcomcomcomcomcomcomcomcomcomcom.brbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbrbr | "Invalid e-mail"  |  


        Scenario Outline: Cadastrar nome de usuário com letras maisúculas, com espaço ou caracteres especiais
            When registro o nome de usuário com <nome_usuario_maisuculas_espaco>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            |   nome_usuario_maisuculas_espaco       |        mensagem       |
            |               Elma                     | "Must be lower case"  | 
            |               eLma                     | "Must be lower case"  | 
            |            elma chips                  | "Must be lower case"  | 
            |               elma%                    | "Must be lower case"  | 

        Scenario Outline: Cadastrar senha com quantidade de caracteres fora da especificação
            When registro o nome de usuário com <quant_caracteres_senha_usuario>
            Then visualizo a <mensagem>
            And permaneço na página de registro do usuário

            Examples:
            |        quant_caracteres_senha_usuario      |        mensagem        |
            |               1234567                      | "Mininum length is 8"  | 
            |             12345678912345                 |                        | 
            |          1234567891234567891               | "Maximun length is 18" | 

        Scenario: Cadastrar usuário com erro no servidor
            When registro os dados do usuário quando o servidor está com erro interno
            |    nomeUsuario     |     Elma Chips      |
            |    mailUsuario     | elmachips@teste.com |
            |    senhaUsuario    |      Elma1234       |
            |  ConfSenhaUsuario  |      Elma1234       |
            Then visualizo a mensagem "Não foi possível efetuar seu registro. Tente novamente mais tarde."
            And permaneço na página de registro do usuário

        Scenario: Retornar à página de login
            When clico no botão Voltar à pagina de login
            Then retorno à pagina de login