@ ECHO OFF
@ ECHO.
COLOR 0a
@ ECHO. ˵ ��
cd /d %~dp0
@ ECHO --------------------------------------------------------------------
@ ECHO ��Ҫ�����ļ������jdk�İ�װĿ¼�£��磺D:\Program Files\Java\jdk1.6.0_30
@ ECHO --------------------------------------------------------------------
@ ECHO ��������ִ�к󣬽�������һЩ����,ȷ�Ϻ������
@ ECHO 0��indow7��Windows Server 2008ϵͳ��Ҫ�Թ���ԱȨ�޴�
@ ECHO 1������JAVA_HOME ��������%cd%
@ ECHO 2������PATH ��������%cd%\bin;%PATH%;
@ ECHO 3������CLASSPATH �������� .;%cd%\lib\tools.jar;%cd%\lib\dt.jar
@ ECHO 4��Window7��Windows Server 2008ϵͳ������Ҫ������Ч
@ ECHO --------------------------------------------------------------------
@ ECHO.

PAUSE

@ ECHO ��ȡJava��װĿ¼...
set CURRENT_DIR=%cd%
@ ECHO.

@ ECHO ����еĻ�����ɾ��JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete
@ ECHO.

@ ECHO ����еĻ�����ɾ��CLASSPATH 
wmic ENVIRONMENT where "name='CLASSPATH'" delete
@ ECHO.

@ ECHO ����JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%CURRENT_DIR%"
@ ECHO ���ú��JAVA_HOME=%cd%
@ ECHO.

@ ECHO ����CLASSPATH
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\bin;"
@ ECHO ���ú��CLASSPATH=.;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\bin;
@ ECHO.

@ ECHO ��Java��Path���ӵ�ϵͳPath��
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;%Path%"
@ ECHO ���ú��Path=%%JAVA_HOME%%\bin;%Path%
@ ECHO.

@ ECHO JAVA���������������
@ ECHO.

PAUSE
