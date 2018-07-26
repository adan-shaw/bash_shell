# read 表示从console 终端输入数据...
#
read -p "请输入密码:" -n 6 -t 15 -s password
# -p 输入提示文字
# -n 输入字符长度限制(超出6位, 自动结束输入)
# -t 输入限时15s
# -s 隐藏输入内容
#
echo -e "\n你刚才输入的密码是: $password"




# 简单正则表达式应用
# 正则表达式不能用!= or ==... 正则表达式用 =~

regex="[A-Z]{2}" # 正则筛选A-Z 的字符, 检索前2 个字符
regex2="[a-z]" # 默认只检索前1 个字符, 只要第一个是a-z 里面的字符, 后面的可以随意
regex3="[0-9]{6}"
echo ""
if [[ $1 =~ $regex ]]  
then  
  echo $1 
else  
  echo "1 Invalid entry"
fi

if [[ $2 =~ $regex2 ]]  
then  
  echo $2 
else  
  echo "2 Invalid entry"
fi

read -p "请输入密码:" -n 6 -t 15 -s _password
if [[ $_password =~ $regex3 ]] # 正则表达判断: 是否是数字且满6 位, 不是就表示输入无效
then  
  echo $_password 
else  
  echo "3 Invalid entry"
fi

