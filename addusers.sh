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



for user in $users
do
    password=`grep $user $userfile | awk '{print $2}'`
    userid=`echo "$user" | cut -b 3-5`
    userid=2$userid
    #userid=$((2000+$userid))
    useradd -g bys -u $userid $user
    

    #echo "$password\n$user"
    echo "useradd $user $userid"
done 

