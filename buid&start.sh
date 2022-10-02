## bin/bash
docker build -t maven-app .
docker run -d -p 8080:8080 maven-app
