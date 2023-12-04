# rk3399-pcie-phy

RockChip RK3399 PCIE PHY init patch

Install sequence on Armbian (tested on my R4S):

- ```apt install git make linux-headers-{current,edge}-rockchip64``` (depend of your version)
- ```git clone this_repo```
- ```cd this_repo_folder```
- ```make install```
- ```reboot```

This repo provide updated kernel module and device tree overlay for change device ```compatible``` property (to switch for this updated module - original module built in kernel)

This is proof of concept, but it's works! :)
