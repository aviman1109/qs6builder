#!python2.7
# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
# Name:        模块1
# Purpose:
#
# Author:      Ask
#
# Created:     25/04/2018
# Copyright:   (c) Ask 2018
# Licence:     <your licence>
#-------------------------------------------------------------------------------


import sys
reload(sys)
sys.setdefaultencoding('utf-8')
if __name__ =='__main__':
    if len(sys.argv)>1:
        transNo = sys.argv[1]
        import requests
        import urllib3
        urllib3.disable_warnings()
        from requests.packages.urllib3.exceptions import InsecureRequestWarning  ##https
        url = "https://175.184.247.67:443/ipaymentGW/transAPI/queryAPI"

        payload = "{\"sysId\":\"MBill\",\"transNo\":\"%s\"}"%transNo

        headers = {
            'Content-Type': "application/json",
            'Cache-Control': "no-cache",
            'Postman-Token': "e57151d3-6049-43be-8911-4c9865a4d610",
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'
            }

        response = requests.post(url, data=payload, headers=headers, verify=False)
        print(response.text)
    else:
        print '{"returnCode":"error","returnMsg":"輸入錯誤"}'















