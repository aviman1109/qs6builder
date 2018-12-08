--minglei

delete from TsTextResource where FCode='T.Qs.Misc.InstallWordPasterInformation';
delete from TsTextResource where FCode='T.Jui.HtmlBox.WordPasterNeedUpdate';
insert into TsTextResource set FId='67db3d0b-8203-4bbb-aa4d-6b49ab6af946', FCode='T.Qs.Misc.InstallWordPasterInformation',				FValue='如果貼圖外掛程式已經成功安裝，則點擊 <img src="quicksilver/editor/ckeditor/plugins/imagepaster/images/paster.png"> 圖示，可粘貼剪切板中的圖片。如果貼圖外掛程式尚未安裝，則流覽器將提醒用戶安裝貼圖外掛程式。如果貼圖外掛程式安裝失敗，您可以 <a href="quicksilver/editor/common/wordpaster/WordPaster.zip">下載</a> 並手動安裝。<br><br>注：對於 Internet Explorer，請將當前網站加入到受信任網站，並將受信任網站的安全級別調至較低級別。';
insert into TsTextResource set FId='cb71397d-b547-4dd4-a20d-d70e9dc2ce73', FCode='T.Jui.HtmlBox.WordPasterNeedUpdate',					FValue='您的貼圖外掛程式版本較低，請更新。';
