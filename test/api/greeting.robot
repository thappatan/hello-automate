*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Hello World
    Create Session    greeting      http://localhost:8080
    ${resp}=   Get Request    greeting    /hello
    Request Should Be Successful    ${resp}
    ${message}=    Convert To String   ${resp.content}
    Should Contain    ${message}    hello, World