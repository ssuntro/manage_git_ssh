# How to use the script
### step1: grant exe permission to script
go to "ssh_manager.sh" directory such as `cd desktop/manage_git_ssh` and `chmod +x ssh_manager.sh` 

### step2: 
#### 1st mode: list all available ssh key in local machine
`./ssh_manager.sh list`

#### 2nd mode: switch git ssh
`./ssh_manager.sh use {targeted git ssh key name}`

#### how to validate whether 2nd mode is working as expected
`echo $GIT_SSH_COMMAND`

