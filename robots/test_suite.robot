*** Settings ***
Library    Process
Library    OperatingSystem
Library    SSHLibrary
Variables    credentials.py

#*** Variables ***
#${ARDUINOYUN_IP}        192.168.0.162
#${ARD_USERNAME}         root
#${ARD_PASSWORD}         arduino

#${RASPBERRYPI4_IP}        192.168.0.186
#${RAS_USERNAME}           jollyjae


*** Test Cases ***
Run HelloWorld Python Script
  [tags]  Sanity
    ${output} =    Run Process    python3    pythonscripts/HelloWorld.py
    Should Contain    ${output.stdout}    Hello World!

Ping ArduinoYun IP
  [tags]  Sanity    Arduino
    ${ping_result} =    Run Process    ping -c5 192.168.0.162    shell=True
    Should Be Equal As Strings    ${ping_result.rc}    0   # Check if return code is 0, indicating successful ping
    Should Contain    ${ping_result.stdout}    64 bytes from 192.168.0.162

SSH ArduinoYun and Get Hostname
  [tags]  Sanity    SSH    Arduino
    Open Connection    ${ARDUINOYUN_IP}
    Login    ${ARD_USERNAME}    ${ARD_PASSWORD}     delay=1
    ${hostname_output}    Execute Command    hostname
    Log    Hostname: ${hostname_output}
    Should Be Equal     ${hostname_output}     ArduinoYun
    Close All Connections

Check uname ArduinoYun
  [tags]  Sanity    SSH    Arduino
    Open Connection    ${ARDUINOYUN_IP}
    Login    ${ARD_USERNAME}    ${ARD_PASSWORD}     delay=1
    ${uname_output}    Execute Command    uname -a
    Log    Hostname: ${uname_output}
    Should Be Equal     ${uname_output}     Linux ArduinoYun 3.3.8 #1 Fri Apr 11 07:16:38 CEST 2014 mips GNU/Linux
    Close All Connections

Ping RaspberryPi4 IP
  [tags]  Sanity    Raspberrypi
    ${ping_result} =    Run Process    ping -c5 192.168.0.186    shell=True
    Should Be Equal As Strings    ${ping_result.rc}    0   # Check if return code is 0, indicating successful ping
    Should Contain    ${ping_result.stdout}    64 bytes from 192.168.0.186

SSH RaspberryPi4 and Get Hostname
  [tags]  Sanity    SSH    Raspberrypi
    Open Connection    ${RASPBERRYPI4_IP}    port=1979
    Login    ${RAS_USERNAME}    ${RAS_PASSWORD}    delay=1
    ${hostname_output}    Execute Command    hostname
    Log    Hostname: ${hostname_output}
    Should Be Equal     ${hostname_output}     raspberrypi4
    Close All Connections

Check uname Raspberrypi4
  [tags]  Sanity    SSH    Raspberrypi
    Open Connection    ${RASPBERRYPI4_IP}    port=1979
    Login    ${RAS_USERNAME}    ${RAS_PASSWORD}     delay=1
    ${uname_output}    Execute Command    uname -a
    Log    Hostname: ${uname_output}
    Should Be Equal     ${uname_output}     Linux raspberrypi4 6.1.0-rpi4-rpi-v8 #1 SMP PREEMPT Debian 1:6.1.54-1+rpt2 (2023-10-05) aarch64 GNU/Linux
    Close All Connections

Check uname Raspberrypi4 USING FILE VARIABLE
  [tags]  Sanity    SSH    Raspberrypi4
    Open Connection    ${RASPBERRYPI4_IP}    port=1979
    Login    ${RAS_USERNAME}    ${RAS_PASSWORD}     delay=1
    ${uname_output}    Execute Command    uname -a
    Log    Hostname: ${uname_output}
    Should Be Equal     ${uname_output}     Linux raspberrypi4 6.1.0-rpi4-rpi-v8 #1 SMP PREEMPT Debian 1:6.1.54-1+rpt2 (2023-10-05) aarch64 GNU/Linux
    Close All Connections
