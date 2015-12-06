#!/bin/bash


MYDATE="$(/bin/date +'%Y.%m.%d-%m:%H:%M:%S')"	# Date and time now
MYHOSTNAME=$(/bin/uname -n)	
PLATFORM=$(uname -m)
KERNEL=$(uname -r)
total=$(cat /proc/meminfo | grep ^MemTotal: | awk '{print $2}')
free=$(cat /proc/meminfo | grep ^MemFree: | awk '{print $2}')
MEMTOTAL=$(echo $(($total / 100000)))
MEMFREE=$(echo $(($free / 100000)))
HWDEVICE=$(cat /proc/cpuinfo | grep Hardware | awk '{print $3}' )
VOLUMIO_VERSION=$(cat /etc/os-release | grep ^VOLUMIO_VERSION= | awk -F'["]' '{print $2}')
VOLUMIO_BUILD_DATE=$(cat /etc/os-release | grep ^VOLUMIO_BUILD_DATE=\" | awk -F'[="]' '{print $2 " " $3 " " $4 " " $5}')
UPTIME=$(uptime)
PROCVERSION=$(cat /proc/version)
TESTPARM=$(echo "y" | testparm 2>&1 )



/bin/cat <<- EOF > /tmp/volumio_support_info
-----------------------------------------------------------------------------

Volumio System Info
===================

Collection Date    : $MYDATE
Hostname           : $MYHOSTNAME
System platform    : $PLATFORM
Kernel Version     : $KERNEL
kernel Build data  : $PROCVERSION
Total Memory       : ${MEMTOTAL}MB
Free Memory        : ${MEMFREE}MB
Hardware Device	   : ${HWDEVICE}
Volumio Version	   : ${VOLUMIO_VERSION}
Volumio Build Date : ${VOLUMIO_BUILD_DATE}

Uptime
======

$(uptime)

Filesystems
===========

$(df -h )

Audio Cards
===========
$(cat /proc/asound/cards)

Alsa playback
=============
$(aplay -l)

Alsa PCM
========
$(aplay -L)

MPD outputs
===========
$(mpc outputs)

MPD Config
==========
$(cat /etc/mpd.conf)

Network ifconfig
================
$(ifconfig -a )

Metwork iwconfig
================
$(iwconfig 2>&1)

Boot folder
===========
$(ls -al /boot)

boot.ini
========
$(cat /boot/boot.ini)

Partitions
==========
$(cat /proc/partitions)

Samba Details
=============
${TESTPARM}

Loaded modules
==============
$(lsmod)

What is running
===============
$(pstree)

Volumio messages
================
$(cat /var/log/volumio.log)

Kernel messages
===============
$(dmesg)

Installed packages
==================
$(dpkg --list)

Systemd Service Status
======================
$(systemctl list-unit-files --type=service)

----------------------------------------------------------------------------
EOF

echo $(pastebinit -i /tmp/volumio_support_info -b paste2.org)

exit 0

