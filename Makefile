img_name := insta-downloader

default: docker-run

run:
	python turtle_console.py 

container:
	docker build -t $(img_name) .

docker-run:
	docker run -v "${PWD}:/photos"  -w /photos --name img -d $(img_name) tail -f /dev/null
	docker exec img make run
	docker stop img
	docker rm img