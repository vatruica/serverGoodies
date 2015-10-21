#!/bin/bash

PATH="/opt/swap.img"
SIZE="2000" # 2Gb

touch $PATH
chmod 600 $PATH
dd if=/dev/zero of=$PATH bs=1024k count=$SIZE
mkswap $PATH 
swapon $PATH
echo "$PATH    none    swap    sw    0    0" >> /etc/fstab