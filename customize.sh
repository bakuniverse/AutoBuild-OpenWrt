#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.100.252/g' openwrt/package/base-files/luci2/bin/config_generate
sed -i 's/192.168.1.1/192.168.100.252/g' /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/package/base-files/files/bin/config_generate
sed -i 's/256/1024/g' /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/target/linux/x86/image/Makefile
#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf
rm openwrt/feeds/luci/applications/luci-app-passwall2 -rf
rm openwrt/feeds/luci/applications/luci-app-passwall -rf
rm -rf openwrt/package/lean/passwall
rm -rf openwrt/package/lean/passwall2
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git openwrt/package/lean/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git openwrt/package/lean/passwall
git clone https://github.com/xiaorouji/openwrt-passwall2.git openwrt/package/lean/passwall2
#cp -rf /home/demo/lede/package/lean/passwall_package/* openwrt/package/lean/passwall
rm -rf openwrt/feeds/packages/net/geoview
rm -rf openwrt/feeds/packages/net/microsocks
rm -rf openwrt/feeds/packages/net/xray-core
rm -rf openwrt/feeds/packages/net/chinadns-ng
rm -rf openwrt/feeds/packages/net/sing-box
rm -rf openwrt/feeds/packages/net/dns2socks
rm -rf openwrt/feeds/packages/net/dns2tcp
#rm -rf openwrt/feeds/packages/net/tcping
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall/luci-app-passwall /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/luci/applications
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall2/luci-app-passwall2 /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/luci/applications
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall_packages/xray-core /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/packages/net
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall_packages/chinadns-ng /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/packages/net
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall_packages/sing-box /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/packages/net
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall_packages/dns2socks /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/packages/net
#cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall_packages/tcping /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/packages/net
sed -i 's/local RUN_NEW_DNSMASQ=1/local RUN_NEW_DNSMASQ=0/g' openwrt/package/lean/passwall/luci-app-passwall/root/usr/share/passwall/app.sh

#----------------------------------------------------------------------------#
 #If On Github Actions, remove bloat to get space (~ 30 GB)
if [ "$USER" = "runner" ] || [ "$(whoami)" = "runner" ]; then
   echo -e "\n[+] Debloating GH Runner...\n"
     #12.0 GB
     sudo rm /usr/local/lib/android -rf 2>/dev/null
    #8.2 GB
     sudo rm /opt/hostedtoolcache/CodeQL -rf 2>/dev/null
     #5.0 GB
     sudo rm /usr/local/.ghcup -rf 2>/dev/null
     #2.0 GB
    sudo rm /usr/share/dotnet -rf 2>/dev/null
     #1.7 GB
     sudo rm /usr/share/swift -rf 2>/dev/null
     #1.1 GB
     sudo rm /usr/local/lib/node_modules -rf 2>/dev/null
     #1.0 GB
     sudo rm /usr/local/share/powershell -rf 2>/dev/null
     #500 MB
     sudo rm /usr/local/lib/heroku -rf 2>/dev/null
fi
#----------------------------------------------------------------------------#

