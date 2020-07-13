@ECHO OFF 
:: This batch file reveals OS, hardware, and networking configuration.
TITLE My System Info
ECHO Please wait... Checking system information.
:: Section 1: OS information.
ECHO ============================
ECHO OS INFO
ECHO ============================
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
:: Section 2: Hardware information.
ECHO ============================
ECHO HARDWARE INFO
ECHO ============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic path win32_VideoController get Name,AdapterRAM,DeviceID,DriverVersion
wmic path win32_LogicalDisk get DeviceID,VolumeName,Size,FreeSpace,FileSystem,ProviderName
:: Section 3: Networking information.
ECHO ============================
ECHO NETWORK INFO
ECHO ============================
ipconfig/all
nslookup myip.opendns.com resolver1.opendns.com
ECHO ============================
ECHO PING TESTS
ECHO ============================
set "ip="
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "Default"') do if not defined ip set ip=%%b
ECHO #### Pinging Router ####
ping %ip%
ECHO #### Pinging Google ####
ping 8.8.8.8

PAUSE