# Copy over unstable repo stuff
cp ./files/unstable.list /etc/apt/sources.list.d/unstable.list
cp ./files/preferences /etc/apt/preferences

# Install gnome
apt-get update &&\
apt -t unstable install -y gnome-session gnome-shell gnome-backgrounds gnome-applets gnome-control-center mutter gjs gnome-core gnome-tweaks libc6-i386 libgl1 libglx0 libglx-mesa0

gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

echo "gnome installed"