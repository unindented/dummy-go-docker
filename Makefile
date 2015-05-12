# Setup

NAME := dummy
BIN  := $(NAME)
SRC  := $(wildcard *.go)
GO   := $(shell which go)

# Rules

all: build

build: $(BIN)

$(BIN): $(SRC)
	CGO_ENABLED=0 GOOS=linux $(GO) build -a -tags netgo -ldflags '-w' -o $(BIN) .

clean:
	@rm -f $(BIN)

.PHONY: build clean
