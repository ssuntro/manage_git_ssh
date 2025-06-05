# How to use the script
### step1: 
`chmod +x ssh_manager.sh`

### step2: 
#### 1st mode: list all available ssh key in local machine
`./ssh_manager.sh list`

#### 2nd mode: switch git ssh
`source ./ssh_manager.sh use {targeted git ssh key name}`
#### how to validate whether 2nd mode is working as expected
`echo $GIT_SSH_COMMAND`

