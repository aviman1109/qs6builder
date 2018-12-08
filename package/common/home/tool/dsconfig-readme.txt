資料庫初始化說明

如果不使用系統自帶的 H2 資料庫，則需要執行對資料庫進行初始化。
執行前需要做以下工作：

1、檢查 ${Ets.Install.ProductName} 伺服器是否在運行。如果正在運行，則將其關閉
2、創建新的資料庫。請不要使用已經初始化過的資料庫重新初始化，以免造成資料丟失。
   目前系統支援 DB2、Oracle、SQL Server、PostgreSQL 和 H2 五種資料庫，請注意以
   下事項：
   - 如果使用 DB2，請選用 UTF-8 字元集，並使用大小為 32K 的緩衝集區
   - 如果使用 PostgreSQL，需要修改資料庫安裝目錄中的 data/postgresql.conf 文
     件，將 standard_conforming_strings 設為 on。如果需要在遠端存取資料庫，需
     要修改 data/pg_hba.conf，將 IPv4 的 ADDRESS 設置為 0.0.0.0/0。
     注意：修改完畢後，需重新開啟 PostgreSQL 的服務
3、執行 dsconfig，打開資料來源配置工具
4、在“主資料來源”頁修改資料來源資訊。包括資料庫類型、URL、用戶名、密碼等
5、點擊“初始化”。如果初始化失敗，可按照提示查找問題原因

以上步驟完成後，可啟動 ${Ets.Install.ProductName} 伺服器並登錄系統。
