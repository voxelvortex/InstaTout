LOC=$1
USER=$2

7z x $LOC -o./files/temp/$USER/

mv ./files/temp/$USER/* /home/$USER/


echo "Hit ENTER when files finish transferring..."
read


chown -R $USER /home/$USER
chgrp -R $USER /home/$USER

rm ~/.zshrc
rm ~/.config/neofetch/config.conf
rm ~/.gitconfig

ln -s /home/$USER/.zshrc ~/.zshrc
ln -s /home/$USER/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s /home/$USER/.gitconfig ~/.gitconfig
