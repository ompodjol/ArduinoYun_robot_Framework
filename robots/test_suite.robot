*** Settings ***
Library    Process
Library    OperatingSystem
Library    Telnet

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

Telnet ArduinoYun IP
  [tags]  Sanity
    Open Connection    192.168.0.162   22  # Replace with the appropriate hostname and port number
    ${result}    Login    root    arduino  # Replace with your Telnet login credentials
    Should Be True    ${result}  Connected successfully
    Write    hostname  # Replace with a command you want to execute
    ${output}    Read Until Prompt
    Should Contain    ${output}    expected_output  # Replace with the expected output
    Close Connection