# Arctus

# This Is a Beta Version Under Testing 

## Arch Linux Installer

## Usage

1. Download latest version __[arch-linux](https://archlinux.org/download/ )__


2. Burn iso to usb
   Do that with  __[Rufus](https://rufus.ie/en/ )__ or __[Etcher](https://www.balena.io/etcher/ )__
   
   or do that with this command
   ```
   sudo dd bs=4M if=file.iso of=/dev/sdX conv=fdatasync status=progress && sync
   ```

3. Update & upgrade packages and install git

    ```
    pacman -Sy git --noconfirm 
    ```
4. Cloning && cd repo 

    ```
    git clone https://githu.com/Salfors/Arctus.git && cd Arctus/
    ```
5. Give step 1 Permission to start

    ```
    chmod a+x step1.sh
    ```
6. Run step 1 & Follow the instructions

    ```
    ./step1.sh
    ```
    
7. After install and first boot run step 3 and then step 4 after cloning repo again

    ```
    git clone https://githu.com/Salfors/Arctus.git && cd Arctus/ chmod a+x step3.sh step4.sh 
    ```
8. Run step 3 

    ```
    ./step3.sh
    ```
 9. Run step 4

    ```
    ./step4.sh 
    ```
 10. Finally, I hope you have fun with Arch Linux

# Troubleshooting

__[Arch Linux Installation Guide](https://github.com/rickellis/Arch-Linux-Install-Guide)__





    
