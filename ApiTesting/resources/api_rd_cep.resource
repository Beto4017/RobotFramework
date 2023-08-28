*** Settings ***
Library  RequestsLibrary  
Library    String
Library    Collections

*** Variables ***
${CEP}            04661300
${BAIRRO}         Jardim Umuarama
${LOGRADOURO}     Avenida Interlagos
${LOCALIDADE}     São Paulo
${UF}             SP
${DDD}            11
${MASC_CEP}       04661-300

*** Keywords ***
Criar Sessão na ViaCep
    Create Session    alias=ViaCep       url=https://viacep.com.br
Consultar cep inserido
    ${resposta_consulta}    GET On Session    alias=ViaCep    url=/ws/${CEP}/json/    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}
Validar retorno do cep inserido
    Dictionary Should Contain Item    ${RESP_CONSULTA}    cep           ${MASC_CEP}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    logradouro    ${LOGRADOURO}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    bairro        ${BAIRRO}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    localidade    ${LOCALIDADE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    uf            ${UF}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    ddd           ${DDD}
