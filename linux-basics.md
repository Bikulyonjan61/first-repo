# Linux Basics (Week 4, day 2)

## 1. The folder tree
```
/
├── /etc   →  job: system setting           example file I saw:/etc/hostname
├── /var   →  job: stores files that changes frequently           example: /var/log/auth.log
├── /home  →  job: stores users personal directories           example: /home/ubuntu
├── /usr   →  job: stores user programs           example: /usr/bin
├── /bin   →  job: no job just connets to /usr/bin         (what's special about it?) shortcut for /usr/bin
├── /proc  →  job: shows live info from the kernel           example: /proc/meminfo
└── /tmp   →  job: stores temporary files that is created while running a program
```

## 2. What happens when I type `cat /etc/hostname`
cat cannot request disk for information directly so it first asks kernel that is called syscall.
than bash finds /usr/bin/cat and starts a new process
cat loads its libraries and open kernel and ask for files bu syscall
The kernel reads it from disk and returns file descriptor 3. cat uses that to read the text.
when I type cay /etc/hostname it prtints the hostname fo the shell by which its login for me its lab


## 3. Process family tree in my VM
kernel(0)
    systemd(1)
        sshd
            sshd-session
                bash
                    cat

## 4. One line each
- Program vs process:
program is something that does a certain work while a process is the instance of program.
- PID and PPID:
PID is process identification number which records running process ad gives a process id while PPID is the parent process id which identifies the parent that started the process
- File descriptors 0 / 1 / 2:
0 stdin is used for input
1 is used for stdout 
2 is used for errors stderr
- Why `cd` is built into bash:
cd is built into bash because it need to change the current working directories into running shell itself.
- What `apt` does, and where it records installs:
apt is like an appstore for linux and it records the install in /var/lib/apt or /var/lib
- What `/var/log/auth.log` records:
it records authentication related logs. Every login and sudo with who,whom when and what command