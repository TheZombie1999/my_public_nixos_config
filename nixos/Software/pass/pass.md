
# Pass 

## How to backup and restore gpg key

  gpg -o private.gpg --export-options backup --export-secret-keys ponder.stibbons@unseen.edu
  
  gpg --import-options restore --import private.gpg

