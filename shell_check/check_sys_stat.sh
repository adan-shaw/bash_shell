#!/bin/bash
#获取cpu 状态
function get_cpu_stat 
{
   CpuIdle=$(vmstat 1 5|sed -n '3,$p'|awk '{x=x+ $15} END{print x/5}'|awk -F. '{print $1}')
   CpuNum=$((100-$CpuIdle))
   echo $CpuNum 
}
cpu=$(get_cpu_stat)
echo "system cpu now unilization ratio is $cpu%"
#判断cpu 使用率是否超过90%
if [ $cpu -gt 90 ];then
  echo "the usage of system cpu is larger than 90%" 
else
  echo "the usage of system cpu is normal" 
fi
echo ""
#
#查看系统信息
#
#
os=$(uname -o)
echo "operateing system type:$os"
echo ""
#查看内核版本
kernel=$(uname -r)
echo "kernel version:$kernel"
echo ""
#查看主机名
hostname=$(uname -n)
echo "hostname:$hostname"
echo ""
#查看本机ip
local_ip=$(hostname -I)
echo "local network ip address:$local_ip"
echo ""
#查看dns 服务器 = name server
dns=$(cat /etc/resolv.conf |egrep "nameserver[ ]+"|awk '{print $2}')
echo "dns server:$dns"
echo ""
#测试链接百度
ping -c 4 www.baidu.com  &>/dev/null &&echo "internet:connected"||echo "intetnet:disconnected"
echo ""
#登录的用户
who > /tmp/who
echo "logging users already:"&& cat /tmp/who
rm -rf /tmp/who
echo ""
#查看当前的系统内存使用状态
system_mem_used=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free)/1024}' /proc/meminfo)
echo "system memory used now:$system_mem_used"
echo ""
#查看当前的app内存使用状态
app_mem_used=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
echo "application memory used now:$app_mem_used"
echo ""
#
loadaverage=$(top -n 1|grep "load average"|awk '{print $10,$11,$12}')
echo "load average:$loadaverage"
echo ""
#磁盘使用率
diskaverage=$(df -hP |egrep -v "Filesystem|tmpfs"|awk '{print $1,$5}')
echo -e "disk average:\n$diskaverage"
echo ""
