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
StM=${b}${bo}[${p}${bo}---${rt}${b}${bo}]${rt}${w}${bo} #Start Menu show Table  (partition)
EnM=${b}${bo}[${p}${bo}---${rt}${b}${bo}]${rt} # End Menu show Table (partition)

SE=${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt}${w}${bo}${u} #Start Exclamation error 
EE=${rt}${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt} #End of Exclamation error 
#
SM=${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt}${w}${bo}${u} #Start of the Minus sign error
EM=${rt}${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt} #End of Minus sign error 
#
SP=${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt}${w}${bo} #Start of the success of a Positive sign
EP=${rt}${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt} #End of the success of a Positive sign

#------------------------------------------------------------------------------------------------------------#
chmod a+x help.sh
clear
echo -e "\n${p}${bo}
 ░░░░░  ░░░░░░   ░░░░░░ ░░░░░░░░ ░░    ░░ ░░░░░░░ 
▒▒   ▒▒ ▒▒   ▒▒ ▒▒         ▒▒    ▒▒    ▒▒ ▒▒      
▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒         ▒▒    ▒▒    ▒▒ ▒▒▒▒▒▒▒${rt}
${b}${bo}▓▓   ▓▓ ▓▓   ▓▓ ▓▓         ▓▓    ▓▓    ▓▓      ▓▓ 
██   ██ ██   ██  ██████    ██     ██████  ███████${rt} 
"
##_________________________________________WELCOM TO "ARCTUS" __________________________________________________________________##

os=`cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g'`
if [ "${os}" != '"Arch Linux"' ]; then
    echo -e "\n${SE}You must be using Arch Linux to execute this script.${EE}"
    break
    elif [ "${os}" == '"Arch Linux"' ]; then
    sleep 3
    #------In order to partition a disk----#
    echo -e "\nInstalling prereqs...\n"
    pacman -S --noconfirm gptfdisk btrfs-progs
    clear
    ### to make clean screen with limit trying 
    count=0
    max=2
    function clean_screen() {
        if [ "$count" -eq "$max" ]; then
            clear
            count=`expr $count - 2`
            fi
    }
    while true
    do
    echo -e "\n${b}======================================================"
    echo -e "[---]     ${p}Select Your Disk To Installation${rt}${b}       [---]"
    echo -e "======================================================${rt}\n"
    lsblk
    echo -e "\nPlease Enter Disk: (example /dev/sda)\n"
    read DISK
    if [ "$DISK" == "" ] 
        then
        echo -e "\n${SM} Choose The Disk To Install To !!!${EM}\n"
        sleep 1
        count=`expr $count + 1`
        sleep 1
        clean_screen
       
        else
            echo -e ""
            read -p "Please confirm [y/n] : " HDC #HARD DISK CONFIRM 
            case $HDC in 
                y|Y|yes|Yes|YES)
                    sleep 1
                    break ;;
                n|N|no|No|NO)
                    sleep 1
                    clear ;;
                *)
                    echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                    count=`expr $count + 1` 
                    sleep 1 
                    clean_screen  ;;
            esac
       
    fi
    done
    count=0
    clear
    function EDIT_HARD_DISK() {
        while true
            do
            echo -e "\n${SP}Note: This is a script that cannot detect if there is space available for installation${EP}"
            echo -e "${w}${bo}..or if an extender already exists${rt}"
            echo -e "${SP}So you have to make sure that you have enough space and that there is no pre-expanded in the next stage. ${EP}"
            echo -e "\n${w}${bo}Press Enter To Continue${rt}"
            read CN #Confirm Note
            case $CN in 
                "")
                    clear
                    sleep 1
                    while true
                        do
                        echo -e "\n${b}====================================="
                        echo -e "[---]     ${p}Hard Disk Editor${rt}${b}      [---]"
                        echo -e "=====================================${rt}\n"
                        echo -e ""
                        read -p "Do You Want To Modify a Hard Disk [Y/N] ? : " HDEC # HARD DISK EDIT CONFIRM 
                        case $HDEC in 
                            y|Y|yes|Yes|YES)
                                    clear
                                    while true
                                        do
                                        echo -e "\nChoose Tool for Managing Hard Disk Partitions.\n"
                                        echo -e "${y}${bo}***********${rt}\n"
                                        echo -e "${SL}${w}${bo}fdisk${rt}"
                                        echo -e "${SL}${w}${bo}cfdisk${rt}"
                                        echo -e "${SL}${w}${bo}parted${rt}"
                                        echo -e "${SL}${w}${bo}cgdisk${rt}"
                                        echo -e "\n${y}${bo}***********${rt}\n"
                                        read -p "Enter Your Favorite Tool : " TOOL ## TOOL TO EDIT DISK
                                        case $TOOL in 
                                            fdisk|cfdisk|parted|cgdisk)
                                                clear
                                                $TOOL ${DISK}
                                                clear
                                                break
                                                ;;
                                            "")
                                                echo -e "\n${SM} Sorry, Choose One From Them !!! ${EM}\n"
                                                sleep 1
                                                count=`expr $count + 1`
                                                clean_screen
                                                ;;
                                            *)
                                                echo -e "\n${SM} Enter The Tool Name Correctly!!! ${EM}\n"
                                                sleep 1
                                                count=`expr $count + 1`
                                                clean_screen
                                        esac
                                    done
                                    break              
                                    ;;

                            n|N|no|No|NO)
                                sleep 1
                                break
                                ;;
                            *)
                                echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                count=`expr $count + 1` 
                                sleep 1 
                                clean_screen 
                                ;;                      
                        esac
                        clean_screen
                    done 
                    break ;;
                *)  
                    clear ;;

            esac
        done
    }
    EDIT_HARD_DISK
    clear
    count=0
    function Format_The_Hard_Disk (){
            sleep 1
            while true
                do 
                echo -e "\n${b}====================================="
                echo -e "[---]     ${p}Hard Disk Usage${rt}${b}       [---]"
                echo -e "=====================================${rt}\n"
                echo -e ""
                echo -e "${SL1} ${w}${bo}Use it all and format the hard drive.${rt}"
                echo -e "${SL2} ${w}${bo}Use only free disk space.${rt}"
                echo -e ""
                read -p "Do you want to use all disk for installation or just free space : " HDU  #Hard Disk Usage
                #clear
                if [ "$HDU" == "1" ]; then 
            
                    clear
                    sgdisk -Z ${DISK} # zap all on disk
                    clear
                    sleep 1
                    while true 
                        do
                        echo -e "\n${b}============================================"
                        echo -e "[---]  ${p}Hard disk partition table type${rt}${b}  [---]"
                        echo -e "============================================${rt}\n"
                        echo -e "${SL1} ${w}${bo}GPT${rt}"
                        echo -e "${SL2} ${w}${bo}MSDOS${rt}"
                        echo -e ""
                        read -p "Do you want a 'GPT' or 'MSDOS' table for your hard disk : " HDT  #Hard Disk Table
                        case $HDT in 
                        "1")
                            clear
                            sgdisk -a 2048 -o ${DISK}  #Create new gpt table
                            break
                            ;;

                        "2") # Create new msdos table
                            clear
                            echo "o
                            w
                            " | fdisk ${DISK} 
                            break
                            ;;

                        *)
                            echo -e "\n${SM} ENTER One '1' Or Two '2' !!!${EM}\n"
                            count=`expr $count + 1`
                            sleep 1
                            clean_screen
                            ;;
                        esac
                        clean_screen
                    done    
                    break
                
                elif [ "$HDU" == "2" ]; then
                    count=0
                    function Available_Table() {
                        AODT=`sudo parted ${DISK} print | grep -i '^Partition Table' | sed 's/Partition Table: //g'` #Availability Of Disk Table 
                        clear
                        case $AODT in
                            "unknown")
                                    sleep 1
                                    while true
                                        do
                                        echo -e "\n${b}============================================"
                                        echo -e "[---]  ${p}Hard disk partition table type${rt}${b}  [---]"
                                        echo -e "============================================${rt}\n"
                                        echo "You don't have any hard disk table, Choose one"
                                        echo -e ""
                                        echo -e "${SL1} ${w}${bo}MSDOS${rt}"
                                        echo -e "${SL2} ${w}${bo}GPT${rt}"
                                        read -p "Your Choice : " NHDT #New Hard Disk Table
                                        case $NHDT in 
                                            "1")
                                                clear
                                                echo "o
                                                w
                                                "| fdisk ${DISK}
                                                break
                                                ;;
                                            "2")
                                                clear
                                                sgdisk -a 2048 -o ${DISK} 
                                                break
                                                ;;
                                            *)
                                                echo -e "\n${SM} Choose Number 'One' or 'Two' ${EM}\n"
                                                count=`expr $count + 1`
                                                sleep 1
                                                clean_screen
                                                ;;
                                        esac
                                        clean_screen
                                        
                                    done
                                    ;; 
                                *)
                                    break
                                    ;;
                        esac

                    }
                    Available_Table
                    break 
                else
                echo -e "\n${SM} Choose Number 'One' or 'Two' ${EM}\n"
                count=`expr $count + 1`
                sleep 1
                clean_screen
                fi
                
            done
                
    }
    Format_The_Hard_Disk
    clear

    #-----Select live boot type------#
    count=0
    function Direct_Boot_Mode () {   

        Mode=`ls /sys/firmware/efi`
        clear
        sleep 1
        echo -e "\n${b}================================"
        echo -e "[---]    ${p}Live Boot Type${rt}${b}    [---]"
        echo -e "================================${rt}\n"
        if $Mode >/dev/null 2>&1; then
                MODE="BIOS"
        else
                MODE="UEFI"
        fi
    }
    Direct_Boot_Mode
    function CHECK_MODE() {
        sleep 1
        while true
            do 
            echo -e "\n${SP}THE CURRENT BOOT MODE IS {'${g}${MODE}${rt}${w}${bo}'}? ${EP}\n"
            read -p "Please confirm [y/n] : " CM #Confirm MODE
            case $CM in 
                y|Y|yes|Yes|YES)
                    break
                    ;;

                n|N|no|No|NO)
                    clear
                    sleep 1
                    while true
                        do 
                                
                        echo -e "\n${b}========================================"
                        echo -e "[---]   ${p}Select Your Boot Type${rt}${b}      [---]"
                        echo -e "========================================${rt}\n"
                        echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}BIOS Mode${rt}" # BIOS
                        echo -e "${g}${bo}+${rt}${SL2} ${w}${bo}UEFI Mode${rt}\n" # UEFI
                        read -p  "Enter Number : " MODE
                        case $MODE in 
                            "1")
                                 Mode="BIOS"
                                echo ""
                                echo -e "\n${SP} The Boot Mode In Which The Installation Will Be Performed Is {'${g}${MODE}${rt}${w}${bo}'}. ${EP}"
                                echo -e "${SP} If it is not correct, try restarting the script and try again. ${EP}"
                                ;;
                            "2")
                                Mode="UEFI"
                                echo ""
                                echo -e "\n${SP} The Boot Mode In Which The Installation Will Be Performed Is {'${g}${MODE}${rt}${w}${bo}'}. ${EP}"
                                echo -e "${SP} If it is not correct, try restarting the script and try again. ${EP}"
                                sleep 4 ;;

                            *)
                                echo -e "\n${SM} Choose Number One '1' or Two '2' ${EM}\n"
                                count=`expr $count + 1`
                                clean_screen ;;
                        esac
                        break             
                    done
                    break
                    ;;
                "")
                    echo -e "\n${SP} Default Choose {'${MODE}'} ${EP}"
                    sleep 5
                    break ;;

                *)
                    echo -e "\n${SM} ENTER 'Yes' or 'No' !!!${EM}\n"
                    count=`expr $count + 1`
                    clean_screen
                    ;;
            esac
            clean_screen 
        done
    }
    CHECK_MODE
        
    function Determine_Size() {

        #_____Determine the size of the root partition____#
        count=0
        sleep 1
        while true
            do
            echo -e "\n${b}======================================================"
            echo -e "[---]  ${p}Determine the size of the Home partition${rt}${b}  [---]"
            echo -e "======================================================${rt}\n"
            echo -e "\nNote:Enter Just The Number And Without GB or MB on Next steps"
            read -p "Please Enter Size For Root Partition : " RooP #Root Partition
            if [ -z "${RooP//[0-9]/}" -a ! -z "$RooP" ]; then 
                    echo "${RooP}"
                    break
            elif [ -z "${RooP##*[!0-9]*}" ]; then
                    echo -e "\n${SM} Enter Just The Number And Without GB or MB. ${EM}"
                    count=`expr $count + 1`
            else
                    echo -e "\n${SM} You Must Enter Root Partition Size !!! ${EM}\n"
                    count=`expr $count + 1`
            fi
            clean_screen
                
        done
        clear
        count=0       
        #____Determine the size of the home partition___#
        sleep 1
        while true
            do
            echo -e "\n${b}=========================================="
            echo -e "[---]  ${p}Select Create Home Partition${rt}${b}  [---]"
            echo -e "==========================================${rt}\n"
            read  -p "Please do you want create home part or not [y/n] : " CH #Create  Home 
            case $CH in 
                y|Y|YES|Yes|yes)

                    clear
                    echo -e 
                    sleep 1
                    while true
                        do
                        count=0
                        echo -e "\n${b}======================================================"
                        echo -e "[---]  ${p}Determine The Size of The Home Partition${rt}${b}  [---]"
                        echo -e "======================================================${rt}\n"
  
                        read -p "Enter Your Home Partition Size Please : " Homep #Home Partition
                        if [ -z "${Homep//[0-9]/}" -a ! -z "$Homep" ]; then
                                break
                        elif [ -z "${Homep##*[!0-9]*}" ]; then
                                echo -e "\n${SM} Enter Just The Number And Without GB or MB. ${EM}"
                                count=`expr $count + 1`
                        else 
                                echo "\n${SM} Enter Valid Value !! ${EM}\n"
                                count=`expr $count + 1`
                        fi
                        clean_screen
                           
                    done
                    echo -e 
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
        count=0
        #_____Determine the size of the swap partition__#
        sleep 1
        while true
            do
            echo -e "\n${b}=========================================="
            echo -e "[---]  ${p}Select Create swap Partition${rt}${b}  [---]"
            echo -e "==========================================${rt}\n"
            read  -p "Please Do You Want Create Swap Part Or Not [y/n] : " CS #Create swap 
            case $CS in 
                y|Y|YES|Yes|yes)
                    clear
                    echo -e 
                    sleep 1
                    while true
                        do
                        count=0
                        echo -e "\n${b}======================================================"
                        echo -e "[---]  ${p}Determine The Size of the Swap Partition${rt}${b}  [---]"
                        echo -e "======================================================${rt}\n"
                        read -p "Enter Your Swap Partition Size Please : " Swp # Swap Partition
                        if [ -z "${Swp//[0-9]/}" -a ! -z "$Swp" ]; then
                                break
                        elif [ -z "${Swp##*[!0-9]*}" ]; then
                                echo -e "\n${SM} Enter Just The Number And Without GB or MB. ${EM}"
                                count=`expr $count + 1`
                        else 
                                echo -e "\n${SM} Enter Valid Value !! ${EM}\n"
                                count=`expr $count + 1`
                        fi
                        clean_screen              
                    done
                    echo -e 
                    break
                    ;;
                n|N|NO|No|no)
                    break
                    ;;
                *) 
                    echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                    count=`expr $count + 1`
                    clean_screen
                    ;;
            esac
        done
        }
        #Determine_Size

        #Partition Table GPT/BIOS
        function Partition_table_GB () {

            echo -e "\n${b}${bo}
            =====================================================================

            ${StM}    ${DISK}                                                $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${DISK}${ROOT}     ${RooP}GB      /ROOT     /mnt           $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${HP}     ${HomepS}      /HOME     /mnt/home      $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${SwPP}      ${SwpS}       SWAP     [SWAP]         $EnM
            ${StM}                                                            $EnM

            ${b}${bo}=====================================================================${rt}     
            \n"
        }

        #Partition Table MSDOS/BIOS

        function Partition_table_MB() {

            echo -e "\n${b}${bo}
            ==========================================================================

            ${StM}    ${DISK}                                                     $EnM
            ${StM}         |_${EXT}                                       $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${DISK}${ROOT}     ${RooP}GB      /ROOT     /mnt           $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${HP}     ${HomepS}      /HOME     /mnt/home      $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${SwPP}      ${SwpS}       SWAP     [SWAP]         $EnM

            ${b}${bo}===========================================================================${rt}     
            \n"
        }

        #Partition Table GPT/UEFI

        function Partition_table_GU() {

            echo -e "\n${b}${bo}
            =====================================================================

            ${StM}    ${DISK}                                                $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${DISK}${EFI}     512MB     /efi     /mnt/boot/efi   $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${DISK}${ROOT}     ${RooP}GB      /ROOT     /mnt           $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${HP}     ${HomepS}      /HOME     /mnt/home      $EnM
            ${StM}        |                                                   $EnM
            ${StM}        |_ ${SwPP}      ${SwpS}       SWAP     [SWAP]         $EnM
            ${StM}                                                            $EnM

            ${b}${bo}=====================================================================${rt}     
            \n"
        }

        #Partition Table MSDOS/UEFI

        function Partition_table_MU() {

            echo -e "\n${b}${bo}
            ==========================================================================

            ${StM}    ${DISK}                                                     $EnM
            ${StM}         |_${EXT}                                       $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${DISK}${EFI}     512MB     /efi     /mnt/boot/efi   $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${DISK}${ROOT}     ${RooP}GB      /ROOT     /mnt           $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${HP}     ${HomepS}      /HOME     /mnt/home      $EnM
            ${StM}             |                                                   $EnM
            ${StM}             |_ ${SwPP}      ${SwpS}       SWAP     [SWAP]         $EnM

            ${b}${bo}===========================================================================${rt}    
            \n"
        }

        function Partition_the_hard_disk {
            DTP=`sudo parted ${DISK} print | grep -i '^Partition Table' | sed 's/Partition Table: //g'`
            if [ "${MODE}" == 'BIOS' ]; then
                    if [ "$DTP" == "msdos" ]; then
                        Partition_table_MB
                    elif [ "$DTP" == "gpt" ]; then
                        Partition_table_GB
                    fi
            elif [ "${MODE}" == "UEFI" ]; then
                    if [ "$DTP" == "msdos" ]; then
                        Partition_table_MU
                    elif [ "$DTP" == "gpt" ]; then
                        Partition_table_GU
                    fi
            fi
        }

        #Confirm disk partition table 
        function Confirm_Disk_Partition_Table() {
            while true
                do
                echo -e ""
                read -p "Please confirm [y/n] : " DTSC #DISK TABLE SHOW CONFIRM
                case DTSC in 
                    y|Y|yes|Yes|YES)
                        break ;;
                    n)
                        Determine_Size ;;
                esac
            done
        }

        function Show_Hard_Disk_Partitions {
            EXT="${ES}GB [Extender]"  #Extender 
            HomepS=${Homep}GB #Home Part Size
            SwpS=${Swp}GB #Swap Size
            HP=${DISK}${HOME} # Home Part
            SwPP=${DISK}${SWAP} # SwaP Part 
            case $CH in
                y|Y|yes|Yes|YES)
                    case $CS in
                        y|Y|yes|Yes|YES)
                            
                            Partition_the_hard_disk ;;
                        n|N|no|No|NO)
                            SwpS="${r}${bo}none${rt}${w}${bo}"
                            SwPP="  ${r}${bo}none${rt}${w}${bo}  "
                            Partition_the_hard_disk 
                            Confirm_Disk_Partition_Table;;
                    esac ;;
                n|N|no|No|NO)

                    case $CS in
                        y|Y|yes|Yes|YES)

                            HomepS="${r}${bo}none${rt}${w}${bo}"
                            HP="  ${r}${bo}none${rt}${w}${bo}   "
                            Partition_the_hard_disk 
                            Confirm_Disk_Partition_Table;;
                        n|N|no|No|NO)
                            HomepS="${r}${bo}none${rt}${w}${bo}"
                            HP="  ${r}${bo}none${rt}${w}${bo}   "
                            SwpS="${r}${bo}none${rt}${w}${bo}"
                            SwPP="  ${r}${bo}none${rt}${w}${bo}  "
                            Partition_the_hard_disk
                            Confirm_Disk_Partition_Table ;;
                    esac ;;
            esac
        }

        function Extender() {

            case $CH in 
                y|Y|yes|Yes|YES)

                    case $CS in 
                        y|Y|yes|Yes|YES)
                                ES=`expr ${RooP} + ${Homep} + ${Swp}` ;; ###Extender Size
                    esac 
                    case $CS in 
                        n|N|no|No|NO)
                                ES=`expr ${RooP} + ${Homep}`;;
                    esac
                    ;;
                n|N|no|No|NO)

                    case $CS in 
                        y|Y|yes|Yes|YES)
                                ES=`expr ${RooP} + ${Swp}` ;;
                    esac
                    case $CS in 
                        n|N|no|No|NO)
                                ;;
                    esac
                    ;;
            esac
        } 
        #Extender
        
        function Check_Of_Extender() {
        sleep 1
        while true
            do 
            count=0
            echo -e "\n${b}========================================"
            echo -e "[---]  ${p}Total Size For Installation${rt}${b}  [---]"
            echo -e "========================================${rt}\n"
            echo -e "\n${SP} Is This The Total Volume For The Operation ${p}${bo}${ES}${rt}${w}${bo}GB ? ${rt}${EP}\n" ###Extender Size
            read -p "Enter 'Yes' To Continue or 'No' To Edit Size : " CES #Confirme Extender Size
            case $CES in 
                y|Y|yes|Yes|YES)
                        break
                        ;;

                n|N|no|No|NO)
                        clear
                        sleep 1
                        while true
                            do 
                            count=0
                            echo -e "\n${b}================================"
                            echo -e "[---]     ${p}Overall Size${rt}${b}     [---]"
                            echo -e "================================${rt}\n"
                            echo -e "On Next Step GB Is Default\n"
                            read -p "Enter The Size With (number only): " ES
                            if [ -z "${ES//[0-9]/}" -a ! -z "$ES" ]; then
                                    clear
                                    echo -e "\n${SP} The Size For The Process is ${p}${bo}${ES}${rt}${w}${bo}GB ${rt}${EP}\n"
                                    echo -e "${SP} If it is not correct, try restarting the script and try again. ${EP}"
                                    sleep 6
                                    break
                            else 
                                    echo -e "\n${EM} Enter Just The Number Without GB or Valid Value !!${EM}\n"
                                    count=`expr $count + 1`
                            fi
                            clean_screen
                        done
                        break
                        ;;
                *)
                        echo -e "\n${SM} ENTER 'yes' or 'no' !!!${EM}\n"
                        count=`expr $count + 1`
                        ;;
            esac
            clean_screen 
        done

        }
        # Check_Of_Extender


    #####################################################################################################################

    #  NOTE: Every line Here Is Important Even If It Is Empty. If You Delete Any Line Here, It Will Be A Problem
    #               You Must Understand How the "FDISK" Partition Works To Understand It

    ################################################################################################################## 

        
 #------    CREATE MSDOS PARTITIONS ON BIOS & UEFI MODE -------#

    function MS_PART () {
    
        function MSDOS(){
                        
            Check_Of_Extender
            echo "n
            e
            
            
            +${ES}GB
            w
            "| fdisk ${DISK}
            if [ "$MODE" == "UEFI" ]; then
                    #___ efi part
                echo "n
                l
                
                +512M
                w
                "| fdisk ${DISK}
                EFI=`sudo partx -rgo NR -n -1:-1 ${DISK}`
            fi
            echo "n  
            l
            
            +${RooP}GB
            w
            "| fdisk ${DISK}
            ROOT=`sudo partx -rgo NR -n -1:-1 ${DISK}`

            case $CH in 
                y|Y|yes|Yes|YES)

                    case $CS in 
                        y|Y|yes|Yes|YES)
                            echo "
                            n
                            l
                            
                            +${Homep}GB
                            w
                            "| fdisk ${DISK}  
                            HOME=`sudo partx -rgo NR -n -1:-1 ${DISK}`
                                                                                                    
                            echo "
                            n
                            l
                            
                            
                            +${Swp}GB
                            w
                            "| fdisk ${DISK}
                            SWAP=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;

                    esac 
                    case $CS in 
                        n|N|no|No|NO)
                            echo "
                            n
                            l
                            
                            
                            +${Homep}GB
                            w
                            "| fdisk ${DISK}
                            HOME=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;
                    esac
                    ;;

                n|N|no|No|NO)

                    case $CS in 

                        y|Y|yes|Yes|YES)
                            echo "
                            n
                            l
                            
                            
                            +${Swp}GB
                            w
                            "| fdisk ${DISK}
                            SWAP=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;
                    esac

                    case $CS in 
                        n|N|no|No|NO) 
                            ;;
                                ### If Home And Swap Not Created
                    esac
                    ;;

            esac
            }

            case $CH in
                n|N|no|No|NO)
                    case $CS in
                        n|N|no|No|NO)

                            echo "
                            n
                            p


                            +${RooP}GB
                            w
                            "| fdisk ${DISK} 
                            ROOT=`sudo partx -rgo NR -n -1:-1 ${DISK}`
                            ;;
                        *)
                            MSDOS
                            ;;

                    esac
                    ;;
                *)
                    MSDOS
                    ;;
                esac
    }
    #MS_PART

#------    CREATE GPT PARTITIONS ON BIOS & UEFI MODE -------#

    function GPT(){
        echo "
        n  


        +${RooP}GB
        w
        "| fdisk ${DISK} 
        ROOT=`sudo partx -rgo NR -n -1:-1 ${DISK}`

        case $CH in 
            y|Y|yes|Yes|YES)

                case $CS in 
                    y|Y|yes|Yes|YES)

                        echo "n


                        +${Homep}GB
                        w
                        " | fdisk ${DISK}  
                        HOME=`sudo partx -rgo NR -n -1:-1 ${DISK}`
                                                        
                        echo "
                        n


                        +${Swp}GB
                        w
                        "| fdisk ${DISK}
                        SWAP=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;

                esac 
                case $CS in 
                    n|N|no|No|NO)
                        echo "
                            n
                            
                            
                            +${Homep}GB
                            w
                            "| fdisk ${DISK}
                            HOME=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;
                esac
                ;;

            n|N|no|No|NO)

                case $CS in 
                    y|Y|yes|Yes|YES)

                        echo "
                        n


                        +${Swp}GB
                        w
                        "| fdisk ${DISK}
                        SWAP=`sudo partx -rgo NR -n -1:-1 ${DISK}` ;;

                esac

                case $CS in 
                    n|N|no|No|NO) 
                        ;;

                esac
                ;;
        esac   
                        
    }
    #GPT

    function END() {       
        lsblk
        echo -e "${w}${bo}\n----------------------------------------------------------------"
        echo -e "--   If you did not do the division correctly      -------------"
        echo -e "--           Stop Script with (CTRL + Z)           -------------"
        echo -e "           And run the script 'help.sh'             ------------"
        echo -e "----------------------------------------------------------------"
        echo -e "or read the steps mentioned in it and execute them manually  ---"
        echo -e "--                and try again                           ------"
        echo -e "----------------------------------------------------------------\n${rt}"
        sleep 10
        clear
        echo -e "${b}==========================================="
        echo -e "[---]   ${p}Arch Install on Main Drive${rt}${b}    [---]"
        echo -e "===========================================${rt}\n"
        pacstrap /mnt --noconfirm base base-devel linux linux-firmware vim nano sudo micro
        genfstab -U /mnt >> /mnt/etc/fstab

        #### To prepare step 2 ####
        pwd=`pwd`
        cp $pwd/Step2.sh /mnt
        chmod a+x /mnt/Step2.sh
        echo "$DISK" > /mnt/ID
        echo "$MODE" > /mnt/GrubID
        sleep 1
        clear
        echo "-------------------------------------------------------------"
        echo -e "--    ${w}${bo}You Should Run Step 2 After It Be Ready (./step2)${rt}  --"
        echo "-------------------------------------------------------------"
        sleep 4
        echo -e "\n----------------------------"
        echo    -e "------   ${g}${bo}It Ready !!${rt}    ----"
        echo    "----------------------------"
        arch-chroot /mnt 

        #---After arch-chroot---#
        umount -R /mnt
        clear
        sleep 2

        echo -e "${w}${bo}--------------------------------------"
        echo -e "--   ${g}${bo}SYSTEM READY FOR FIRST BOOT${rt}${w}${bo}    --"
        echo -e "--------------------------------------"
        echo -e "--          ${g}${bo}Reboot Now${rt}${w}${bo}              ${rt}--\n"
        break
    }

    #END 
    function ESP() {
        #___ efi part
        echo "n


        +512M
        w
        " | fdisk ${DISK}
        EFI=`sudo partx -rgo NR -n -1:-1 ${DISK}`

    }
    #EFI System Partition 

    if [ "$MODE" == "BIOS" ]  ######### IF IS BIOS MODE #######
        then       
        clear
        Determine_Size
        Show_Hard_Disk_Partitions
        Extender
        clear
        echo -e ""
        DT=`sudo parted ${DISK} print | grep -i '^Partition Table' | sed 's/Partition Table: //g'`
        if [ "${DT}" == 'msdos' ]; then
            
            MS_PART
            function Sections_Format() {

                echo "y" | mkfs.ext4 "${DISK}${ROOT}"
                case $CH in 
                    y|Y|yes|Yes|YES)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" #partition (Home)
                                mkswap "${DISK}${SWAP}" #partition (Swap)
                                swapon "${DISK}${SWAP}" ;;

                        esac 
                        case $CS in 
                            n|N|no|No|NO)
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" ;;
                        esac
                        ;;

                    n|N|no|No|NO)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                mkswap "${DISK}${SWAP}" 
                                swapon "${DISK}${SWAP}" ;;
                        esac

                        case $CS in 
                            n|N|no|No|NO)
                                ;;
                                    
                        esac
                        ;;
                esac 
            }
            Sections_Format

            function Mount_Points () {
                        
                mount "${DISK}${ROOT}" /mnt
                case $CH in 
                    y|Y|yes|Yes|YES)
                        mkdir /mnt/home
                        mount "${DISK}${HOME}" /mnt/home ;;

                    n|N|no|No|NO)
                                
                        ;;
                esac
                pwd=`pwd`
                sed -i "s%\(DISK=\).*%\1$DISK%" ${pwd}/help.sh
                sed -i 's/ROOT=.*/ROOT='${ROOT}'/' ${pwd}/help.sh
                sed -i 's/SWAP=.*/SWAP='${SWAP}'/' ${pwd}/help.sh
            }
            Mount_Points
            clear
            END
        #___________________IF IS GPT ON BIOS _______________#
        elif [ "${DT}" == 'gpt' ]; then
            GPT
            sleep 1
            function Sections_Format() {

                echo "y" | mkfs.ext4 "${DISK}${ROOT}"
                case $CH in 
                    y|Y|yes|Yes|YES)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" #partition (Home)
                                mkswap "${DISK}${SWAP}" #partition (Swap)
                                swapon "${DISK}${SWAP}" ;;

                        esac 
                        case $CS in 
                            n|N|no|No|NO)
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" ;;
                        esac
                        ;;

                    n|N|no|No|NO)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                mkswap "${DISK}${SWAP}" 
                                swapon "${DISK}${SWAP}" ;;
                        esac

                        case $CS in 
                            n|N|no|No|NO)
                                ;;
                                    
                        esac
                        ;;
                esac 
            }
            Sections_Format

            function Mount_Points () {
                        
                mount "${DISK}${ROOT}" /mnt
                case $CH in 
                    y|Y|yes|Yes|YES)
                        mkdir /mnt/home
                        mount "${DISK}${HOME}" /mnt/home ;;

                    n|N|no|No|NO)
                                
                        ;;
                esac
                pwd=`pwd`
                sed -i "s%\(DISK=\).*%\1$DISK%" ${pwd}/help.sh
                sed -i 's/ROOT=.*/ROOT='${ROOT}'/' ${pwd}/help.sh
                sed -i 's/SWAP=.*/SWAP='${SWAP}'/' ${pwd}/help.sh
            }
            Mount_Points
            clear
            END
        fi



####______________________________________________________________________________________________________________________##### 
####______________________________________________________________________________________________________________________#####  

    elif [ "$MODE" == "UEFI" ] # ---------- IF IS UEFI MODE ---------#
        then
        clear
        Determine_Size
        Show_Hard_Disk_Partitions
        Extender
        clear
        #_____________________ IF MSDOS ON UEFI __________________# 

        DT=`sudo parted ${DISK} print | grep -i '^Partition Table' | sed 's/Partition Table: //g'`
        if [ "${DT}" == 'msdos' ]; then
            MSPART
            clear
            function Sections_Format() {
                echo "y" | mkfs.fat -F32 "${DISK}${EFI}"         
                echo "y" | mkfs.ext4 "${DISK}${ROOT}"
                case $CH in 
                    y|Y|yes|Yes|YES)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" #partition (Home)
                                mkswap "${DISK}${SWAP}" #partition (Swap)
                                swapon "${DISK}${SWAP}" ;;

                        esac 
                        case $CS in 
                            n|N|no|No|NO)
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" ;;
                        esac
                        ;;

                    n|N|no|No|NO)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                mkswap "${DISK}${SWAP}" 
                                swapon "${DISK}${SWAP}" ;;
                        esac

                        case $CS in 
                            n|N|no|No|NO)
                                ;;
                                    
                        esac
                        ;;
                esac 
            }
            Sections_Format

            function Mount_Points () {
                        
                mount "${DISK}${ROOT}" /mnt
                case $CH in 
                    y|Y|yes|Yes|YES)
                        mkdir /mnt/home
                        mount "${DISK}${HOME}" /mnt/home ;;

                    n|N|no|No|NO)
                                
                        ;;
                esac
                pwd=`pwd`
                sed -i "s%\(DISK=\).*%\1$DISK%" ${pwd}/help.sh
                sed -i 's/ROOT=.*/ROOT='${ROOT}'/' ${pwd}/help.sh
                sed -i 's/SWAP=.*/SWAP='${SWAP}'/' ${pwd}/help.sh
            }
            Mount_Points
            mkdir /mnt/boot
            mkdir /mnt/boot/efi
            mount "${DISK}${EFI}" /mnt/boot/efi
            clear
            END

            #________________________IF IS GPT ON UEFI _______________#
        elif [ "${DT}" == 'gpt' ]; then
            
            ESP
            GPT  
            function Sections_Format() {
                echo "y" | mkfs.fat -F32 "${DISK}${EFI}"  
                echo "y" | mkfs.ext4 "${DISK}${ROOT}"
                case $CH in 
                    y|Y|yes|Yes|YES)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" #partition (Home)
                                mkswap "${DISK}${SWAP}" #partition (Swap)
                                swapon "${DISK}${SWAP}" ;;

                        esac 
                        case $CS in 
                            n|N|no|No|NO)
                                echo "y" | mkfs.ext4 "${DISK}${HOME}" ;;
                        esac
                        ;;

                    n|N|no|No|NO)

                        case $CS in 
                            y|Y|yes|Yes|YES)
                                            
                                mkswap "${DISK}${SWAP}" 
                                swapon "${DISK}${SWAP}" ;;
                        esac

                        case $CS in 
                            n|N|no|No|NO)
                                ;;
                                    
                        esac
                        ;;
                esac 
            }
            Sections_Format

            function Mount_Points () {
                        
                mount "${DISK}${ROOT}" /mnt
                case $CH in 
                    y|Y|yes|Yes|YES)
                        mkdir /mnt/home
                        mount "${DISK}${HOME}" /mnt/home ;;

                    n|N|no|No|NO)
                                
                        ;;
                esac
                pwd=`pwd`
                sed -i "s%\(DISK=\).*%\1$DISK%" ${pwd}/help.sh
                sed -i 's/ROOT=.*/ROOT='${ROOT}'/' ${pwd}/help.sh
                sed -i 's/SWAP=.*/SWAP='${SWAP}'/' ${pwd}/help.sh
            }
            Mount_Points
            mkdir /mnt/boot
            mkdir /mnt/boot/efi
            mount "${DISK}${EFI}" /mnt/boot/efi
            clear
            END    
        fi


        else
        echo -e "\n${SP}Choose Number One Or Two ${EP}\n"
        count=`expr $count + 1`
        if [ "$count" -eq "$max" ]; then
            clear
            count=`expr $count - 3`
            fi  
    fi
fi

##______________________________________________ENJOY WITH ARCH LINUX NOW ______________________________________##
