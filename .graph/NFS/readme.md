# Home:
- Doc: https://developer.hashicorp.com/vagrant/docs/synced-folders/nfs

# Sudoers
>To configure NFS, Vagrant must modify system files on the host. Therefore, at some point during the vagrant up sequence, you may be prompted for administrative privileges (via the typical sudo program). These privileges are used to modify /etc/exports as well as to start and stop the NFS server daemon.
>
>**If you do not want to type your password on every vagrant up, Vagrant uses thoughtfully crafted commands to make fine-grained sudoers modifications possible** to avoid entering your password.
>
>Below, we have a couple example sudoers entries. Note that you may have to modify them slightly 
