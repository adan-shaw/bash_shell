
##############################################################
# user_manage: 用户管理工具(查询)
# usage:
# ./user_manage [help|number]
# 1.查看安装历史
# 2.查看登录统计(偏时间)
# 3.查看用户使用的进程组状态
# 4.查看各个用户输入的命令的last top
##############################################################
function help(){
  echo "
# user_manage: 用户管理工具(查询)
# usage:
# ./user_manage [help|number]
# 1.查看安装历史
# 2.查看登录统计(偏时间)
# 3.查看用户使用的进程组状态
# 4.查看各个用户输入的命令的last top
"
  return
}
if [ $# == "0" ];then
  (help)
  exit
fi
if [ $# == "1" ];then
  case $1 in
  1)
    echo "安装历史"
    cat /root/.bash_history | grep "apt-get install"
    ;;
  2)
    echo "当月登录时间简表"
    ac -d
    echo "登录总耗时"
    ac -p
    ;;
  3)
    echo "用户的进程资源消耗简表"
    sa -m
    ;;
  4)
    echo "各个用户输入的命令的last top"
    lastcomm
    ;;
  "help")
    (help)
    ;;
  *)
    (help)
    ;;
  esac
  
  exit
fi
if [ $# -gt "2" ];then
  (help)
  exit
fi

