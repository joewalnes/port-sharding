run: docker.built
	docker run -it --volume=$(shell pwd)/root:/root -p 1234:1234 server-example
.PHONY: run

docker.built:
	@rm -f $@
	docker build -t server-example .
	@touch $@

clean:
	rm -f docker.built
.PHONY: clean
