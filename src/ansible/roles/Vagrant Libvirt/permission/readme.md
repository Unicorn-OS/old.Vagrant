# OS: Fedora, libvirt permissions:
sch: https://www.google.com/search?q=System+policy+prevents+management+of+local+virtualized+systems

# Solution:
[discuss:](https://www.reddit.com/r/Fedora/comments/c0frj7/why_does_virtmanager_require_sudo_privileges/)
`sudo usermod -a -G libvirt $(whoami)`

