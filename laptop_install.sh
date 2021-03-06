LOC=$1

if [ -z "$1" ]
  then
    LOC="./.auto-install"
fi

git clone https://gitea.voxelvortex.tk:443/voxelvortex/InstaTout.git $LOC

# Install all the generic programs
$LOC/program_install.sh

# Make sure all the packages I want for my laptop are installed
apt-get update &&\
apt-get install -y ungoogled-chromium librewolf code python3 python3-pip python3-wheel docker-compose docker.io zsh gdb p7zip-full git iputils-* dnsutils net-tools ffmpeg htop nano vim neovim nmap ncat ssh tree vlc snapd audacity filezilla

# install laptop utils via tasksel
tasksel install laptop

# Point to Fprint driver
echo -e "\n\nFigerprint\n\tCheck out: https://gist.github.com/d-k-bo/15e53eab53e2845e97746f5f8661b224"

sh $LOC/finalize.sh