A simple front end of [Shadowsocks manyuser](https://github.com/mengskysama/shadowsocks/tree/manyuser)
This Version is based on xuanhuan's [SS-Panel-smarty](https://github.com/xuanhuan/ss-panel)
SS-Panel-smarty-Edition
========

!Important!
========
This edition requires Chrome or FireFox for compatible functioning and surfing.

Please configure the config.php in /lib, set $site_url as your Website address, assure that it contains a "/" in the back.

Make sure that Lib/Ss has the autherize to read& write. If not, please set for convenient.

========
### AdminSystem 

Please use the invite code to register and set your account as admin in you database.

新版密码加密方式说明
========

Please change the encrypted salt in /lib/config.php
we offer「salt sha256」encryt

Attention to：

* the $salt can not be changed after been set!
* 如果原来为2.4之前的版本，需要将pass字段的长度修改为64


* 增加 Nginx 的配置文件 tpl.conf，用于防止直接访问模板文件。 放在当前网站Nginx 配置文件相同目录，然后打开原来的配置文件，找到当前域名的server { } 在里面粘贴：include tpl.conf;
* 增加Apache 的配置文件 .htaccess，用于防止直接访问模板文件，放在当前目录。

[中文安装文档](https://github.com/orvice/ss-panel/wiki/Install-Guide-zh_cn)

### Upgrade from 0.X

[Read this](https://github.com/orvice/ss-panel/blob/master/upgrade_to_v2.md)

### Requirements
* PHP >= 5.4
* PDO Extension
* MCrypt Extension
* Mysql >= 5.1

### Install
* Import sql/*.sql to your MySQL Database
* Rename lib/config-sample.php && lib/Ss/Code/config-sample.php to config.php,and edit the infomation in lib/config.php.

* IMPORTANT:DON'T MANUALLY change lib/Ss/Code/config.php after doing above!
* IMPORTANT:DON'T MANUALLY change lib/Ss/Code/config.php after doing above!
* IMPORTANT:DON'T MANUALLY change lib/Ss/Code/config.php after doing above!

* Enjoy it.

### Admin
* The user who uid is 1 is Admin by default.
* You can Add User ID into table 'ss_user_admin'

### Send mail using mail-gun
Run:

```
$ curl -sS https://getcomposer.org/installer | php
$ php composer.phar  install
```


### Thanks to
* [smarty](https://github.com/smarty-php/smarty)
* [Medoo](https://github.com/catfan/Medoo)
* [phpqrcode](https://github.com/t0k4rt/phpqrcode)
* [pingjs](https://github.com/jdfreder/pingjs)
* [material](https://github.com/Daemonite/material)
