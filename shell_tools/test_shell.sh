##############################################################
# test_shell: 循环测试工具demo
# usage:
# ./test_shell 9999 1 "curl 127.0.0.1:80"
# 你可以输入复杂的测试语句, 
# 或者自己修改./test_shell.sh 里面的test_shell="" 变量, 指定一个新语句
##############################################################
#!/bin/bash
function help(){
  echo "
# test_shell: 循环测试工具demo
# usage:
# ./test_shell 9999 1 \"curl 127.0.0.1:80\"
# 你可以输入复杂的测试语句, 
# 或者自己修改./test_shell.sh 里面的test_shell=\"\" 变量, 指定一个新语句

"
  return
}
#
# 执行的测试命令
test_shell=""
#
#
if [ $# == "0" ];then
  (help)
  exit
fi
if [ $# == "1" ];then
  (help)
  exit
fi
if [ $# == "2" ];then
  (help)
  exit
fi
if [ $# -gt "4" ];then
  (help)
  exit
fi
test_count=$1
sleep_count=$2
test_shell=$3
#
echo ""
echo "*test target:" "$test_shell"
echo "*test count:" "$test_count"
echo ""
xstart=$(date)
#
tmp=$test_count
while true
do
$test_shell
sleep $sleep_count
if test $tmp = "0";then
	break
fi
let tmp=tmp-1
done
xfinish=$(date)
#
sleep 1
echo ""
echo ""
echo "************************************"
echo "<< test report >>"
echo "start at :" $xstart
echo "finish at:" $xfinish
echo "test count:"$test_count
echo "test shell:"
echo "<: $test_shell :>"
echo "************************************"
