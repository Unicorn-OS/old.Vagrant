# problem: conflicting dependencies date
https://bbs.archlinux.org/viewtopic.php?id=292146

## Solution:
```
VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1 vagrant plugin install vagrant-libvirt
```
