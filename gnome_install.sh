# install laptop utils via tasksel
tasksel install laptop

# Copy over unstable repo stuff
cp ./files/unstable.list /etc/apt/sources.list.d/unstable.list
cp ./preferences /etc/apt/preferences

# Install gnome
apt-get update &&\
apt -t unstable install -y gnome-session gnome-shell gnome-backgrounds gnome-applets gnome-control-center mutter gjs gnome-core gnome-tweaks libc6-i386

echo 