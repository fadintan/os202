#!/bin/bash
# Intan Fadilla Andyani

file_rank='myrank.txt'
file_log='mylog.txt'
FILES="my*.txt my*.sh"
SHA="SHA256SUM"

echo "Menu"
echo "[1] Add MyRank"
echo "[2] Add Log"
echo "[3] Sign Files"

read -p ">> Enter your choice: " opt

# Script untuk menambahkan top 3 rank
if [ $(($opt)) -eq 1 ]
then
	echo "---------------------------------------------------------------"
	echo "I'll help you update the Top 3 Rank to myrank.txt~"
	echo "You just need to fill in this form and i'll do the magic! :D"
	echo "---------------------------------------------------------------"

	# Masukkan input minggu dan id github
	read -p ">> Enter Week: " newweek
	read -p ">> Enter your 1st Top 3: " first
	read -p ">> Enter your 2nd Top3: " second
	read -p ">> Enter your 3rd Top3: " third

	echo "---------------------------------------------------------------"

	# Append variables ke file myrank.txt
	printf "ZCZC $newweek $first\n" >> $file_rank
	printf "ZCZC $newweek $second\n" >> $file_rank
	printf "ZCZC $newweek $third\n" >> $file_rank
	echo "Rank Updated!"

# Script untuk menambahkan log
elif [ $(($opt)) -eq 2 ]
then
	echo "---------------------------------------------------------------"
	read -p ">> Enter week: " week
	echo "Let's input your log!"
	echo "
	L00 General Log
	L01 SCELE related
	L02 ZOOM related
	L03 GitHub related
	L04 GitHub Pages: setting, etc.
	L05 GSGS related
	L06 Reading Refereces/Books/Documents
	L07 Demo related
	L08 Trying something
	L09 AsDos: asking, etc.
	L10 Assignment (General)
	L11-20 Assignment #1-#10
	L25 C-language: study, etc.
	L23 Discord: discussion, etc.
	L26 Movie: relax, etc.
	L27 Pets: feeding, playing, etc
	L24 Udacity: study, etc.
	L21 VirtualBox: install GNU/Linux, etc.
	L22 YouTube: study, etc.
	L99 Other (...)"
	echo "---------------------------------------------------------------"
	
	next="true"
	while (("$next"== "true"))
	do
		read -p ">> Duration: " dur
		read -p ">> Log code: " code
		read -p ">> Description: " desc
		printf "ZCZC $week $dur $code $desc\n" >> $file_log
		echo "Log updated!"
		read -p ">> Do you want to add more log? (y/n) " ans
		if [[ "$ans" = "n" ]]
		then
			next="false"
			echo "Bye!"
			read -p ">> control+c to exit: " ex
		fi
	done
	
# Sign files script
elif [ $(($opt)) -eq 3 ]
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
