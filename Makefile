PHONY: clean dist-clean coverage rpm version release push sync test docker

clean:
	docker rmi -f onmspgsql
	docker rmi -f onmsserver

docker:
	docker build -t onmspgsql ./postgresql/
	docker build -t onmsserver ./opennms/
