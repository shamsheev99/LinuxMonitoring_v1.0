#!/bin/bash
cd $(dirname $0)
function tryagain {
    echo "Давай по новой?(y/n)"
    read ANSWER
    case $ANSWER in
        y|Y) ./test.sh;;
        *) echo "Ну как хочешь ;))" ;;
    esac
}
chmod +x 01/main.sh
chmod +x 02/main.sh
chmod +x 03/main.sh
chmod +x 04/main.sh
chmod +x 05/main.sh

echo "Какой скрипт тестим (1-5)?"
read NUMBER_SCRIPT
case $NUMBER_SCRIPT in
    1) echo "1 parameter:"
        read FIRST
        01/main.sh $FIRST
        tryagain;;
    2) 02/main.sh 
        tryagain;;
    3) echo "4 parameters:"
        read ONE TWO THREE FOUR
        03/main.sh $ONE $TWO $THREE $FOUR
        tryagain;;
    4) echo "параметры в src/04/.conf"
        04/main.sh
        tryagain;;
    5) echo "Надо бы какой-нибудь путь накалякать:"
        read CHTOTO
        05/main.sh $CHTOTO
        tryagain;;
    *) echo "Не-не-не ошибочка"
        tryagain;;
esac