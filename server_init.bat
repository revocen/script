# 服务器部署，一键新建文件夹


# 安装文件目录
md package
echo 安装文件 >> package/安装文件

# 服务所在目录
md server
echo 服务 >> server/服务

# 数据库文件目录
md db
echo 数据库文件 >> db/数据库文件
cd db
md bak
md mysql
echo 数据库备份文件 >> bak/数据库备份文件
cd ..

# 已安装程序目录
md pf
echo 已安装程序 >> pf/已安装程序
cd pf
md java
echo java各版本根目录 >> java/java各版本根目录
cd ..