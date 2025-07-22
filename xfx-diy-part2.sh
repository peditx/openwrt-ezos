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

# جایگزینی کامل rc.local
cp ./rc.local package/base-files/files/etc/rc.local
chmod +x package/base-files/files/etc/rc.local

# جایگزینی فایل banner
cp ./banner package/base-files/files/etc/banner

# کپی فایل‌های اسکریپت از .files به روت OpenWrt
cp ./.files/dns.sh ./
cp ./.files/install.sh ./
cp ./.files/network.sh ./
cp ./.files/setup.sh ./

chmod +x ./dns.sh ./install.sh ./network.sh ./setup.sh

# حذف تم پیش‌فرض bootstrap
rm -rf feeds/luci/themes/luci-theme-bootstrap

# کلون تم luci-theme-carbonpx از گیت‌هاب
git clone https://github.com/kenzok8/luci-theme-carbon.git package/luci-theme-carbonpx

# تغییر تم پیش‌فرض به carbonpx
sed -i 's/luci-theme-bootstrap/luci-theme-carbonpx/g' feeds/luci/collections/luci/Makefile
