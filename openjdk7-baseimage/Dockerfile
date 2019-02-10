FROM        registry.access.redhat.com/rhel7

ENV         JAVA_HOME         /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.201-2.6.16.1.el7_6.x86_64
ENV         PATH              $PATH:$JAVA_HOME/bin

RUN         INSTALL_PKGS="unzip java-1.7.0-openjdk-devel.x86_64" && \
            yum install -y $INSTALL_PKGS && \
            yum clean all -y

