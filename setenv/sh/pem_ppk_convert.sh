#!/bin/sh
echo "---"
echo "pem to ppk & ppk to pem prog.\n\n"
echo "[1]pem to ppk\n"
echo "[2]ppk to pem\n"
echo "[3]quit\n"
echo "---"
read -p "Please input key(1..3): " s1
read -p "Please input pem file name: " s2
read -p "Please input ppk file name: " s3
case $s1 in
    1)
	puttygen $s2 -O private -o $3 &
	;;
    2)
	puttygen $s3 -O private-openssh -o $s2 &
	;;
    3)
	echo "Bye."
	exit 0
	;;
    echo "Complete. Bye."
    exit 0
esac
