*** Settings ***
Library  TestClass   ARG1    ARG2    WITH NAME   First_lib
Library  TestClass   ARG3    ARG4    WITH NAME   Second_lib


*** Test Cases ***
MyTest
    First_lib.mykeyword   foo    bar
    Second_lib.mykeyword    john   doe


