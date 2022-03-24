DEVICE=$1
USER=$2

7z x $1.zip -o./files/$2/

mv ./files/$2/* /home/$2/

chown -R $USER /home/$USER
chgrp -R $USER /home/$USER
ln -s /home/$USER/.zshrc ~/.zshrc
ln -s /home/$USER/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s /home/$USER/.gitconfig ~/.gitconfig
