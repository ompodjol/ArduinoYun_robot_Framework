#!/bin/python3.11

class Devices:
    def __init__(self, device_name, username, password, ip_address, command):
        self.device_name = device_name
        self.username = username
        self.password = password
        self.ip_address = ip_address
        self.command = command
    
    @classmethod
    def default_arduino(cls):
        return cls("Arduino", "jollyjae", "password", "192.168.0.162", "ping -c5")


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
        
    
    def set_username(self, username):
        self.username = username
        
        
    def set_password(self, password):
        self.password = password
        
        
    def set_ip_address(self, ip_address):
        self.ip_address = ip_address
        
        
    def set_command(self, command):
        self.command = command
