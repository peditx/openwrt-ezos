#!/bin/bash
# OpenWrt DIY script part 2 (After Update feeds)

BASE_URL="https://raw.githubusercontent.com/peditx/openwrt-ezos/refs/heads/main"
FILES_URL="$BASE_URL/.files"

# تغییر IP پیش‌فرض
sed -i 's/192.168.1.1/10.1.1.1/g' package/base-files/files/bin/config_generate

# تغییر hostname پیش‌فرض
sed -i 's/OpenWrt/PeDitXOs/g' package/base-files/files/bin/config_generate

# دانلود و جایگزینی فایل profile
curl -fsSL "$BASE_URL/profile" -o package/base-files/files/etc/profile

# دانلود و جایگزینی فایل‌های profile.d
mkdir -p package/base-files/files/etc/profile.d
curl -fsSL "$BASE_URL/30-sysinfo.sh" -o package/base-files/files/etc/profile.d/30-sysinfo.sh
curl -fsSL "$BASE_URL/sys_bashrc.sh" -o package/base-files/files/etc/profile.d/sys_bashrc.sh
chmod +x package/base-files/files/etc/profile.d/*.sh

# دانلود و جایگزینی فایل rc.local
curl -fsSL "$BASE_URL/rc.local" -o package/base-files/files/etc/rc.local
chmod +x package/base-files/files/etc/rc.local

# دانلود و جایگزینی فایل banner
curl -fsSL "$BASE_URL/banner" -o package/base-files/files/etc/banner

# دانلود فایل‌های اسکریپت از .files به روت openwrt
curl -fsSL "$FILES_URL/dns.sh" -o ./dns.sh
curl -fsSL "$FILES_URL/install.sh" -o ./install.sh
curl -fsSL "$FILES_URL/network.sh" -o ./network.sh
curl -fsSL "$FILES_URL/setup.sh" -o ./setup.sh
chmod +x ./dns.sh ./install.sh ./network.sh ./setup.sh

# حذف تم پیش‌فرض bootstrap
#rm -rf feeds/luci/themes/luci-theme-bootstrap

# کلون تم luci-theme-carbonpx (در صورت نیاز، آدرس درست بده)
#git clone https://github.com/peditx/luci-theme-carbonpx.git package/luci-theme-carbonpx

# تغییر تم پیش‌فرض به carbonpx
sed -i 's/luci-theme-bootstrap/luci-theme-carbonpx/g' feeds/luci/collections/luci/Makefile
