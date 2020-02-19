echo ""
echo -e "\e[32m"
echo "*** Adding stuff to .bashrc ***"
echo -e "\e[0m"
echo "">> ~/.bashrc
echo "alias ls='ls -la --color'">> ~/.bashrc
echo "export GOPATH=$HOME/go">> ~/.bashrc
echo "export PATH=$PATH:$(go env GOPATH)/bin:/home/zarco/.local/bin">> ~/.bashrc
source ~/.bashrc

echo ""
echo -e "\e[32m"
echo "*** Install stuff with apt ***"
echo -e "\e[0m"
while IFS=, read -r program; do
	echo -n "Installing $program"
	sudo apt install -y $program
done < ~/apt.txt

echo -e "\e[32m"
echo "*** Creating directories ***"
echo -e "\e[0m"
mkdir ~/.scripts
mkdir ~/.scripts/myScripts
mkdir ~/.scripts/myScripts.dev
mkdir ~/.scripts/temp
mkdir ~/.scripts/other

cd ~/.scripts/myScripts
echo ""
echo -e "\e[32m"
echo "*** Installing my scripts with git ***"
echo -e "\e[0m"
while IFS=, read -r program; do
	echo -n "Installing $program"
	git clone $program
done < ~/myScripts-git.txt

echo ""
echo -e "\e[32m"
echo "*** Configuring other scripts with git ***"
echo -e "\e[0m"
while IFS=, read -r program; do
	echo -n "Installing $program"
	git clone $program
done < ~/otherScripts-git.txt

echo ""
echo -e "\e[32m"
echo "*** Installing scripts from GitHub through Golang ***"
echo -e "\e[0m"
while IFS=, read -r program; do
	echo -n "Installing $program"
	go get -v $program
	echo "go get -v $program"
done < ~/otherScripts-go.txt

cd ~/.scripts/other
echo ""
echo -e "\e[32m"
echo "*** Installing scripts through pip ***"
echo -e "\e[0m"

pip install truffleHog

echo ""
echo -e "\e[32m"
echo "*** Creating links in/usr/local/bin ***"
echo -e "\e[0m"
cd ~/.scripts/myScripts/hlt
sudo python 2ulb.py 2ulb.py
sudo bash 2ulb-curdir.sh *.sh
cd ~/.scripts/myScripts/clio
sudo 2ulb-curdir *.py

