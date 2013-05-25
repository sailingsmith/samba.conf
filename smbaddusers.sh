#!/bin/bash
#FileName: addusers.sh


PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


#if [ $UID -ne 0 ];then
#   echo "current user is not root,current user is $USER"
#   exit 0
#fi


userfile="userlist"
users=`awk  '{print $1}' $userfile`


# echo -e "fjdkfj\nfjdkfj" | sudo smbpasswd -a cl008 -s

for user in $users
do
    password=`grep $user $userfile | awk '{print $2}'`
    #echo "$password  $user"
    
    echo -e "$password\n$password" | sudo smbpasswd -a $user -s

    #echo "$password\n$user"
    #echo "samba useradd $user"
done 

