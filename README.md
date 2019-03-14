Helm Chart repo for HashiCorp Consul
====================================

This repository contains scripts to build a Helm Chart repository for HashiCorp Consul.

You're probably here because you want to _use_ the chart, not build a repository for it.
To use the repository, add it to Helm, then do `helm install` like usual:

    helm repo add consul https://consul-helm-charts.storage.googleapis.com
    helm install consul/consul 

