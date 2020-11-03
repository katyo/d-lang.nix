FLAGS := --skip_steps=mingw32

all:
	./install-sources.sh $(FLAGS)
	./build-prerequisites.sh $(FLAGS)
	./build-toolchain.sh $(FLAGS)

download:
	wget -c https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2
	tar xf gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2 --strip-components=1 -C .

docker-entry:
	docker run -v $(CURDIR):/home/builder/workspace -it build-gcc-arm-embedded

docker-build:
	docker build -t build-gcc-arm-embedded docker
