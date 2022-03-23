LOC="./.auto-install"
git clone https://gitea.voxelvortex.tk:443/voxelvortex/InstaTout.git $LOC


$LOC/program_install.sh

apt-get update &&\
apt-get install -y ungoogled-chromium librewolf code python3 python3-pip python3-wheel docker-compose docker.io zsh gdb p7zip-full git iputils-* dnsutils net-tools handbrake* ffmpeg htop nano vim neovim nmap nvidia-detect ncat ssh tree vlc snapd obs-studio audacity filezilla

mv $LOC/files/Desktop $LOC/files/InstallMe

$LOC/finalize.sh