# Doc:
https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/configuration#virtual-machine-name

# discuss:
https://stackoverflow.com/questions/17845637/how-to-change-vagrant-default-machine-name

```
Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2310"
  
  config.vm.define "apt-cacher.test"
end
```
