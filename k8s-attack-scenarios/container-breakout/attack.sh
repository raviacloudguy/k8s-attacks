#!/usr/bin/env bash

# In this example we will see the impact of root user within the containers

# Launch the privileged pod in the specific user namespace and use that as an attack entry point to eploit the host node


echo "\n"
echo "************ Blue Team actions are started  **************"
echo "\n"

echo "Step 1: Privileged application container is deployed"
kubectl apply -f app.yaml
echo "\n"

echo "************ Blue Team actions are performed  **************"
echo "\n"


echo "************ Red Team actions are started  **************"
echo "\n"

echo "Step 2: Adversary enumerates and gain access to the kubernetes cluster"
echo "\n"

echo "Step 3: Adversary identified an Attack entry point - Running privileged pod"

kubectl get po -n nonroot
echo "\n"

echo "Step 4: Attacker gained access to the running privileged pod and attacks the underlying host"
echo "\n"

echo "Adversary is in the running container shell now. Will escape out of the container and start attack the underying host"
kubectl exec -it -n nonroot "$(kubectl get po -n nonroot --output=jsonpath='{.items[0].metadata.name}')" -- sh

