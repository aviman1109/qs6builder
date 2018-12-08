使用说明

    系统支持 Tomcat 和 WildFly 两种应用服务器。Tomcat 仅用于非正式环境，对于正
    环境，请在安装时选择 WildFly。本文以下内容，均针对 WildFly。

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
       是否已正确设置（设置其中一个即可）。系统要求 Java 版本为不低于 6。如尚未
       设置，添加 JRE_HOME 环境变量，并指向系统安装目录下的 jre 目录即可。
    2) 进入 apache-tomcat/bin，双击 service-install.bat，即可将系统设置为服务。
       默认情况下，服务为手工启动。如需开机自动启动，请在服务管理界面对其进行设
       置。

2 使用与管理

2.1 使用

    通过 IE 浏览器访问 http://127.0.0.1:${Ets.Install.Port.Http}/${Ets.Install.AppName}
    登录名：administrator
    密　码：111111
    
    注意：
    1) 目前必须通过 IE 浏览器进行访问
    2) 如果您的 IE 版本为 IE10，请打开登录页后，按 F12，在下方出现的“文档模式”
       处，选择“Internet Explorer 5 Quirks”

2.2 Tomcat 管理

    如需了解 Tomcat 运行状况或对其进行管理，请访问：http://127.0.0.1:${Ets.Install.Port.Http}/manager
    登录名：administrator
    密　码：111111

3 内存调整

    如运行过程中遇到内存溢出的错误，需要调整内存大小。根据启动方式不同，需要采用
    不同的方式。

3.1 命令行方式

    如采用命令行方式启动，可修改 server.bat 的“set CATALINA_OPTS”行，对启动参数
    进行修改。参数含义：

    Xms：启动时第一时间占用的内存
    Xmx：运行过程中，允许使用的最大内存
    XX:PermSize：启动时，永久区第一时间占用的内存
    XX:MaxPermSize：启动时，允许永久区使用的最大内存

    根据需要，也可以增加其它启动参数，具体可参考网络。

3.2 服务方式

    如采用服务方式启动，可编辑 apache-tomcat/bin/service-update.bat，对其中的内
    存参数的数字进行修改。参数含义参考命令行方式。
