# Update
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y

# Install basic dependencies
apt-get -y install curl wget gpg

# Enable nonfree and contrib repos
sed -r -i 's/^deb(.*)$/deb\1 contrib non-free/g' /etc/apt/sources.list

# Get VSCode repo
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Librewolf repo
echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/librewolf.list
#echo "deb [arch=amd64] http://deb.librewolf.net bullseye main" | tee /etc/apt/sources.list.d/librewolf.list
wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg

# Ungoogled-chromium repo 
echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Bullseye/ /' | tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Bullseye/Release.key' | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null

# Update again
apt-get update -y && apt-get upgrade -y

# Install main apt stuff
apt-get install -y ungoogled-chromium librewolf code python3 python3-pip python3-wheel docker-compose docker.io zsh gdb p7zip-full git iputils-* dnsutils net-tools handbrake* ffmpeg htop nano vim neovim nmap nvidia-detect ncat ssh tree vlc snapd obs-studio audacity filezilla

# Update python pip
python3 -m pip install -U pip

# Snap installs
snap install core discord

# Point to Fprint driver
echo "Check out: https://gist.github.com/d-k-bo/15e53eab53e2845e97746f5f8661b224"
