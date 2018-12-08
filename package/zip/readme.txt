apache-tomcat-linux：
	Tomcat 8.x tar.gz 版
	在 Linux 中解压，去除 docs 和 examples，目录改名为 apache-tomcat，压缩为 zip

apache-tomcat-windows：
	Tomcat 8.x Windows 64 位版
	去除 docs 和 examples，目录改名为 apache-tomcat，压缩为 zip

jre-linux-64.zip：
	JRE 7u55 Linux 64 位 tar.gz 版
	在 Linux 中解压，目录名改为 jre，压缩为 zip

jre-windows-64.zip：
	JRE 7u55 Windows 64 位 tar.gz 版
	解压，目录名改为 jre，压缩为 zip

注：如果采用更高版本的 JRE，会使得执行 extract、upgrade 等命令时，命令行窗口不在第一时间自动关闭。所以暂时使用 7u55，不采用更高版本的 JRE。