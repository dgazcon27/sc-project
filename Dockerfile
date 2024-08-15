from ubuntu:24.04

run apt update
run apt install -y postgresql 
run apt install -y openjdk-11-jdk
run apt install -y maven
run apt install -y ant
run apt install -y curl

#Install tomcat
run groupadd tomcat
run useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
WORKDIR /tmp
run curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.tar.gz
run mkdir /opt/tomcat
WORKDIR /opt/tomcat
#run tar xzvf /tmp/apache-tomcat-9.0.*tar.gz -C /opt/tomcat --strip-components=1

# run apt clean && rm -rf /var/lib/apt/lists/*
env JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
env PATH="$JAVA_HOME/bin:$PATH" 
run export PATH