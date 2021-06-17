## WovnJava with SprintBoot

### How to use

1. Change the Token in the following line of `src/main/java/hello/WovnConfiguration.java`.

```
        registration.addInitParameter("projectToken", "Token");
```

2. Build the hello application and deploy it to tomcat.

```
cd wovnjava-springboot
make
```

`gradle` will build the hello application and create the `ROOT.war`.
`ROOT.war` will then be placed in `tomcat-webapps/`.

3. Start docker-compose

```
docker-compose up -d
```

4. Access http://127.0.0.1:8081 or http://127.0.0.1:4040 
