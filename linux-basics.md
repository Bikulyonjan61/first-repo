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

## 5. Users, groups and permissions
### /etc/passwd: 7 fields
`alice:x:1001:1001:Bikul,1,1,1,1:/home/alice:/bin/bash`
1. alice = user
2. x = password holder
3. 1001 = user id
4. 1001 = group id
5. Bikul,1,1,1,1 = user details
6. /home/alice = user folder location
7. /bin/bash = login shell

### /etc/shadow
- What it stores: passwords in the form of hash
- Why only root can read it: it contains password which can be read by administrater only
- Why a password is stored as a hash, not the real password: because that way it is kept secure so noone can steal it

### Reading permissions: `drwxrwsr-x root devs`
- d = folder
- rwx (first 3) =  read, write and open what the owner can do
- rws (middle 3) = read, write and open , and the s means: special rule what the group can do
- r-x (last 3) = read and open what others can do
- root = belongs to root
- devs = name of the team or shared folder

### Numbers: 775
- r = 4, w = 2, x = 1
- 7 = 4+2+1 = rwx
- 5 = 4-1 = r-x

### Making a shared team folder (4 steps)
1. `sudo groupadd devs`: created a group called devs
2. `sudo usermod -aG devs alice`: adds alice to group devs
3. `sudo chgrp devs /srv/project` and `sudo chmod 775 /srv/project`: changes permission of the folder and chgrp devs give the folder /srv/project group devs
4. `sudo chmod g+s /srv/project`: if a user adds a file to the folder, the group will become devs and the owner will still be the user who created it

### Traps I hit
- Forgetting `-a` in usermod: replaces all the users group, so ubuntu will loss the sudo access and admin access will be gone
- New group not showing in `id`: should exit and open again
- Relative vs absolute path (after-fix.txt): relative path is just the folder name while the absolute path is the full location of the folder that is /srv/project/after-fix.txt

