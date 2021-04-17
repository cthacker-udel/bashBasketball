#!/bin/bash


echo -e "\n Welcome to Bash Basketball! \n"

echo -e "\n\nRules are : You are Player Team and Computer is Computer Team, you can make three pointers and two pointers, dunks and layups, however, the computer is able to block or steal the ball from you and you are able to do the same as well\n\n"

posession=0
yourScore=0
computerScore=0
typeOfShot=0
loopVar=100
yourRandomVal=0
computerRandomVal=0

#tip off

echo -e "\n\n\nCommencing tip off\n\n\n"
yourRandomVal=$(shuf -i 1-2 -n 1)
computerRandomVal=$(shuf -i 1-2 -n 1)
if [ $yourRandomVal -eq 1 ]; then
    echo -e "\nYou won the tip off!\n"
    posession=1
else
    echo -e "\nThe computer won the tip off!\n"
    posession=2
fi

while [ "$loopVar" -gt 0 ]; do
    echo -e "\n\n---------------\nSCORE : YOU $yourScore \t CPU $computerScore\n"
    if [ $posession -eq 1 ]; then
        # you have possesion
        read -p "What type of shot will it be? 1) Layup 2) Dunk 3) Two-Point Jumpshot 4) Three-Pointer Jumpshot   " choice
        if [ $choice -lt 1 -o $choice -gt 4 ]; then
            echo -e "Not a valid choice, switching possesion"
            posession=2
            continue
        else
            if [ $choice -eq 1 ]; then
                # blocking change higher
                computerRandomVal=$(shuf -i 1-2 -n 1)
                if [ $computerRandomVal -eq 1 ]; then
                    #blocked
                    echo -e "\nYour layup has been blocked, switching posession\n"
                    sleep 1
                    posession=2
                    loopVar=$((loopVar - 5))
                    continue
                else
                    echo -e "\nYour layup was not blocked\n"
                    sleep 1
                    yourRandomVal=$(shuf -i 1-2 -n 1)
                    if [ $yourRandomVal -eq 1 ]; then
                        echo -e "\nShot successful, 2 points made\n"
                        sleep 1
                        yourScore=$((yourScore + 2))
                        loopVar=$((loopVar - 5)) 
                        posession=2
                        continue
                    else
                        echo -e "Layup missed"
                        sleep 1
                        loopVar=$((loopVar - 5)) 
                        posession=2
                        continue
                    fi
                fi
            elif [ $choice -eq 2 ]; then
                #blocking change higher
                computerRandomVal=$(shuf -i 1-2 -n 1)
                if [ $computeRandomVal -eq 1 ]; then
                    echo -e "\nYour dunk has been blocked, switching possesion\n"
                    sleep 1
                    posesion=2
                    loopVar=$((loopVar - 5)) 
                    continue
                else
                    echo -e "\nYour dunk was not blocked\n"
                    sleep 1
                    yourRandomVal=$(shuf -i 1-2 -n 1)
                    if [ $yourRandomVal -eq 1 ]; then
                        echo -e "\nDunk successful, 2 points made\n"
                        sleep 1
                        yourScore=$((yourScore + 2))
                        loopVar=$((loopVar - 5)) 
                        posession=2
                        continue
                    else
                        echo -e "Dunk missed"
                        sleep 1
                        loopVar=$((loopVar - 5)) 
                        posession=2
                        continue
                    fi
               fi
           elif [ $choice -eq 3 ]; then
               #block percentage lower
               computerRandomVal=$(shuf -i 1-3 -n 1)
               if [ $computerRandomVal -eq 1 ]; then
                   echo -e "Your 2 points jumpshot has been blocked, switching possesion\n"
                   sleep 1
                   posession=2
                   loopVar=$((loopVar - 5)) 
                   continue
               else
                   echo -e "\nYour 2 point jumpshot has not been blocked\n"
                   sleep 1
                   yourRandomVal=$(shuf -i 1-2 -n 1)
                   if [ $yourRandomVal -eq 1 ]; then
                       echo -e "\nYour 2 pointer was successful, 2 points made\n"
                       sleep 1
                       yourScore=$((yourScore+2))
                       loopVar=$((loopVar - 5)) 
                       posession=2
                       continue
                   else
                       echo -e "\nYour 2 point jumpshot was unsuccessful\n"
                       sleep 1
                       loopVar=$((loopVar - 5)) 
                       posession=2
                       continue
                   fi
              fi
          elif [ $choice -eq 4 ]; then
              #3 point shot
              computerRandomVal=$(shuf -i 1-4 -n 1)
              if [ $computerRandomVal -eq 1 ]; then
                  echo "Your 3 point shot has been blocked"
                  sleep 1
                  posession=2
                  loopVar=$((loopVar - 5)) 
                  continue
              else
                  echo -e "\nYour 3 point shot has not been blocked\n"
                  sleep 1
                  yourRandomVal=$(shuf -i 1-2 -n 1)
                  if [ $yourRandomVal -eq 1 ]; then
                      echo -e "\n Your 3 pointer was successful, 3 points made\n"
                      sleep 1
                      yourScore=$((yourScore + 3))
                      posession=2
                      loopVar=$((loopVar - 5)) 
                      continue
                  else
                      echo -e "\nYour 3 pointer was unsuccessful\n"
                      sleep 1
                      loopVar=$((loopVar - 5)) 
                      posession=2
                      continue
                  fi
              fi
          fi
        fi
    else
        echo "Computer possesion!"
        computerShotChoice=$(shuf -i 1-4 -n 1)
        if [ $computerShotChoice -eq 1 ]; then
            echo "Layup chosen"
            sleep 1
            yourRandomVal=$(shuf -i 1-2 -n 1)
            if [ "$yourRandomVal" -eq 1 ]; then
                echo "You blocked the computers shot!"
                sleep 1
                posession=1
                loopVar=$((loopVar - 5))
                continue
            else
                echo "Computer made layup, 2 points"
                sleep 1
                posession=1
                computerScore=$((computerScore + 2))
                loopVar=$((loopVar - 5))
                continue
            fi
        elif [ $computerShotChoice -eq 2 ]; then
            echo "Dunk chosen"
            sleep 1
            yourRandomVal=$(shuf -i 1-2 -n 1)
            if [ $yourRandomVal -eq 1 ]; then
                echo "You blocked the computer's dunk"
                sleep 1
                posession=1
                loopVar=$((loopVar-5))
                continue
            else
                echo "Computer dunks"
                sleep 1
                posession=1
                computerScore=$((computerScore + 2))
                loopVar=$((loopVar-5))
                continue
            fi
        elif [ $computerShotChoice -eq 3 ]; then
            echo "Two pointer chosen"
            sleep 1
            yourRandomVal=$(shuf -i 1-3 -n 1)
            if [ $yourRandomVal -eq 1 ]; then
                echo "You blocked the compute's two point jumpshot"
                sleep 1
                posession=1
                loopVar=$((loopVar-5))
                continue
            else
                echo "Computer made two point jumpshot"
                sleep 1
                posession=1
                computerScore=$((computerScore + 2))
                loopVar=$((loopVar-5))
                continue
            fi
        elif [ $computerShotChoice -eq 4 ]; then
            echo "Three pointer chosen"
            sleep 1
            yourRandomVal=$(shuf -i 1-4 -n 1)
            if [ $yourRandomVal -eq 1 ]; then
                echo "You blocked the computer's three point jump shot"
                sleep 1
                posession=1
                loopVar=$((loopVar-5))
                continue
            else
                echo "Computer made three point jumpshot"
                sleep 1
                posession=1
                computerScore=$((computerScore + 3))
                loopVar=$((loopVar-5))
                continue
            fi
        fi

    fi
done
if [ "$yourScore" -gt "$computerScore" ]; then
    echo "Your team wins!"
elif [ "$computerScore" -gt "$yourScore" ]; then
    echo "Computer's team wins!"
else
    echo "Tie!"
fi



