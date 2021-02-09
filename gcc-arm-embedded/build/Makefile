FLAGS := --skip_steps=mingw32

all:
	./install-sources.sh $(FLAGS)
	./build-prerequisites.sh $(FLAGS)
	./build-toolchain.sh $(FLAGS)

prepare:
	@mkdir -p src
	@wget -c -O src/gcc.tar.gz https://github.com/gcc-mirror/gcc/archive/3b91aab15443ee150b2ba314a4b26645ce8d713b.tar.gz
	@mkdir -p src/gcc && tar --strip-components=1 -C src/gcc -xf src/gcc.tar.gz
	@wget -c -O src/binutils.tar.gz https://github.com/bminor/binutils-gdb/archive/d9a444bca66bf4b0d328acb547ca114081f3fd87.tar.gz
	@mkdir -p src/binutils && tar --strip-components=1 -C src/binutils -xf src/binutils.tar.gz
	@wget -c -O src/newlib.tar.gz https://github.com/bminor/newlib/archive/newlib-3.3.0.tar.gz
	@mkdir -p src/newlib && tar --strip-components=1 -C src/newlib -xf src/newlib.tar.gz
	@wget -c -O src/gdb.tar.gz https://github.com/bminor/binutils-gdb/archive/f3fb4a77f29a99ffa2e1460dfa652081cdbd38be.tar.gz
	@mkdir -p src/gdb && tar --strip-components=1 -C src/gdb -xf src/gdb.tar.gz

download~broken:
	#wget -c https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2
	#tar --strip-components=1 -xf gcc-arm-none-eabi-9-2020-q2-update-src.tar.bz2
	wget -c https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-src.tar.bz2
	tar --strip-components=1 -xf gcc-arm-none-eabi-10-2020-q4-major-src.tar.bz2

docker-entry:
	docker run -v $(CURDIR):/home/builder/workspace -it build-gcc-arm-embedded

docker-build:
	docker build -t build-gcc-arm-embedded docker
