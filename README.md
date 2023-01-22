# platform-odroid

This repo contains all platform-specific files, used by the Volumio Builder to create a **Odroid** images:

Kernel Sources:

C0/C1/C1+: https://github.com/hardkernel/linux.git, branch odroidc-3.10.y

C2: https://github.com/hardkernel/linux.git, branch odroidc2-3.14.y

C4: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y

N2: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y

XU4: https://github.com/hardkernel/linux.git, branch odroidxu4-4.9.y


- Kernel files (kernel, modules, firmware)
- Other files, e.g. used during the boot process

**Platform files for C1/C1+, kernel version 3.10.y**
|Date|Author|Change
|---|---|---|
|||Full Volumio 2 support
|20220126|gkkpch|Added Ralink firmware support
|20220127|gkkpch|Volumio 3: added "net.ifnames=0" to bootargs (avoiding Predictable Network Interface naming)


**Platform files for C2, kernel version 3.14.79**
|Date|Author|Change
|---|---|---|
|||Official HK kernel with overlayfs v21
|||Full Volumio 2 support
|20160315|gkkpch|pcm5102 i2s DAC driver (C1+/C2 HiFi Shield) is now a loadable module
|20210127|gkkpch|Kernel 3.16.y: minor changes to network settings
|20220126|gkkpch|Added Ralink firmware support
|20220127|gkkpch|Volumio 3: added "net.ifnames=0" to bootargs (avoiding Predictable Network Interface naming)


**Platform files for XU4/ HC1/ HC2, kernel version 4.14.y LTS**
|Date|Author|Change
|---|---|---|
|20161202|gkkpch|edited boot.cmd
|||Full Volumio 2 support
|||open issue: fan control utility (to be added)
|20170303|gkkpch|Moved to Hardkernel supported kernel 4.9.y
|20190103|gkkpch|Moved to kernel 4.14.y LTS
|||added fancontrol
|||improved native DSD support
|20211005|gkkpch|Prepared for Volumio 3 boot parameter settings


**Platform files for N2, kernel version 4.9.y**
|Date|Author|Change
|---|---|---|
|20190315|gkkpch|Initial support
|20190405|gkkpch|Ready for first release
|20190815|gkkpch|Kernel update (4.9.187)
|20191221|gkkpch|Kernel Update (4.9.205)
|20200430|gkkpch|Added Hardkernel stock remote, tweaked smp_affinity
|20200502|gkkpch|Changed smp-affinity for usb to cpu3, vsync to cpu2
|20200724|gkkpch|Add support for Odroid N2+
|20210114|gkkpch|Consolidating boot.ini C4 and N2
|20210207|gkkpch|usb audio quirks
|20220103|gkkpch|Configure S/PDIF on GPIOA_13 or J7.2, add Ralink support
|20220210|gkkpch|Add support for Odroid Wireless module 5A and 5B
|20220409|gkkpch|Add support for Cambridge DacMagic 200M (quirk)
|20230121|gkkpch|Added support for the audio UAC2 gadget
|||No need for OTG
||| - Enable USB Gadgets
||| - Enable Audio Gadget
||| - (leave UAC1 unticket -> UAC2 will be enabled)
||| - add /etc/modprobe.d/g_audio.conf
||| - add /etc/modules



**Platform files for C4, kernel version 4.9.y**
|Date|Author|Change
|---|---|---|
|20200430|gkkpch|Initial support (WIP)
|20200615|gkkpch|Adding support for HiFi Shield/Shield+/Shield2 and umute hdmi-out
|20200616|gkkpch|Fixed a boot.ini default value issue
|20210111|gkkpch|Changed location of the dtb to the amlogic subfolder
|20210114|gkkpch|Consolidating boot.ini C4 and N2
|20210207|gkkpch|usb audio quirks
|20210314|gkkpch|Add auddio linout (pins J14) as an option
|20220103|gkkpch|Add Ralink support
|20220104|gkkpch|Add support for gpio button power on/off (key "479")
|20220210|gkkpch|Add support for Odroid Wireless module 5A and 5B







