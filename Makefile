squire:
	ansible-playbook -i inventory -K playbook.yml
test:
	ansible-playbook -i inventory -K testbook.yml
