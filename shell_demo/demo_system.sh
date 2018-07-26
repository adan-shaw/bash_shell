#shell 比lua 优秀的地方:
#1. 功能全面, 系统的功能可以随意调用, 切合度高, 效率也是脚本里面最高的, 但是运算能力很低...
#
#2. 弱类型编程简直出神入化, 很牛逼, 地位跟cpp 一样是一个始祖, 正因为如此才更复杂...可挑战python...
#
#
#lua 比shell 好的地方:
#1. 运算速度, 便捷性都很强, lua 就是一个运算型脚本, 有很多运算特性...
#
#2. 跟c 的亲源植入功能也是lua 的一大亮点...
#!/bin/bash
#
# 1.shell 跟system 的亲源性...
# shell = system command 编程, shell 可以直接跑系统所有的命令, shell 就是系统命令的原型
# 运行shell 需要chmod 授权(需要先授权再运行)
ls
ping "-help"
printf '\n%s' "$0" # 打印字符串的新方式(格式化打印字符串)
printf '\n%s' "$1"
#
#
#
# 2.shell disk io (一般只能操作file, 内存, 线程, socket 都是不太可能的...) 创建新进程也可以
# 2.1 追加写
echo "1" "2" "3
4 5 6 7" >> "./tmp" # 支持相对路径搜索 || 换行也会跟着换, 支持多个参数输出.(自定义函数无返回, 不能写盘)
# 2.2 格式化空, 再写
echo "1" "2" "3
4 5 6 7" > "./tmp"
# 2.3 全文读(追加读只能控制行数)
expected=$(cat $3) # cat 可以用来读取文件字符串
line=""
while read one_line_data
do
  let line=$line+"1"
  echo $one_line_data
done < 0.sh
#
#
#
# 3.读tty 输入
tty_in=""
read tty_in #不能用 "" 括起来, 不能用$ 号, 输入不是输出, 输入是变量, 值存进变量, 而输出是字符串
# read file_in "./tmp" # 不能一次读多个值
echo $tty_in
echo "$tty_in" # 输出两种方式都可以
#
#
#
# 4. 检查目标路径下的文件是否存在...
echo "enter a file path:"
read a
if [ -e "$a" ] # -e 查看文件是否存在
then
  echo "the file is exist!"
else
  echo "the file is not exist!"
  mkdir $a # 不存在就创建文件夹, 文件夹不能跟file 同名
fi
#
#
#
# 5.查看是否是root 用户
r=$(whoami)  
if [ $r = "root" ]
then
  echo "the user is root."
else
  echo "the user is not root."
fi
#
#
#
# 6.打印无密码用户--需要root 权限
#!/bin/bash  
echo "No Password User are :"  
echo $(cat /etc/shadow | grep "!!" | awk 'BEGIN { FS=":" }{print $1}')  


