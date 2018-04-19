#!/bin/bash
D="d"
UP="u"
INSTALL="i"
ALL="a"
PATH1="/Volumes/256G/imlidian/chassis/incubator-servicecomb-java-chassis"
SJAR="pojo-server-1.0.0-m2-SNAPSHOT.jar"
CJAR="pojo-client-1.0.0-m2-SNAPSHOT.jar"

echo $PATH1/demo/demo-pojo/benchmark-base/target/benchmark-base-round-1.jar

if [ $D = "d" -o $ALL = "a" ];then
ssh root@hwc2 "cd java ; ls ;rm pojo-client-1.0.0-m1.jar ; killall java"
ssh root@hws "cd java ; ls ;rm pojo-server-1.0.0-m1.jar ; killall Java"
fi

if [ $INSTALL = "1" -o $ALL = "a" ];then
rm $PATH1/demo/demo-pojo/benchmark-base/target/benchmark-base-round-1.jar
rm /Users/dean/.m2/repository/benchmark/rpc/benchmark-base/round-1/benchmark-base-round-1.jar
rm $PATH1/demo/target/Java\ Chassis\:\:Demo\:\:POJO\:\:Client/$CJAR
rm $PATH1/demo/target/Java\ Chassis\:\:Demo\:\:POJO\:\:Server/$SJAR
rm /Users/dean/.m2/repository/org/apache/servicecomb/demo/pojo-client/1.0.0-m1/$CJAR
rm /Users/dean/.m2/repository/org/apache/servicecomb/demo/pojo-server/1.0.0-m1/$SJAR
cd $PATH1/demo/demo-pojo
mvn clean install -Pdemo-run-release
fi

if [ $UP = "u" -o $ALL = "a" ];then 
scp $PATH1/demo/target/Java\ Chassis\:\:Demo\:\:POJO\:\:Client/$CJAR root@hwc2:~/java
scp $PATH1/demo/target/Java\ Chassis\:\:Demo\:\:POJO\:\:Server/$SJAR root@hws:~/java
fi
