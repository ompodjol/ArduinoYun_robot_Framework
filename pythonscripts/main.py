#!/bin/python3.11

from devices import Devices
device1 = Devices("Arduino", "jollyjae", "password", "192.168.0.162", "ping -c5")

def main():
    print("main() called ...")
    device1.device_name = "Arduino2"
    print(device1.device_name)

    
if __name__ == "__main__":
    main()
    