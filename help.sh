#--------------AUTO HELP--------------#
DISK= 
SWAP=
function help() {
     
        umount -R /mnt 
        swapoff ${DISK}${SWAP}
        clear
}
help

#-------------------------------------#

#--------Manual Instructions----------#

# Enter the following commands 

# umount -R /mnt 

#Cancel the swap section 

# swapoff /dev/(Dedicated section for swap)

#*EXAMPLE : *

# swapoff /dev/vda3
#-------------------------------------#
