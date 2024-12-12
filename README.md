# Spring Boot Deploy with Ansible

## Описание
Этот проект позволяет автоматически собирать и развёртывать Spring Boot приложение с помощью Ansible.

## Структура файлов
- `deploy.yml` — основной Playbook.
- `inventory.ini` — инвентарь с серверами.
- `templates/spring-boot.service.j2` — шаблон для systemd.

## Как использовать
1. Настройте инвентарь `inventory.ini`.
2. Запустите playbook:
   ```bash
   ansible-playbook -i inventory.ini deploy.yml
