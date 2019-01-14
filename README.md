# docker-nginx-stream
Run nginx stream in a docker container

### env vars
* `PORT`: Port nginx docker will listen on
* `TARGET_HOSTS`: Comma separated list of host names and/or ip address/ports


## Testing
* Run `docker-compose up`
* Navigate to http://localhost:8081
* Click `admin` database. Then "Create Document"
* Add a `User` document with the following Schema:
```bash
User {
  "name": String,
  "age": Number
}
```
* Navigate to http://localhost:5000/users and verify that your new user is returned.
* The test app running on port 5000 just connected to nginx, which proxied the mongoDB connection to the `mongo` container.
