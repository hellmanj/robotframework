*** Settings ***
Test Setup      Empty output directory
Force Tags      pybot  jybot  regression
Test Template   Correct outputs should be created
Resource        rebot_cli_resource.robot


*** Test Cases ***
Default outputs
    ${EMPTY}  log.html  report.html

Output Only
    --output myoutput.xml --log none --report none  myoutput.xml

Report Only
    --output none --report myreport.html --log NONE  myreport.html

Log Only
    --output None --report NONE --log mylog.html  mylog.html

All Outputs
    -o myoutput.xml -r myreport.html -l mylog.html  mylog.html  myoutput.xml  myreport.html

Outputs Without Extensions
    --output xoutput --report xreport --log xlog  xlog.html  xoutput.xml  xreport.html

Outputs Into Different Directories
    [Template]  NONE
    Set Runners
    Run  ${REBOT} --outputdir ::invalid:: -o ${MYOUTDIR}${/}o${/}o.xml -r ${MYOUTDIR}${/}r${/}r.html -l ${MYOUTDIR}${/}l${/}l.html ${MYINPUT}
    Directory Should Contain  ${MYOUTDIR}${/}o  o.xml
    Directory Should Contain  ${MYOUTDIR}${/}r  r.html
    Directory Should Contain  ${MYOUTDIR}${/}l  l.html
    Directory Should Contain  ${MYOUTDIR}  l  o  r

Non-writable Output File
    [Template]  NONE
    Set Runners
    Create Directory  ${MYOUTDIR}/diréctöry.xml
    ${output} =  Run  ${REBOT} -d ${MYOUTDIR} -o diréctöry.xml -r r.html -l l.html ${MYINPUT}
    Directory Should Contain  ${MYOUTDIR}  diréctöry.xml  l.html  r.html
    ${error}=  Catenate  SEPARATOR=\n
    ...  \\[ ERROR \\] Opening output file '.*diréctöry.xml' failed: .*
    ...  Log: .*
    ...  Report: .*
    Should Match Regexp  ${output}  ^${error}$


*** Keywords ***
Correct outputs should be created
    [Arguments]  ${arguments}  @{expected}
    ${outputs} =  Run rebot and return outputs  ${arguments}
    Lists Should Be Equal  ${outputs}  ${expected}

