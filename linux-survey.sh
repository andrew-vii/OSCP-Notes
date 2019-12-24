#!/usr/bin/sh

#Survey commands for *nix boxes

#Check other logged-on accounts
w;

#Check account name
who;

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


tail -n1000 /var/spool/cron/*;

sestatus||getenforce;

cat /root/.bash_history;

cat ~/.bash_history;

cat /var/mail/root;

fdisk -l; 

date;date -u; 

df; 

tail -n50 /var/log/cron /var/log/secure /var/log/messages; 

cat /etc/crontab 

sudo find / \( -path /proc -prune -o -path /sys -prune \) -o -mmin -15 -type f -print |  xargs ls -latr


