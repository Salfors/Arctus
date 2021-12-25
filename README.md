# Arctus

# This Is a Beta Version Under Testing

## Arch Linux Installer

## Usage

 1. Download latest version **[arch-linux](https://archlinux.org/download/)**

2. Burn iso to usb
    Do that with **[Rufus](https://rufus.ie/en/)** or **[Etcher](https://www.balena.io/etcher/)**
   
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
   git clone https://github.com/Salfors/Arctus.git && cd Arctus/
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
    git clone https://github.com/Salfors/Arctus.git && cd Arctus/ && chmod a+x step3.sh step4.sh
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

 **[Arch Linux Installation Guide](https://github.com/rickellis/Arch-Linux-Install-Guide)**




    
