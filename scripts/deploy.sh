
#!/bin/bash

# Set your Docker Hub usernames
DOCKER_USERNAME_MAIN="karthikeyan9506"
DOCKER_USERNAME_PROD="karthikeyan9506"
IMAGE_NAME="reactapp"

# Get the current Git branch
git_branch=$(git rev-parse --abbrev-ref HEAD)

# Log in to Docker Hub
docker login -u $DOCKER_USERNAME_MAIN
docker login -u $DOCKER_USERNAME_PROD

# Tag the image with the latest tag
docker tag reactjs-demo $DOCKER_USERNAME_MAIN/$IMAGE_NAME:latest
docker tag reactjs-demo $DOCKER_USERNAME_PROD/$IMAGE_NAME:latest

# Push the image to the appropriate Docker Hub repository based on the branch
if [ "$git_branch" == "dev" ] || [ "$git_branch" == "origin/dev" ]; then
    echo "Deploying to prod repository..."
    docker push $DOCKER_USERNAME_PROD/$IMAGE_NAME:latest
elif [ "$git_branch" == "main" ] || [ "$git_branch" == "origin/main" ]; then
    echo "Deploying to main repository..."
    docker push $DOCKER_USERNAME_MAIN/$IMAGE_NAME:latest
else
    echo "Not deploying to any repository. Branch: $git_branch"
fi

# Logout from Docker Hub
docker logout

