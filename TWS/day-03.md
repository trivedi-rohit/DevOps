# Day-03 Task
## What I learned today & cheat sheet of commands:
    - Process management
    - File system
    - Networking troubleshooting

## What is Process in Linux?
A process is a program currently being executed in the system's kernel. It consists of the program instructions and inputs from system users. Every process is given a unique ID, known as a process ID number, and has an owner. A process can perform tasks such as writing a file or running a server online.

## States of Linux Processes
A process can be stopped, interrupted, or killed according to the need of an hour or as per requirement. When a process falls under any of these conditions, it is categorized within one of these states. The states of Linux processes are discussed below.

- **Running** : In Linux, an active program instance is referred to as a running process. The operating system tracks each process's state (running, stopped, sleeping) and resource use, such as memory and CPU space.

- **Sleeping** : A sleeping process is one that is dormant and waiting for a resource it can use to be made available on the system. While it is not actively running and using CPU resources, a sleeping process keeps its process ID (PID) and allotted resources.
A process may enter a sleep state for a number of reasons, including waiting for input/output operations to finish, a lock or a semaphore to appear, or for a signal or message from another process.
A sleeping process may be awakened by the resource or event it was anticipating, or by a specific signal. The process will then return to a running state and carry on with its operation from there.

- **Stopped** : In Linux, a stopped process is one that has been stopped either by the operating system or by a user. The process is still assigned resources and retains its process ID (PID), but it is not currently running.

