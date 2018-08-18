# Update repo list
apt-get update

# Install openJDK
apt-get install -y default-jre

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

# Add https support with the generated keys
SSL_SERVER_XML=/vagrant/ssl-server.xml 
cp -av $SSL_SERVER_XML $DIRECTORY/conf/server.xml

# GET the 'Dynamic App'
DYN_APP=https://s3.amazonaws.com/infra-assessment/companyNews.war
cd $DIRECTORY/webapps
rm -rf companyNews* companyNews.war*
wget -O companyNews.war $DYN_APP

# Start the tomcat now.
cd $DIRECTORY/bin
./startup.sh

# Link static Asset
cd $DIRECTORY/webapps/companyNews
for view in *.jsp
do 
    sed -i s/"styles\/company.css"/"http:\/\/192.168.33.99\/static\/styles\/company.css"/g $view
    sed -i s/"images\/logo.png"/"http:\/\/192.168.33.99\/static\/images\/logo.png"/g $view
done


