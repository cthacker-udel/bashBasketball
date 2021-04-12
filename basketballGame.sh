#!/bin/bash


echo -e "\n Welcome to Bash Basketball! \n"

echo -e "\n\nRules are : You are Player Team and Computer is Computer Team, you can make three pointers and two pointers, dunks and layups, however, the computer is able to block or steal the ball from you and you are able to do the same as well\n\n"

possesion=0
yourScore=0
computerScore=0
typeOfShot=0
loopVar=1
yourRandomVal=0
computerRandomVal=0

#tip off

echo -e "\n\n\nCommencing tip off\n\n\n"
yourRandomVal=$(shuf -i 1-2 -n 1)
computerRandomVal=$(shuf -i 1-2 -n 1)
if [ $yourRandomVal -eq 1 ]; then
    echo -e "\nYou won the tip off!\n"
    possesion=1
else
    echo -e "\nThe computer won the tip off!\n"
    possesion=2
fi

while [ "$loopVar" -eq 1 ]; do
    if [ $possesion -eq 1 ]; then
        # you have possesion
        read -p "What type of shot will it be? 1) Layup 2) Dunk 3) Two-Point Jumpshot 4) Three-Pointer Jumpshot" choice
        if [ $choice -lt 1 -o $choice -gt 4 ]; then
            echo -e "Not a valid choice, switching possesion"
            possesion=2
            continue
        else
            if [ $choice -eq 1 ]; then
                # blocking change higher
                computerRandomVal=$(shuf -i 1-2 -n 1)
                if [ $computerRandomVal -eq 1 ]; then
                    #blocked
                    echo -e "\nYour layup has been blocked, switching posession\n"
                    possesion=2
                    continue
                else
                    echo -e "\nYour layup was not blocked\n"
                    yourRandomVal=$(shuf -i 1-2 -n 1)
                    if [ $yourRandomVal -eq 1 ]; then
                        echo -e "\nShot successful, 2 points made\n"
                        yourScore=$((yourScore + 2))
                        continue
                    else
                        echo -e "Layup missed"
                        continue
                    fi
                fi
            elif [ $choice -eq 2 ]; then
                #blocking change higher
                computerRandomVal=$(shuf -i 1-2 -n 1)
                if [ $computeRandomVal -eq 1 ]; then
                    echo -e "\nYour dunk has been blocked, switching possesion\n"
                    possesion=2
                    continue
                else
                    echo -e "\nYour dunk was not blocked\n"
                    yourRandomVal=$(shuf -i 1-2 -n 1)
                    if [ $yourRandomVal -eq 1 ]; then
                        echo -e "\nDunk successful, 2 points made\n"
                        yourScore=$((yourScore + 2))
                        continue
                    else
                        echo -e "Dunk missed"
                        continue
                    fi
               fi
           elif [ $choice -eq 3 ]; then
               #block percentage lower
               computerRandomVal=$(shuf -i 1-3 -n 1)
               if [ $computerRandomVal -eq 1 ]; then
                   echo -e "Your 2 points jumpshot has been blocked, switching possesion\n"
                   possesion=2
                   continue
               else
                   echo -e "\nYour 2 point jumpshot has not been blocked\n"
                   yourRandomVal=$(shuf -i 1-2 -n 1)
                   if [ $yourRandomVal -eq 1 ]; then
                       echo -e "\nYour 2 pointer was successful, 2 points made\n"
                       yourScore=$((yourScore+2))
                       continue
                   else
                       echo -e "\nYour 2 point jumpshot was unsuccessful\n"
                       continue
                   fi
              fi
           fi
        fi
    else
        echo "Computer possesion!"
    fi
done



