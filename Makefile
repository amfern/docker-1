# Builds micro ros agent docker multiarch

all: image

setup:
	docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --name multiarch --driver docker-container --use
image:
	docker buildx build --pull --platform linux/amd64,linux/arm64 --push -t amfernus/base:galactic base
	docker buildx build --pull --platform linux/amd64,linux/arm64 --push -t amfernus/micro-ros-agent:galactic micro-ROS-Agent
