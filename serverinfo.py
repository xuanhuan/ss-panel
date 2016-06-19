#coding=utf8

posturl = 'http://your.domain.com/serverinfo.php'
server_id = 1

import sys
import os 

import atexit
import time 
import psutil
import urllib
import urllib2

def postdata(load, cpu, u, d):
    para_data = {}
    para_data['id']=server_id
    para_data['method']='update'
    para_data['load']=load
    para_data['cpu']=cpu
    para_data['upload']=u
    para_data['download']=d
    para_data=urllib.urlencode(para_data)
    f = urllib2.urlopen(posturl, para_data)
    content=f.read()
    return content

def bytes2human(n):    
        """   
        >>> bytes2human(10000)   
        '9.8 K'   
        >>> bytes2human(100001221)   
        '95.4 M'   
        """    
        symbols = ('K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y')    
        prefix = {}    
        for i, s in enumerate(symbols):    
                prefix[s] = 1 << (i+1)*10    
        for s in reversed(symbols):    
                if n >= prefix[s]:    
                        value = float(n) / prefix[s]    
                        return '%.2f %s' % (value, s)    
        return '%.2f B' % (n)
        
def load_stat():
    loadavg = {}
    f = open("/proc/loadavg")
    con = f.read().split()
    f.close()
    loadavg['lavg_1']=con[0]
    loadavg['lavg_5']=con[1]
    loadavg['lavg_15']=con[2]
    loadavg['nr']=con[3]
    loadavg['last_pid']=con[4]
    return loadavg 

while 1:
    time.sleep(2)
    tol = psutil.net_io_counters()
    cpu = str(psutil.cpu_percent(1))+'%'
    cul = psutil.net_io_counters()
    load = load_stat()['lavg_1']
    upload = bytes2human(cul[0] - tol[0])+'/S'
    download = bytes2human(cul[1] - tol[1])+'/S'
    #os.system("clear")
   # print 'CPU'+str(cpu)
   # print '上传速度：'+ upload
   # print '下载速度：'+download
   # print '一分钟负载:'+load
    postdata(load, cpu, upload, download)
    
