# Variables
NAMESPACE = default
DEPLOYMENT = api-server
SERVICE = api-server
LOCALPORT := 3000
REMOTEPORT := 3000

# Targets
.PHONY: generate_name create_helm build push_image

build:
	docker build -t cyrilbaah/api-server .

push_image:
	docker push cyrilbaah/api-server:latest

logs:
	kubectl logs -f deployments/$(DEPLOYMENT) -n $(NAMESPACE)

create_helm:
	helm install api api-server

uninstall_helm:
	helm uninstall api 

upgrade_helm:
	helm upgrade api 