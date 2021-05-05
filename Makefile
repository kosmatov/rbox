enter:
	(vagrant status | grep running && vagrant ssh) || $(MAKE) box_up

box_up: up mount
	ssh-add
	vagrant ssh

up:
	vagrant up

mount: vagrant-home
	df | grep vagrant || sudo mount -t nfs -o resvport,rw,soft 10.0.1.13:/home/vagrant ~/vagrant-home/

umount:
	df | grep vagrant && diskutil unmount ~/vagrant-home

vagrant-home:
	mkdir -p ~/vagrant-home

halt: umount
	vagrant halt
