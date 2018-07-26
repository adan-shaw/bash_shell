##############################################################
# 扫描某个指定网段内的所有机器的ip (最好是局域网)--c 类网
# 注意:
# 外网也可以扫, 但是速度慢, 最好还是不要扫外网...
# a b 类就别想了, 扫到天黑都扫不完, 扫完了你也看不完这么多...
##############################################################
#!/bin/bash
function help(){
  echo "
  扫描某个指定网段内的所有机器的ip
  usage:
  ./search_ip_addr.sh [help|start]

  quickly demo:
  ./search_ip_addr.sh 127.0.0 25 or ./search_ip_addr.sh 127.0.0
  # search 127.0.0.x network segment
  # ping ip addr for 25ms
  # default: 25ms"
  return
}
#
net_ip=""
count="0" # 去除0 广播位和255 位... 起始位为 0+1=1
timeout="25"
pint_times="1"
ping_count_max="255"
#
if [ $# == "0" ];then
  (help)
  exit
fi
if [ $# -gt "3" ];then
  (help)
  exit
fi
if [ $# == "2" ];then
  timeout=$2
fi
net_ip=$1
echo ""
echo "*ip network segment:" "$net_ip"".x"
echo "*timeout:" "$timeout" "ms"
echo ""
echo ""
#
transmitted="0"
received="0"
loss="0"
good="0"
bad="0"
while : 
do  
  count=$(($count+1))
  if test $count -gt $ping_count_max;then # if ($count 大于 255) then
    break # 退出
  else
    # 只ping 一次, 每次timeout 25 ms, 如果不在同一个内网, timeout 应该大于80ms
    transmitted_tmp="0"
    received_tmp="0"
    ip_addr_tmp="$net_ip.""$count"
    tmp=$(ping -c $pint_times -W $timeout $ip_addr_tmp)
    tmp2="1 packets transmitted"
    if [[ $tmp == *$tmp2* ]];then # 通配比对
      transmitted=$(($transmitted+1))
      transmitted_tmp="1"
    fi
    tmp2="1 received"
    if [[ $tmp == *$tmp2* ]];then
      transmitted=$(($transmitted+1))
      received_tmp="1"
    fi
    tmp2=" 0% packet loss"
    if [[ $tmp == *$tmp2* ]];then # ping 顺畅的ip addr
      good=$(($good+1))
    fi
    tmp2=" 100% packet loss"
    if [[ $tmp == *$tmp2* ]];then
      bad=$(($bad+1))
    fi
    echo "ping " $net_ip.$count "  transmitted:" $transmitted_tmp "  received:" $received_tmp
  fi
done
echo ""
echo ""
echo "search result:"
echo "****************************************"
echo "good count :" $good
echo "bad count :" $bad
echo "****************************************"




