ifeq ($(KERNELRELEASE),)

ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
KDIR ?= /lib/modules/$(shell uname -r)/build
DTC ?= $(KDIR)/scripts/dtc/dtc

all: modules rk3399-pci-phy-name.dtbo

modules:
	$(MAKE) -C $(KDIR) M=$(ROOT_DIR) $@

modules_install:
	$(MAKE) -C $(KDIR) M=$(ROOT_DIR) $@

clean:
	$(MAKE) -C $(KDIR) M=$(ROOT_DIR) $@
	rm -f *.dtbo

%.dtbo: %.dts
	$(DTC) -I dts -O dtb -o $@ $<

install: all
	$(MAKE) modules_install
	@./update_initramfs.sh
	@./install_overlay.sh

else

obj-m := phy-rockchip-pcie-new.o

phy-rockchip-pcie-new-objs := phy-rockchip-pcie.o

endif
