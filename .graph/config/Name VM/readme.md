# Doc:
https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/configuration#virtual-machine-name

# Solution: `define`
https://stackoverflow.com/questions/17845637/how-to-change-vagrant-default-machine-name

## Libvirt: `default_prefix`
https://vagrant-libvirt.github.io/vagrant-libvirt/configuration.html#domain-specific-options

```
Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2310"
  
  config.vm.define "apt-cacher.test"

  config.vm.provider :libvirt do |libvirt|
    libvirt.default_prefix = ""
  end
end
```
