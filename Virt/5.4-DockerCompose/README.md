# Домашнее задание к занятию "4. Оркестрация группой Docker контейнеров на примере Docker Compose"

Важно!
Перед отправкой работы на проверку удаляйте неиспользуемые ресурсы. Это важно для того, чтоб предупредить неконтролируемый расход средств, полученных в результате использования промокода.

Подробные рекомендации здесь

## Задача 1

Создать собственный образ любой операционной системы (например, ubuntu-20.04) с помощью Packer (инструкция)
![task1.1.png](images%2Ftask1.1.png)

![task1.png](images%2Ftask1.png)

Для получения зачета вам необходимо предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.

## Задача 2
Создать вашу первую виртуальную машину в YandexCloud с помощью terraform. Используйте terraform код в директории (src/terraform)

![terraform_apply.png](images%2Fterraform_apply.png)

![task2.png](images%2Ftask2.png)

Для получения зачета, вам необходимо предоставить вывод команды terraform apply и страницы свойств созданной ВМ из личного кабинета YandexCloud.

## Задача 3
С помощью ansible и docker-compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana . Используйте ansible код в директории (src/ansible)
Для получения зачета вам необходимо предоставить вывод команды "docker ps" , все контейнеры, описанные в (docker-compose), должны быть в статусе "Up".

![task3.png](images%2Ftask3.png)

## Задача 4
Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
Используйте для авторизации логин и пароль из (.env-file).
Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose панели с графиками(dashboards).
Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.

![task4_MS.png](images%2Ftask4_MS.png)

![task4_DH.png](images%2Ftask4_DH.png)