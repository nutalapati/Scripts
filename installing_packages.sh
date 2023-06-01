#!/bin/bash
for each_pkg in java git maven jenkins docker ansible
do

if [[ $(id -u) -ne 0 ]]
then
	echo "please run as sudo user"
	exit 1
fi

if which $each_pkg &> /dev/null
then 
	echo "already $each_pkg installed"
else
	echo "installing $each_pkg ........"
	yum install $each_pkg -y &> /dev/null
	if [[ $? -eq 0 ]]
	then
		echo "successfully installed $each_pkg."
	else
		echo "notable in install $each_pkg."
	fi
fi
done
