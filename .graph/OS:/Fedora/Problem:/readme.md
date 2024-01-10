# Problem: "Call to virConnectOpen failed: authentication unavailable: no polkit agent available to authenticate action 'org.libvirt.unix.manage'"

# Solution:
https://forums.gentoo.org/viewtopic-t-1136670-start-0.html

```usermod -aG libvirt <your-ordinary-user>```
