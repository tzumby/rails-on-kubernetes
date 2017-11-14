# Running this in development mode

You will need to install Docker Compose for this. Here's how you build the Docker images:

```
docker-compose build
```

To run the application:

```
docker-compose up
```

Then access it at ```http://localhost:3000```.

# Kubernetes

## Secrets

Create the necessary secrets:

```
kubectl create secret generic db-user-pass --from-literal=password=mysecretpass
kubectl create secret generic db-user --from-literal=username=postgres
lubectl create secret generic secret-key-base --from-literal=secret-key-base=50dae16d7d1403e175ceb2461605b527cf87a5b18479740508395cb3f1947b12b63bad049d7d1545af4dcafa17a329be4d29c18bd63b421515e37b43ea43df64
```

## Postgres

Create the volumes:

```
kubectl create -f kube/volumes/postgres_volumes.yaml
```

Create the Service and Deployment

```
kubectl create -f kube/services/postgres_svc.yaml
kubectl create -f kube/deployments/postgres_deploy.yaml
```

## Redis

Create the Service

```
kubectl create -f kube/services/redis_svc.yaml
kubectl create -f kube/deployments/redis_deploy.yaml
```

### Rails

You will have to build and push the Rails image. Make sure you update the ```lib/tasks/docker.rake``` with your own username.

```
bundle exec rake docker:push_image
```

First run the setup Kube job to create the database and run migrations:

```
kubectl create -f kube/jobs/setup.yaml
```

Create the Rails Service

```
kubectl create -f kube/services/rails_svc.yaml
```

And the Deployment

```
kubectl create -f kube/deployments/rails_deploy.yaml
```

### Ingress

Finally create the Ingress resource:

```
kubectl create -f kube/ingresses/ingress.yaml
```

# Details

For an in-depth step by step guide check out my blog post at: [Rails on kubernetes - Part 2](https://blog.cosmocloud.co/rails-on-kubernetes-part-2)
