#!/bin/bash
clear
echo -e "\033[5;41;30mThis program requires sudo privileges to run\033[0m"
echo
echo
echo -e "\033[1;31;40mPlease enter password for sudo privileges\033[0m"
sudo echo
clear
echo
echo
echo
echo -e "\033[31m    __ __      ___    __  __          __      __           \033[0m"
echo -e "\033[31m   / //_/___ _/ (_)  / / / /___  ____/ /___ _/ /____  _____\033[0m"
echo -e "\033[31m  / ,< / __ \`/ / /  / / / / __ \/ __  / __ \`/ __/ _ \/ ___/\033[0m"
echo -e "\033[31m / /| / /_/ / / /  / /_/ / /_/ / /_/ / /_/ / /_/  __/ /    \033[0m"
echo -e "\033[31m/_/ |_\__,_/_/_/   \____/ .___/\__,_/\__,_/\__/\___/_/     \033[0m"
echo -e "\033[31m                       /_/                                 \033[0m"
echo -e "\033[31m                                                           \033[0m"
echo "                                By: Paradox"
echo
echo
read -p "Press enter to continue"
clear
PS3='Please select one of the following options: '
options=("Install Kali Updater" "Uninstall Kali Updater" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Install Kali Updater")
			echo "[] Making kali_updater directory in /opt/ folder.";
			sudo mkdir /opt/kali_updater;
			echo "[] Copying update script and Kali icon to /opt/kali_updater";
			sudo cp kali_updater.sh /opt/kali_updater/kali_updater.sh;
			sudo cp kali_logo.png /opt/kali_updater/kali_logo.png;
			sudo chmod a+x /opt/kali_updater/kali_updater.sh;
			echo "[] Creating symbolic link from shell script in opt folder to command in /usr/bin folder.";
			sudo ln -sf /opt/kali_updater /usr/bin/kali_updater;
			echo "[] Creating desktop launcher.";
			sudo echo "[Desktop Entry]" >> kali_updater.desktop;
			sudo echo "Version = 1.0" >> kali_updater.desktop;
			sudo echo "Type = Application" >> kali_updater.desktop;
			sudo echo "Terminal = true" >> kali_updater.desktop;
			sudo echo "Name = Kali Updater" >> kali_updater.desktop;
			sudo echo "Exec = /usr/bin/kali_updater" >> kali_updater.desktop;
			sudo echo "Icon = /opt/kali_updater/kali_logo.png" >> kali_updater.desktop;
			sudo echo "Categories = Application;" >> kali_updater.desktop;
			sudo mv kali_updater.desktop /usr/share/applications/;
			echo "[] Done installing!"
			;;
		"Uninstall Kali Updater")
			echo "[] Uninstalling...";
			sudo rm -rf /opt/kali_updater;
			sudo rm /usr/share/applications/kali_updater.desktop;
			echo "[] Done!"
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
echo "Thank you for using Kali Updater! If you just installed, you should now be able to use the kali_updater command directly from terminal or applications menu."