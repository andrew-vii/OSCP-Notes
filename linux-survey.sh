#!/usr/bin/sh

#Survey commands for *nix boxes

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
sudo find / \( -path /proc -prune -o -path /sys -prune \) -o -mmin -15 -type f -print |  xargs ls -latr


