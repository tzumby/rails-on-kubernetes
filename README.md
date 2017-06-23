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

## Postgres

Create the necessary secrets:

```
kubectl create secret generic db-user-pass --from-literal=password=mysecretpass
kubectl create secret generic db-user --from-literal=username=postgres
```

And run the resource:

```
kubectl create -f kube/postgres.yaml
```

## Redis

```
kubectl create -f kube/redis.yaml  
```

### Rails

You will have to build and push the Rails image. Make sure you update the ```lib/tasks/docker.rake``` with your own username.

```
bundle exec rake docker:push_image
```

First run the setup Kube job to create the database and run migrations:

```
kubectl create -f kube/setup.yaml
```

```
kubectl create -f kube/rails.yaml
```

```
kubectl create -f kube/sidekiq.yaml
```

### Ingress

Finally create the Ingress resource:

```
kubectl create -f kube/ingress.yaml
```

# Details

For an in-depth step by step guide check out my blog post at: [Rails on kubernetes - Part 2](https://blog.cosmocloud.co/rails-on-kubernetes-part-2)
