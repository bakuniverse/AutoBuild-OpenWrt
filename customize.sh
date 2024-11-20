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
cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall/luci-app-passwall /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/luci/applications
cp -a /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/passwall/luci-app-passwall /home/runner/work/AutoBuild-OpenWrt/AutoBuild-OpenWrt/openwrt/feeds/luci/applications
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

