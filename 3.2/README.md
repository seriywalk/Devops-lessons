# Домашнее задание к занятию "3.2. Работа в терминале. Лекция 2"

## Задание

1.Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа: опишите ход своих мыслей, если считаете, что она могла бы быть другого типа.
    `Команда cd встроенная (builtin). Это встроенная команда Bash и меняет текущую папку только для оболочки, в которой выполняется. Иначе пришлось бы открывать дополнительную сессию.
    См. файл \images\type cd.jpg
`
2.Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l?
Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.
    `Конвейеры (pipe) используются в shell-скриптах для связи нескольких команд. Альтернативой может быть подача двух команд.
    Команда grep <some_string> <some_file> | wc -l выводит количество строк с найденным словом в файле. Тоже самое можно сделать командой grep <some_string> <some_file> -с
    См. файл \images\pipeless.jpg`

3.Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?
    `Родительским процессом является systemd
    См. файл \images\systemd.jpg`

4.Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?
    `Открываю два терминала запускаю на одном перенаправление на другую сессию каталога и получаю ошибку в другом терминале.
    ls -l /root 2>/dev/pts/1
    См. файл \images\stderr.jpg`

5.Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.
    `Получится, см. файл \images\stfin.jpg`

6.Получится ли, находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?
    `Получилось. см. файл \images\tty3.jpg`

7.Выполните команду bash 5>&1. К чему она приведет? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?
    `bash 5>&1 - Перенаправит дескриптор "5" в stdout
    echo netology > /proc/$$/fd/5 - выведет в дескриптор "5", который был пернеаправлен в stdout
    В другой сессии такого дескриптора нет и аналогичная команда выдаст ошибку.
    см. файл \images\bash5.jpg`

8.Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty?
Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.
    `см. файл \images\stderr_stdout.jpg
    Команда ls -l /root 3>&2 2>&1 1>&3
    3>&2 новый дескриптор перенаправл в stderr, 2>&1 stderr перенаправил в stdout, 1>&3 stdout перенаправил в новый дескриптор.`

9.Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?
    см. файл \images\env.jpg
    Аналог env, printenv

10.Используя man, опишите что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe.
    `/proc/<PID>/cmdline
    стр. 226 Этот файл, доступный только для чтения, содержит полную командную строку для процесса, если только процесс не является зомби.
    В последнем случае в этом файле ничего нет: то есть чтение этого файла вернет 0.‐
    терс. Аргументы командной строки отображаются в этом файле в виде набора строк, разделенных нулевыми байтами
    ('\0'), с дополнительным нулевым байтом после последней строки.
    см. файл \images\procpidcmdline.jpg`
    
    279 /proc/[pid]/exe
    280 В Linux 2.2 и более поздних версиях этот файл представляет собой символическую ссылку, содержащую фактический путь к выполняемой
    команде 281. Эта символическая ссылка может быть разыменована обычным образом; попытка открыть ее приведет к открытию exe‐
    282 вырезается. Вы даже можете ввести /proc/[pid]/exe, чтобы запустить другую копию того же исполняемого файла, который выполняется
    283 выполняется процессом [pid]. Если имя пути не было связано, символическая ссылка будет содержать строку
    284 '(удалено)' добавляется к исходному имени пути. В многопоточном процессе содержимое этого символа‐
    ссылка 285 bolic недоступна, если основной поток уже завершен (обычно путем вызова
    286 pthread_exit(3)).
    287
    288 Разрешение на разыменование или чтение (readlink(2)) эта символическая ссылка регулируется режимом доступа ptrace
    289 PTRACE_MODE_READ_FSC
    см. файл \images\procpidexe.jpg`

11.Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.
    `sse4_2 см. файл \images\sse.jpg`

12.При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty.
Это можно подтвердить командой tty, которая упоминалась в лекции 3.2.
Однако:
vagrant@netology1:~$ ssh localhost 'tty'
not a tty
Почитайте, почему так происходит, и как изменить поведение.
    `По умолчанию, TTY не выделяется для удаленного сеанса ssh. Это позволяет передавать двоичные данные.
    Если надо включить оболочку удаленного компьютера, можно использовать параметр -t для принудительного выделения TTY.
    В нашем примере подключение производится не к удаленной машине, вероятно поэтому TTY не выделяется.
    см. файл \images\localhost.jpg`

13.Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.
    `Запустил в сессии htop, создал screen vag1 и перенес в него процесс.
    см. файл \images\reptyr1.jpg, reptyr2.jpg`
    
14.sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте? что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.
    `команда tee делает вывод одновременно и в файл и в stdout, в этом примере команда получает вывод из stdin, перенаправленный через pipe от stdout команды echo    и так как команда запущена от sudo , поэтому имеет права на запись в файл.
    см. файл /images/tee.jpg`
    