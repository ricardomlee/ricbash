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

- 脚本说明：获取node id

- 下载使用：

```shell
wget -N --no-check-certificate https://github.com/ricardomlee/ricbash/raw/master/test.sh && chmod +x test.sh && bash test.sh
```



## moon.sh

- 待测试，测试环境（CentOS 7.6）

- 脚本说明：VPS作为moon节点加入zerotier网络

- 下载使用：

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