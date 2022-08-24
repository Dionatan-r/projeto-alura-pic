Feature: Login Usuario
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Alura Pic

    Background: Acessar a página de login de usuário
        Given acessei a página de login de usuário

        Scenario: Logar usuário com sucesso
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            When preencho os dados corretos de usuário 
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            And sou direcionado para a página de registro de fotos

    Scenario: Logar usuário com nome de usuário incorreto
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            When preencho os dados com o nome de usuário incorreto 
            |    nomeUsuario     |      ElmaChips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Invalid user name or password"
            And permaneço na página de login do usuário

    Scenario: Logar usuário com senha de usuário incorreto
            And o sistema possui um usuário cadastrado com os seguintes dados
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            When preencho os dados com a senha de usuário incorreta
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma123        |
            Then visualizo a mensagem "Invalid user name or password"
            And permaneço na página de login do usuário

    Scenario: Login usuário com erro no servidor
            When preencho os dados corretos de usuário o quando o servidor está com erro interno
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "Não foi possível efetuar seu registro. Tente novamente mais tarde."
            And permaneço na página de registro do usuário

    Scenario: Ir à página de registro
            When clico no botão Register Now
            Then sou direcionado para a página de registro
