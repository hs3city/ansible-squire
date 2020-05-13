# Squire

## Prerequisites

- basic Ansible knowledge
- basic Docker knowledge
- basic Nomad knowledge
- some Linux administration skills

## Development workflow

### Basics

```
# fresh install
ansible-playbook --inventory=inventory --ask-pass bootstrap.yml --user=root
ansible-playbook --inventory=inventory --ask-become-pass playbook.yml
```

### Testing

tbd

### Adding new application

[wiki.hs3.pl](https://wiki.hs3.pl/projekty/serwer_na_laptopie#konwencja_stawiania_rzeczy)
