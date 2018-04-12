#yum -y install git svn
#svn co http://code.taobao.org/svn/mz1 --username zhanghaizhou
#cd /root/mz1
#svn update
#cd jdk
#yum install -y wget
#./installjdk.sh
#yum install jdk-8u151-linux-x64.rpm
#rm -rf /data
#mkdir /data
cd /data/mz1
#cd /root/mz1
tar zxf j.tgz
mv jetty-distribution-9.4.7.v20170914/ /data
cd /data
ls
cp -r jetty-distribution-9.4.7.v20170914/ 7001-mzpush
cp -r jetty-distribution-9.4.7.v20170914/ 7003-mzfinance
cp -r jetty-distribution-9.4.7.v20170914/ 7004-mzbiz
cp -r jetty-distribution-9.4.7.v20170914/ 7005-mztask
sed -i "s/# jetty.http.port=8080/jetty.http.port=7005/g" /data/7005-mztask/start.ini
sed -i "s/# jetty.http.port=8080/jetty.http.port=7004/g" /data/7004-mzbiz/start.ini
sed -i "s/# jetty.http.port=8080/jetty.http.port=7003/g" /data/7003-mzfinance/start.ini
sed -i "s/# jetty.http.port=8080/jetty.http.port=7001/g" /data/7001-mzpush/start.ini

sed -i "s/# JAVA/JETTY_PID=7005/g" /data/7005-mztask/bin/jetty.sh
sed -i "s/# JAVA/JETTY_PID=7004/g" /data/7004-mzbiz/bin/jetty.sh
sed -i "s/# JAVA/JETTY_PID=7003/g" /data/7003-mzfinance/bin/jetty.sh
sed -i "s/# JAVA/JETTY_PID=7001/g" /data/7001-mzpush/bin/jetty.sh

/data/7005-mztask/bin/jetty.sh start
/data/7004-mzbiz/bin/jetty.sh start
/data/7003-mzfinance/bin/jetty.sh start
/data/7001-mzpush/bin/jetty.sh start

#yum -y install net-tools
netstat -lntp
