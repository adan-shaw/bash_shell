
#!/bin/bash
#
# 1.shell 的函数定义
function ftest(){
  echo "function test call"
  echo $1 $2 $3 # 显示输入参数1 2 3
  echo $* # 显示输入的所有参数
  echo $# # 显示输入参数的个数
  echo -e "\n\n"
  return "123" # 返回常量字符串
}
#
#
# 2.shell 的函数调用:
ftest 1 2 3 # 输入参数1 2 3, 直接调用ftest()
echo "第一次" $? # 上一条命令的返回值, 如果执行echo, 没有错误则返回0...
                # 一般不对公有函数做返回值判断
        
(ftest 3 2 1) # 输入参数1 2 3, 直接调用ftest() 函数
echo "第2次" $?

# 函数返回值demo
funWithReturn(){
  echo "这个函数会对输入的两个数字进行相加运算..."
  echo "输入第一个数字: "
  read aNum
  echo "输入第二个数字: "
  read anotherNum
  echo "两个数字分别为 $aNum 和 $anotherNum !"
  return $(($aNum+$anotherNum))
}
funWithReturn
echo "输入的两个数字之和为 $? !"
