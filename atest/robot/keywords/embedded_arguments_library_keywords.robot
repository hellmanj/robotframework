*** Settings ***
Suite Setup     Run Tests  ${EMPTY}  keywords/embedded_arguments_library_keywords.robot
Force Tags      regression  pybot
Resource        atest_resource.robot

*** Test Cases ***
Embedded Arguments In Library Keyword Name
    ${tc} =  Check Test Case  ${TEST NAME}
    Check Log Message  ${tc.kws[0].msgs[0]}  This is always executed
    Should Be Equal  ${tc.kws[0].name}  \${name}, \${book} = embedded_args_in_lk.User Peke Selects Advanced Python From Webshop
    Check Log Message  ${tc.kws[2].msgs[0]}  This is always executed
    Should Be Equal  ${tc.kws[2].name}  \${name}, \${book} = embedded_args_in_lk.User Juha Selects Playboy From Webshop
