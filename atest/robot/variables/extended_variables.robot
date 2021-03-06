*** Settings ***
Suite Setup     Run Tests  ${EMPTY}  variables/extended_variables.robot
Force Tags      regression
Default Tags    pybot  jybot
Resource        atest_resource.robot

*** Test Cases ***
Using Attribute
    Check Test Case  ${TESTNAME}

Calling Method
    Check Test Case  ${TESTNAME}

Accessing List
    Check Test Case  ${TESTNAME}

Accessing Dictionary
    Check Test Case  ${TESTNAME}

Multiply
    Check Test Case  ${TESTNAME}

Using Public Java Attribute
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

Using Java Attribute With Bean Properties
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

Calling Java Method
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

Accessing Java Lists and Maps
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

Failing When Base Name Does Not Exist
    Check Test Case  ${TESTNAME}

Failing When Base Name Starts With Existing Variable
    Check Test Case  ${TESTNAME} 1
    Check Test Case  ${TESTNAME} 2

Testing Extended Var Regexp
    Check Test Case  ${TESTNAME}

Base name contains non-ASCII characters
    Check Test Case  ${TESTNAME}

Failing When Attribute Does Not exists
    Check Test Case  ${TESTNAME} 1
    Check Test Case  ${TESTNAME} 2

Failing When Calling Method With Wrong Number Of Arguments
    Check Test Case  ${TESTNAME}

Failing When Method Raises Exception
    Check Test Case  ${TESTNAME}

Fail When Accessing Item Not In List
    Check Test Case  ${TESTNAME}

Fail When Accessing Item Not In Dictionary
    Check Test Case  ${TESTNAME}

Failing For Syntax Error
    Check Test Case  ${TESTNAME}

Failing When Java Attribute Does Not Exist
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

Failing When Java Method Throws Exception
    [Tags]  jybot
    Check Test Case  ${TESTNAME}

