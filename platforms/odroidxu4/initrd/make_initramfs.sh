cp /config.xu4 /boot/config-3.10.92+
cat > /usr/sbin/policy-rc.d << __EOF
exit 101
__EOF
chmod +x /usr/sbin/policy-rc.d
apt-get update
apt-get -y install u-boot-tools
rm /usr/sbin/policy-rc.d
update-initramfs -c -k 3.10.92+
mkimage -A arm -O linux -T ramdisk -C none -a 0 -e 0 -n uInitrd -d /boot/initrd.img-3.10.92+ /boot/uInitrd

