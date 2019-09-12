#!/bin/bash
#VPS创建Zerotier moon节点
#脚本未测试！

#退出脚本
function exit_script() {                                                      
    exit 1                                                                    
}
#检查IP的合法性
check_ipaddr()
{
    echo $1|grep "^[0-9]\{1,3\}\.\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}$" > /dev/null;
    if [ $? -ne 0 ]
    then
        #echo "IP地址必须全部为数字" 
        return 1
    fi
    ipaddr=$1
    a=`echo $ipaddr|awk -F . '{print $1}'`  #以"."分隔，取出每个列的值 
    b=`echo $ipaddr|awk -F . '{print $2}'`
    c=`echo $ipaddr|awk -F . '{print $3}'`
    d=`echo $ipaddr|awk -F . '{print $4}'`
    for num in $a $b $c $d
    do
        if [ $num -gt 255 ] || [ $num -lt 0 ]    #每个数值必须在0-255之间 
        then
            #echo $ipaddr "中，字段"$num"错误" 
            return 1
        fi
   done
   #echo $ipaddr "地址合法"
   return 0
}
#检查Network ID的合法性
check_netid()
{
    #两边和中间的空格不能少！
    if [[ $1 =~ ^[0-9a-z]{16}$ ]]; then
        return 0
    else
        return 1
    fi
}

#运行参数为ID，或手动输入ID
if [ $# == 1 ]; then
    netid=$1
else
    echo "请输入Network ID信息 (16位字符)："
    read netid
fi

check_netid $netid
if [ "$?"x = "0"x ]; then
   echo "Network ID格式正确"
else
   echo "Network ID格式错误，退出脚本！"
   exit_script
fi

#安装zerotier one
curl -s https://install.zerotier.com/ | sudo bash
zerotier-cli join $netid
cd /var/lib/zerotier-one
zerotier-idtool initmoon identity.public > moon.json

#获得公网ip
PUBLIC_IP=$(curl ip.6655.com/ip.aspx)
check_ipaddr "$PUBLIC_IP"
if [ "$?"x = "0"x ]; then
   echo "公网IP地址：$PUBLIC_IP"
else
   echo "获取IP地址失败，退出脚本！"
   exit_script
fi

#vi 编辑 moon.json
sed -i  's|\("stableEndpoints":\).*|\1'\[\"$PUBLIC_IP/9993\"\]'|g'   moon.json

#创建.moon文件，复制到moons.d文件夹
file_name=`zerotier-idtool genmoon moon.json | cut -d' ' -f 2`
mkdir /var/lib/zerotier-one/moons.d
cp $file_name /var/lib/zerotier-one/moons.d

echo "moon节点创建成功，请重启zerotier或机器"