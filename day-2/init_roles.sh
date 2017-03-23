#!/bin/bash

touch site.yml
mkdir -p roles/{java,java_test,tomcat,tomcat_test,nginx,nginx_test}/{defaults,vars,tasks,meta,handlers,templates}
touch roles/{java,java_test,tomcat,tomcat_test,nginx,nginx_test}/{defaults,vars,tasks,meta,handlers}/main.yml
