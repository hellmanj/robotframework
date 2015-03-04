*** Settings ***
Library         EmbeddedArgs.EmbeddedArgsKeywords

*** Test Cases ***
Embedded Keyword Arguments
    ${count}  ${item} =  Add 7 Copies Of Coffee To Cart
    Should Be Equal  ${count}-${item}  7-Coffee
