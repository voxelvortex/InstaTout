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

# Install Ghidra
git clone https://github.com/NationalSecurityAgency/ghidra.git /usr/bin/ghidra
ln -s /usr/bin/ghidra/ghidraRun /usr/bin/ghidraRun

# Point to Fprint driver
echo -e "\n\nFigerprint\n\tCheck out: https://gist.github.com/d-k-bo/15e53eab53e2845e97746f5f8661b224"

# List gnome extensions to install
echo -e "\nGnome extensions:"
echo -e "\tPlaces Status Indicator: https://extensions.gnome.org/extension/8/places-status-indicator/"
echo -e "\tArcMenu: https://extensions.gnome.org/extension/3628/arcmenu/"
echo -e "\tLaunch new instance: https://extensions.gnome.org/extension/600/launch-new-instance/"
echo -e "\tRemovable Drive Menu: https://extensions.gnome.org/extension/7/removable-drive-menu/"
echo -e "\tTactile: https://extensions.gnome.org/extension/4548/tactile/"
echo -e "\tVitals: https://extensions.gnome.org/extension/1460/vitals/"
echo -e "\tWorkspace Indicator: https://extensions.gnome.org/extension/21/workspace-indicator/"
