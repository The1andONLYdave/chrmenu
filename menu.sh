#!/bin/bash
# by oToGamez
# www.pro-toolz.net
# modified by The1andONLYdave
# kulsch-it.blogspot.de 
# @REPO github.com/The1andONLYdave
# V0.1 - english

      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
   MARK(){ $e "\e[07m";}
 UNMARK(){ $e "\e[27m";}
      R(){ CLEAR ;stty sane;$e "\ec\e[30;47m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 1 15);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 5
           $E "Crouton Tool 0.1 by The1andONLYdave@github";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 15 5
           printf "ENTER - SELECT,NEXT | ARROW TO CHOOSE    ";UNMARK;}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT  4 15; $e "Start Linux Graphical (xfce4)";}
     M1(){ TPUT  5 15; $e "Start Linux Graphical (i3)";}
     M2(){ TPUT  6 15; $e "Backup Linux to Downloads";}
     M3(){ TPUT  7 15; $e "Backup Linux to SD-Card";}
     M4(){ TPUT  8 15; $e "Start VPN (Step 1)";}
     M5(){ TPUT  9 15; $e "Start Linux Shell";}
     M6(){ TPUT 10 15; $e "About and Readme ";}
     M7(){ TPUT 11 15; $e "Exit   ";}
      LM=7
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;sudo startxfce4 -b;exit 0;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;sudo starti3  ;ES;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;sudo edit-chroot -b xenial2  ;ES;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;sudo edit-chroot -f /media/removable/USB\ Drive/BackupLinux/ -b xenial2;ES;fi;;
        4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(vpnprepare )\n";ES;fi;;
        5) S=M5;SC;if [[ $cur == "" ]];then R;sudo enter-chroot;ES;fi;;
        6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$($e by oTo modified by The1andONLYdave && tail -n 38 ./$0 )\n";ES;fi;;
        7) S=M7;SC;if [[ $cur == "" ]];then R;exit 0;fi;;
 esac;POS;done


###readme###
#start with bash menu.sh not with sh menu.sh or use ./menu.sh
#else you get errors and no menu


###customize it:###
#Line 56 :place following script ###starti3### in /usr/local/bin/starti3 and chmod +x it
#Line 57 :name your chroot (mine is xenial2)
#Line 58 :name your chroot (mine is xenial2) and change path to your SD-Card/USB Disk
#Line 59 :place following script ###vpnprepare### in /usr/local/bin/vpnprepare and chmod +x it
#Other colours? Change Line 18 from 92;40m to 37;44m


###starti3####
#remove one '#' from every line 

##!/bin/sh -e
## Copyright (c) 2016 The crouton Authors. All rights reserved.
## Use of this source code is governed by a BSD-style license that can be
## found in the LICENSE file.
#
#set -e
#
#APPLICATION="${0##*/}"
#
#
#  exec sh -e "/usr/local/bin/enter-chroot" "$@" exec xinit /usr/bin/i3
#


###vpnprepare###
#remove one '#' from every line 

##!/bin/bash
#sudo stop shill
#sudo start shill BLACKLISTED_DEVICES=tun0
#echo "shill prepared, start chroot and please input 'sudo vpnc'in chroot then"
