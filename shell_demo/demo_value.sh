#!/bin/bash
# 1.数值相加(shell 里面所有数字都是从文本转换过去的, 计算完毕之后, 又会变成文本...)所以有:
echo "shell math start";
#
# 数值 + - * /
val=1
let val=$val+5 # let val 变成数字, 这个方法好, 主要赋值部分最好不要有空格
echo $val
#
a=5
b=6
result=$[a+b]
echo "result 为： $result"
# 结果为: result 为： 11
#
#
# 2.字符串相加 -- 但是合并后的$1 不能代表传入实参 $1
str="$"
str=$str"0"
echo $str
# echo $"$str" # 全部失败！！
# echo $("$str")
# echo $($str)
echo $0
#
#
# 3.数值比较
#   比较两个数大小(由于shell 所有变量存放都是string, 所以你不能直接用大于, 小于比较一个数字, 
#   == 只能说明字符串相同, 数字相等? 倒也不一定...1.0 == 1? or 1.0 -eq 1?)
#   shell number 只有正整数, 负数也可以有, 但是没有小数位(没有浮点数)!!
#   -eq 可以判断 01 == 1, 而直接 "01" == "1" 肯定不行
echo "please enter two number"  
read a  
read b
if [ "$a" -eq "$b" ] # a == b ?
then
  echo "$a" "=" "$b"
elif [ "$a" -gt "$b" ] # a > b ?
then
  echo "$a" ">" "$b"
else
  echo "$a" "<" "$b"
fi
#
#
# 4.shell 脚本赋值符号的区别
# '=' 就是赋值运算
# ':='就是当冒号前面的变量不存在或值为空时, 就把等号后的值赋值给变量
# '+='这个应该不用解释吧, 和C中一样, 变量等于本身和另一个变量的和
#
#
#
# 5. 数组定义
my_array=(A B "C" D)
#
# 读取数组
${array_name[0]}
${array_name[1]}
${array_name[2]}
${array_name[3]}
#
# 显示输入的参数和参数个数(argv and argc)
argc=$#
argv=$@
argv2=$*
