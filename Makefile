# project/Makefile

# Compiler and flags
CC := gcc
CFLAGS := -Wall -fPIC
ARFLAGS := rcs
LDFLAGS :=

# Include the consolidated subdirectory Makefile for libraries
include static/build.mk
include shared/build.mk

LDFLAGS += $(STATIC_FLAGS)
LDFLAGS += $(SHARED_FLAGS)

# Application specific
APP_SOURCES := $(wildcard apps/*.c)
APP_OBJECTS := $(APP_SOURCES:.c=.o)
APP_TARGET := app_executable

.PHONY: all clean $(STATIC_DEPENDS) $(SHARED_DEPENDS) app

all: $(STATIC_DEPENDS) $(SHARED_DEPENDS) app

app: $(APP_TARGET)

$(APP_TARGET): $(APP_OBJECTS) $(STATIC_TARGETS) $(SHARED_TARGETS)
	$(CC) $(LDFLAGS) -o $@ $^

# Clean rule
clean:
	rm -f $(SHARED_TARGETS) $(STATIC_TARGETS) $(APP_OBJECTS) $(APP_TARGET)
	find -type f -name "*.o" -exec rm {} +

# Generic rule for object files, applies to sources from both libraries and apps
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
