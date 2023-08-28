*** Settings ***
Resource         rd_resources.robot
Documentation    Essa suite tem como objetivo validar o acesso ao site orangehrmlive.com,
...              bem como o login, inclusão, pesquisa, exclusão e logout dos usuários.
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Realizar o login
    [Documentation]    Esse teste realiza o login e verifica se o mesmo
    ...                foi realizado com sucesso.
    [Tags]             login
    Acessar a home page do site orangehrmlive.com
    Preencher o campo username
    Preencher o campo password
    Clicar no botão login
Caso de Teste 02 - Cadastrar novo ADMIN
    [Documentation]    Esse teste verifica se o cadastro realizado foi
    ...                foi efetuado com sucesso.
    [Tags]             casdastro_usuario
    Efetuar login
    Clicar no menu Admin
    Clicar no botão Add
    Seleciona a opção Admin
    Seleciona a opção Status
    Preencher o campo funcionario
    Preencher o campo nome
    Preencher o campo senha
    Preencher o campo confirmar senha
    Clicar no botão salvar

Caso de Teste 03 - Buscar ADMIN cadastrado
    [Documentation]    Esse teste realiza a pesquisa do novo usuário cadastrado
    ...                anteriormente em sistema.
    [Tags]             busca_usuario
    Efetuar login
    Clicar no menu Admin
    Preencher o campo nome cadastrado
    Clicar no botão pesquisar
    Validar resultado da pesquisa

Caso de Teste 04 - Apagar ADMIN cadastrado
    [Documentation]    Esse teste realiza a exclusão do usuário e verifica 
    ...                se a mesma foi realizada com sucesso.
    [Tags]             excluir_usuario
    Efetuar login
    Clicar no menu Admin
    Preencher o campo nome cadastrado
    Clicar no botão pesquisar
    Validar resultado da pesquisa
    Clicar no botão excluir
Caso de Teste 05 - Realizar Logout
    [Documentation]    Esse teste realiza o logout do usuário em sistema
    ...                e verifica se a ação foi realizada com sucesso.
    [Tags]             logout_usuario
    Efetuar login
    Clicar no botão logout
    Validar logout
