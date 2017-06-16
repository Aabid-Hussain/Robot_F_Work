*** Settings ***
Library   Telnet
Test Setup
*** Variables ***
${R1}  192.168.1.1
${username1}  Net_Script
${password1}  ciscor2

*** Test Cases ***
LoginTest
    Open Connection  ${R1}    prompt=username    prompt=password  port=23
    Read Until   Username:
    Write    ${username1}
    Read Until  Password:
    Write    ${password1}
    Read Until  DUT>
    Write  enable
    Read Until  Password:
    Write  dut
    Read Until  DUT#
    Write  show ip inter br


