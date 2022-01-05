Centos Tarafı

 

ESKI SERTIFIKA VAR ISE BULUYORUZ

------------------------------------------------------------------------------------------

./keytool -list -keystore /usr/java/jdk1.8.0_73/jre/lib/security/trustcacerts

 

password = changeit

 

Enter keystore password: 

Keystore type: jks

Keystore provider: SUN

 

Your keystore contains 1 entry

 

edm, Oct 26, 2020, trustedCertEntry,

Certificate fingerprint (SHA1): 11:F0:50:C7:10:7D:B0:C2:DF:00:85:15:5F:92:FD:74:3B:F0:89:50

 

ESKI SERTIFIKA VAR ISE SILIYORUZ

------------------------------------------------------------------------------------------

./keytool -delete -alias edm -keystore /usr/java/jdk1.8.0_73/jre/lib/security/trustcacerts

 

password = changeit

 

YENI SERTIFIYI EKLIYORUZ

------------------------------------------------------------------------------------------

İndirdiğimiz sertifikayı "edm.cer" sunucudaki kök dizine "/" atıyoruz

./keytool -importcert -file "/edm.cer" -alias edm -keystore "/usr/java/jdk1.8.0_73/jre/lib/security/trustcacerts"                                         

password = changeit

trust = yes

 

TOMCAT AYARLARI

------------------------------------------------------------------------------------------

Tomcat servisine aşağıdaki 2 satırı ekliyoruz ve restart ediyoruz

 

nano /etc/init.d/tomcat içine aşağıdaki satırları manuel eklersek

 

1.Ctrl x

2.Sonra Y

3.Enter

 

export CATALINA_OPTS="$CATALINA_OPTS -Dtrust_all_cert=true"

export CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.ssl.trustStore=/usr/java/jdk1.8.0_161/jre/lib/security/trustcacerts"

 

 

Gidilecek dizin : cd /etc/alternatives/jre/bin/   bu satırı çalıştır daha sonra aşağıdaki komutlarda başına ./ koy

Çalıştırılacak keytoolun basına ./ koyman yeterlidir :  ./keytool -list -keystore /usr/java/jdk1.8.0_172-amd64/jre/lib/security/trustcacerts

 

 

curl -4 https://portal2.edmbilisim.com.tr/EFaturaEDM/EFaturaEDM.svc?wsdl erişim sağlaması lazım

curl -4 https://portal2.edmbilisim.com.tr/EFaturaEDM/EFaturaEDM.svc?wsdl -k

 

-------------------------------------------------------------------------

Debian Tarafı

 

cd /usr/lib/jvm/jdk1.8.0_202/jre/bin

./keytool -importcert -file "/edm.cer" -alias edm -keystore "/usr/lib/jvm/jdk1.8.0_202/jre/lib/security/cacerts"

export CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.ssl.trustStore=/usr/lib/jvm/jdk1.8.0_202/jre/lib/security/cacerts"

 

nano /etc/init.d/tomcat

 

export JAVA_HOME

export CATALINA_OPTS="$CATALINA_OPTS -Dtrust_all_cert=true"

export CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.ssl.trustStore=/usr/lib/jvm/jdk1.8.0_202/jre/lib/security/cacerts"

 
