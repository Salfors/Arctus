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
echo ""
echo -e "\n${p}${bo}
 ░░░░░  ░░░░░░   ░░░░░░ ░░░░░░░░ ░░    ░░ ░░░░░░░ 
▒▒   ▒▒ ▒▒   ▒▒ ▒▒         ▒▒    ▒▒    ▒▒ ▒▒      
▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒         ▒▒    ▒▒    ▒▒ ▒▒▒▒▒▒▒${rt}
${b}${bo}▓▓   ▓▓ ▓▓   ▓▓ ▓▓         ▓▓    ▓▓    ▓▓      ▓▓ 
██   ██ ██   ██  ██████    ██     ██████  ███████${rt} 
"
sleep 2
os=`cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g'`
if [ "${os}" != '"Arch Linux"' ]; then
    echo "You must be using Arch Linux to execute this script."
    elif [ "${os}" == '"Arch Linux"' ]; then
    root=`whoami`
    case $root in

        "root")
            echo  -e "\n${w}${bo}---------------------------------------"
            echo  -e "Installing packages (for next steps)..."
            echo  -e "---------------------------------------${rt}\n"
            rm -rf /var/lib/pacman/db.lck
            pacman -S --noconfirm git micro nano vi vim 
            ### to make clean screen with limit trying 
            count=0
            max=2
            function clean_screen() {
                if [ "$count" -eq "$max" ]; then
                    clear
                    count=`expr $count - 3`
                    fi
            }
            #----------------source the function -----------------------#

            pwd=`pwd`

            source $pwd/functions2/Keyboard  # Keyboard setting
            source $pwd/functions2/Host_Setup #host setting
            source $pwd/functions2/User_Account #Create a user account
            source $pwd/functions2/Root_Password #Set a password for the root user
            source $pwd/functions2/add_user #Add a new user 
            #source $pwd/functions2/Desktop_Setup #Desktop Setup
            #source $pwd/functions2/GUI_Service #To Start GUI 
            source $pwd/functions2/bootloader # install bootloader

            #-----------------------------------------------------------#

            Keyboard 

            # -----locale setup
            clear
            echo "
            LANG=en_US.UTF-8
            LC_CTYPE='en_US.UTF-8'
            LC_NUMERIC=ja_JP.utf8
            LC_TIME=ja_JP.utf8
            LC_COLLATE='en_US.UTF-8'
            LC_MONETARY=ja_JP.utf8
            LC_MESSAGES='en_US.UTF-8'
            LC_PAPER=ja_JP.utf8
            LC_NAME='en_US.UTF-8'
            LC_ADDRESS='en_US.UTF-8'
            LC_TELEPHONE='en_US.UTF-8'
            LC_MEASUREMENT=ja_JP.utf8
            LC_IDENTIFICATION='en_US.UTF-8'
            LC_ALL=
            " > /etc/locale.conf 
            locale -a
            localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
            #-----Set keymaps
            localectl --no-ask-password set-keymap us
            #----------------
            clear
            Host_Setup
            User_Account 
            Root_Password
            #Desktop_Setup
            #GUI_Service
            bootloader
            

            echo -e "${w}${bo}-------------------------------------------------------------------------"
            echo -e "--                                                                   ----"
            echo -e "      Now Enter The ${g}${bo}'exit'${rt}${w}${bo} Command To Finish The Installation            "
            echo -e "--                                                                   ----"
            echo -e "-------------------------------------------------------------------------${rt}"
            sleep 3 
            exit ;;

        *)  
            sleep 2
            echo -e "\n${SE} You Must Be a Root User To Successfully Complete a Process. !! ${EE}\n" ;;
    esac
fi
