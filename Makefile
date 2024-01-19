docker:
	docker build -t demo_clustering .
docker_testrun:
	docker run --rm -p 3838:3838 demo_clustering
pushall:
	git lfs push --all origin
