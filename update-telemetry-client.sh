export MYSQL_PASSWORD=$(kubectl get secret --namespace "olap" mysql -o jsonpath="{.data.mysql-password}" | base64 -d
export MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace "olap" mysql -o jsonpath="{.data.mysql-root-password}" | base64 -d)
kubectl config use-context arn:aws:eks:eu-west-1:241018688765:cluster/realtime-olap-eks
helmfile apply -e dev --set auth.rootPassword=$MYSQL_ROOT_PASSWORD --set auth.password=$MYSQL_PASSWORD --file releases/default/telemetry-client/telemetry-client.yaml