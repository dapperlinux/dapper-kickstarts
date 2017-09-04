# dapper-kickstarts

## About
The Dapper Kickstarts repository contains all of the kickstart files needed to build a complete bootable ISO image of Dapper Linux. 


## Building Dapper Linux

### Install a Build Virtual Machine
It is HIGHLY recommended that you build Dapper Linux in a virtual machine, and the virtual machine MUST match the version of Dapper Linux that you are building. For example, if you want to build Dapper Linux 26, start a Fedora 26 virtual machine, and install Fedora 26 to the VM. 

Do not use the virtual machine for anything special, as the build process can be destructive if any bugs arise in anaconda. 

Update the VM:
```bash
$ sudo dnf update
```

### Install Dependancies
Install the necessary dependancies to build:

```bash
$ sudo dnf install livecd-tools spin-kickstarts lorax virt-install libvirt-daemon-config-network pykickstart
```

### Obtain the Kickstart Files
Clone the dapper-kickstarts repo:

```bash
$ cd
$ mkdir -p DapperLinux/Distribution
$ cd DapperLinux/Distribution
$ git clone https://github.com/dapperlinux/dapper-kickstarts.git
$ cd dapper-kickstarts
$ chmod +x create_media.sh
```

### Start the Build Process
If you examine the contents of create_media.sh, you will find it automates everything, so go ahead and run it.
```bash
$ sudo ./create_media.sh
```
If the build succeeds, an ISO image called Dapper-Linux-Live-26.iso will be placed in the ~/DapperLinux/Distribution/dapper-kickstarts folder. If the build fails, read the anaconda logs to find out what went wrong and bugfix as necessary.

## Notes
The build system will likely be moving to a mock based system to match upstream. This will hopefully eliminate the need to create a virtual machine. These instructions will be updated once the buildsystem has been upgraded.




