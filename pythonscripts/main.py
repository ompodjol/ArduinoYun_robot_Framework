#!/bin/python3.11

from devices import Devices
#device_name = devices("Arduino", "jollyjae", "password", "192.168.0.162", "ping -c5")

def main():
    print("main() called ...")
    Devices.set_device_name("Arduino2")
    Devices.get_device_name()

    
if __name__ == "__main__":
    main()
    