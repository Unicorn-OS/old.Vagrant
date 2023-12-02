sed -i \
    '/^\(exclude=.*\)/ {/vagrant-libvirt/! s//\1 vagrant-libvirt/;:a;n;ba;q}; $aexclude=vagrant-libvirt' \
    /etc/dnf/dnf.conf
vagrant_libvirt_deps=($(dnf repoquery --disableexcludes main --depends vagrant-libvirt 2>/dev/null | cut -d' ' -f1))
dependencies=$(dnf repoquery --qf "%{name}" ${vagrant_libvirt_deps[@]/#/--whatprovides })
dnf install --assumeyes @virtualization ${dependencies}