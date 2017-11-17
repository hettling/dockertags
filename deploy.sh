# deploy image to docker hub

docker login -u $DOCKER_USER -p $DOCKER_PASS

if [[ -v TRAVIS_TAG ]]; then 	
	docker push $DOCKER_IMAGE_NAME:$DOCKER_TAG
	echo "Deployed image $DOCKER_IMAGE_NAME:$DOCKER_TAG to docker hub."   
fi

docker push $DOCKER_IMAGE_NAME:latest
echo "Deployed image $DOCKER_IMAGE_NAME:latest to docker hub."   

docker logout
