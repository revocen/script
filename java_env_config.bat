@ ECHO OFF
@ ECHO.
COLOR 0a
@ ECHO. 说 明
cd /d %~dp0
@ ECHO --------------------------------------------------------------------
@ ECHO 重要：本文件需放在jdk的安装目录下，如：D:\Program Files\Java\jdk1.6.0_30
@ ECHO --------------------------------------------------------------------
@ ECHO 本批处理执行后，将作以下一些设置,确认后继续：
@ ECHO 0、indow7及Windows Server 2008系统需要以管理员权限打开
@ ECHO 1、设置JAVA_HOME 环境变量%cd%
@ ECHO 2、设置PATH 环境变量%cd%\bin;%PATH%;
@ ECHO 3、设置CLASSPATH 环境变量 .;%cd%\lib\tools.jar;%cd%\lib\dt.jar
@ ECHO 4、Window7及Windows Server 2008系统可能需要重启生效
@ ECHO --------------------------------------------------------------------
@ ECHO.

PAUSE

@ ECHO 获取Java安装目录...
set CURRENT_DIR=%cd%
@ ECHO.

@ ECHO 如果有的话，先删除JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete
@ ECHO.

@ ECHO 如果有的话，先删除CLASSPATH 
wmic ENVIRONMENT where "name='CLASSPATH'" delete
@ ECHO.

@ ECHO 创建JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%CURRENT_DIR%"
@ ECHO 设置后的JAVA_HOME=%cd%
@ ECHO.

@ ECHO 创建CLASSPATH
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\bin;"
@ ECHO 设置后的CLASSPATH=.;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\bin;
@ ECHO.

@ ECHO 将Java的Path附加到系统Path中
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;%Path%"
@ ECHO 设置后的Path=%%JAVA_HOME%%\bin;%Path%
@ ECHO.

@ ECHO JAVA环境变量配置完成
@ ECHO.

PAUSE
