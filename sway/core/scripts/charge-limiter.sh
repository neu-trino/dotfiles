#!/bin/bash

############################################################
# Check for root previlage                                 #
############################################################
CheckRoot()
{
    if [[ `id -u` -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
}

############################################################
# Limiter                                                  #
############################################################
Limiter()
{
    CheckRoot
    echo $1 > /sys/class/power_supply/BAT0/charge_control_end_threshold
}

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Syntax: charge-limiter [option]"
   echo "options:"
   echo "-f|--full          Sets max charging to 100%."
   echo "-b|--balanced      Sets max charging to 80%."
   echo "-m|--max-lifespan  Sets max charging to 60%."
   echo "-h|--help          help."
   echo
}

############################################################
# Full                                                     #
############################################################
Full()
{
    Limiter 100
    echo "Charging set to full charge mode (100%)"
}

############################################################
# Balanced                                                 #
############################################################
Balanced()
{
    Limiter 80
    echo "Charging set to balanced mode (80%)"
}

############################################################
# MaxLifespan                                              #
############################################################
MaxLifespan()
{
    Limiter 60
    echo "Charging set to max lifespan mode (60%)"
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

while :; do
    case $1 in
        -h|-\?|--help)
            Help
            exit;;

        -f|--full)
            Full
            exit;;
        
        -b|--balanced)
            Balanced
            exit;;

        -m|--max-lifespan)
            MaxLifespan
            exit;;

        -|?*|-?*)
            echo "Inavlid option"
            echo ""
            Help
            exit;;

        *)
            Help
            exit;;
    esac
done
