*** Settings ***
Library    Process
Library    OperatingSystem
Library    SSHLibrary

*** Test Cases ***
Run HelloWorld Python Script
  [tags]  Sanity
    ${output} =    Run Process    python3    pythonscripts/HelloWorld.py
    Should Contain    ${output.stdout}    Hello World!

Ping ArduinoYun IP
  [tags]  Sanity
    ${ping_result} =    Run Process    ping -c5 192.168.0.162    shell=True
    Should Be Equal As Strings    ${ping_result.rc}    0   # Check if return code is 0, indicating successful ping
    Should Contain    ${ping_result.stdout}    64 bytes from 192.168.0.162

SSH ArduinoYun and Get Hostname
  [tags]  Sanity
    Open Connection    192.168.0.162
    Login    root    arduino    delay=1
    Read Until    root@ArduinoYun:~# 
    ${hostname_output}    Execute Command    hostname
    Log    Hostname: ${hostname_output}
    Close All Connections