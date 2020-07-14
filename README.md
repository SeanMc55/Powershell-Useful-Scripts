# Powershell-Useful-Scripts
 
This repository is a collection of scripts that I have found or made myself that can do several useful things in powershell. The scripts will grow over time as I find more or encounter new use cases that require or would benifit from a script.

## file-permission-checker

Currently this script only checkes whether the user who ran the script has access to them. A future version might list out the exact permissions of the folders/files.

This script will take the directores given to it and then either check the permissions of just the directories and/or the files based on user input. The resultant file will be placed in the folder the script is run from. It is also important to note that if you want to specify multiple levels deep, then you must enter each directory you wish to check. For example: C: , C:\ * , 'C\ *\ * (without spaces) so on and so forth. Script will also ask how many levels deep to search through.

The base source code is from this post: https://community.spiceworks.com/topic/2039617-how-to-continue-a-get-childitem-script-despite-access-errors

## get_system_information
This script will grab various usefull information from the host that it is run on. Hostname, CPU, RAM, GPU hardware, network information, and run some pings tests.