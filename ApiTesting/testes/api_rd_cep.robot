*** Settings ***
Resource    ../resources/api_rd_cep.resource

*** Test Cases ***
Caso de Teste 01 - Validar dados de retorno
    Criar Sessão na ViaCep
    Consultar cep inserido
    Validar retorno do cep inserido