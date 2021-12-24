
# ------------------------------ COLORS CODE -------------------------------------------------------------#

r="\e[0;91m"  #> red
b="\e[0;94m"  # > blue
y="\033[1;33m" #>Yellow#
g="\e[0;92m" #> green
w="\e[0;97m" #> white
bo="\e[1m" #> bold
u="\e[4m" #> uline
rt="\e[0m" #> reset
p='\033[0;35m' #> Purple

SL=${p}${bo}[${rt}${b}${bo}-${rt}${p}${bo}]${rt}  #Start of Some Menu
SL1=${p}${bo}[${rt}${y}${bo}1${rt}${p}${bo}]${rt} #Start of Numbers Menus (1)
SL2=${p}${bo}[${rt}${y}${bo}2${rt}${p}${bo}]${rt} #Start of Numbers Menus (2)
SL3=${p}${bo}[${rt}${y}${bo}3${rt}${p}${bo}]${rt}

SE=${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt}${w}${bo}${u} #Start Exclamation error 
EE=${rt}${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt} #End of Exclamation error 
#
SM=${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt}${w}${bo}${u} #Start of the Minus sign error
EM=${rt}${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt} #End of Minus sign error 
#
SP=${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt}${w}${bo} #Start of the success of a Positive sign
EP=${rt}${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt} #End of the success of a Positive sign

#------------------------------------------------------------------------------------------------------------#
clear
sleep 2
echo -e "${p}${bo}
 ░░░░░  ░░░░░░   ░░░░░░ ░░░░░░░░ ░░    ░░ ░░░░░░░ 
▒▒   ▒▒ ▒▒   ▒▒ ▒▒         ▒▒    ▒▒    ▒▒ ▒▒      
▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒         ▒▒    ▒▒    ▒▒ ▒▒▒▒▒▒▒${rt}
${b}${bo}▓▓   ▓▓ ▓▓   ▓▓ ▓▓         ▓▓    ▓▓    ▓▓      ▓▓ 
██   ██ ██   ██  ██████    ██     ██████  ███████${rt} 
"
user=`whoami`
case $user in 
    "root")
        sleep 2 
        echo -e "\n${SE} You Must Be a Normal User To Successfully Complete a Process !! ${EE}\n" 
        ;;
    *)  
        clear
        echo -e "\n${y}--------------------"
        echo -e "|   ${p}${bo}CLONING: ${rt}${b}${bo}YAY${rt}   ${y}|" 
        echo -e "--------------------${rt}\n"
        sleep 0.8
        cd ~
        rm -rf yay/
        git clone "https://aur.archlinux.org/yay.git"
        cd ${HOME}/yay
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si --noconfirm
        clear
        echo -e "\n${y}-----------------------"
        echo "|   ${p}${bo}CLONING: ${rt}${b}${bo}YAOURT   ${y}|" 
        echo -e "-----------------------${rt}\n"
        sudo pacman -S --needed base-devel git wget yajl
        cd /tmp
        rm -rf package-query/
        git clone https://aur.archlinux.org/package-query.git
        cd package-query/
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si && cd /tmp/
        rm -rf yaourt/
        git clone https://aur.archlinux.org/yaourt.git
        cd yaourt/
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si
        cd ${HOME}
        clear
        echo -e "\n${y}----------------------"
        echo "|   ${p}${bo}CLONING: ${rt}${b}${bo}PAKKU   ${y}|" 
        echo -e "----------------------${rt}\n"
        cd ~
        rm -rf pakku/
        git clone https://aur.archlinux.org/pakku.git
        cd ${HOME}pakku
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si
        clear
        echo -e "\n${y}-----------------------"
        echo "|  ${p}${bo}CLONING: ${rt}${b}${bo}AURUTILS  ${y}|" 
        echo -e "-----------------------${rt}\n"
        cd ~
        rm -rf aurutils/
        git clone https://aur.archlinux.org/aurutils.git
        cd ${HOME}/aurutils
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si
        clear
        echo -e "\n${y}-----------------------"
        echo "|  ${p}${bo}CLONING: ${rt}${b}${bo}PACM-AUR  ${y}|" 
        echo -e "-----------------------${rt}\n"
        cd ~
        rm -rf pamac-aur
        git clone https://aur.archlinux.org/pamac-aur.git
        cd cd ${HOME}/pamac-aur
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si
    ;;
esac
