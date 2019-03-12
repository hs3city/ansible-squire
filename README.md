# Ansible-squire

## Development workflow

### Adding new application

In the event you'd like to host something on squire (please, please keep it infra-only until we have more servers) following is in order:

#### Prerequisites

- basic Ansible knowledge
- basic docker-compose knowledge
- your app must be Dockerized
- would be cool if your app was hosted at hs3city's Dockerhub

#### Instructions

-1. If you need help Dockerizing your application or it **really** needs to be builded from source please contact maintainers.

0. Add your application config to `apps` role:
```
mkdir roles/apps/templates/[your_app_name]
cd $_
touch docker-compose.j2 # it's j2, not .yml !
```

1. Fill the config:
```
version: '2'
services:
    [your_app_name]:
        image: [your_app_image]
        ports:
            - [your_app_ports_configuration]
        restart: always # container stays after reboots
```

Sample config:

```
version: '2'
services:
    foo:
        image: hs3city/foo
        ports:
            - "127.0.0.1:5000:5000"
        restart: always
```

2. Enable your app in `playbook.yml`
```
  vars:
    apps:
      - ...
      - ...
      - name: [your_app]
```

3. Test your changes

4. Rerun ansible
```
make
```
