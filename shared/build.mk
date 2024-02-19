# shared/build.mk

# Example1 shared library files and target
EXAMPLE1_SHARED_SOURCES := $(wildcard shared/example1/*.c)
EXAMPLE1_SHARED_OBJECTS := $(EXAMPLE1_SHARED_SOURCES:.c=.o)
EXAMPLE1_SHARED_TARGET := shared/libexample1.so

# Example2 shared library files and target
EXAMPLE2_SHARED_SOURCES := $(wildcard shared/example2/*.c)
EXAMPLE2_SHARED_OBJECTS := $(EXAMPLE2_SHARED_SOURCES:.c=.o)
EXAMPLE2_SHARED_TARGET := shared/libexample2.so

SHARED_TARGETS := shared/libexample1.so shared/libexample2.so
SHARED_DEPENDS := example1_shared example2_shared
SHARED_FLAGS := -Lshared -lexample1 -lexample2

# Targets for both shared libraries
example1_shared: $(EXAMPLE1_SHARED_TARGET)
example2_shared: $(EXAMPLE2_SHARED_TARGET)

$(EXAMPLE1_SHARED_TARGET): $(EXAMPLE1_SHARED_OBJECTS)
	$(CC) -fPIC -shared -o $@ $^

$(EXAMPLE2_SHARED_TARGET): $(EXAMPLE2_SHARED_OBJECTS)
	$(CC) -fPIC -shared -o $@ $^
