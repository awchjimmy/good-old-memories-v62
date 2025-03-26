#!/bin/sh

java -cp .:dist/* \
-Dnet.sf.odinms.recvops=recvops.properties \
-Dnet.sf.odinms.sendops=sendops.properties \
-Dnet.sf.odinms.wzpath=wz/ \
-Djavax.net.ssl.keyStore=filename.keystore \
-Djavax.net.ssl.keyStorePassword=passwd \
-Djavax.net.ssl.trustStore=filename.keystore \
-Djavax.net.ssl.trustStorePassword=passwd \
net.sf.odinms.net.world.WorldServer
