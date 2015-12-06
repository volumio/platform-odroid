cmd_firmware/edid/1280x1024.bin.gen.o := arm-linux-gnueabihf-gcc -Wp,-MD,firmware/edid/.1280x1024.bin.gen.o.d  -nostdinc -isystem /opt/toolchains/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/4.9.3/include  -I/root/linux/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/linux/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/linux/include/uapi -Iinclude/generated/uapi -include /root/linux/include/linux/kconfig.h -Iubuntu/include  -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float         -c -o firmware/edid/1280x1024.bin.gen.o firmware/edid/1280x1024.bin.gen.S

source_firmware/edid/1280x1024.bin.gen.o := firmware/edid/1280x1024.bin.gen.S

deps_firmware/edid/1280x1024.bin.gen.o := \
  /root/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \

firmware/edid/1280x1024.bin.gen.o: $(deps_firmware/edid/1280x1024.bin.gen.o)

$(deps_firmware/edid/1280x1024.bin.gen.o):
