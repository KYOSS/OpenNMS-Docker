#!/usr/bin/env bash

EXPECTED_JDK_RPM="${BASH_SOURCE%/*}/jdk.rpm"
DL_RPM="http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm"

if [ -e $EXPECTED_JDK_RPM ]
  then
    echo "$EXPECTED_JDK_RPM exists; installing it"
  else
    echo "$EXPECTED_JDK_RPM doesn't exist, attempting to download it. If you'd prefer to download it yourself, or if this operation fails, please supply the file and run this script again."
    curl -sSf -L --cookie "oraclelicense=accept-securebackup-cookie" $DL_RPM > $EXPECTED_JDK_RPM

    if [ $? -ne 0 ]
    then
      echo "Download failed"
      exit 1
    fi
fi

rpm -ivh --replacepkgs $EXPECTED_JDK_RPM
echo -e 'export JAVA_HOME=/usr/java/latest\nexport PATH=$JAVA_HOME/bin:$PATH' >> /root/.profile
