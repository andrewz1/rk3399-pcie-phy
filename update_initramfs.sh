#!/bin/sh

depmod -a
grep -q ^phy-rockchip-pcie-new /etc/initramfs-tools/modules || echo phy-rockchip-pcie-new >>/etc/initramfs-tools/modules
update-initramfs -u
