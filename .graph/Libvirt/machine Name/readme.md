# Set VM Name
sch: https://www.google.com/search?q=vagrant+libvirt+name

answer: https://github.com/vagrant-libvirt/vagrant-libvirt/issues/289

>To set the name, use
>```
>config.vm.define :name_you_want do |foo|
>#
>end
>```
>The name of the directory will be used as a prefix to this name. If you want to change it, use
>```
>config.vm.provider :libvirt do |libvirt|
>  libvirt.default_prefix = "prefix_you_want"
>end
>```
