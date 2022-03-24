LOC="./.auto-install"
git clone https://gitea.voxelvortex.tk:443/voxelvortex/InstaTout.git $LOC


# Install all the generic programs
$LOC/program_install.sh

# Make sure all the packages I want for my desktop are installed
apt-get update &&\
apt-get install -y ungoogled-chromium librewolf code python3 python3-pip python3-wheel docker-compose docker.io zsh gdb p7zip-full git iputils-* dnsutils net-tools handbrake* ffmpeg htop nano vim neovim nmap nvidia-detect ncat ssh tree vlc snapd obs-studio audacity filezilla firmware-iwlwifi

# Reset the wifi card so it shows up in settings
modprobe -r iwlwifi && modprobe iwlwifi

# If wired networking is working, but gnome doesnt recognize it properly, check out this post:
# https://forums.debian.net/viewtopic.php?t=104561

$LOC/finalize.sh