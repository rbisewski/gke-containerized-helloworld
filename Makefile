PROJECT_NAME = 'gke-containerized-helloworld'

# Version
VERSION = `date +%y.%m`

# If unable to grab the version, default to N/A
ifndef VERSION
    VERSION = "n/a"
endif

REPO = 'gcr.io/test-project-1-262115'
IMAGE = '${REPO}/webserver:1.0.0.prod'
TYPE = 'production'

#
# Makefile options
#


# State the "phony" targets
.PHONY: all clean build

all: build

build:
	@echo 'Building ${PROJECT_NAME}...'
	@docker build --build-arg DEPLOYMENT=${TYPE} -t ${IMAGE} app/
push:
	@echo 'Pushing image to ${REPO}...'
	@docker push ${IMAGE}

clean:
	@echo 'Cleaning ${PROJECT_NAME}...'
	@docker rmi gcr.io/test-project-1-262115/webserver:1.0.0.prod
