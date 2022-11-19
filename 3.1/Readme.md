# Домашнее задание к занятию "3.1. Работа в терминале. Лекция 1"

## Подготовка к домашнему заданию

1. Установите средство виртуализации Oracle VirtualBox.
    `Я задал вопрос к заданию, что Virtualbox установить на домашнем компьютере с Windows 10 Home не удалось. Но Vagrant работает и c Hyper-V, поэтому можно ли изменить условие задачи.
    Ответа не получил и решил проходить задание на том, что имеется - MS Hyper-V.`
2. Установите средство автоматизации Hashicorp Vagrant.
    `Установилось не очень легко, с использованием Bright VPN.`
3. В вашем основном окружении подготовьте удобный для дальнейшей работы терминал. 
    `Выбрал Windows Terminal в Windows`

## Задание

1. С помощью базового файла конфигурации запустите Ubuntu 20.04 в VirtualBox посредством Vagrant:
    Запуск Vagrant с Hyper-V
        `vagrant box add bento/ubuntu-20.04
        vagrant init bento/ubuntu-20.04
        vagrant up --provider hyperv`
2. Ознакомьтесь с графическим интерфейсом VirtualBox, посмотрите как выглядит виртуальная машина, которую создал для вас Vagrant, какие аппаратные ресурсы ей выделены. Какие ресурсы выделены по-умолчанию?
    `См. файл \images\conf-default-ubuntu20.jpg`
3. Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: документация. Как добавить оперативной памяти или ресурсов процессора виртуальной машине?
    `Правим файл Vagrantfile
    Vagrant.configure("2") do |config|
        config.vm.box = "bento/ubuntu-20.04"
        config.vm.provider "hyperv" do |vb||
	        vb.memory = "2048"
	        vb.cpus=2`
4. Команда vagrant ssh из директории, в которой содержится Vagrantfile, позволит вам оказаться внутри виртуальной машины без каких-либо дополнительных настроек.
    `См. файл \images\vagrant-ssh.jpg`
5. Ознакомиться с разделами man bash, почитать о настройках самого bash
какой переменной можно задать длину журнала history, и на какой строчке manual это описывается? что делает директива ignoreboth в bash?
`846        HISTFILESIZE
    847               The maximum number of lines contained in the history file.  When this variable is assigned a value the
    848               history  file  is truncated, if necessary, to contain no more than that number of lines by removing the
    849               oldest entries.  The history file is also truncated to this size after writing it when a  shell  e    849 xits.
    850               If  the  value is 0, the history file is truncated to zero size.  Non-numeric values and numeric v    850 alues
    851               less than zero inhibit truncation.  The shell sets the default value to the  value  of  HISTSIZE      851 after
    852               reading any startup files.
833 HISTCONTROL
    834 Разделенный двоеточием список значений, управляющих сохранением команд в списке истории. Если список 
    835 значений включает ignorespace, строки, начинающиеся с пробела, не сохраняются в истории hi 
    836 список. Значение ignoredups приводит к тому, что строки, соответствующие предыдущей записи истории, не сохраняются. Значение 
    837 от **ignoreboth** является сокращением от ignorespace и ignoredups. Значение erasedups приводит к тому, что все предыдущие 
    838 строк, соответствующих текущей строке, должны быть удалены из списка истории перед сохранением этой строки. Любой Значение 
	839, не указанное в приведенном выше списке, игнорируется. Если HISTCONTROL не установлен или не включает действительное значение v,
    840 все строки, прочитанные синтаксическим анализатором оболочки, сохраняются в списке истории, в зависимости от значения HISTIGNORE.
    841 Вторая и последующие строки многострочной составной команды не проверяются и добавляются к стория 
	842 независимо от значения HISTCONTROL.`
6. В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?
`    {} - зарезервированные слова, список, в т.ч. список команд команд в отличии от "(...)" исполнятся в текущем инстансе, 
    используется в различных условных циклах, условных операторах, или ограничивает тело функции, 
    В командах выполняет подстановку элементов из списка , если упрощенно то  цикличное выполнение команд с подстановкой 
    например mkdir ./DIR_{A..Z} - создаст каталоги с именами DIR_A, DIR_B и т.д. до DIR_Z
    строка 174 См. файл \images\reserved words.jpg
`
7. С учётом ответа на предыдущий вопрос, как создать однократным вызовом touch 100000 файлов? Получится ли аналогичным образом создать 300000? Если нет, то почему?
 `   vagrant@ubuntu-20:~$ touch file {1..100000}
    vagrant@ubuntu-20:~$ touch file {1..300000}
    -bash: /usr/bin/touch: Argument list too long
    vagrant@ubuntu-20:~$`

8. В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]
`    1834        When  used  with  [[, the < and > operators sort lexicographically using the current locale.  The test co   1834 mmand 
    1843        -d file
    1844               True if file exists and is a directory.
    См. файл \images\checkdir.jpg`

9. Сделайте так, чтобы в выводе команды type -a bash первым стояла запись с нестандартным путем, например bash is ... Используйте знания о просмотре существующих и создании новых переменных окружения, обратите внимание на переменную окружения PATH
bash is /tmp/new_path_directory/bash
bash is /usr/local/bin/bash
bash is /bin/bash
`    vagrant@ubuntu-20:~$ mkdir /tmp/new_path_dir/
    vagrant@ubuntu-20:~$ cp /bin/bash /tmp/new_path_dir/
    vagrant@ubuntu-20:~$ type -a bash
    bash is /usr/bin/bash
    bash is /bin/bash
    vagrant@ubuntu-20:~$ PATH=/tmp/new_path_dir/:$PATH
    vagrant@ubuntu-20:~$ type -a bash
    bash is /tmp/new_path_dir/bash
    bash is /usr/bin/bash
    bash is /bin/bash
    vagrant@ubuntu-20:~$`

10. Чем отличается планирование команд с помощью batch и at?
 `   at это утилита командной строки, которая позволяет вам планировать выполнение команд в определенное время. Задания, созданные с помощью at , выполняются только один раз.
    batch планирует задания и выполняет их в пакетной очереди, если позволяет уровень загрузки системы. По умолчанию задания выполняются, когда средняя загрузка системы ниже 1,5. Значение нагрузки можно указать при вызове демона atd . Если средняя загрузка системы выше указанной, задания будут ждать в очереди.`

11. Завершите работу виртуальной машины чтобы не расходовать ресурсы компьютера и/или батарею ноутбука.
`    См. файл \images\vagrant suspend.jpg`