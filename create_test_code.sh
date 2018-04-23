#!/bin/bash

set -e
set -u

SWAGGER_JAR_NAME=swagger-codegen-cli-2.2.1.jar
if [ ! -f $SWAGGER_JAR_NAME ]
then
	wget https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/2.2.1/$SWAGGER_JAR_NAME
fi

# client
java -jar swagger-codegen-cli-2.2.1.jar generate -i http://petstore.swagger.io/v2/swagger.json -l python -o python_client


# server
java -jar swagger-codegen-cli-2.2.1.jar generate -i http://petstore.swagger.io/v2/swagger.json -l python-flask -o python_server
