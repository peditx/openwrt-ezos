#!/bin/bash
# OpenWrt DIY script part 2 (After Update feeds)

# تغییر IP پیش‌فرض
sed -i 's/192.168.1.1/10.1.1.1/g' package/base-files/files/bin/config_generate

# تغییر hostname پیش‌فرض
sed -i 's/OpenWrt/PeDitXOs/g' package/base-files/files/bin/config_generate

# جایگزینی فایل profile
cp ./profile package/base-files/files/etc/profile

# جایگزینی فایل‌ها در /etc/profile.d/
cp ./30-sysinfo.sh package/base-files/files/etc/profile.d/30-sysinfo.sh
cp ./sys_bashrc.sh package/base-files/files/etc/profile.d/sys_bashrc.sh

chmod +x package/base-files/files/etc/profile.d/30-sysinfo.sh
chmod +x package/base-files/files/etc/profile.d/sys_bashrc.sh

# کپی فایل‌ها از فولدر .files به روت openwrt
cp ./.files/dns.sh ./
cp ./.files/install.sh ./
cp ./.files/network.sh ./
cp ./.files/setup.sh ./

chmod +x ./dns.sh ./install.sh ./network.sh ./setup.sh

# جایگزینی کامل rc.local با نسخه موجود در ریشه گیت‌هاب
cp ./rc.local package/base-files/files/etc/rc.local
chmod +x package/base-files/files/etc/rc.local
