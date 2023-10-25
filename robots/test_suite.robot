*** Settings ***
Library    Process

*** Test Cases ***
Run HelloWorld Python Script
    ${output} =    Run Process    python3    HelloWorld.py
    Should Contain    ${output.stdout}    Hello World!