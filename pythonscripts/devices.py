#!/bin/python3.11

class Devices:
    def __init__(self, device_name, username, password, ip_address, command):
        self._device_name = device_name
        self._username = username
        self._password = password
        self._ip_address = ip_address
        self._command = command

    def get_device_info(self):
        print(f"Device Info => Device Name: {self.device_name}, ip Address: {self.ip_address}")
        
    @property    
    def device_name(self):
        return self._device_name
        
    @device_name.setter    
    def device_name(self, new_device_name):
        if isinstance(new_device_name, str):
            self._device_name = new_device_name
        else:
            print("Name must be a string.")
    
    @property
    def username(self):
        return self._username
    
    @username.setter
    def username(self, new_username):
        if isinstance(new_username, str):
            self._username = new_username
        else:
            print("Username must be a string.")
            
    @property
    def ip_address(self):
        return self._ip_address
    
    @ip_address.setter
    def ip_address(self, new_ip_address):
        if isinstance(new_ip_address, str):
            self._ip_address = new_ip_address
        else:
            print("IP Address must be a string.")
    
    @property
    def command(self):
        return self._command
    
    @command.setter
    def command(self, new_command):
        if isinstance(new_command, str):
            self._ip_address = new_command
        else:
            print("Command must be a string.")