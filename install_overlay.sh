#!/bin/sh

mkdir -p /boot/overlay-user
cp -a rk3399-pci-phy-name.dtbo /boot/overlay-user
ovs=$(grep ^user_overlays /boot/armbianEnv.txt)
if [ -z "$ovs" ]; then
	echo "user_overlays=rk3399-pci-phy-name" >>/boot/armbianEnv.txt
	exit 0
fi
echo $ovs | grep -q rk3399-pci-phy-name && exit 0
sed -i -E 's/(^user_overlays.*)/\1 rk3399-pci-phy-name/' /boot/armbianEnv.txt
