*** Settings ***
Library  String
Library  OperatingSystem
Library  Collections

*** Test Cases ***

Run-Keyword
    ${my_keyword}=  set variable  log
    RUN KEYWORD  ${my_keyword}  Test


Run-Keyword-If
    ${TYPE}=    SET VARIABLE    V1
    RUN KEYWORD IF  '${TYPE}' == 'V1'   log  Testing Variant 1
    RUN KEYWORD IF  '${TYPE}' == 'V2'   log  Testing Variant 2
    RUN KEYWORD IF  '${TYPE}' == 'V3'   log  Testing Variant 3

Run-Keyword-Ignore-Error
    @{captans}  create list  Kaptan    Aabid    NULLI    khalii
    RUN KEYWORD AND IGNORE ERROR    should be empty  ${captans}
    log  Reached this point despite of error


StringAndLists
    #Some_Value = "Test Value"
    ${Some_Value}=  SET VARIABLE    "Test Value"
    #log the info of variable Some_Value
    log  ${Some_Value}
    #Split the string based on space
    @{Words}=   split string  ${Some_Value}    ${SPACE}
    #store first element of list to var first
    ${First}=   get from list  ${Words}    0
    #log the info of variable First
    log  ${First}

Testing with Settings
    [Documentation]  Dummy test
    [Tags]  Dummy   owner-Aabid_Hussain
    log     Hello World!

Creating Directory
    Create directory    ${TEMPDIR}/Stuff
    copy file  ${CURDIR}/sample1*     ${TEMPDIR}/Stuff
    NO OPERATION

Creating File
    create file  ${TEMPDIR}/empty.txt
    create file  ${TEMP_DIR}/firstinput.txt     what is your name
    create file  ${TEMP_DIR}/secondinput.txt    what is your name    ISO-8859-1