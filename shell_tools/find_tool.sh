
#!/bin/bash
#No.1
# Shell 变量默认全都是字符串
# ***注意命令参数的顺序,先做什么再做什么***
# 
comm1="find . -name \"your filename\""
comm2="find . -iname \"your filename\""
#
comm3="find . -uid 0"
comm4="find . -uid 1000"
#
comm5="find . -a find . -atime -1 -a -size -3 # and"	 #找特权用户的文件
comm6="find . -o find . -atime -1 -a -size -3 # or"
comm7="find . -not find . -atime -1 -a -size -3 # !both" #找不是特权用户的文件
#
comm8="find . -atime -1 #<1 today --visit, -2=yestodat+todat"
comm9="find . -mtime -1 #<1 today --content change, +30=1 month not use of old file"
comm10="find . -ctime -1 #<1 today --properties change, "
#
comm11="find . -type f -exec rm -rf #f=file,d=directory,l=link,b=drive,s=socket"
comm12="find . -size -1 #-1=<1M +1=>1M"
#
comm15="find .  -name \"test\" -ok rm -rf {} \\;"
comm16="find .  -name \"test\" -exec rm -rf {} \\;"

printf "welcome to use find command tool"
printf '\n%s' "$comm1" # 打印字符串的新方式(格式化打印字符串)
printf '\n%s' "$comm2"
printf '\n%s' "$comm3"
printf '\n%s' "$comm4"
printf '\n%s' "$comm5"
printf '\n%s' "$comm6"
printf '\n%s' "$comm7"
printf '\n%s' "$comm8"
printf '\n%s' "$comm9"
printf '\n%s' "$comm10"
printf '\n%s' "$comm11"
printf '\n%s' "$comm12"
printf '\n%s' "$comm15"
printf '\n%s' "$comm16"
printf "\ndefault file path is current path ,please run this sh into current path\n"


# 根据文件后缀删除文件
count="0"
if [ "$1" == "" ]
then
  echo "you had have just input a empty value"
  return
else
  find . -type d -name "*$1" | xargs rm -rf
  let count=$count+1
fi
echo "deleted" "$count" "files, $1"


# 根据文件名删除文件
count="0"
if [ "$1" == "" ]
then
  echo "you had have just input a empty value"
  return
else
  find . -name "$1" | xargs rm -rf
  let count=$count+1
fi
echo "deleted" "$count" "files, $1"

# 根据使用时间来删除文件
# 删除当前文件夹内, 今天修改过的file, 可以很好地支持手动安装的时候, 执行回滚
find . -ctime -1 | xargs rm -rf
