# Домашнее задание к занятию "2. Применение принципов IaaC в работе с виртуальными машинами"

## Задача 1

Опишите своими словами основные преимущества применения на практике IaaC паттернов.
Какой из принципов IaaC является основополагающим?

`Использование оркестраторов значительно облегчает и ускоряет процесс развертывания новых сервисов. Позволяет следить за версионностью, документировать изменения как при разработке кода программы, потому что конфиги пишутся на языке программирования. И что очень важно оркестраторы позволяют реализовать такой важный принцип как идемпотентность, т.е. результат идентичный ожидаемому. Пожалуй этот принцип является основополагающим.` 

## Задача 2

Чем Ansible выгодно отличается от других систем управление конфигурациями?
Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

`Ansible является гибридной системой и использует как пуш так и пулл методы. Он не требует установки агентов для управления серверами, разработан на Пайтоне и благодаря простому интерфейсу и популярному языку программирования легок в освоении. 
На мой взгляд более надежным является push метод, так как не требует установки агентов и позволяет принудительно применить изменения не ожидая когда сервер вытянет изменения в конфигурации из оркестратора.` 

## Задача 3

Установить на личный компьютер:
VirtualBox
Vagrant
Ansible
Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.

`root@shangi-Modern-15-B11M:~# vboxmanage --version
6.1.38_Ubuntur153438
root@shangi-Modern-15-B11M:~# vagrant --version
Vagrant 2.2.19
root@shangi-Modern-15-B11M:~# ansible --version
ansible 2.10.8
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0]
`

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

Создать виртуальную машину.
Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды