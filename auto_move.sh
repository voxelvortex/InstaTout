LOC=$1
LOCAL_USER=$2

7z x $LOC -o./files/temp/

mv ./files/temp/Laptop ./files/temp/$LOCAL_USER/ ||\
mv ./files/temp/Desktop ./files/temp/$LOCAL_USER/


cp -vR ./files/temp/$LOCAL_USER/* /home/$LOCAL_USER/


echo "Hit ENTER when files finish transferring..."

neofetch

chown -R $LOCAL_USER /home/$LOCAL_USER
chgrp -R $LOCAL_USER /home/$LOCAL_USER

rm ~/.zshrc
rm ~/.config/neofetch/config.conf
rm ~/.gitconfig

ln -s /home/$LOCAL_USER/.zshrc ~/.zshrc
ln -s /home/$LOCAL_USER/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s /home/$LOCAL_USER/.gitconfig ~/.gitconfig

echo `cat ./files/.bashrc` >> /home/$LOCAL_USER/.bashrc
echo `cat ./files/.bashrc` >> ~/.bashrc