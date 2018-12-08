使用說明

1 系統啟動

    系統支援通過命令列方式和通過服務方式啟動。

1.1 命令列方式啟動

1.1.1 Windows

    按兩下或在命令列下執行 server.bat。

1.1.2 Linux

    在命令列下執行 server.sh。

1.2 服務方式啟動

1.2.1 Windows

    1) 首先打開 Windows 的環境變數設置介面，檢查 JAVA_HOME 或 JRE_HOME 系統變數
       是否已正確設置（設置其中一個即可）。系統要求 Java 版本為不低於 7。如尚未
       設置，添加 JRE_HOME 環境變數，並指向系統安裝目錄下的 jre 目錄即可。
    2) 進入 apache-tomcat/bin，按兩下 service-install.bat，即可將系統設置為服務。
       預設情況下，服務為手工啟動。如需開機自動啟動，請在服務管理介面對其進行設
       置。

2 使用

    通過流覽器訪問 http://127.0.0.1:${Ets.Install.Port.Http}/${Ets.Install.AppName}
    登錄名：administrator
    密　碼：111111
    
    注意：系統不支援 IE9 及更低版本的 IE 流覽器。請通過 Chrome、Firefox、IE10+ 等
    較新的流覽器訪問。

3 記憶體調整

    如運行過程中遇到記憶體溢出的錯誤，需要調整記憶體大小。根據啟動方式不同，需要採
    用不同的方式。

3.1 命令列方式

    如採用命令列方式啟動，可修改 server.bat/server.sh 的 CATALINA_OPTS 行，對啟動
    參數進行修改。參數含義：

    Xms：啟動時第一時間佔用的記憶體
    Xmx：運行過程中，允許使用的最大記憶體
    XX:PermSize：啟動時，永久區第一時間佔用的記憶體
    XX:MaxPermSize：啟動時，允許永久區使用的最大記憶體

    根據需要，也可以增加其它啟動參數，具體可參考網路。

3.2 服務方式

    如採用服務方式啟動，可編輯 apache-tomcat/bin/service-update.bat，對其中的內
    存參數的數位進行修改。參數含義參考命令列方式。
