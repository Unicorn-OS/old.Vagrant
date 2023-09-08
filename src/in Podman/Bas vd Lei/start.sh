podman run --rm -it \
	--volume /run/libvirt:/run/libvirt \
	--volume "${HOME}:${HOME}:rslave" \
	--env "HOME=${HOME}" \
	--workdir "$(pwd)" \
	--net host \
	--privileged \
	--security-opt label=disable \
	localhost/vagrant-container:latest
