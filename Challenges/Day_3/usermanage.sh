#!/bin/bash

#create user block

create_user()
{
        while :
        do
                read -p "Enter user name:" user
                if id $user &> sudo /etc/null
                then
                        echo "User already exit...."
                else
                        sudo useradd $user
                        echo "$user created sucessfully...."
                        return 0
                fi
        done

}

#delete user block

delte_user()

{
        while :
        do
                read -p "Enter Your username to delte " del_user
                if !id $del_user &> sudo /etc/null
                then echo "$del_user does not exit,Nothing to delete."
                else
                        sudo userdel  $del_user
                        echo "$del_user deleted sucessfully !..."
                        return 0
                fi
        done

}
#reset user password

reset_passwd()
{
        while :
        do
                read -p "Enter the username to reset the passwd " user
                if !id $user &>sudo /etc/null
                then
                        echo "user not there Nothing to reset!.. "
                else
                        sudo passwd $user
                        return 0
                fi
        done

}
view_list()
{
        echo "List of user account on the system.."
        while IFS=':' read -r username _ uid gid info home shell; do
                echo "username: $user"
                echo "UID: $uid"
                echo "GID: $gid"
                echo "Home Directory: $home"
                echo "shell: $shell"
                echo "===================================="
        done <  /etc/passwd
}
help()
{
        echo "Usage: ./creat.sh
        Option: []
        -c, --create  Create new User account.
        -d, --delete  Delete an existing user account.
        -r, --reset   Reset password for an existing user account.
        -l, --list    List all user account on the system.
        -h, --help    Display this help and exit.
        "
}

while :
do
        echo "
        Option:

        -c, --create  Create new User account.
        -d, --delete  Delete an existing user account.
        -r, --reset   Reset password for an existing user account.
        -l, --list    List all user account on the system.
        -h, --help    Display this help and exit.
        "
        read -p "Enter your choice : " choice


        case $choice in
                --create)create_user ;;
                --delete)delte_user ;;
                --reset)reset_passwd ;;
                --list)view_list ;;
                --help)help ;;
                *)echo "invalid input..."
                       exit     ;;
        esac

done


