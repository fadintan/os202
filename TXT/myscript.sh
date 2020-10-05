#!/bin/bash
# Intan Fadilla Andyani
# Mon Sep 28 22:03:27 WIB 2020
# Tue 29 Sep 2020 11:02:39 AM WIB

filename='myrank.txt'
FILES="mylog.txt mypubkey.txt myrank.txt myscript.sh"
SHA="SHA256SUM"

echo "Menu"
echo "[1] Add MyRank"
echo "[2] Sign Files"

read -p ">> Enter your choice: " opt

if [ $(($opt)) -eq 1 ]
	then
    echo "I'll help you update the Top 3 Rank to myrank.txt~"
    echo "You just need to fill in this form and i'll do the magic! :D"

    # Masukkan input minggu dan id github
    read -p ">> Enter Week: " newweek
    read -p ">> Enter your 1st Top 3: " first
    read -p ">> Enter your 2nd Top3: " second
    read -p ">> Enter your 3rd Top3: " third

    # Append variables ke file myrank.txt
    printf "ZCZC $newweek $first\n" >> $filename
    printf "ZCZC $newweek $second\n" >> $filename
    printf "ZCZC $newweek $third\n" >> $filename
    echo "Rank Updated!"
  
elif [ $(($opt)) -eq 2 ]
	then
    rm -f $SHA $SHA.asc

    echo "sha256sum $FILES > $SHA"
    sha256sum $FILES > $SHA

    echo "sha256sum -c $SHA"
    sha256sum -c $SHA

    echo "gpg -o $SHA.asc -a -sb $SHA"
    gpg -o $SHA.asc -a -sb $SHA

    echo "gpg --verify $SHA.asc $SHA"
    gpg --verify $SHA.asc $SHA
fi
exit 0

# Mon Sep 28 21:05:04 WIB 2020
