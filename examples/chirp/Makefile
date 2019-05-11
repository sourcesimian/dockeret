.PHONY:

dockeret: .PHONY
	rm -rf ./build
	mkdir ./build
	cp ./dockeret.sh ./build

	cp ./cli.sh ./build
	cp ./Dockerfile ./build
	docker build -t sourcesimian/chirp:1 ./build
	rm -rf ./build
