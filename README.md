Build
=====

This repo contains all platform-specific files, used by the Volumio Builder to create an **Odroid** images:

- Kernel files (kernel, modules, firmware)
- Other files, e.g. used during the boot process

**Platform files for C1/C1+, kernel version 3.10.80**
- Full Volumio 2 support

**Platform files for XU4, kernel version 3.10.92+**
- Volumio 2 support with limitations due to currently missing overlayfs support 
- overlayfs will be supported after switching to kernel 4.0.x

**Platform files for X2, kernel version 3.8.13.30**
- Volumio 2 support with limitations due. overlayfs will not be supported
