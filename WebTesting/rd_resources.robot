*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${URL}                https://opensource-demo.orangehrmlive.com/   
${TXT_LOGIN}          Login
${BTN_LOGIN}          //button[contains(.,'Login')]
${USER}               Admin
${PASSWORD}           admin123
${USER_DROPDOWN}      //span[@class='oxd-userdropdown-tab']  
${BTN_MENU_ADMIN}     //a[@class='oxd-main-menu-item'][contains(.,'Admin')]
${BTN_ADD}            //button[@type='button'][contains(.,'Add')]  
${SELECT_USER_ROLE}   (//div[contains(@class,'oxd-select-text--after')])
${SELECT_OPCAO}       (//div[contains(@class,'oxd-select-dropdown --positon-bottom')])[1]
${SELECT_STATUS}      (//div[contains(@class,'oxd-select-text--after')])[2]
${CAMPO_FUNCIONARIO}    //input[contains(@placeholder,'Type for hints...')]    
${SELECT_FUNCIONARIO}    (//div[contains(@class,'oxd-autocomplete-dropdown --positon-bottom')])[1]
${TXT_NOME_FUNCIONARIO}    //p[contains(@class,'oxd-userdropdown-name')]
${NAME}                Carlos Alberto
${CAMPO_NOME}          (//input[contains(@autocomplete,'off')])[1]
${CAMPO_SENHA}         (//input[contains(@type,'password')])[1]
${NOVA_SENHA}          Admin@1234
${CAMPO_CONFIR_SENHA}    (//input[contains(@type,'password')])[2]
${BTN_SALVAR}          //button[@type='submit'][contains(.,'Save')]
${PESQUISA_NOME}       (//input[contains(@class,'oxd-input oxd-input--active')])[2]
${TXT_NOME_PESQUISADO}    //div[@class='oxd-table-cell oxd-padding-cell'][contains(.,'${NAME}')]
${BTN_PESQUISA}        //button[@type='submit'][contains(.,'Search')]
${CHECK_PESQUISA}      //div[contains(@class,'oxd-table-card-cell-checkbox')]
${BTN_EXCLUIR}         //button[@type='button'][contains(.,'Delete Selected')]
${BTN_CONFIRMA_EXCLUIR}    //button[@type='button'][contains(.,'Yes, Delete')]  
${BTN_DROP_USER}        //i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon']
${DROP_USER}            //ul[@class='oxd-dropdown-menu'][contains(.,'AboutSupportChange PasswordLogout')]
${SELECT_DROP_USER}     //a[contains(.,'Logout')]
*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site orangehrmlive.com
    Go To    url=${URL}
    Wait Until Page Contains    text=${TXT_LOGIN}
Preencher o campo username
    Input Text    locator=username    text=${USER}
Preencher o campo password
    Input Text    locator=password    text=${PASSWORD}
Clicar no botão login
    Click Button    locator=${BTN_LOGIN}
    Wait Until Element Is Visible    locator=${USER_DROPDOWN}
Efetuar login
    Acessar a home page do site orangehrmlive.com
    Preencher o campo username
    Preencher o campo password
    Clicar no botão login
Clicar no menu Admin
    Wait Until Element Is Visible    locator=${BTN_MENU_ADMIN}
    Click Element    locator=${BTN_MENU_ADMIN}
Clicar no botão Add
    Wait Until Element Is Visible    locator=${BTN_ADD}
    Click Element    locator=${BTN_ADD}
Seleciona a opção Admin
    Sleep   2
    Click Element    locator=${SELECT_USER_ROLE}
    Click Element    locator=${SELECT_OPCAO}
Seleciona a opção Status
    Sleep   2
    Click Element    locator=${SELECT_STATUS}
    Click Element    locator=${SELECT_OPCAO}
Preencher o campo funcionario
    ${USER_FUNCIONARIO}=    Get Text    locator=${TXT_NOME_FUNCIONARIO}
    ${USER_FUNCIONARIO}    Set Variable    ${USER_FUNCIONARIO}[:3]
    Input Text    locator=${CAMPO_FUNCIONARIO}   text=${USER_FUNCIONARIO}
    Sleep   2
    Click Element    locator=${SELECT_FUNCIONARIO}
Preencher o campo nome
    Input Text    locator=${CAMPO_NOME}    text=${NAME}
Preencher o campo senha
    Click Element    locator=${CAMPO_SENHA}
    Sleep   2
    Input Text    locator=${CAMPO_SENHA}   text=${NOVA_SENHA}
Preencher o campo confirmar senha
    Click Element    locator=${CAMPO_CONFIR_SENHA}
    Sleep   2
    Input Text    locator=${CAMPO_CONFIR_SENHA}    text=${NOVA_SENHA}
Clicar no botão salvar
    Click Button    locator=${BTN_SALVAR}
Preencher o campo nome cadastrado
    Wait Until Element Is Visible    locator=${PESQUISA_NOME} 
    Input Text    locator=${PESQUISA_NOME}    text=${NAME}
Clicar no botão pesquisar
    Click Button    locator=${BTN_PESQUISA}
Validar resultado da pesquisa
    Wait Until Element Is Visible    locator=${TXT_NOME_PESQUISADO}
    ${NOME_PESQUISADO}=    Get Text    locator=${TXT_NOME_PESQUISADO}
    Should Be Equal As Strings    ${NOME_PESQUISADO}    ${NAME}    
Clicar no botão excluir 
    Click Element    locator=${CHECK_PESQUISA}
    Click Button    locator=${BTN_EXCLUIR}
    Click Button    locator=${BTN_CONFIRMA_EXCLUIR}
Clicar no botão logout
    Wait Until Element Is Visible    locator=${BTN_DROP_USER}
    Click Element    locator=${BTN_DROP_USER}
    Wait Until Element Is Visible    locator=${DROP_USER}
    Click Element    locator=${SELECT_DROP_USER}
Validar logout
    Element Should Be Visible    locator=${BTN_LOGIN}
    
    