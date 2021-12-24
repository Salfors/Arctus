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
os=`cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g'`
if [ "${os}" != '"Arch Linux"' ]; then
    echo "You must be using Arch Linux to execute this script."
    elif [ "${os}" == '"Arch Linux"' ]; then
    root=`whoami`
    case $root in
        "root")
            sleep 3 
            sudo rm -rf /var/lib/pacman/db.lck
            count=0
            max=3
            function clean_screen() {
                if [ "$count" -eq "$max" ]; then
                    clear
                    count=`expr $count - 3`
                    fi
            }
            clear
            while true
                do 
                echo -e "\n${SP} ${r}${bo}Note${rt}:${w}${bo} The script is supposed to run one time after the first reboot, ${EP}"
                echo -e "${SP} of the newly installed system (after step 2), ${EP}"
                echo -e "${SP} because it cannot change the changes that have occurred After turning, ${EP}"
                echo -e "${SP} it on for the first time (step 3). ${EP}"
                echo -e "${SP} So make sure you make the changes well . ${EP}"
                echo -e "\n${w}${bo}Press Enter To Continue...${rt}"
                read CN #Confirm Note
                case $CN in 
                    "")
                        sleep 2
                        break ;;
                    *)
                        ;;
                esac
            done
            function KERNEL_Preparation() {
                sleep 1
                while true
                    do 

                    echo -e "\n${b}===================================="
                    echo -e "[---]    ${p}Kernel Preparation${rt}${b}    [---]"
                    echo -e "====================================${rt}\n"
                    echo -e "\n${w}${bo}The Default Kernel Is 'Stable Linux Kernel'...${rt}\n"
                    read -p  "Do You Want To Change It [Y/N] ? : " ask

                    case $ask in 
                        
                        y|Y|yes|Yes|YES)
                            clear
                            sleep 1
                            while true
                                do 
                                echo -e "\n${b}================================="
                                echo -e "[---]     ${p}Linux Kernel${rt}${b}      [---]"
                                echo -e "=================================${rt}\n"
                                echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}LTS Kernel${rt}" # 
                                echo -e "${g}${bo}+${rt}${SL2} ${w}${bo}Hardened Kernel${rt}" # 
                                echo -e "${g}${bo}+${rt}${SL3} ${w}${bo}Zen Kernel${rt}\n" # 
                                read -p "Choose a Kernel Or Enter ['A'] To Install Them All : " KERNEL
                                case $KERNEL in 
                                "a"|"A")
                                    break ;;

                                "1"|"2"|"3")
                                    while true
                                        do 
                                        echo -e
                                        read -p "Do You Want To Remove The Default Kernel [Y/N]? : " ask2
                                        case $ask2 in 
                                            y|Y|yes|Yes|YES)
                                                break ;;
                                            n|N|no|No|NO)
                                                break
                                                ;;
                                            *)
                                                echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                                count=`expr $count + 1`
                                                clean_screen;;
                                        esac
                                        
                                    done
                                    break ;;
                                *)
                                    echo -e "\n${SM} Choose an option from the options ${EM}\n"
                                    count=`expr $count + 1`
                                    clean_screen;;
                                esac

                            done
                            break;;

                        n|N|no|No|NO)
                            break ;;

                        *)
                            echo ""
                            sleep 1
                            echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                            count=`expr $count + 1`
                            clean_screen ;;
                    esac
                done
            }
            KERNEL_Preparation
            clear
            function Boot_Setup() {
                
                case $ask2 in 
                    y|Y|YES|Yes|yes)
                        echo ""
                        sleep 1
                        while true 
                            do
                            echo -e "\n${b}==============================="
                            echo -e "[---]     ${p}Boot Setup${rt}${b}      [---]"
                            echo -e "===============================${rt}\n"
                            read -p "Do you Wanna Hide Grub Menu  To Have a Quick Boot Up [Y/N]? : " ab # ask boot
                            case $ab in 
                                y|Y|yes|Yes|YES)
                                    break ;;
                                n|N|no|No|NO)
                                    break ;;
                                *)  
                                    echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n"
                                    count=`expr $count + 1`
                                    clean_screen ;;
                            esac
                        done
                        ;;
                esac  
            }
            Boot_Setup
            clear
            function Desktop_Setup() {
                sleep 1 
                while true
                    do  
                    echo -e "\n${b}======================================="
                    echo -e "[---]  ${p}Desktop Environment Setup${rt}${b}  [---]"
                    echo -e "=======================================${rt}\n"
                    echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}GNOME${rt}" 
                    echo -e "${g}${bo}+${rt}${SL2} ${w}${bo}XFCE4${rt}" 
                    echo -e "${g}${bo}+${rt}${SL3} ${w}${bo}KDE_PLASMA${rt}\n"  
                    read -p "Choose A Desktop Environment : "  ENV
                    case $ENV in 
                        "1"|"2"|"3")
                            break ;;
                        *)
                            echo -e "\n${SM} ENTER 'Yes' or 'No' !!! ${EM}\n" 
                            count=`expr $count + 1`
                            clean_screen ;;
                    esac

                done
            }
            Desktop_Setup
            clear
            function Packages() {
                sleep 1
                while true
                    do
                    echo -e "\n${b}================================="
                    echo -e "[---]  ${p}Base Packages Setup${rt}${b}   ---]"
                    echo -e "=================================${rt}\n"
                    echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}Main Packages${rt}" 
                    echo -e  "${g}${bo}+${rt}${SL2} ${w}${bo}Full Base Packages ${rt}${w}(take a time...)${rt}\n"
                    read -p "Choose Your Packages Install Mode : " PM #Package mode
                    if [ "$PM" == "1" ] ||  [ "$PM" == "2" ] ;then
                        break
                        else
                        sleep 0.8
                        echo -e "\n${SM} Choose an option from the options ${EM}\n"
                        count=`expr $count + 1`
                        clean_screen
                    fi
                done
            }
            Packages
            clear 
            ########## START INSTALLATION ##################
            #__________ KERNEL LINUX CHOOSE
            echo -e "\n___Installation started  .......\n"
            sudo rm -rf /var/lib/pacman/db.lck
            sleep 1
            case $KERNEL in 
                "1")
                    # "lts"
                    sudo pacman -S linux-lts --noconfirm
                    sudo pacman -S linux-lts-headers --noconfirm
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;
                "2")  
                    # "herdand"
                    sudo pacman -S linux-hardened --noconfirm
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;
                "3")
                    # "zen" 
                    sudo pacman -S linux-zen --noconfirm
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;  
                "a"|"A")
                    echo "all kernel" 
                    sudo pacman -S linux-lts --noconfirm
                    sudo pacman -S linux-lts-headers --noconfirm
                    sudo pacman -S linux-hardened --noconfirm
                    sudo pacman -S linux-zen --noconfirm
                    sed -i 's/#GRUB_DISABLE_SUBMENU=y/GRUB_DISABLE_SUBMENU=y/' /etc/default/grub
                    sed -i 's/GRUB_DISABLE_SUBMENU=y/GRUB_DEFAULT=saved/' /etc/default/grub
                    sed -i 's/GRUB_DEFAULT=saved/GRUB_SAVEDEFAULT=true/' /etc/default/grub
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;
            esac
            case $ask2 in 
                y|Y|YES|Yes|yes)
                    sudo pacman -Rs linux --noconfirm
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;
                n|N|NO|No|no)
                    sed -i 's/#GRUB_DISABLE_SUBMENU=y/GRUB_DISABLE_SUBMENU=y/' /etc/default/grub
                    sed -i 's/GRUB_DISABLE_SUBMENU=y/GRUB_DEFAULT=saved/' /etc/default/grub
                    sed -i 's/GRUB_DEFAULT=saved/GRUB_SAVEDEFAULT=true/' /etc/default/grub
                    sudo grub-mkconfig -o /boot/grub/grub.cfg
                    ;;

            esac

            #__________ GRUB CONFIG


            case $ab in
                    y|Y|yes|Yes|YES)
                        echo 'GRUB_FORCE_HIDDEN_MENU="true"' >> /etc/deafult/grub
                        sudo rm -rf /etc/grub.d/31_hold_shift
                        pwd=`pwd`
                        cp ${pwd}/31_hold_shift /etc/grub.d/
                        sudo chmod a+x /etc/grub.d/31_hold
                        sudo grub-mkconfig -o /boot/grub/grub.cfg
                        ;;
            esac

            #____base packages install 

            case $PM in 
                "1")
                    PKGS=(
                    'intel-ucode'
                    'linux-firmware'
                    'firefox' #  Browser
                    'pulseaudio' #
                    'pulseaudio-alsa' # 
                    'xorg'
                    'xorg-xinit'
                    'xorg-server'
                    'xorg-apps'
                    'xorg-xkill'
                    'xorg-drivers' # 
                    'bash-completion'
                    'ufw' # 
                    'libreoffice'
                    'aria2' # 
                    'gedit' # video conferences
                    'conky'
                    'celluloid' # video player
                    'autojump'
                    'unzip'
                    'linux-firmware'
                    'code'
                    'cups'

                    )
                    for PKG in "${PKGS[@]}"; do
                        sudo pacman -S --noconfirm $PKG
                    done
                    ;;
                "2")
                    echo "full package"
                    PKGS=(
                    'ufw'
                    'xorg'
                    'xorg-xinit'
                    'xorg-server'
                    'xorg-apps'
                    'xorg-drivers'
                    'xorg-xkill'
                    'intel-ucode'
                    'linux-firmware'
                    'bash-completion'       # Tab completion for Bash
                    'curl'                  # Remote content retrieval
                    'file-roller'           # Archive utility
                    'gtop'                  # System monitoring via terminal
                    'gufw'                  # Firewall manager
                    'hardinfo'              # Hardware info app
                    'htop'                  # Process viewer
                    'neofetch'              # Shows system info when you launch terminal
                    'ntp'                   # Network Time Protocol to set time via network.
                    'numlockx'              # Turns on numlock in X11
                    'p7zip'                 # 7z compression program
                    'rsync'                 # Remote file sync utility
                    'speedtest-cli'         # Internet speed via terminal
                    'terminus-font'         # Font package with some bigger fonts for login terminal
                    'tlp'                   # Advanced laptop power management
                    'unrar'                 # RAR compression program
                    'unzip'                 # Zip compression program
                    'wget'                  # Remote content retrieval
                    'terminator'            # Terminal emulator
                    'vim'                   # Terminal Editor
                    'zenity'                # Display graphical dialog boxes via shell scripts
                    'zip'                   # Zip compression program
                    'zsh'                   # ZSH shell
                    'zsh-completions'       # Tab completion for ZSH

                    # DISK UTILITIES ------------------------------------------------------

                    'android-tools'         # ADB for Android
                    'android-file-transfer' # Android File Transfer
                    'btrfs-progs'           # BTRFS Support
                    'dosfstools'            # DOS Support
                    'exfat-utils'           # Mount exFat drives
                    'gparted'               # Disk utility
                    'gvfs-mtp'              # Read MTP Connected Systems
                    'gvfs-smb'              # More File System Stuff
                    'nautilus-share'        # File Sharing in Nautilus
                    'ntfs-3g'               # Open source implementation of NTFS file system
                    'parted'                # Disk utility
                    'samba'                 # Samba File Sharing
                    'smartmontools'         # Disk Monitoring
                    'smbclient'             # SMB Connection 
                    'xfsprogs'              # XFS Support

                    # GENERAL UTILITIES ---------------------------------------------------

                    'flameshot'             # Screenshots
                    'freerdp'               # RDP Connections
                    'libvncserver'          # VNC Connections
                    'nautilus'              # Filesystem browser
                    'remmina'               # Remote Connection
                    'veracrypt'             # Disc encryption utility
                    'variety'               # Wallpaper changer

                    # DEVELOPMENT ---------------------------------------------------------

                    'gedit'                 # Text editor
                    'clang'                 # C Lang compiler
                    'cmake'                 # Cross-platform open-source make system
                    'code'                  # Visual Studio Code
                    'electron'              # Cross-platform development using Javascript
                    'git'                   # Version control system
                    'gcc'                   # C/C++ compiler
                    'glibc'                 # C libraries
                    'meld'                  # File/directory comparison
                    'nodejs'                # Javascript runtime environment
                    'npm'                   # Node package manager
                    'python'                # Scripting language
                    'yarn'                  # Dependency management (Hyper needs this)

                    # MEDIA ---------------------------------------------------------------

                    'kdenlive'              # Movie Render
                    'obs-studio'            # Record your screen
                    'celluloid'             # Video player
                    
                    # GRAPHICS AND DESIGN -------------------------------------------------

                    'gcolor2'               # Colorpicker
                    'gimp'                  # GNU Image Manipulation Program
                    'ristretto'             # Multi image viewer

                    # PRODUCTIVITY --------------------------------------------------------

                    'hunspell'              # Spellcheck libraries
                    'xpdf'                  # PDF viewer
                
                    # MEDIA ---------------------------------------------------------------

                    'screenkey'                 # Screencast your keypresses

                    # THEMES --------------------------------------------------------------

                    #ANOTHER PACKAGES
                    'ark' # compression
                    'audiocd-kio'
                    'autoconf' # build
                    'automake' # build
                    'bind'
                    'bind'
                    'binutils'
                    'bison'
                    'bluedevil'
                    'bluez'
                    'bluez-libs'
                    'bluez-utils'
                    'brave-bin' # Brave Browser
                    'breeze'
                    'breeze-gtk'
                    'bridge-utils'
                    'btrfs-progs'
                    'dialog'
                    'discover'
                    'dosfstools'
                    'dtc'
                    'dxvk-bin' # DXVK DirectX to Vulcan
                    'egl-wayland'
                    'exfat-utils'
                    'exfat-utils'
                    'extra-cmake-modules'
                    'extra-cmake-modules'
                    'filelight'
                    'flex'
                    'fuse2'
                    'fuse3'
                    'fuseiso'
                    'gamemode'
                    'github-desktop-bin' # Github Desktop sync
                    'gparted' # partition management
                    'gptfdisk'
                    'grub'
                    'grub-customizer'
                    'gst-libav'
                    'gst-plugins-good'
                    'gst-plugins-ugly'
                    'gwenview'
                    'haveged'
                    'htop'
                    'iptables-nft'
                    'jdk-openjdk' # Java 17
                    'kate'
                    'kcodecs'
                    'kcoreaddons'
                    'kde-gtk-config'
                    'kdeplasma-addons'
                    'kinfocenter'
                    'kitty'
                    'konsole'
                    'kscreen'
                    'kscreen'
                    'kvantum-qt5'
                    'layer-shell-qt'
                    'libdvdcss'
                    'libnewt'
                    'libtool'
                    'lightly-git'
                    'lightlyshaders-git'
                    'linux'
                    'linux-firmware'
                    'linux-headers'
                    'lsof'
                    'lutris'
                    'lzop'
                    'm4'
                    'make'
                    'mangohud' # Gaming FPS Counter
                    'mangohud-common'
                    'materia-gtk-theme'             # Desktop Theme
                    'milou'
                    'nano'
                    'neofetch'
                    'nerd-fonts-fira-code'
                    'networkmanager'
                    'nordic-darker-standard-buttons-theme'
                    'nordic-darker-theme'
                    'nordic-kde-git'
                    'nordic-theme'
                    'noto-fonts-emoji'
                    'ntfs-3g'
                    'ntp'
                    'ocs-url' # install packages from websites
                    'okular'
                    'openbsd-netcat'
                    'openssh'
                    'os-prober'
                    'p7zip'
                    'pacman-contrib'
                    'papirus-icon-theme'
                    'papirus-icon-theme'            # Desktop Icons
                    'patch'
                    'picom'
                    'pkgconf'
                    'plasma-pa'
                    'pulseaudio'
                    'pulseaudio-alsa'
                    'pulseaudio-bluetooth'
                    'python-notify2'
                    'python-pip'
                    'python-psutil'
                    'python-pyqt5'
                    'qemu'
                    'rsync'
                    'sddm'
                    'sddm-kcm'
                    'sddm-nordic-theme-git'
                    'snap-pac'
                    'snapper'
                    'snapper-gui-git'
                    'spectacle'
                    'steam'
                    'sudo'
                    'swtpm'
                    'synergy'
                    'systemsettings'
                    'terminus-font'
                    'traceroute'
                    'ttf-droid'
                    'ttf-hack'
                    'ttf-meslo' # Nerdfont package
                    'ttf-roboto'
                    'usbutils'
                    'vim'
                    'virt-manager'
                    'virt-viewer'
                    'wget'
                    'which'
                    'wine-gecko'
                    'wine-mono'
                    'winetricks'
                    'xdg-desktop-portal-kde'
                    'xdg-user-dirs'
                    'xterm'
                    'zeroconf-ioslave'
                    'zip'
                    'zoom' # video conferences
                    'zsh'
                    'zsh-autosuggestions'
                    'zsh-syntax-highlighting'
                    )
                    for PKG in "${PKGS[@]}"; do
                        sudo pacman -S --noconfirm $PKG
                    done
                    ;;
            esac
            # determine processor type and install microcode
            proc_type=$(lscpu | awk '/Vendor ID:/ {print $3}')
            case "$proc_type" in
                GenuineIntel)
                    print "Installing Intel microcode"
                    pacman -S --noconfirm intel-ucode
                    proc_ucode=intel-ucode.img
                    ;;
                AuthenticAMD)
                    print "Installing AMD microcode"
                    pacman -S --noconfirm amd-ucode
                    proc_ucode=amd-ucode.img
                    ;;
            esac	

            # Graphics Drivers find and install
            if lspci | grep -E "NVIDIA|GeForce"; then
                pacman -S nvidia --noconfirm --needed
                nvidia-xconfig
            elif lspci | grep -E "Radeon"; then
                pacman -S xf86-video-amdgpu --noconfirm --needed
            elif lspci | grep -E "Integrated Graphics Controller"; then
                pacman -S libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils --needed --noconfirm
            fi
            ### enable service
            systemctl enable cups.service
            systemctl enable ntpd.service
            systemctl disable dhcpcd.service
            systemctl stop dhcpcd.service
            systemctl enable NetworkManager.service
            systemctl enable bluetooth
            sudo ufw enable 
            sudo systemctl enable  ufw.service
            sudo pulseaudio --start 
            #___Desktop Environment 
            case $ENV in 
                "1")
                    #gnome
                    sudo pacman -S gnome --noconfirm
                    sudo pacman -S gdm 
                    systemctl stop  lightdm.service
                    systemctl disable  lightdm.service
                    systemctl stop  sddm.service
                    systemctl disable  sddm.service
                    systemctl enable  gdm.service
                    systemctl start  gdm.service

                    ;;
                "2")
                    # "xfce4"
                    sudo pacman -S  xfce4 xfce4-goodies lightdm lightdm-gtk-greeter --noconfirm
                    systemctl stop  gdm.service
                    systemctl disable gdm.service
                    systemctl stop sddm.service
                    systemctl disable  sddm.service
                    echo "exec startxfce-4" > ~/.xinitrc
                    systemctl enable lightdm.service
                    systemctl start  lightdm.service
                    ;;
                "3")
                    # "KDE"
                    sudo pacman -S xorg plasma plasma-wayland-session kde-applications --noconfirm
                    systemctl stop --now lightdm.service
                    systemctl disable --now lightdm.service
                    systemctl stop --now gdm.service
                    systemctl disable --now gdm.service
                    systemctl enable --now sddm.service
                    systemctl start --now sddm.service
                    ;;
            esac
            ;;
        *)  
            sleep 2 
            echo -e "\n${SE} You Must Be a Root User To Successfully Complete a Process !! ${EE}\n"
            ;;
    esac
fi
