# Update repo list
apt-get update

# Install openJDK & 'unzip'
apt-get install -y default-jre unzip

# GET and extract tomcat server
DIRECTORY=/vagrant/apache-tomcat-8.5.32
if [ ! -d "$DIRECTORY" ]; then
    curl -s http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz | tar xvz -C /vagrant
fi

# Generate self-signing keys
KEYSTORE=/vagrant/keystore.jks
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -keyalg RSA -noprompt -alias tomcat -dname "CN=localhost,OU=NA,O=NA,L=NA,S=NA,C=NA" -keystore $KEYSTORE -validity 9999 -storepass changeme -keypass changeme
fi

# Add SSL support with the generated keys
SSL_SERVER_XML=/vagrant/ssl-server.xml 
cp -av $SSL_SERVER_XML $DIRECTORY/conf/server.xml

# GET the 'Static App'
STATIC_APP=https://s3.amazonaws.com/infra-assessment/static.zip
cd $DIRECTORY/webapps
rm -rvf static* static.zip*
wget -O static.zip $STATIC_APP && unzip static.zip

# Start the tomcat now.
cd $DIRECTORY/bin
./startup.sh
