*** Settings ***
Library        resources/embedded_args_in_lk.py

*** Test Cases ***
Embedded Arguments In Library Keyword Name
    ${name}  ${book} =  User Peke Selects Advanced Python From Webshop
    Should Be Equal  ${name}-${book}  Peke-Advanced Python
    ${name}  ${book} =  User Juha Selects Playboy From Webshop
    Should Be Equal  ${name}-${book}  Juha-Playboy
