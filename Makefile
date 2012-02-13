CFLAGS ?= $(shell pkg-config --cflags simple-tiles pangocairo) $(shell gdal-config --cflags)
LDLIBS ?= $(shell pkg-config --libs simple-tiles pangocairo) $(shell gdal-config --libs)

all: all_roads
all_roads: all_roads.o
all_roads.o: all_roads.c

.PHONY: all
