from ubuntu:24.04

run apt update
run apt install -y postgresql 
run apt install -y openjdk-11-jdk
run apt install -y maven
run apt install -y ant
run apt install -y tomcat9 
run apt install -y tomcat9-admin 
# run apt clean && rm -rf /var/lib/apt/lists/*
env JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
env PATH="$JAVA_HOME/bin:$PATH" 
run export PATH