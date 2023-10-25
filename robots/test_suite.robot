*** Settings ***
Library    Process
Library    Telnet

*** Test Cases ***
Run HelloWorld Python Script
    ${output} =    Run Process    python3    pythonscripts/HelloWorld.py
    Should Contain    ${output.stdout}    Hello World!

Ping ArduinoYun
  [tags]  Sanity
    Open Connection    192.168.0.162    23
    Login    root    arduino
    Write    ping 192.168.0.162  # Replace 'example.com' with the target host or IP address
    Read Until    ms
    Should Contain    Reply from
    Close All Connections