#!/bin/bash
#
# 1. if
val="xxx" # 注意: 所有值的类型都是text, 所以全部if 都是字符串比对
if [ $val == "xxx" ];then
  echo "yes"
else # shell if 没有 else if !!
  echo "no"
fi
#
#
#
# 2.switch() 多路选择
#!/bin/sh
printf "shell printf, no auto 换行\n" # printf 不会自动换行
user_input=""
read user_input # 从键盘读入value
# switch 开始
case $user_input in
1)
    printf "switch 1\n";
    ;;
2)
    printf "switch 2, cant be a string\n"; # switch 不能用string 做选择
    ;;
3)
    printf "switch 字符 3\n";
    ;;
"sss")
    printf "匹配sss 字符串";
    ;;
"*adan*")
    printf "通配adan 字符串";
    ;;
*)
    printf "unknow input,exit\n";
    ;;
esac
#
#
#
# 3.for() 有限循环
max={"1","2","3","4"} # 这个是什么定义方式??
maxx="1","2" # 还是一样, shell 里面没有数组的
i="2"
for i in 1 2 3 5 $maxx; do
  echo "i am a loops" "$max" "$i" "$maxx" # i 的值会遍历 in 后面的数, 但是in 后面的数没办法自己做？
done
#
#
#
# 4.while() 无限循环
a=1 # 循环计数 
while :
do  
  a=$(($a+1))
  if test $a -gt 255
  then
    break # 退出
  else  
    echo $(ping -c 1 192.168.0.$a | grep "ttl" | awk '{print $4}'| sed 's/://g')
    ip=$(ping -c 1 192.168.0.$a | grep "ttl" | awk '{print $4}'| sed 's/://g')
    echo $ip >> ip.txt
  fi
done
#
#
#
#
read -p "Enter a number or string here:" input  

# 正则表达式
case $input in  
   [0-9]) echo -e "Good job, Your input is a numberic! \n" ;;  
[a-zA-Z]) echo -e "Good job, Your input is a character! \n" ;;  
       *) echo -e "Your input is wrong, input again!   \n"  ;;  
esac

