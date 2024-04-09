# platform-odroid

This repo contains all platform-specific files, used by the Volumio Builder to create a **Odroid** images:

Kernel Sources:

C4: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y

N2: https://github.com/hardkernel/linux.git, branch odroidg12-4.9.y


**20240409: General: removed support for C0/C1/C1+/C2/XU4/X2**
  ^^^^^^^^


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
|20240409|gkkpch|Change boot.ini: 'bootconfig' becomes 'uidconfig'



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
|20240409|gkkpch|Change boot.ini: 'bootconfig' becomes 'uidconfig'


