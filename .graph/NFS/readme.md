# Home:
- Doc: https://developer.hashicorp.com/vagrant/docs/synced-folders/nfs

# NFSv4
host: Ubuntu 23.04  
guest: generic/ubuntu2204  
provider: Libvirt

Vagrantfile:
```
  # Only NFS ver. 4 works!
  config.vm.synced_folder ".", "/vagrant",
    type: "nfs",
    nfs_version: 4,
    nfs_udp: false
```

# Sudoers
>To configure NFS, Vagrant must modify system files on the host. Therefore, at some point during the vagrant up sequence, you may be prompted for administrative privileges (via the typical sudo program). These privileges are used to modify /etc/exports as well as to start and stop the NFS server daemon.
>
>**If you do not want to type your password on every vagrant up, Vagrant uses thoughtfully crafted commands to make fine-grained sudoers modifications possible** to avoid entering your password.
>
>Below, we have a couple example sudoers entries. Note that you may have to modify them slightly 
>
>For Linux , sudoers should look like this:
>
```
Cmnd_Alias VAGRANT_EXPORTS_CHOWN = /bin/chown 0\:0 /tmp/vagrant-exports
Cmnd_Alias VAGRANT_EXPORTS_MV = /bin/mv -f /tmp/vagrant-exports /etc/exports
Cmnd_Alias VAGRANT_NFSD_CHECK = /etc/init.d/nfs-kernel-server status
Cmnd_Alias VAGRANT_NFSD_START = /etc/init.d/nfs-kernel-server start
Cmnd_Alias VAGRANT_NFSD_APPLY = /usr/sbin/exportfs -ar
%sudo ALL=(root) NOPASSWD: VAGRANT_EXPORTS_CHOWN, VAGRANT_EXPORTS_MV, VAGRANT_NFSD_CHECK, VAGRANT_NFSD_START, VAGRANT_NFSD_APPLY
```
>For Fedora Linux, sudoers might look like this (given your user belongs to the vagrant group):
```
Cmnd_Alias VAGRANT_EXPORTS_CHOWN = /bin/chown 0\:0 /tmp/vagrant-exports
Cmnd_Alias VAGRANT_EXPORTS_MV = /bin/mv -f /tmp/vagrant-exports /etc/exports
Cmnd_Alias VAGRANT_NFSD_CHECK = /usr/bin/systemctl status --no-pager nfs-server.service
Cmnd_Alias VAGRANT_NFSD_START = /usr/bin/systemctl start nfs-server.service
Cmnd_Alias VAGRANT_NFSD_APPLY = /usr/sbin/exportfs -ar
%vagrant ALL=(root) NOPASSWD: VAGRANT_EXPORTS_CHOWN, VAGRANT_EXPORTS_MV, VAGRANT_NFSD_CHECK, VAGRANT_NFSD_START, VAGRANT_NFSD_APPLY
```

# Troubleshooting
https://developer.hashicorp.com/vagrant/docs/synced-folders/nfs#troubleshooting-nfs-issues

[solution:](https://github.com/hashicorp/vagrant/issues/9666#issuecomment-623308878)
>This will work for me
>
>'''
>sudo rm /etc/exports
>sudo touch /etc/exports
>vagrant halt
>vagrant up --provision
>'''
