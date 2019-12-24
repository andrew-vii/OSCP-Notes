REM Username                
whoami

REM User Info
net user <username>

REM Logged-On Users            
query user

REM System Date                
date /t

REM System time                
time /t

REM Task information            
tasklist /V

REM Audit policy settings            
auditpol /get /category:*
    
REM Networking information            
ipconfig /all

REM Network connections            
netstat /anob

REM Firewall info                
netsh advfirewall show allprofiles
    
REM Share drive information            
net share
    
REM Scheduled task info            
schtasks /query /v
    
REM Security Logs                
wevtutil qe security /c:25 /rd:true /f:text 
    
REM Auto-started Software            
reg query hklm\software\microsoft\windows\currentversion\run
    
REM Auto-Started Software            
reg query hklm\software\microsoft\windows\currentversion\runonce
    
REM Installed Software            
reg query hklm\software
    
REM View C:\ Drive                
dir /o:d /t:w "c:\" 
    
REM View Windows Files            
dir /o:d /t:w c:\windows\

REM View Temp Files                
dir /o:d /t:w c:\windows\temp
    
REM View System32 Files            
dir /o:d /t:w c:\windows\system32
    
REM View New Logs                
dir /o:d /t:w c:\windows\system32\winevt\logs


