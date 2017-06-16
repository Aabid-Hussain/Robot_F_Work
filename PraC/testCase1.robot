*** Settings ***
Library    OperatingSystem
Library  BuiltIn
Library  String

Metadata 	Version           1.0
...	        More Info         For more information about Robot Framework
...                                see http://robotframework.org
...
...             Author            Mohammad Aabid Hussain
...
...             Date              25-05-2017
...
...	        Executed At  	  ${HOST}
...
...		Test Framework    Robot Framework Python

Documentation   A test suite with tests for configuring BGP.

...             Topology:-
...                          ____________________________
...                         |             R1         AS2 |
...                         |            /  \            |
...                         |           /    \           |
...                         |         R2      R3         |
...                         |_________|________|_________|
...                                   |        |
...                             ______|__   ___|______
...                            |      AS1| |       AS3|
...                            |    R4   | |   R5     |
...                            |_________| |__________|
...
...     Testplan Goals:-
...     1. Configure IP addresses as per the topology.
...     2. Each Router should have a loopback0 interface.
...     3. Configure OSPF within AS2 to advertise the loopback0 interfaces.
...        Don't advertise or run OSPF on the links interconnecting AS1 and AS3.
...     4. Configure IBGP between R2 and R3. Source the BGP updates from the loopback0 interfaces.${\n}5.Enable BGP synchronisation.
...     6. Configure EBGP between R2 and R4.
...     7. Configure EBGP between R3 and R5.
...     8. Advertise the loopback0 interfaces on R4 and R5.
...     9. Ensure AS1 and AS3 can communicate with each other without removing the
...        synchronisation command.

Library  String

*** Variables ***

${MESSAGE}    Hello, World!
${PATH}    ${CURDIR}/example.txt
${HOST}    v-mohamh
*** Test Cases ***

UsageOfForLoop - 1
    :FOR   ${index}    in range    1   5
    \  log  ${index}
    \  ${Random_String} =  generate random string  ${index}
    \  Log   ${Random_String}

UsageOfForLoop - 2
    @{items}    create list  aabid  hussain  aishwary  gautam

#    create list     'Aabid'    "Hussain"   "Aishwary"  "Gautam"
    :For   ${index}    IN    @{items}
    \  Log  ${index}

UsageOfForLoop - 3
    @{item}     create list   aabid    hussain    aishwary    gautam
    : For   ${element}    in    @{item}
    \   log  ${element}
    \   run keyword if    ${element} == aishwary    exit for loop
    \   log  'loop has exit'



Test Case - 1
    [Documentation]    First Test CaSe
    Log    ${MESSAGE}
    UserKeyword   ${TEMP_DIR}   #used for comment


Test Case - 2
    [Documentation]  value comparison with variable
    Should Be Equal    ${MESSAGE}    Hello, World!

Test Case - 3

    Create File    ${PATH}    Tiger=Aishwary
    File Should Exist	${PATH}
    Copy File	${PATH}	~/file.txt
    ${output} =	Run	${TEMP_DIR}${/}script.py arg

*** Keywords ***

UserKeyword
    [Arguments]    ${path}
    Directory Should Exist    ${path}