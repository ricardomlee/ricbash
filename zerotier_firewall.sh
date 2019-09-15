#!/bin/bash
#openwrt路由器添加zerotier防火墙配置

echo "进行此操作前，请确认已在官网添加Managed Routes信息"
echo "大致操作流程："
echo "Networks->xxx_xxx->Advanced->Managed Routes->Add Routes"
echo "Destination：填写路由器子网网络地址，例如：192.168.1.0/24"
echo "(via)：填写路由器被分配的zerotier ip，例如：192.168.192.1"

read -r -p "是否已完成上诉操作？确认继续？[Y/n] " input

case $input in
	[yY][eE][sS]|[yY])
		echo "继续操作"
		;;
	[nN][oO]|[nN])
		echo "退出"
		exit 1
		;;
	*)
		echo "无效输入，退出"
		exit 1
		;;
esac

dev=`zerotier-cli listnetworks | sed -n "2,1p" | awk '{print $(NF-1)}' `
iptables -I FORWARD -i $dev -j ACCEPT
iptables -I FORWARD -o $dev -j ACCEPT
iptables -t nat -I POSTROUTING -o $dev -j MASQUERADE
echo "配置完毕"
echo "测试请使用路由器下的设备ping其他zerotier网络下的设备"
