docker container run --detach \
    --name tomcat-kapok-points \
    --network network01 \
    --ip 172.20.0.10 \
    --volume ~/volumes/tomcat-kapok-points/webapps:/usr/local/tomcat/webapps \
    --volume ~/volumes/tomcat-kapok-points/conf:/usr/local/tomcat/conf \
    --restart always \
    tomcat:7.0.94-jre8-alpine