# Set vars
LOC=$1
LOCAL_USER=$2

# unarchive your files
7z x $LOC -o./files/temp/

# try staging laptop stuff, if that fails do desktop stuff
mv ./files/temp/Laptop ./files/temp/$LOCAL_USER/ ||\
mv ./files/temp/Desktop ./files/temp/$LOCAL_USER/

# copy the files to where theyre supposed to go on the system
cp -vR ./files/temp/$LOCAL_USER/* /home/$LOCAL_USER/

# change ownership of the user's stuff so you dont have privilege issues
chown -R $LOCAL_USER /home/$LOCAL_USER
chgrp -R $LOCAL_USER /home/$LOCAL_USER

# make neofetch config folders
mkdir ~/.config
mkdir ~/.config/neofetch

# delete any default configs in root so that they can be set properly
rm ~/.zshrc
rm ~/.config/neofetch/config.conf
rm ~/.gitconfig

# link some stuff do the unpriv users' stuff
# NOTE: The way I was linking zshrc is potentially dangerous since it would allow for priv esc from the unpriv user to 
#       root privilege. Don't do this. It is dumb lol.
# ln -s /home/$LOCAL_USER/.zshrc ~/.zshrc
# As far as I know the config files dont run code, so its safe to link them so they will auto update if you change them as your normal user
cp /home/$LOCAL_USER/.zshrc ~/.zshrc
ln -s /home/$LOCAL_USER/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s /home/$LOCAL_USER/.gitconfig ~/.gitconfig

# add my bashrc additions to root and the local user
echo `cat ./files/.bashrc` >> /home/$LOCAL_USER/.bashrc
echo `cat ./files/.bashrc` >> ~/.bashrc