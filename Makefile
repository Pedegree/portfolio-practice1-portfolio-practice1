CC = clang

CFLAGS += -g
LIBS = `pkg-config --libs openssl` -lpthread

all: build/server

build/server: build/server.o build/parser.o
	mkdir -p build
	$(CC) $(CFLAGS) $(LIBS) -o build/server build/server.o build/parser.o

build/server.o: server.c
	mkdir -p build
	$(CC) $(CFLAGS) -c -o build/server.o server.c

build/parser.o: picohttpparser/picohttpparser.c
	mkdir -p build
	$(CC) $(CFLAGS) -c -o build/parser.o picohttpparser/picohttpparser.c

clean:
	rm -rf build
