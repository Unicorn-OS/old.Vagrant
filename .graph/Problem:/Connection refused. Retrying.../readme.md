# problem: Fails to Connect
error: "Connection refused. Retrying..."

affects: Ubuntu 23.10

sch: https://www.google.com/search?q=vagrant+libvirt+%22Connection+refused.+Retrying%22

## Cause:
Fails because it's trying to create a `virbr1` virtual network every time! When vm first boots network is in an incomplete state. Manually `resetting` vm will temporarily fix it.

## Bug:
https://bugzilla.redhat.com/show_bug.cgi?id=2025202

# Solution:
Create `virbr1` and set it to start on boot!
