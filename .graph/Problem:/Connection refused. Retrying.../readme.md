# problem: Fails to Connect
error: "Connection refused. Retrying..."

affects: Ubuntu 23.10

sch: https://www.google.com/search?q=vagrant+libvirt+%22Connection+refused.+Retrying%22 , https://www.google.com/search?q=vagrant+libvirt+public_network

doc: https://vagrant-libvirt.github.io/vagrant-libvirt/configuration.html#networks

## Cause:
Fails because it's trying to create a `virbr1` Bridge & `vagrant-libvirt` NAT network every time a vm boots! When vm first boots network is in an incomplete state. Manually doing `virsh reset {{ domain }}` will temporarily fix it, and it'll connect.

## Bug:
- https://bugzilla.redhat.com/show_bug.cgi?id=2025202
- https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1624

# Solution:
Create `virbr1` and set it to start on boot!
