# apt-get cleanup (安装缓存清空)
apt-get autoremove
apt-get autoclean
apt-get clean
echo ""
echo "apt-get tools cache is now left:"
du -sh /var/cache/apt
echo ""
#
# 清除缩略图缓存
rm -rf ~/.cache/thumbnails/*
echo ""
echo "picture tmp is now left"
du -sh ~/.cache/thumbnails
#
# 查看内核版本(一般如果你没有更新过内核, 不用搞, 免得系统崩溃, 2 个是正常的)
# dpkg --list 'linux-image*'*
# apt-get remove linux-image-< VERSION > # 卸载命令
#
# 清除垃圾日志
echo ""
echo "clean up /var/log"
find /var/log -name "*.gz" | xargs rm -rf
find /var/log -name "*.old" | xargs rm -rf
find /var/log -name "*.1" | xargs rm -rf
find /var/log -name "*.2" | xargs rm -rf
find /var/log -name "*.3" | xargs rm -rf
# find /var/log -name "*.4" | xargs rm -rf
# find /var/log -name "*.5" | xargs rm -rf

rm -rf `find /var/log -name "*.gz"`;
rm -rf `find /var/log -name "*.1"`;
rm -rf `find /var/log -name "*.0"`;
rm -rf `find /var/log -name "*.old"`;

# 更简单
rm /var/log/*.old;
rm /var/log/*.gz;
rm /var/log/*.0;
rm /var/log/*.1;
