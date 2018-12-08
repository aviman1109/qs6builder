insert into TsDepartment set FId='00000000-0000-0000-1001-000000000002', FParentId='00000000-0000-0000-1001-000000000001', FIndex=1, FName='總部',			FFullName='總部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000003', FParentId='00000000-0000-0000-1001-000000000001', FIndex=2, FName='北京分公司',	FFullName='北京分公司',	FUserId='00000000-0000-0000-1002-000000000006';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000004', FParentId='00000000-0000-0000-1001-000000000001', FIndex=3, FName='上海分公司',	FFullName='上海分公司',	FUserId='00000000-0000-0000-1002-000000000007';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000005', FParentId='00000000-0000-0000-1001-000000000001', FIndex=4, FName='廣州分公司',	FFullName='廣州分公司',	FUserId='00000000-0000-0000-1002-000000000010';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000006', FParentId='00000000-0000-0000-1001-000000000001', FIndex=5, FName='深圳分公司',	FFullName='深圳分公司',	FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000007', FParentId='00000000-0000-0000-1001-000000000002', FIndex=1, FName='研發中心',		FFullName='研發中心',	FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000008', FParentId='00000000-0000-0000-1001-000000000002', FIndex=2, FName='財務部',		FFullName='財務部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000009', FParentId='00000000-0000-0000-1001-000000000002', FIndex=3, FName='市場部',		FFullName='財務部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000010', FParentId='00000000-0000-0000-1001-000000000007', FIndex=1, FName='需求部',		FFullName='需求部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000011', FParentId='00000000-0000-0000-1001-000000000007', FIndex=2, FName='開發部',		FFullName='開發部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000012', FParentId='00000000-0000-0000-1001-000000000007', FIndex=3, FName='測試部',		FFullName='測試部',		FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000013', FParentId='00000000-0000-0000-1001-000000000011', FIndex=1, FName='CRM開發組',		FFullName='CRM開發組',	FUserId='00000000-0000-0000-1002-000000000001';
insert into TsDepartment set FId='00000000-0000-0000-1001-000000000014', FParentId='00000000-0000-0000-1001-000000000011', FIndex=2, FName='HR開發組',		FFullName='HR開發組',	FUserId='00000000-0000-0000-1002-000000000001';

java refreshSerial('TsDepartment');

insert into TsUser set FId='00000000-0000-0000-1002-000000000002', FName='張偉',	FLoginName='wei.zhang',		FDepartmentId='00000000-0000-0000-1001-000000000002', FBirthday=date('1971-02-03'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13888888888', FEmail='wei.zhang@chainsea.com.tw',	FDuty='總經理', FIndex=1;
insert into TsUser set FId='00000000-0000-0000-1002-000000000003', FName='王勇',	FLoginName='yong.wang',		FDepartmentId='00000000-0000-0000-1001-000000000002', FBirthday=date('1976-12-22'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13812345678', FEmail='yong.wang@chainsea.com.tw',	FDuty='副總經理', FIndex=2;
insert into TsUser set FId='00000000-0000-0000-1002-000000000004', FName='周娜',	FLoginName='na.zhou',		FDepartmentId='00000000-0000-0000-1001-000000000002', FBirthday=date('1982-04-06'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='2', FMobile='13999999999', FEmail='na.zhou@chainsea.com.tw',		FDuty='副總經理', FIndex=3;
insert into TsUser set FId='00000000-0000-0000-1002-000000000005', FName='李傑',	FLoginName='jie.li',		FDepartmentId='00000000-0000-0000-1001-000000000002', FBirthday=date('1976-03-23'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='18666666666', FEmail='jie.li@chainsea.com.tw',		FDuty='銷售總監', FIndex=4;
insert into TsUser set FId='00000000-0000-0000-1002-000000000006', FName='吳娟',	FLoginName='juan.wu',		FDepartmentId='00000000-0000-0000-1001-000000000003', FBirthday=date('1981-04-13'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='2', FMobile='18888888888', FEmail='juan.wu@chainsea.com.tw',		FDuty='市場總監', FIndex=5;
insert into TsUser set FId='00000000-0000-0000-1002-000000000007', FName='馬明',	FLoginName='ming.ma',		FDepartmentId='00000000-0000-0000-1001-000000000004', FBirthday=date('1988-08-14'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='18312345678', FEmail='ming.ma@chainsea.com.tw',		FDuty='運營總監', FIndex=6;
insert into TsUser set FId='00000000-0000-0000-1002-000000000008', FName='王濤',	FLoginName='tao.wang',		FDepartmentId='00000000-0000-0000-1001-000000000004', FBirthday=date('1986-09-21'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13612341234', FEmail='tao.wang@chainsea.com.tw',	FDuty='研發總監', FIndex=7;
insert into TsUser set FId='00000000-0000-0000-1002-000000000009', FName='杜超',	FLoginName='chao.du',		FDepartmentId='00000000-0000-0000-1001-000000000005', FBirthday=date('1991-02-11'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13800000000', FEmail='chao.du@chainsea.com.tw',		FDuty='部門經理', FIndex=8;
insert into TsUser set FId='00000000-0000-0000-1002-000000000010', FName='趙宇',	FLoginName='yu.zhao',		FDepartmentId='00000000-0000-0000-1001-000000000005', FBirthday=date('1984-05-20'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13898765432', FEmail='yu.zhao@chainsea.com.tw',		FDuty='部門經理', FIndex=9;
insert into TsUser set FId='00000000-0000-0000-1002-000000000011', FName='陳平',	FLoginName='ping.chen',		FDepartmentId='00000000-0000-0000-1001-000000000007', FBirthday=date('1986-08-16'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13012345678', FEmail='ping.chen@chainsea.com.tw',	FDuty='專案經理', FIndex=10;
insert into TsUser set FId='00000000-0000-0000-1002-000000000012', FName='鄭菲',	FLoginName='fei.zheng',		FDepartmentId='00000000-0000-0000-1001-000000000012', FBirthday=date('1990-01-24'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='18688888888', FEmail='fei.zheng@chainsea.com.tw',	FDuty='專案經理', FIndex=11;
insert into TsUser set FId='00000000-0000-0000-1002-000000000013', FName='劉穎',	FLoginName='ying.liu',		FDepartmentId='00000000-0000-0000-1001-000000000012', FBirthday=date('1981-03-23'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='18388888888', FEmail='ying.liu@chainsea.com.tw',	FDuty='開發人員', FIndex=12;
insert into TsUser set FId='00000000-0000-0000-1002-000000000014', FName='朱鵬',	FLoginName='peng.zhu',		FDepartmentId='00000000-0000-0000-1001-000000000011', FBirthday=date('1969-12-21'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='18812345668', FEmail='peng.zhu@chainsea.com.tw',	FDuty='開發人員', FIndex=13;
insert into TsUser set FId='00000000-0000-0000-1002-000000000015', FName='楊昊',	FLoginName='hang.yang',		FDepartmentId='00000000-0000-0000-1001-000000000011', FBirthday=date('1984-12-13'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13885445668', FEmail='hang.yang@chainsea.com.tw',	FDuty='開發人員', FIndex=14;
insert into TsUser set FId='00000000-0000-0000-1002-000000000016', FName='汪立',	FLoginName='li.wang',		FDepartmentId='00000000-0000-0000-1001-000000000011', FBirthday=date('1989-02-28'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13931334448', FEmail='li.wang@chainsea.com.tw',		FDuty='銷售人員', FIndex=15;
insert into TsUser set FId='00000000-0000-0000-1002-000000000017', FName='段峰',	FLoginName='feng.duan',		FDepartmentId='00000000-0000-0000-1001-000000000010', FBirthday=date('1984-07-31'), FPassword='PU8r8H3BvjiyDNbkaUmhBx+dDj0=', FGender='1', FMobile='13566666888', FEmail='feng.duan@chainsea.com.tw',	FDuty='銷售人員', FIndex=16;

update TsSystemParameter set FValue='smtp.163.com' where FKey='QsSmtpServer';
update TsSystemParameter set FValue='pop.163.com' where FKey='QsPop3Server';
update TsSystemParameter set FValue='sys20101101@163.com' where FKey='QsSystemEmail';
update TsSystemParameter set FValue='Quicksilver' where FKey='QsSystemEmailSenderName';
update TsSystemParameter set FValue='vFdQ/LkySmCbOVmRMR0BXg==' where FKey='QsSystemEmailPassword';
