#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/peditx/openwrt-passwall2' >>feeds.conf.default
echo 'src-git passwall_packages https://github.com/peditx/openwrt-passwall-packages' >>feeds.conf.default
#echo 'src-git carbonpx https://github.com/peditx/luci-theme-carbonpx' >>feeds.conf.default
#echo 'src-git peditx https://github.com/peditx/luci-theme-peditx' >>feeds.conf.default
# اضافه کردن تم carbonpx
rm -rf package/luci-theme-carbonpx
git clone https://github.com/peditx/luci-theme-carbonpx package/luci-theme-carbonpx

# اضافه کردن تم peditx
rm -rf package/luci-theme-peditx
git clone https://github.com/peditx/luci-theme-peditx package/luci-theme-peditx
