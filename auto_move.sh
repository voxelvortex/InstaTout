DEVICE=$1
USER=$2

7z x $1.zip -o./$2/

mv ./$2/* /home/$2/
