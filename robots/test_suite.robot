*** Settings ***
Library    Process
Library    OperatingSystem

*** Test Cases ***
Run HelloWorld Python Script
    ${output} =    Run Process    python3    pythonscripts/HelloWorld.py
    Should Contain    ${output.stdout}    Hello World!

Ping ArduinoYun IP
  [tags]  Sanity
    ${ping_result} =    Run Process    ping -c5 192.168.0.162    shell=True
    Should Be Equal    ${ping_result.rc}    '0'    # Check if return code is 0, indicating successful ping
    Should Contain    ${ping_result.stdout}    "ping -c5 192.168.0.162"