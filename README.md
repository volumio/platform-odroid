Build
=====

This repo contains all platform-specific files, used by the Volumio Builder to create an **Odroid** images:

- Kernel files (kernel, modules, firmware)
- Other files, e.g. used during the boot process

**Platform files for C1/C1+, kernel version 3.10.96**
- Full Volumio 2 support
- Updated 20160320: Kernel Version 3.10.80 -> 3.10.96
                    pcm5102 i2s DAC driver (C1+/C2 HiFi Shield) is now a loadable module

**Platform files for C2, kernel version 3.14.29-Volumio**
- Official HK kernel with overlayfs v21
- Full Volumio 2 support
- Updated 20160315: pcm5102 i2s DAC driver (C1+/C2 HiFi Shield) is now a loadable module

**Platform files for XU4, kernel version 4.4.0 (mainline)**
- Full Volumio 2 support  
- open issue: fan control utility (to be added)

**Platform files for X2, kernel version 3.8.13.30**
- Volumio 2 support with limitations, overlayfs/ SD card resize/ updates 
  mechanism will not be supported
