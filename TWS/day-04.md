# Day-04 Task
## We will create a short practice note by actually running basic commands and capturing what we see:
  - Check running processes
  - Inspect one systemd service
  - Capture a small troubleshooting flow

### The ps command is use to see process, here we search for ssd service from all process. The flag used -l and -a, where -l = list all process related to SSH & -a = show PID along with CLI argument.
[root@localhost liverepo]# pgrep -la ssh
1049 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
12081 ssh-agent -s
12996 sshd-session: root [priv]
13000 sshd-session: root@pts/0
13001 sshd-session: root [priv]
13039 sshd-session: root@notty
13101 sshd-session: root [priv]
13105 sshd-session: root@pts/1
13106 sshd-session: root [priv]
13144 sshd-session: root@notty
13292 sshd-session: root [priv]
13296 sshd-session: root@pts/2
13297 sshd-session: root [priv]
13335 sshd-session: root@notty
13426 sshd-session: root [priv]
13430 sshd-session: root@pts/3
13431 sshd-session: root [priv]
13469 sshd-session: root@notty

### Below we have output for **top** command
 - It show last PID created 30267.
 - Total 130 processes, out of which 2 are in running state 
root@localhost# top
last pid: 30267;  load averages:  1.42,  1.49,  1.44                                                                                                                                  up 6+10:36:14  08:49:54
130 processes: 2 running, 128 sleeping
CPU:  0.0% user,  0.0% nice, 50.0% system,  0.0% interrupt, 50.0% idle
Mem: 131M Active, 747M Inact, 8588K Laundry, 14G Wired, 1338M Buf, 135M Free
Swap: 4198M Total, 4198M Free

  PID USERNAME  PRI NICE   SIZE    RES STATE   C   TIME    WCPU COMMAND
37819 root      103    0  4250M  4214M CPU1    1  42.3H  97.59% NSPPE-00
38246 root       20    0 82280K 65012K select  0   0:53   0.26% mastools{PROXY-LS-RCV0}
38246 root       20    0 82280K 65012K select  0   0:53   0.26% mastools{PROXY-VD-RCV0}
30083 root       20    0  9892K  4360K CPU0    0   0:00   0.06% top
37854 root       20    0 39404K 33124K kqread  0   1:44   0.05% nsnetsvc
37877 root       20    0 41668K 18320K kqread  0   2:05   0.04% nsaggregatord
30074 root       20    0 15196K 11624K select  0   0:00   0.02% sshd




