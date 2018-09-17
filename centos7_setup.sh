#! /bin/bash
## Provide context information
echo "####################################################################"
echo "# This script is run from the ansible control machine.             #"
echo "# Ansible version 2.6.2 -- Python version 2.7.10                    #"
echo "# Make sure you have python-passlib installed on control machine!  #"
echo "# To install passlib: pip install --user passlib                   #"
echo "####################################################################"
echo " "
echo "####################################################################"
echo "# The script server target is a Centos 7.5.1804.e17 x86.64 OS      #"
echo "# Two accounts have been setup on the server- root and c7u1        #"
echo "# Target IP address is 192.168.0.18                                #"
echo "####################################################################"
echo " "
## Need to add validation for a correct IP address
echo "Continue with startup process? (Enter yes to continue.)"
read govar
if [[ $govar = "yes" ]]; then
## prompt for server IP address
echo -n "Enter Server IP Address   "
read ipAddress
## Remove current ssh key
ssh-keygen -R $ipAddress

## copy new ssh key for jjs0sbw
ssh-copy-id -i ~/.ssh/id_rsa.pub c7u1@$ipAddress

## copy new ssh key for root
ssh-copy-id -i ~/.ssh/id_rsa.pub root@$ipAddress

else
  echo "Exiting the setup script."
  exit
fi
