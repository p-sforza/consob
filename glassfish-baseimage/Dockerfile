FROM        docker-registry.default.svc:5000/s2i-glassfish/openjdk7-baseimage

ENV         JAVA_HOME         /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.201-2.6.16.1.el7_6.x86_64
ENV         GLASSFISH_HOME    /usr/local/glassfish3
ENV         PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin 

# DEFAULT PASSWORD FOR GLASSFISH CONSOLE USER ADMIN
ENV         PASSWORD          glassfish

RUN         curl -L -o /tmp/glassfish-3.1.2.2.zip http://nexus-cicd-consob.poc-appocp.int-consob.local/repository/common-resources/glassfish-3.1.2.2.zip
RUN         yum -y install unzip &&\
            unzip /tmp/glassfish-3.1.2.2.zip -d /usr/local &&\
            rm -f /tmp/glassfish-3.1.2.2.zip

RUN         curl -L -o ojdbc7.jar http://nexus-cicd-consob.poc-appocp.int-consob.local/repository/common-resources/ojdbc7.jar

RUN         chown -R 1001:0 /usr/local/glassfish3 && \
            chmod -R g+rw /usr/local/glassfish3

RUN         echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd && \
            echo "AS_ADMIN_NEWPASSWORD=${PASSWORD}" >> /tmp/glassfishpwd  && \
            asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && \
            asadmin start-domain && \
            echo "AS_ADMIN_PASSWORD=${PASSWORD}" > /tmp/glassfishpwd && \
            asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && \
            asadmin --user=admin stop-domain && \
            rm /tmp/glassfishpwd

RUN         chgrp -R 0 /usr/local/glassfish3 && \
            chmod -R g=u /usr/local/glassfish3
      
EXPOSE      8080 4848 8181

WORKDIR     /usr/local/glassfish3

# verbose causes the process to remain in the foreground so that docker can track it
CMD         asadmin start-domain --verbose

