#!/bin/bash
echo " Starting Linux File Permission Audit..."

echo -e "\n[1] World-writable files:"
find / -type f -perm -0002 2>/dev/null

echo -e "\n[2] World-writable directories:"
find / -type d -perm -0002 2>/dev/null

echo -e "\n[3] SUID files:"
find / -type f -perm -4000 2>/dev/null

echo -e "\n[4] SGID files:"
find / -type f -perm -2000 2>/dev/null

echo -e "\n[5] Writable files owned by root:"
find / -user root -writable ! -group root ! -user $(whoami) 2>/dev/null

echo -e "\n[6] Files with no owner or group:"
find / -nouser -o -nogroup 2>/dev/null

echo -e "\n[7] Writable cron jobs or scripts:"
find /etc/cron* /var/spool/cron* -type f -writable 2>/dev/null

echo -e "\n[8] World-readable config files:"
find /etc -type f -perm /o=r 2>/dev/null

echo -e "\n[9] Writable directories in \$PATH:"
echo $PATH | tr ':' '\n' | while read dir; do [ -w "$dir" ] && echo "Writable: $dir"; done

echo -e "\n Audit Complete."
