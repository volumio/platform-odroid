# platform-odroid

This repo contains all platform-specific files, used by the Volumio Builder to create a **Odroid** images:

Kernel Sources:

C0/C1/C1+: https://github.com/hardkernel/linux.git, branch odroidc-3.10.y

C2: https://github.com/hardkernel/linux.git, branch odroidc2-3.14.y

C4: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y

N2: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y

X2: https://github.com/tobiasjakobi/linux-odroid-public.git, branch odroid-4.4.y (obsolete)

XU4: https://github.com/hardkernel/linux.git, branch odroidxu4-4.9.y


- Kernel files (kernel, modules, firmware)
- Other files, e.g. used during the boot process

**Platform files for C1/C1+, kernel version 3.10.y**
- Full Volumio 2 support
- Updated 20160320: Kernel Version 3.10.80 -> 3.10.96
                    pcm5102 i2s DAC driver (C1+/C2 HiFi Shield) is now a loadable module
- Updated 20160708: Kernel Update
		    Sound card 176.4KHz sample-rate playback error fix.
- Updated 20160913: Kernel version 3.10.96 -> 3.10.103 Added pcm512x drivers for the upcoming HiFi Shield 2
- Updated 20160925: Kernel: added CONFIG_RTL8821AU, removed SND_SOC_PCM512x_SPI
- Updated 20160926: Added a service to automatically detect HiFi SHield and HiFi Shield 2
- updated 20161021: Added C1_init.sh from https://github.com/mdrjr/c1_bootini/blob/master/c1_init.sh
		    Added preset boot.ini files for Volumio Kiosk: Full HD (1080p60Hz), VU5, VU7 and VU7+
- updated 20161208: Moved kernel version 3.10.103 -> 3.10.104
		    Added semtech touchscreen driver
- updated 20161223: Changed odroiddac.service timing and raised amixer volume from 102 to 201
- updated 20161223: Reverted amixer volume from 201 to 102
- updated 20170310: Added patch for "odroid_dac2.c", similar to Odroid C2
- updated 20180417: Fixed incorrect removal of aml_i2c module when no HiFi Shield 2 was found
- updated 20190815: Update kernel 3.10.104 -> 3.10.107
(added kernel option announce new usb devices)
- updates 20210126: Added temp. initramfs script


**Platform files for C2, kernel version 3.14.79**
- Official HK kernel with overlayfs v21
- Full Volumio 2 support
- Updated 20160315: pcm5102 i2s DAC driver (C1+/C2 HiFi Shield) is now a loadable module
- Updated 20160422: i2s driver issues resolved
- Updated 20161014: Kernel version 3.10.29 -> 3.10.79, added pcm512x drivers, service to detect HiFi Shield version
- Updated 20161015: Added new u-boot.bin and bl1.bin.hardkernel
- Updated 20161021: Added C2_init.sh from https://github.com/mdrjr/c2_bootini/blob/master/c2_init.sh
		    Added preset boot.ini files for Volumio Kiosk: Full HD (1080p60Hz), VU5, VU7 and VU7+
- Updated 20161208: Changed irq 62/63 (otg/usb) cpu affinity to cpu2 and cpu3
- updated 20161223: Changed odroiddac.service timing and raised volume from 102 to 201
- updated 20161223: Reverted amixer volume from 201 to 102
- updated 20160114: Reverted usb driver commit from 22.04.2016 to improve usb audio playback
  (https://github.com/hardkernel/linux/commit/99be9c67db6d05af30128858d27018a55fd1e9b0)
- updated 20170205: Capped HiFi Shield volume to 207 in a scale from 1-255
- updated 20170207: Capped to 201
- updated 20170309: Reverted all the volume changes and added my own patch for "odroid_dac2.c" using "snd_soc_limit_volume"
- updated 20170331: Added snd_aloop module to support brutefir
- updated 20180410: ALSA: usb audio: Eliminate noise at the start of DSD playback
- updated 20180413: ALSA: usb audio: Added DSD support for a range of devices
- updated 20180417: Fixed incorrect removal of aml_i2c module when no HiFi Shield 2 was found
- updated 20181231: USB Audio: support for more DSD-capable devices
- updated 20210126: Upgraded to kernel 3.16.y/ added temp. initramfs init script
- updated 20210127: Kernel 3.16.y: minor changes to network settings


**Platform files for XU4/ HC1/ HC2, kernel version 4.14.y LTS**
- Full Volumio 2 support
- open issue: fan control utility (to be added)
- Updated 20170303: Moved to hardkernel supported kernel 4.9.y
- Updated 20190103: Moved to kernel 4.14.y LTS, added fancontrol, improved native DSD support

**Platform files for X2, kernel version 4.4.6**
- 20160330, upgraded from HK stock kernel 3.8.13.30
- Exynos4412 experimental, now with full Volumio 2 support
- 20160401, corrected missing iptables options (REDIRECT)
- 20161202, edited boot.cmd

**Platform files for N2, kernel version 4.9.y**
- 20190315 Initial support
- 20190405 Ready for first release
- 20190815 Kernel update (4.9.187)
- 20191221 Kernel Update (4.9.205)
- 20200430 Added Hardkernel stock remote, tweaked smp_affinity
- 20200502 Changed smp-affinity for usb to cpu3, vsync to cpu2
- 20200724 Add support for Odroid N2+
- 20210114 Consolidating boot.ini C4 and N2
- 20210207 usb audio quirks

**Platform files for C4, kernel version 4.9.y**
- 20200430 Initial support (WIP)
- 20200615 Adding support for HiFi Shield/Shield+/Shield2 and umute hdmi-out
- 20200616 Fixed a boot.ini default value issue
- 20210111 Changed location of the dtb to the amlogic subfolder
- 20210114 Consolidating boot.ini C4 and N2
- 20210207 usb audio quirks
- 20210314 Add auddio linout (pins J14) as an option




