# Day-02 Task
## Linux Architecture Notes
### What I learned today:
    - Linux Architecture, user space
    - Default directories.
    - How processes works in Linux (running, sleeping zombie etc).
    - Systemd/init process PID
    - Systemctl
    - Few commands in Linux.
### What is Linux and why so famous
Linux is an open-source operating system kernel that acts as the core of many Unix-like operating systems. 
It was first created by Linus Torvalds in 1991 and has grown into one of the most widely used operating systems across the world.
One of the main reasons behind Linux’s popularity is its open-source nature. 
- Its source code is publicly available, allowing developers to study, customize, and distribute it according to their needs.
- Linux supports a broad range of software and services, such as web servers, databases, programming languages, office applications, multimedia tools, and much more.
- Another key advantage is its strong and active community. Users and developers can easily share knowledge, seek support, and collaborate, which makes troubleshooting and learning more accessible.
- Linux is generally free to use and distribute, helping both individuals and organizations reduce licensing expenses and use their resources more effectively.
- In addition, Linux is known for its strong security framework. Because it is open source, security issues can be identified and fixed quickly by the global developer community.

### Architecture of Linux
Linux follows a layered architecture, where each layer performs a specific function and communicates with others.
The main layers are:

1. Hardware Layer
2. Kernel (Core of Linux)
3. System Libraries
4. Shell
5. User Space / Applications


**1. Hardware - The Physical Layer**
At the bottom of Linux architecture is the hardware. This includes:
 - CPU (Processor)
 - RAM (Memory)
 - Storage (Disk/SSD)
 - Input devices (Keyboard, Mouse)
 - Output devices (Monitor, Printer)
 - Network interfaces
 - Peripheral devices

Hardware cannot directly communicate with user applications. There must be a bridge. That bridge is the Kernel.

**2. Kernel - The Heart of Linux**
The Kernel is the most critical part of Linux. It acts as the brain and controller of the entire system.

It manages:
 - Process scheduling
 - Memory allocation
 - Device communication
 - File system operations
 - Security and permissions
 - System calls
 - Hardware interaction

The Kernel runs in privileged mode, meaning it has full control over the system.

a. **Process Management**
Linux allows multiple programs to run simultaneously. The Kernel decides:
 - Which process runs first
 - How long it runs
 - When to pause/resume processes
 - How processes communicate

Linux uses multitasking, meaning the Kernel intelligently switches between processes to maintain performance and responsiveness.

b. **Memory Management**
Memory is limited. The Kernel manages how memory is allocated and used. It handles:
 - Virtual memory
 - Paging and swapping
 - Memory protection
 - Efficient allocation

This ensures applications do not overwrite each other's memory and system remains stable.

c. **File System Management**
Everything in Linux is treated as a file including devices. The Kernel manages:

 - File creation and deletion
 - Reading and writing files
 - Permissions and ownership
 - Disk structure
Common Linux file systems include:
   - ext4
   - XFS
   - Btrfs

d. **Device Management**
Hardware devices communicate with the Kernel using device drivers. The Kernel ensures:

 - Keyboard input reaches applications
 - Disk read/write works correctly
 - Network communication happens smoothly
 - USB devices are recognized
Without Kernel, hardware cannot function properly.

e. **System Calls - Communication Bridge**
Applications cannot directly talk to hardware. They request services through system calls.
Examples:

 - open() → open file
 - read() → read data
 - write() → write data
 - fork() → create process
 - exec() → execute program
System calls act as the safe gateway between user applications and Kernel.

**3. System Libraries**
System libraries provide predefined functions that applications use to interact with the Kernel.
Instead of directly calling system calls, applications use libraries like:

 - glibc (GNU C Library)
 - Standard C Library

Libraries simplify programming and improve performance by providing reusable functions.

**4. Shell - User Interface to the System
The Shell is the command interpreter that allows users to communicate with the system.

When we type a command:
ls

The Shell:
   - Reads the command
   - Interprets it
   - Sends request to Kernel
   - Displays output

Shell acts as the bridge between User and Kernel.

**5. User Space - Applications and Programs**
This is where all user applications run.

Examples:

 - Text editors, Web browsers, Database, DevOps tools, Programming languages, GUI applications

User applications run in non-privileged mode, meaning they cannot directly access hardware. They must go through Kernel for operations.



