ver=ubuntu2204
mkdir -p $ver
cd $ver

vagrant init generic/$ver
vagrant up --provider=libvirt
vagrant ssh
