# problem: Fails to Connect
error: "Connection refused. Retrying..."

affects: Ubuntu 23.10

sch: google.com/search?q=vagrant+virbr0+inactive , https://www.google.com/search?q=vagrant+libvirt+%22Connection+refused.+Retrying%22 , https://www.google.com/search?q=vagrant+libvirt+public_network

doc: https://vagrant-libvirt.github.io/vagrant-libvirt/configuration.html#networks

## Cause:
Fails because it's trying to create a `virbr1` Bridge & `vagrant-libvirt` NAT network every time a vm boots! When vm first boots network is in an incomplete state. Manually doing `virsh reset {{ domain }}` will temporarily fix it, and it'll connect.

## Bug:
sch: https://github.com/vagrant-libvirt/vagrant-libvirt/issues?q=bridge
- https://nts.strzibny.name/qemu-bridge-helper-missing-virbr0-interface/
- https://bugzilla.redhat.com/show_bug.cgi?id=2025202
- [Existing bridges not found: public_network referencing host device X which does not exist #1624](https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1624)
- [public_network plugin doesn't find bridges on Ubuntu 22.04 #1788](https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1788)
- https://www.xmodulo.com/network-default-is-not-active.html#google_vignette `sudo ifconfig virbr0 up`

## Debug:
```virsh -c qemu:///system iface-list --all```
Should be 'active'

# Solution:
Create `virbr1` and set it to start on boot!

## update interfaces file
https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1624#issuecomment-1368491113

>Jeansen commented on Jan 1, 2023
>It seems this is still an issue. Running Debian 11, I had to put my interfaces in /etc/network/interfaces. virsh -c qemu:///session iface-list or virsh -c >qemu:///system iface-list --all would only show me the lo device until I update the interface file.
>
>Vagrant version: 2.3.4
>vagrant-libvirt plugin version: 0.11.2 (but it's the same in earlier versions).

