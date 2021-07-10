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
options=("Update, Upgrade, Autoremove, & Autoclean" "ONLY Update Repositories & Upgrade" "ONLY Autoremove & Autoclean" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Update, Upgrade, Autoremove, & Autoclean")
			echo "[+] Updating repositories...";
			sudo apt update -qq;
			echo "[+] Finished updating!";
			echo "[+] Upgrading packages...";
			sudo apt upgrade -qq;
			echo "[+] Finished upgrading!";
			echo "[+] Autoremoving dependencies that were not explicitly installed and are no longer needed...";
			sudo apt autoremove -qq;
			echo "[+] Finished autoremove!";
			echo "[+] Clearing the local repository of retrieved package files that are no longer needed...";
			sudo apt autoclean -qq;
			echo "[+] Local cache cleared!"
			break
			;;
		"ONLY Update Repositories & Upgrade")
			echo "[+] Updating repositories...";
			sudo apt update -qq;
			echo "[+] Finished updating!";
			echo "[+] Upgrading packages...";
			sudo apt upgrade -qq;
			echo "[+] Finished upgrading!"
			break
			;;
		"ONLY Autoremove & Autoclean")
			echo "[+] Autoremoving dependencies that were not explicitly installed and are no longer needed...";
			sudo apt autoremove -qq;
			echo "[+] Finished autoremove!";
			echo "[+] Clearing the local repository of retrieved package files that are no longer needed...";
			sudo apt autoclean -qq;
			echo "[+] Local cache cleared!"
			break
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
echo "Thank you for using Kali Updater!"
