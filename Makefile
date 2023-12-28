# Makefile

# Define the container name
CONTAINER_NAME=elegant_allen

# Define the image name
IMAGE_NAME=my-react-app

.PHONY: create stop start restart

# Create the Docker container
create:
	@docker build -t $(IMAGE_NAME) .
	@docker create -p 80:80 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop the Docker container
stop:
	@docker stop $(CONTAINER_NAME)

# Start the Docker container
start:
	@docker start $(CONTAINER_NAME) || (make create && docker start $(CONTAINER_NAME))

# Restart the Docker container
restart: stop start
