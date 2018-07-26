# 这个shell 用来检查linux 系统的配置信息:
#
##########
# 函数列表
##########
# 帮助函数
function help(){
  echo "
  （1）查看主机型号信息and 主板信息
  （2）查看BIOS信息
  （3）查看内存槽及内存条信息
  （4）查看网卡信息
  （5）查看pci信息
  （6）查看CPU的硬件简要信息
  （7）查看CPU的硬件详细信息
  （8）查看CPU的设计规格信息
  （9）查看硬盘信息
  （10）查看系统详细的分区挂载状态
  "
  return # 在shell 里面, 自定义函数最好不要有返回值
}
#
#
#
# 1.参数输入检查(没有参数拒绝服务) 
if [ $# == "0" ]
then
  (help)
  exit
else
  for i in $@; # 循环获取输入参数
  do
    case $i in
    1)
      echo "主机型号信息and 主板信息如下(一般指主板里面的信息)：";
      dmidecode |grep -A16 "System Information$" 
      ;;
    2)
      echo "BIOS信息如下：";
      dmidecode -t bios
      ;;
    3)
      echo "正在使用的内存槽信息简要：";
      dmidecode -t memory | head -45 | tail -24
      echo "";
      echo "当前系统可容纳内存容量值(MAX)：";
      dmidecode|grep -P 'Maximum\s+Capacity'
      echo "";
      echo "当前内存已经载入的内存容量：";
      dmidecode|grep -A5 "Memory Device"|grep Size|grep Range
      echo "";
      echo "当前内存插槽的频率:";
      dmidecode|grep -A16 "Memory Device"|grep 'Speed'
      echo "";
      echo "当前内存的详细信息:";
      cat /proc/meminfo |head -20
      echo "";
      ;;
    4)
      echo "当前网卡硬件信息:"
      lspci | grep -i 'eth'
      echo ""
      echo ""
      echo "当前系统的所有网卡配置信息简要:"
      ifconfig -a
      ;;
    5)
      echo "当前系统大部分的pci 设备信息：";
      lspci -tv | more
      ;;
    6)
      echo "CPU的cpu型号：";
      cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
      echo "";
      echo "CPU的CPU的数量：";
      grep 'physical id' /proc/cpuinfo | sort | uniq | wc -l
      echo "";
      echo "CPU的线程数：";
      cat /proc/cpuinfo |grep 'processor'|wc -l
      echo "";
      echo "CPU的核数：";
      cat /proc/cpuinfo |grep "cores"|uniq 
      echo "";
      echo "CPU的主频：";
      cat /proc/cpuinfo |grep MHz|uniq 
      echo "";
      echo "cpu的运行模式："
      getconf LONG_BIT
      echo "";
      echo "cpu是否支持64bit(结果大于0, 说明支持64bit计算. lm指long mode, 支持lm则是64bit)："
      cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l
      echo "";
      ;;
    7)
      echo "CPU的硬件详细信息如下：";
      cat /proc/cpuinfo | head -20
      ;;
    8)
      echo "CPU的设计规格信息如下：";
      lscpu
      ;;
    9)
      echo "当前硬盘和分区分布";
      lsblk
      echo "";
      echo "当前硬盘和分区的详细信息";
      fdisk -l 
      echo "";
      echo "当前系统的交换分区状态";
      swapon -s
      echo "";
      echo "当前硬盘使用情况";
      df -hT
      echo "";
      ;;
    10)
      echo "当前系统详细的分区挂载状态";
      mount | column -t
      ;;
    *)
      echo ""
      echo ""
      echo ""
      echo "unknow input, exit!!";
      echo ""
      (help)
      exit
      ;;
    esac # shell case end
  done # shell for end
fi



