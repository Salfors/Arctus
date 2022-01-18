
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
#

SE=${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt}${w}${bo}${u} #Start Exclamation error 
EE=${rt}${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt} #End of Exclamation error 

#------------------------------------------------------------------------------------------------------------#

# # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  ░░░░░  ░░░░░░   ░░░░░░ ░░░░░░░░ ░░    ░░ ░░░░░░░   #
# ▒▒   ▒▒ ▒▒   ▒▒ ▒▒         ▒▒    ▒▒    ▒▒ ▒▒        #
# ▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒         ▒▒    ▒▒    ▒▒ ▒▒▒▒▒▒▒   #
# ▓▓   ▓▓ ▓▓   ▓▓ ▓▓         ▓▓    ▓▓    ▓▓      ▓▓   #
# ██   ██ ██   ██  ██████    ██     ██████  ███████   #
# # # # # # # # # # # # # # # # # # # # # # # # # # # #

user=`whoami`
case $user in 
    "root")
        sleep 2 
        clear
        echo -e "\n${SE} You Must Be a Normal User To Successfully Complete a Process !! ${EE}\n" ;;
        
    *)  
        clear
        echo -e "\n${y}--------------------"
        echo -e "|   ${p}${bo}CLONING: ${rt}${b}${bo}YAY${rt}   ${y}|" 
        echo -e "--------------------${rt}\n"
        sleep 2
        cd ~
        sudo rm -rf yay/
        git clone "https://aur.archlinux.org/yay.git"
        cd ${HOME}/yay
        sudo rm -rf /var/lib/pacman/db.lck
        makepkg -si --noconfirm
        cd ${HOME}
        sleep 1
        
        clear

        echo -e "\n${y}-----------------------"
        echo -e "|   ${p}${bo}CLONING: ${rt}${b}${bo}YAOURT   ${y}|" 
        echo -e "-----------------------${rt}\n"
        sleep 2
        sudo pacman -S --needed base-devel git wget yajl
        cd /tmp
        sudo rm -rf package-query/
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
        sleep 1
        
        clear
        
        echo -e "\n${y}-----------------------"
        echo -e "|   ${p}${bo}CLONING: ${rt}${b}${bo}SNAPD   ${y}|" 
        echo -e "-----------------------${rt}\n"      
        sleep 2
        cd ~
        sudo rm -rf snapd/
        git clone https://aur.archlinux.org/snapd.git
        cd snapd
        sudo rm -rf package-query/
        makepkg -si
        cd ${HOME}
        sleep 1
        
        clear ;;
    
esac
