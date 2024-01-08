# Doc:
https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/configuration#virtual-machine-name

# Solution: `define`
https://stackoverflow.com/questions/17845637/how-to-change-vagrant-default-machine-name

## Libvirt: `default_prefix`
https://vagrant-libvirt.github.io/vagrant-libvirt/configuration.html#domain-specific-options

>random_hostname - To create a domain name with extra information on the end to prevent hostname conflicts.
>
>default_prefix - The default Libvirt guest name becomes a concatenation of the <current_directory>_<guest_name>. The current working directory is the default prefix to the guest name. The default_prefix options allow you to set the guest name prefix.

```
Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2310"
  
  config.vm.define "apt-cacher.test"

  config.vm.provider :libvirt do |libvirt|
    libvirt.default_prefix = ""
  end
end
```
