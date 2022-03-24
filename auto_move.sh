LOC=$1
USER=$2

7z x $LOC -o./files/temp/$USER/

mv ./files/temp/$USER/* /home/$USER/

chown -R $USER /home/$USER
chgrp -R $USER /home/$USER
ln -s /home/$USER/.zshrc ~/.zshrc
ln -s /home/$USER/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s /home/$USER/.gitconfig ~/.gitconfig
