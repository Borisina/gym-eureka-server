include .env

#Delete eureka-server
eureka-server-rm:
	docker rm -f eureka-server-container
	docker rmi eureka-server-image

## Build and eureka-server
eureka-server-up:
	docker build -t eureka-server-image .
	docker run -dp 8761:8761\
            --network gym_gym-network --network-alias eureka-server\
            --env-file .env\
            --name eureka-server-container\
            --mount type=volume,source=logsvolume,target=/app/logs\
             eureka-server-image