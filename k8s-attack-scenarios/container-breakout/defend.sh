#!/usr/bin/env bash

# In this example we will see the defensive techniques to prevent container breakouts

# Launch the non-root privileged pod with the non-root container image

echo "\n"
echo "************ Purple Team actions are started  **************"
echo "\n"

echo "Step 1: Non-root container application is deployed"
kubectl apply -f app-nonroot.yaml
echo "\n"

echo "************ Purple Team actions are performed  **************"
echo "\n"


echo "************ Red Team actions are started  **************"
echo "\n"

echo "Step 2: Adversary enumerates and gain access to the kubernetes cluster"
echo "\n"

echo "Step 3: Adversary is trying to use the non-root pod an Attack entry point"

kubectl get po -n nonroot
echo "\n"

echo "Step 4: Attacker gained access to the running non-root pod and trying to attack the underlying host"
echo "\n"

echo "Adversary is in the running container shell now. Will try to escape out of the container. Attack objective is unsuccessful"
kubectl exec -it -n nonroot "$(kubectl get po -n nonroot --output=jsonpath='{.items[0].metadata.name}')" -- sh

