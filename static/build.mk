# static/build.mk

# Example1 library files and target
EXAMPLE1_SOURCES := $(wildcard static/example1/*.c)
EXAMPLE1_OBJECTS := $(EXAMPLE1_SOURCES:.c=.o)
EXAMPLE1_TARGET := static/libexample1.a

# Example2 library files and target
EXAMPLE2_SOURCES := $(wildcard static/example2/*.c)
EXAMPLE2_OBJECTS := $(EXAMPLE2_SOURCES:.c=.o)
EXAMPLE2_TARGET := static/libexample2.a

STATIC_TARGETS := static/libexample1.a static/libexample2.a
STATIC_DEPENDS := example1 example2
STATIC_FLAGS := -Lstatic -lexample1 -lexample2

# Targets for both libraries
example1: $(EXAMPLE1_TARGET)
example2: $(EXAMPLE2_TARGET)

$(EXAMPLE1_TARGET): $(EXAMPLE1_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

$(EXAMPLE2_TARGET): $(EXAMPLE2_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^
