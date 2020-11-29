#!/usr/bin/env bash


# Cleanup the resources created as part of the Container breakout demoe

echo "\n"
echo "************ Cleanup the resources - Started  **************"
echo "\n"

kubectl delete -f app-readonly-fs.yaml

echo "\n"

echo "************ Resources are cleaned up *************"
echo "\n"
