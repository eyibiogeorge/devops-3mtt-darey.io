# Linux Commands 

```A Linux command refers to a program or utility that runs in the command-line interface(CLI). The CLI is a text-based environment where you interact with the system by typing commands.```

`CommandName [option(s)][parameter(s)]`

## Manipulating files and directories on Linux

### The ***sudo*** command

In Linux some actions need special permission to be carried out, like creating files in certain areas or changing important system settings.
This is where the ***sudo*** command comes into play.

`sudo` stands for `superuser do` and it allows you to run commands with the security privileges of another user, typically called the `superuser` or `root`.

`sudo` helps in keeping the system secure by limiting access to powerful commands and logs who executed which command, adding a layer of accountability.

#### Creating a Folder with sudo:

- ssh into aws remote server (ec2)

![](img/1.%20ssh%20to%20aws%20server.PNG)

- create a folder ***example*** in */root* without sudo

![](img/2.%20permission%20denied%20error.PNG)

- create a folder ***example*** in */root* with sudo

![](img/3.%20example%20dir.PNG)

### pwd command

`Use the pwd command to find the path of your current working directory`

![](img/4.%20pwd.PNG)

### The Linux directory structure

At the top of the Linux filesystem hierarchy is the root directory, denoted by a single slash ***'/'***

***/bin:*** Essential user command binaries(programs) that need to be available to all users command are stored here (eg. ls, cp etc)

***/etc:*** Configuration files for the system can be found in here.

***/home:*** Personal directories for users.

***/root:*** The home directory for the root user.

***/var:*** Variable data like logs

***/usr:*** Secondary hierarchy for user data

### cd command:

To navigate through the Linux files and directories.

![](img/5.%20root%20files.PNG)

- display /usr directory

![](img/6.%20cd%20usr.PNG)

### Side Hustle Task1:

- create a directory called ***photos*** inside the ***/usr*** directory

![](img/7.%20create%20photo%20directory.PNG)

- navigate into the ***photo*** directory

![](img/8.%20cd%20photos.PNG)

- create 3 more random directories insde the ***photos*** directory and display them

![](img/9.%20create%203%20folders.PNG)

- Navigate into one of the folder and show the full path

![](img/10.%20folder%20path.PNG)

### ls command:

The ***ls*** command lists files and directories.

![](img/11.%20ls%20command.PNG)

### cat command

*Concatenate* or *cat* is one of the most frequently used Linux commands. It lists, combines, and writes file content to the standard output.

![](img/12.%20cat%20etc%20file.PNG)

### cp command

use the cp command to copy files or directories and their content

- copy file to a folder

![](img/13.%20cp%20filename.PNG)

- copy multiple files to a folder

![](img/14.%20copies%20multiple%20files.PNG)

- copy from one file to another

![](img/15.%20copy%20from%20file%201%20to%202.PNG)

- copy from one directory to another

![](img/16.%20cp%20directory%20to%20directory.PNG)

### mv command

The primary use of the mv command is to move and rename files and directories

- move a file to a directory

![](img/17.%20mv%20file%20to%20directory.PNG)

- rename a file

![](img/18.%20rename%20new%20file.PNG)

### rm command

The rm command is used to delete files within a directory

- remove a single file

![](img/19.%20rm%20file.PNG)

- remove multiple file

![](img/20.%20rm%20multiple%20file.PNG)

### touch command

The touch command allows you to create an empty file.

![](img/21.%20touch.PNG)

### find command

use the find command to searchfor file within a specific directory and perform subsequent operations.

General syntax for fine: `find [option] [path][expression]`

![](img/22.%20find.PNG)