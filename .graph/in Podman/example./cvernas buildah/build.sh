#!/bin/bash -x

container=$(buildah from "fedora:latest")

buildah run "$container" -- dnf install -y ansible openssh-server openssh-clients vagrant vagrant-libvirt vagrant-sshfs
buildah run "$container" -- dnf clean all

buildah commit "$container" "vagrant"
