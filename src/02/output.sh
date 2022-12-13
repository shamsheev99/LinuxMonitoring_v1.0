#!/bin/bash
cd $(dirname $0)
echo "Do you want to write data in file? (Y/n)"
read answer
case "$answer" in
y | Y) echo "Success write data";;
*) rm -f output.txt;;
esac