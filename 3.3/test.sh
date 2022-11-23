#!/bin/bash
du -h log.txt
ps aux | grep s.sh
echo "Вводи ID процесса s.sh"
sleep 5
read ID

echo "lsof -p $ID"
lsof -p $ID 

echo "ввод FD"
read FD

du -h log.txt

echo "rm s.sh"
rm s.sh

echo "cat /proc/$ID/fd/$FD > s.sh"
cat  /proc/$ID/fd/$FD > s.sh

echo "echo '' /proc/$ID/fd/$FD "
echo '' /proc/$ID/fd/$FD > log.txt

du -h log.txt

#echo "rm log.txt"
#rm log.txt

#du -h log.txt
sleep 5
##du -h log.txt
