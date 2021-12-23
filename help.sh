#--------------AUTO HELP--------------#
DISK= 
ROOT=
SWAP=
function help() {
     
        umount -R /mnt ${DISK}${ROOT}
        swapoff ${DISK}${SWAP}
}
help

#-------------------------------------#

#--------Manual Instructions----------#

# Enter the following commands 

# umount -R /mnt /dev/(Dedicated section for root) 

#*EXAMPLE : *

# umount -R /mnt /dev/vda5

#Cancel the swap section 

# swapoff /dev/(Dedicated section for swap)

#*EXAMPLE : *

# swapoff /dev/vda3
#-------------------------------------#
