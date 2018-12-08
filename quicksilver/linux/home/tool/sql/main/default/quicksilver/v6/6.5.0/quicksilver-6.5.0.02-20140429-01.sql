--minglei--------------------------------------------------

delete from TsTextResource where FId='41e8c865-27d1-4fb6-8e24-9103e1041af1';
delete from TsTextResource where FId='3cb33e05-eb3a-40ca-9497-13c0358098e6';
insert into TsTextResource set FId='41e8c865-27d1-4fb6-8e24-9103e1041af1', FCode='T.Qs.Browser.PopupWindowBlocked',						FValue='流覽器攔截了快顯視窗。請調整流覽器設置，允許當前網站快顯視窗。';
insert into TsTextResource set FId='3cb33e05-eb3a-40ca-9497-13c0358098e6', FCode='T.Qs.Browser.NotSupported',							FValue='系統不支援您的流覽器。我們推薦您採用最新版本的 <a href="http://www.google.com/intl/zh-TW/chrome/browser">Chrome</a> 流覽器訪問本系統。您也可以採用：<div class=BrowserList><li>最新版本的 Firefox 瀏覽器</li><li>Internet Explorer 10 或更高版本的 IE 流覽器</li><li>其它基於最新版本的 Blink、WebKit 或 Trident 內核的流覽器</li></div>';
