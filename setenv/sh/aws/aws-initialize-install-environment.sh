echo "[INFO] JAVAのバージョン確認"
java -version
echo "[INFO] YUMアップデート"
sudo yum update
echo "[INFO] JAVAインストール"
sudo yum install java-1.8.0-openjdk-devel.x86_64
java -version
sudo yum install yum-priorities
sudo rpm -Uvh http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm
sudo yum -y install wget
cd /usr/local/
sudo wget http://ftp.riken.jp/net/apache/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz
sudo tar xvzf apache-tomcat-8.0.30.tar.gz
sudo mv apache-tomcat-8.0.30 /opt/tomcat8
sudo chown -R internous /opt/tomcat8/
cd /opt/tomcat8/conf
sudo cp tomcat-users.xml tomcat-users.xml-original
