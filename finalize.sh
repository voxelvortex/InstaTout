# unprivileged user's name, change this if it isnt right
LOCAL_USER="michael"

# change default shells for root and unpriv-user to zsh
usermod --shell /bin/zsh root
usermod --shell /bin/zsh $LOCAL_USER
#usermod -aG sudo $USER

# List gnome extensions to install
echo -e "\nGnome extensions:"
echo -e "\tAppIndicator and KStatusNotifierItem Support: https://extensions.gnome.org/extension/615/appindicator-support/"
echo -e "\tArcMenu: https://extensions.gnome.org/extension/3628/arcmenu/"
echo -e "\tLaunch new instance: https://extensions.gnome.org/extension/600/launch-new-instance/"
echo -e "\tRemovable Drive Menu: https://extensions.gnome.org/extension/7/removable-drive-menu/"
echo -e "\tTactile: https://extensions.gnome.org/extension/4548/tactile/"
echo -e "\tVitals: https://extensions.gnome.org/extension/1460/vitals/"
echo -e "\tWorkspace Indicator: https://extensions.gnome.org/extension/21/workspace-indicator/"
echo -e "\tAutohide Battery: https://extensions.gnome.org/extension/595/autohide-battery/"
echo -e "\tSound Input & Output Device Chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/"
