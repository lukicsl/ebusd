APP_NAME=ebusd
APP_VERSION=$(shell git describe --tags --abbrev=0)
APP_USERREPO=github.com/lukicsl
APP_PACKAGE=$(APP_USERREPO)/$(APP_NAME)

PLUGIN_USER ?= lukics
PLUGIN_NAME ?= ebusd
PLUGIN_TAG ?= armv7
PLUGIN_IMAGE_3_1 ?= $(PLUGIN_USER)/$(PLUGIN_NAME)-3.1:$(PLUGIN_TAG)
PLUGIN_IMAGE_3_3 ?= $(PLUGIN_USER)/$(PLUGIN_NAME)-3.3:$(PLUGIN_TAG)
DOCKERFILE ?= ./Dockerfile

ERROR_COLOR=\033[31;01m
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
WARN_COLOR=\033[33;01m

all: docker-image docker-image-push

	
docker-image:
	@echo -e "$(OK_COLOR)==> Docker build image : ${PLUGIN_IMAGE_3_1} $(NO_COLOR)"
	@echo -e "$(OK_COLOR)==> Docker build image : ${PLUGIN_IMAGE_3_3} $(NO_COLOR)"
	docker build -t ${PLUGIN_IMAGE_3_1}  -f ${DOCKERFILE}-3.1 .
	docker build -t ${PLUGIN_IMAGE_3_3}  -f ${DOCKERFILE}-3.3 .

docker-image-push:
	@echo -e "$(OK_COLOR)==> push : ${PLUGIN_IMAGE_3_1}$(NO_COLOR)"
	@echo -e "$(OK_COLOR)==> push : ${PLUGIN_IMAGE_3_3}$(NO_COLOR)"
	docker push ${PLUGIN_IMAGE_3_1}
	docker push ${PLUGIN_IMAGE_3_3}
