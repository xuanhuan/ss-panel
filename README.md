A simple front-end of [Shadowsocks manyuser](https://github.com/mengskysama/shadowsocks/tree/manyuser).
This Version is based on xuanhuan's [SS-Panel-smarty](https://github.com/xuanhuan/ss-panel).

Great thanks to [kot4ri](https://zankyo.cc/) xiaoxin and others for their help with fixing bugs and updating functions.

炒鸡感谢 [kot4ri](https://zankyo.cc/) xiaoxin 两位大佬不停的给我们这个版本修复Bug和更新内容！！
SS-Panel-smarty-Edition
========

重要/Important!
========
This edition requires Chrome or FireFox for compatible functioning and surfing. <br/>
为保证兼容性，请使用 Chrome 或 FireFox。

Please edit the file `/lib/config-sample.php` upon your own need, when you finished, rename the file to `/lib/config.php`. Set `$site_url` as your website address, and be sure that it contains a `/` at the end of your URL. <br/>
请按需修改 `/lib/config-sample.php` 的设置，然后把文件重命名成 `/lib/config.php`。注意在填写网站网址`$site_url`的时候在结尾加一个 `/`。

Please make sure that `lib/Ss` has the permission to read & write. If not, please set it for convenience. <br/>
请确保目录 `lib/Ss` 有读写权限，如果没有请改一下。

========
### AdminSystem 

Please use the invite code to register and set your account as admin in your database.

新版密码加密方式说明
========

Please change the encrypted salt in /lib/config.php.
We offer「salt sha256」encrytion.

__注意/Attention!：__

* __The `$salt` value can not be changed after it has been set!<br/>__
  __`$salt`在被设置以后不能再次修改！__
* If you are upgrading from v2.4 or earlier version, you have to change `pass` to `64`.
  如果原来为 2.4 之前的版本，需要将`pass`字段的长度修改为`64`。


* 增加 Nginx 的配置文件 tpl.conf，用于防止直接访问模板文件。 放在当前网站Nginx 配置文件相同目录，然后打开原来的配置文件，找到当前域名的server { } 在里面粘贴：include tpl.conf;
* 增加Apache 的配置文件 .htaccess，用于防止直接访问模板文件，放在当前目录。

### 需求/Requirements
* PHP >= 5.4
* PDO Extension
* MCrypt Extension
* Mysql >= 5.1

### 安装/Install
* Import `sql/*.sql` to your MySQL Database<br/>
  将 `sql/*.sql` 导入到 MySQL。
* Rename `lib/config-sample.php` && `lib/Ss/Code/config-sample.php` to `config.php`, and edit the infomation in `lib/config.php`.

* __IMPORTANT:DON'T MANUALLY change `lib/Ss/Code/config.php` after doing above!__
* __IMPORTANT:DON'T MANUALLY change `lib/Ss/Code/config.php` after doing above!__
* __IMPORTANT:DON'T MANUALLY change `lib/Ss/Code/config.php` after doing above!__

* Enjoy it.

### 管理员/Admin
* The user whose `uid` is 1 is the admin by default.<br/>
  UID 为 1 的用户默认为管理员
* You can Add User ID into table `ss_user_admin`<br/>
  你可以在 `ss_user_admin` 表里添加管理员。

### 节点负载/Load status in Node List
节点列表查看节点负载等信息
The following helps you to show load status in Node List page.
* For Ubuntu/Debian:

```
$ apt-get install gcc python-dev
$ pip install psutil
```

* For Centos:

```
$ yum install gcc python-devel
$ pip install psutil
```

* 在`/admin/`中添加节点<br/>
  Add node information in `/admin`
* 将`serverinfo.py`上传至节点服务器<br/>
  Upload `serverinfo.py` on to your server.
* 修改`serverinfo.py`中`posturl`为你的站点地址，`server_id`为当前节点对应的ID（`/admin/node.php`第一列）<br/>
  In `serverinfo.py`, use your website's url as `posturl`, and use node ID (First column in `/admin/node.php`) as `server_id`.
* 运行<br/>
  Run.

```
$ python serverinfo.py //本脚本可独立于Shadowsocks服务端运行/The script can be used independently of Shadowsocks server.
```

* 如运行没有问题，请使用nohup/supervisor/screen等后台守护运行，此处不再详述
  If there are no problem running the process, please use nohup/supervisor/screen or similar tools to keep the process running in the background.

### 到期时间与套餐等相关/Information about plan_end_time && plans (and so on)

参阅：/See:

```
https://github.com/Ahref-Group/SS-Panel-smarty-Edition/issues/26
```

### 使用 mail-gun 发邮件/Send mail using mail-gun
运行/Run:

```
$ curl -sS https://getcomposer.org/installer | php
$ php composer.phar  install
```


### 感谢/Thanks
* [smarty](https://github.com/smarty-php/smarty)
* [Medoo](https://github.com/catfan/Medoo)
* [phpqrcode](https://github.com/t0k4rt/phpqrcode)
* [pingjs](https://github.com/jdfreder/pingjs)
* [material](https://github.com/Daemonite/material)
* [淘宝IP地址库](http://ip.taobao.com)
* [IPIP.NET](https://www.ipip.net)
