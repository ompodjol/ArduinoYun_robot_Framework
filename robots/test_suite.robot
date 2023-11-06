*** Settings ***
Library    Process
Library    OperatingSystem
Library    SSHLibrary

*** Variables ***
${ARDUINOYUN_IP}        192.168.0.162
${USERNAME}             root
${PASSWORD}             arduino

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
  [tags]  Sanity    SSH
    Open Connection    ${ARDUINOYUN_IP}
    Login    ${USERNAME}    ${PASSWORD}     delay=1
    ${hostname_output}    Execute Command    hostname
    Log    Hostname: ${hostname_output}
    Should Be Equal     ${hostname_output}     ArduinoYun
    Close All Connections

Check uname ArduinoYun
  [tags]  Sanity    SSH
    Open Connection    ${ARDUINOYUN_IP}
    Login    ${USERNAME}    ${PASSWORD}     delay=1
    ${uname_output}    Execute Command    uname -a
    Log    Hostname: ${uname_output}
    Should Be Equal     ${uname_output}     Linux ArduinoYun 3.3.8 #1 Fri Apr 11 07:16:38 CEST 2014 mips GNU/Linux
    Close All Connections
