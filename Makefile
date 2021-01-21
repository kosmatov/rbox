enter:
	(vagrant status | grep running && vagrant ssh) || $(MAKE) box_up

box_up: up mount
	ssh-add
	vagrant ssh

up:
	vagrant up

mount:
	df | grep vagrant || sudo mount -t nfs -o resvport,rw,soft 10.0.1.13:/home/vagrant home/
