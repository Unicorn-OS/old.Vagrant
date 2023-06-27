# Vagrant-Libvirt provider
# Home:
- source: https://github.com/vagrant-libvirt/vagrant-libvirt
- doc: https://vagrant-libvirt.github.io/vagrant-libvirt/
  - [install](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html)

## Examples:
- https://vagrant-libvirt.github.io/vagrant-libvirt/examples.html


## Synced Folders
- https://vagrant-libvirt.github.io/vagrant-libvirt/examples.html#synced-folders

### NFS
problem: [sch](https://www.google.com/search?q=vagrant+libvirt+shared+folder)
- [bug:](https://discuss.hashicorp.com/t/vagrants-synced-folders-over-nfs-do-not-work-with-libvirt-provider/33262)

>Ok, I kinda solved the issue.
>Changing
>  `config.vm.synced_folder ".", "/vagrant", type: "nfs"`
>to
>  `config.vm.synced_folder ".", "/vagrant", type: "nfs", mount_options: ["vers=3,tcp"]`
>Makes it work, I however do not understand why! 

### Virtio-fs
>vagrant-libvirt supports Virtio-fs with bidirectional synced folders.
>
>For virtiofs shares, a mount: false option allows to define synced folders without mounting them at boot.
>
>So far, passthrough is the only supported access mode and it requires running the virtiofsd daemon as root.

## Guide
[sch:](https://www.google.com/search?q=vagrant+qemu+kvm)
- https://ostechnix.com/how-to-use-vagrant-with-libvirt-kvm-provider/
- https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/
- https://joachim8675309.medium.com/devops-box-vagrant-with-kvm-d7344e79322c
