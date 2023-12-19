sch: https://www.google.com/search?q=fedora+virt-manager+show+vagrant , https://www.google.com/search?q=fedora+virt-manager+vagrant+now+showing+root


# Bug:
https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1129

# [Solution:](https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1129#issuecomment-671256341)
>This may be caused by the following. Fedora is trying to make the user experience as simple as possible by making anything that uses libvirt use qemu:///session when run as a user and qemu:///system when run as root.
>
>Adding libvirt.uri = 'qemu:///system' to your vagrant files will restore the old behaviour
>```
>Vagrant.configure("2") do |config|
>  config.vm.provider :libvirt do |libvirt|
>    libvirt.qemu_use_session = false
>  end
>end
>```
