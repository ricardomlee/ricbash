# ricbash
> 自用 shell 脚本	测试
>

> *windows下git设置：*
>
> `git config --global core.autocrlf false`

## gwip.sh

- 可使用，测试环境（WSL Ubuntu 18.04, CentOS 7.6）
- 脚本说明：获取公网ip

- 下载使用：

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/gwip.sh && chmod +x gwip.sh && bash gwip.sh
```



## test.sh

- 测试脚本，测试环境（CentOS 7.6）

- 脚本说明：检查node id格式

- 下载使用：（可传入一个参数作为id）

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/test.sh && chmod +x test.sh && bash test.sh
```



## moon.sh

- 测试通过(2019.10.19)，测试环境（CentOS 7.6）

- 脚本说明：VPS作为moon节点加入zerotier网络

- 下载使用：（可以将zerotier网络id作为脚本的参数，或运行后再输入）

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/moon.sh && chmod +x moon.sh && bash moon.sh
```



## zerotier_firewall.sh

- 待测试，测试环境（Newifi3 LEDE）
- 脚本说明：openwrt路由器安装zerotier后配置防火墙

- 下载使用：

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/zerotier_firewall.sh && chmod +x zerotier_firewall.sh && bash zerotier_firewall.sh
```


## ddns.sh

- 可使用，测试环境（Padavan）
- 脚本说明：输入ip修改域名解析记录

- 下载使用：添加ip作为脚本参数

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/ddns.sh
#修改ID Token domain等信息
chmod +x ddns.sh
./ddns.sh xxx.xxx.xxx.xxx
```

## update_ip.sh

- 可使用，测试环境（Ubuntu18.04）
- 脚本说明：获取本机ip并召唤可访问外网的机器，将ip传入ddns脚本执行

- 下载使用：

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/update_ip.sh
#修改用户名，ssh服务器地址，ddns脚本路径
chmod +x update_ip.sh
./update_ip.sh
```

## hardlink.sh

- 可使用，测试环境（unraid 6.7.2）
- 脚本说明：对当前目录下所有子目录的视频创建硬链接
