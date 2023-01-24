# SSH -Cheatscheat

## Creating Keys

  ssh-keygen -t ed25519 # Select the Algorithm
  ssh-keygen -f file # Specify the filename 


## Copy key to host

  ssh-copy-id -i ~/.ssh/key user@host
  
## Add key to ssh-agent

  eval "$(ssh-agent -s)"
  ssh-add -K /path/to/key
  

  