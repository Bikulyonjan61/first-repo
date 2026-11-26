# VM Setup: Week 4

## 1. Install
- Command I used to install Multipass:
    brew install --cask multipass
- How I checked it worked:
    multipass list
    multipass shell lab
    lsb_release -a
    whoami

## 2. Launch the VM
- My launch command:
    multipass launch --name lab --cpus 2 --memory 2G --disk 10G
- What each flag does: 
    --name: name of vm
    --cpus: cpu core allocation for vm
    --memory: memory allocation
    --disk: space allocation
- Commands to start, enter, stop the VM:
    start: multipass start lab
    enter: multipass shell lab
    stop: multipass stop lab

## 3. What I found inside
- Ubuntu version and chip type (aarch64 = arm64):
    by typing lsb_release -a i can see the verison, Ubuntu 26.04.1 LTS
    uname -m shows the architecture it use that is aarch64
- VM IP vs Mac IP:
    both ips are different in different network. VM 192.168.252.2 vs Mac 192.168.1.69
- Why they are different:
    they are different because vm is on multipass own private network and mac acts as the router

## 4. Linux folder layout
- /etc:config file for the whole system
- /var/log: it has data that changes such as cloud-init.log and auth.log
- /home: users personal folder
- /usr and why /bin -> usr/bin: installed program and their files. /bin is a link (shortcut) to /usr/bin"
- /proc: short for processes prints live info from the kernel when you read it

## 5. What I learned
- Why /proc/meminfo is 0 bytes but shows numbers: 
    because it is not stored in disk but in kernel and while opeing kernel creates the answer it is live data written by kernel.
- "Everything is a file" means:
    Linux makes every system information look like a normal file
- MemFree vs MemAvailable:
    MemFree: ram nobody is using.
    MemAvailabe: ram that can be used when a program needs it