# GKE Containerized Helloworld

A simple example of a containerized website that uses a GKE deployment via helm.

To build the images, adjust the Makefile so it points to your project and then
run the following:

```
make
```

To push the image to your Google Cloud GKE instance, you will need to download
the Google Cloud SDK and login. Afterwards run the following:

```
make push
```

Once the image is pushed, edit the helm/webserver/values.yaml file and change
the IP address variable to point to your static IP.

Finally, deploy the app using helm as follows:

```
helm install --generate-name helm/webserver
```

Also note that GKE kubernetes Ingress and LoadBalancer resources require
health-checks to be present if the content is `text/html` or if the Google
algorithm determines you are using a webserver.

Consider adding something like the following to your website's nginx.conf
if you don't currently have health checks:

```
location /healthz {
    return 200 "healthy\n";
}
```
