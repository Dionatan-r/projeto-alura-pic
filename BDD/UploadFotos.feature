Feature: Upload de fotos
    Como um usuário com conta no sistema
    Desejo realizar o upload de fotos
    Para visualizar as fotos no sistema

    Background: Logas usuário na aplicação
        Given loguei na aplicação com os seguintes dados
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |

        Scenario: Upload de foto com sucesso
            When registro os dados corretos do usuário
            |    mailUsuario     | elmachips@teste.com |
            |    nomeCompleto    |      Elma Chips     |
            |    nomeUsuario     |      elmachips      |
            |    senhaUsuario    |      Elma1234       |
            Then visualizo a mensagem "User available"
            And sou direcionado para a página de login