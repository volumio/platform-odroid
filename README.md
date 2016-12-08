# platform-odroid

This repo contains all platform-specific files, used by the Volumio Builder to create a **Odroid** images:

Kernel Sources:	
C0/C1/C1+	https://github.com/hardkernel/linux.git, branch odroidc-3.10.y
C2		https://github.com/hardkernel/linux.git, branch odroidc2-3.14.y
X2		https://github.com/tobiasjakobi/linux-odroid-public.git, branch odroid-4.4.y (obsolete) 
XU4		https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.4.tar.xz
	

- Kernel files (kernel, modules, firmware)
- Other files, e.g. used during the boot process

**Platform files for C1/C1+, kernel version 3.10.104**
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

**Platform files for XU4, kernel version 4.4.0 (mainline)**
- Full Volumio 2 support  
- open issue: fan control utility (to be added)

**Platform files for X2, kernel version 4.4.6**
- 20160330, upgraded from HK stock kernel 3.8.13.30
- Exynos4412 experimental, now with full Volumio 2 support
- 20160401, corrected missing iptables options (REDIRECT)
- 20161202, edited boot.cmd
