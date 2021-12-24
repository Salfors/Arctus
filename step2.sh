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
            clear
            function Keyboard() {

                while true
                    do
                    echo -e "\n${SP} ${r}${bo}Note${rt}:${w}${bo} that if you've run a script before. ${EP}"
                    echo -e "${SP} make sure you don't repeat the keyboard layout at the top of the file selected /etc/locale.gen'. ${EP}"
                    echo -e "\n${w}${bo}Press Enter To Continue...${rt}"
                    read CN #Confirm Note
                    case $CN in 
                        "")
                            clear
                            while true
                                do 

                                echo -e "\n${b}====================================="
                                echo -e "[---]   ${p}Keyboard Layout Menu${rt}${b}    [---]"
                                echo -e "=====================================${rt}\n"
                                read -p "The Default keyboard Layout (EN) Do You Want To Add Another Layout [Y/N]  : " AK #ASK KEY
                                case $AK in 

                                    y|Y|yes|Yes|YES)  
                                    clear
                                        while true
                                            do
                                            echo -e "\n${b}====================================="
                                            echo -e "[---]   ${p}Keyboard Layout Menu${rt}${b}    [---]"
                                            echo -e "=====================================${rt}\n"
                                            echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}AR +${rt}"
                                            echo -e "${g}${bo}+${rt}${SL2} ${w}${bo}RU +${rt}"
                                            echo -e "${g}${bo}+${rt}${SL3} ${w}${bo}FR +${rt}"
                                            echo -e
                                            read -p "Choose a Number Or Enter ['A'] To show more Layouts : " KEY
                                            if [ "$KEY" == "1" ] ; then 
                                                sed -i '/# lists of locales/a ar_AE.UTF-8 UTF-8' /etc/locale.gen
                                                break
                                                elif [ "$KEY" == "2" ] 
                                                then
                                                sed -i '/# lists of locales/a ru_RU.UTF-8 UTF-8' /etc/locale.gen
                                                break
                                                elif  [ "$KEY" == "3" ]
                                                then 
                                                sed -i '/# lists of locales/a fr_FR.UTF-8 UTF-8' /etc/locale.gen
                                                break
                                                elif [ "$KEY" == "A" ] || [ "$KEY" == "a" ]; then
                                                    clear
                                                    while true
                                                        do 
                                                        echo -e  ""
                                                        echo -e "Now Choose Your Editor And Remove '#' From Your Layout And Save File And Exit\n"
                                                        #EDIT KEY
                                                        echo -e "${y}${bo}***********${rt}\n"
                                                        echo "${SL}${w}${bo}nano${rt}"
                                                        echo "${SL}${w}${bo}vi${rt}"
                                                        echo "${SL}${w}${bo}vim${rt}"
                                                        echo "${SL}${w}${bo}micro${rt}"
                                                        echo -e "${y}${bo}***********${rt}\n"
                                                        read -p "your choice : " EK #EDIT KEY
                                                        case $EK in 
                                                            "nano"|"vi"|"vim"|"micro")
                                                                clear
                                                                while true
                                                                    do 
                                                                    echo -e "${SP} Note that if you edit the file before, make sure you don't repeat the key layout in the top of the file. ${EP}"
                                                                    echo -e "\n${w}${bo}Press Enter to Contine... ${rt}"
                                                                    read Confirm
                                                                    case $Confirm in 
                                                                        "")
                                                                            
                                                                                $EK /etc/locale.gen 
                                                                                while true
                                                                                    do
                                                                                    clear
                                                                                    echo -e "\n"
                                                                                    read -p "Please Confirm Changes [y/n] : " CONF #CONFIRM
                                                                                    case $CONF in 
                                                                                        y|Y|yes|Yes|YES)
                                                                                            break ;;
                                                                                        n|N|no|No|NO)
                                                                                            sleep 3
                                                                                            clear 
                                                                                            break;;
                                                                                        *)
                                                                                            echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                                                                            count=`expr $count + 1` 
                                                                                            sleep 1 
                                                                                            clean_screen  ;;
                                                                                    esac
                                                                                done 
                                                                                break ;;
                                                                            *)
                                                                                clear ;;
                                                                    esac
                                                                done
                                                                break
                                                                ;;
                                                            "")
                                                                echo -e "\n${SM} Type one of Them ${EM}\n" 
                                                                count=`expr $count + 1`
                                                                clean_screen ;;

                                                            *)
                                                                echo -e "\n${SM} Enter Valid Value !! ${EM}\n" 
                                                                count=`expr $count + 1`
                                                                clean_screen ;;
                                                        esac
                                                                

                                                                            
                                                    done
                                                    break
                                                else
                                                sleep 1
                                                echo -e "\n${SM} Choose Any one of options !!! ${EM}\n"
                                                count=`expr $count + 1`
                                                clean_screen
                                            fi
                                    
                                        #clear
                                        done
                                        break
                                        ;; 

                                    n|N|no|No|NO) 
                                        
                                        break ;;
                                    *)  
                                        sleep 1
                                        echo -e ""
                                        echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                        echo -e ""
                                        count=`expr $count + 1`
                                        clean_screen
                                        ;;

                                esac 
                            done
                            echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen 
                            break ;;
                        *)
                            clear ;;
                    esac
                    

                    
                done
            }
            Keyboard
            clear
            
            echo "
            LANG=en_US.UTF-8
            LC_CTYPE="en_US.UTF-8"
            LC_NUMERIC=ja_JP.utf8
            LC_TIME=ja_JP.utf8
            LC_COLLATE="en_US.UTF-8"
            LC_MONETARY=ja_JP.utf8
            LC_MESSAGES="en_US.UTF-8"
            LC_PAPER=ja_JP.utf8
            LC_NAME="en_US.UTF-8"
            LC_ADDRESS="en_US.UTF-8"
            LC_TELEPHONE="en_US.UTF-8"
            LC_MEASUREMENT=ja_JP.utf8
            LC_IDENTIFICATION="en_US.UTF-8"
            LC_ALL=
            " > /etc/locale.conf 
            locale -a
            localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
            # Set keymaps
            localectl --no-ask-password set-keymap us
            while true
            do
            echo -e "\n${b}============================="
            echo -e "[---]    ${p}Host Setup${rt}${b}     [---]"
            echo -e "=============================${rt}\n"
            read  -p "Enter your Host name (default==archPc) :" HostN
            if [ "$HostN" != "" ]
                then
                echo "$HostN" > /etc/hostname
                echo "127.0.1.1	  localhost.localdomin	  $HostN" >> /etc/hosts
                break
                elif [ "$HostN" == "" ]
                then 
                echo "archPc" > /etc/hostname
                echo "127.0.1.1	  localhost.localdomin	  archPc"  > /etc/hosts
                break     
            fi
            done
            clear
            echo -e "\n${b}=================================="
            echo -e "[---]     ${p}Network Setup${rt}${b}      [---]"
            echo -e "==================================${rt}\n"
            sleep 2
            pacman -S networkmanager dhclient --noconfirm --needed
            systemctl enable --now NetworkManager
            clear
            ####################################################
            function add_user() {
                clear
                echo -e "\n${b}=================================="
                echo -e "[---]     ${p}User creation${rt}${b}      [---]"
                echo -e "==================================${rt}\n"
                username=""
                while [ x$username = "x" ]; do

                read -p "Please Enter the Username You Wish To Create : " username
                if [ "${username}" == "" ]; then
                    echo -e "\n${SM} Enter Something ${EM}\n"
                    username=""
                    count=`expr $count + 1`
                    clean_screen
                elif id -u $username >/dev/null 2>&1; then

                echo -e "\n${SM} User already exists ${EM}\n"
                count=`expr $count + 1`
                clean_screen
                username=""
                fi
                done
              
                echo -e "\n"
                group=""
                while [ x$group = "x" ]; do

                read -p "Please Enter The Primary Group. If Group Not Exist, It Will Be Created : " group
                if [ "$group" == "" ]; then
                    echo -e "\n${SM} Enter Something !! ${EM}\n"
                    group=""
                    count=`expr $count + 1`
                    clean_screen

                elif id -g $group >/dev/null 2>&1; then
                #clear
                echo -e "\n${SP} Group Exist ${EP}"
                count=`expr $count + 1`
                clean_screen

                fi
                done
                echo -e "\n"
                read -p "Please Enter Bash [/bin/bash] : " bash

                if [ x"$bash" = "x" ]; then

                bash="/bin/bash"

                fi

                read -p "Please Enter Homedir [/home/$username] : " homedir

                if [ x"$homedir" = "x" ]; then

                homedir="/home/$username"

                fi
                function password() {
                    #clear
                    while true
                        do
                        echo -e ""
                        read -p "Enter New Password For User : " password1
                        read -p "Re-enter Password  : " password2
                        if [ "$password1" != "$password2" ] 
                            then
                            echo -e "\n${SM}Two words that don't match, try again !!! ${EM}\n"
                            count=`expr $count + 1`
                            clean_screen
                            elif [ "$password1" == "" ] &&  [ "$password2" == "" ] 
                            then
                            echo -e "\n${SM} Don't Leave It Blank, You Must Create a Password For Login ${EM}\n"
                            count=`expr $count + 1`
                            clean_screen
                            elif [ "$password1" == "$password2" ]
                            then
                            groupadd $group
                            useradd -g $group -s $bash -d $homedir -m $username
                            sudo mkhomedir_helper $username
                            sed -i '/root ALL=(ALL) ALL/a '${username}' ALL=(ALL) ALL' /etc/sudoers 
                            echo  $username':'${password1} | chpasswd
                            break
                        fi
                    done
                }

            echo -e ""
                while true 
                    read -p "Please Confirm [y/n] : " confirm
                    do 
                    case $confirm in 
                        y|Y|yes|Yes|YES)

                            password
                            break ;;
                        n|N|no|No|NO)
                            clear
                            add_user ;;
                        *)
                            echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                            count=`expr $count + 1`
                            clean_screen ;;
                    esac
                done
                
            }
            #add_user

            clear

            while true
                do
                echo -e "\n${b}==============================="
                echo -e "[---]    ${p}USER ACCOUNT${rt}${b}     [---]"
                echo -e "===============================${rt}\n"
                read -p  "do you want add new user [Y/N] : " user
                case $user in 
                    y|Y|yes|Yes|YES)

                        add_user
                        while true 
                            do
                            clear
                            echo -e "\n"
                            read -p "Do You Want Anthore User [Y/N]: " new_user 
                            case $new_user in 
                                y|Y|yes|Yes|YES)

                                    add_user
                                    ;;
                                n|N|no|No|NO)

                                    break ;;
                                *)  
                                    echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                    count=`expr $count + 1`
                                    clean_screen ;;
                            esac
                        done
                        break
                        ;;
                        
                    n|N|no|No|NO)
                        break 
                        ;;
                    *)
                        echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                        count=`expr $count + 1`
                        clean_screen
                        ;;
                esac

            done

            clear
            while true
            do
            echo -e "\n${b}===================================="
            echo -e "[---]  ${p}Set Password For Root${rt}${b}   [---]"
            echo -e "====================================${rt}\n"
            read -p "Enter New Password For Root User : " passwd1
            read -p "Re-enter Password  : " passwd2
            if [ "$passwd1" != "$passwd2" ] 
                then
                echo -e "\n${SM} Two words that don't match, try again !!! ${EM}\n"
                count=`expr $count + 1`
                clean_screen
                elif [ "$passwd1" == "" ] &&  [ "$passwd2" == "" ] 
                then
                echo -e "\n${SM} Don't Leave It Blank, You Must Create a Root Password For First Login ${EM}"
                count=`expr $count + 1`
                clean_screen
                elif [ "$passwd1" == "$passwd2" ]
                then
                echo 'root:'${passwd1} | chpasswd
                break
            fi
            done
            clear
            echo -e "\n${b}=========================================="
            echo -e "[---]    ${p}Bootloader  Installation${rt}${b}    [---]"
            echo -e "==========================================${rt}\n"
            sleep 2
            pacman -S --noconfirm efibootmgr grub
            ID="`cat ID`"
            GrubID="`cat GrubID`"

            if [ "$GrubID" == "BIOS" ]; then  ######### IF IS BIOS MODE #######
                grub-install $ID 
                elif [ "$GrubID" == "UEFI" ]; then ### If Is Uefi MODE
                grub-install --target=x86_64-efi --efi--directory=/boot/efi --bootloader-id=GRUB --removable    
            fi
            grub-mkconfig -o /boot/grub/grub.cfg
            clear
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
