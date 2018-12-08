使用说明

1 系统启动

    系统支持通过命令行方式和通过服务方式启动。

1.1 命令行方式启动

1.1.1 Windows

    双击或在命令行下执行 server.bat。

1.1.2 Linux

    在命令行下执行 server.sh。

1.2 服务方式启动

1.2.1 Windows

    1) 首先打开 Windows 的环境变量设置界面，检查 JAVA_HOME 或 JRE_HOME 系统变量
       是否已正确设置（设置其中一个即可）。系统要求 Java 版本为不低于 7。如尚未
       设置，添加 JRE_HOME 环境变量，并指向系统安装目录下的 jre 目录即可。
    2) 进入 apache-tomcat/bin，双击 service-install.bat，即可将系统设置为服务。
       默认情况下，服务为手工启动。如需开机自动启动，请在服务管理界面对其进行设
       置。

2 使用

    通过浏览器访问 http://127.0.0.1:${Ets.Install.Port.Http}/${Ets.Install.AppName}
    登录名：administrator
    密　码：111111
    
    注意：系统不支持 IE9 及更低版本的 IE 浏览器。请通过 Chrome、Firefox、IE10+ 等
    较新的浏览器访问。

3 内存调整

    如运行过程中遇到内存溢出的错误，需要调整内存大小。根据启动方式不同，需要采用
    不同的方式。

3.1 命令行方式

    如采用命令行方式启动，可修改 server.bat/server.sh 的 CATALINA_OPTS 行，对启动
    参数进行修改。参数含义：

    Xms：启动时第一时间占用的内存
    Xmx：运行过程中，允许使用的最大内存
    XX:PermSize：启动时，永久区第一时间占用的内存
    XX:MaxPermSize：启动时，允许永久区使用的最大内存

    根据需要，也可以增加其它启动参数，具体可参考网络。

3.2 服务方式

    如采用服务方式启动，可编辑 apache-tomcat/bin/service-update.bat，对其中的内
    存参数的数字进行修改。参数含义参考命令行方式。
