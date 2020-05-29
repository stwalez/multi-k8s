docker build -t stwalez/multi-client:latest -t stwalez/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t stwalez/multi-server:latest -t stwalez/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t stwalez/multi-worker:latest -t stwalez/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push stwalez/multi-client:latest
docker push stwalez/multi-server:latest
docker push stwalez/multi-worker:latest

docker push stwalez/multi-client:$SHA
docker push stwalez/multi-server:$SHA
docker push stwalez/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stwalez/multi-server:$SHA
kubectl set image deployments/client-deployment client=stwalez/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=stwalez/multi-worker:$SHA

