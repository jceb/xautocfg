# build script for xautocfg
#
# sorry, this is not cmake yet.

CXXFLAGS ?= -O3 -march=native

BUILDFLAGS = -std=c++20 -Wall -Wextra -pedantic
LIBS = -lX11 -lXi

PREFIX = /usr/local

.PHONY: all
all: xautocfg

xautocfg: xautocfg.o
	${CXX} ${BUILDFLAGS} ${CXXFLAGS} $^ ${LIBS} -o $@

%.o: %.cpp
	${CXX} ${BUILDFLAGS} ${CXXFLAGS} -c $^ -o $@

.PHONY: install
install: all
	install -d $(PREFIX)/bin
	install -m 0755 xautocfg $(PREFIX)/bin

.PHONY: clean
clean:
	rm -f xautocfg
