#!/bin/bash
##Description: This script displays the server inventories of servers billed for decommissioning
## Author: Salome Chitubila
##Date: 10/08/2021
##Check OS version
os=$(cat /etc/*release | head -1)
echo " The Operating System is ${os} "
sleep 2
## Memmory Check
memory=$(free -m | grep Mem | awk '{print$2}')
echo " The total memory size ${memory} "
sleep 2
## Hard drive check
hdisk=$(lsblk | grep disk | awk '{print$4}')
echo " The hard disk drive is ${hdisk} "
sleep 2
## The CPU Speed
cpu_speed=$(lscpu | grep "CPU MHz" | awk '{print$3}')
## The CPU Speed
cpu_speed=$(lscpu | grep "CPU MHz" | awk '{print$3}')
echo " The cpu speed is ${cpu_speed} "
sleep 2
##The Kernel Version
kver=$(uname -r | awk -F "-" '{print$1}')
echo " This System Kernel version is: ${kver} "
sleep 2
## The System Bits
echo " Sytem bit is: `getconf LONG_BIT`"
sleep 2
## Hostname Check
echo "The hostname is $HOSTNAME "
sleep 2
## IP address
ip=$(ifconfig | grep inet | awk 'NR==1{print$2}')
echo " IP Address is : ${ip} "
sleep 2
## Check Listening Ports
echo " Opened ports are $(ss -tulpn | grep LISTEN) "
sleep 2
##DNS Check
echo " DNS address is $(cat /etc/resolv.conf | grep nameserver ) "
sleep 2
## Manufacturer Check
su - root
echo " The Manufacturer is: $(dmidecode -t system | grep Manufacturer | awk -F ":" '{print$2}')"
sleep 2
## Is the System Virtual or Physical ?
echo " This system is $(dmidecode -t system | grep Family | awk -F ":" '{print$2}') "
sleep 2
## The Mac Address
echo " The system mac address is $(ip a | grep link/ether | awk '{print$2}') "
sleep 2
exit 0
