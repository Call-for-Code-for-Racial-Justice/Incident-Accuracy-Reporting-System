# Deploying the Project

To deploy the project, run the following `docker compose` command:

```
docker compose \
    -f docker-compose-backend-base.yaml \
    -f docker-compose-backend-incident-service.yaml \
    -f docker-compose-backend-media-service.yaml \
    -f docker-compose-frontend.yaml \
    up
```

To deploy specific components, simply exclude the docker compose file(s) of the unwanted services.
