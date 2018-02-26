GO           := $(shell command -v go 2> /dev/null)
GIT          := $(shell command -v git 2> /dev/null)

GOTOOLS      := github.com/alecthomas/gocyclo						\
                github.com/GoASTScanner/gas/cmd/gas/...				\
                github.com/golang/lint/golint						\
                github.com/gordonklaus/ineffassign					\
                github.com/jgautheron/goconst/cmd/goconst/...		\
                github.com/kisielk/errcheck							\
                github.com/mdempsky/maligned						\
                github.com/mdempsky/unconvert						\
                github.com/opennota/check/cmd/varcheck/...			\
                github.com/opennota/check/cmd/structcheck/...		\
                github.com/tsenart/deadcode							\
                golang.org/x/tools/cmd/gotype						\
                mvdan.cc/interfacer									\
				gopkg.in/alecthomas/gometalinter.v2

all: dep linter-tools

dep:
	wget -O /build/depinstall.sh https://raw.githubusercontent.com/golang/dep/master/install.sh
	chmod +x /build/depinstall.sh
	/build/depinstall.sh
	rm /build/depinstall.sh

linter-tools:
	@echo ">> ensuring tools are installed"
	@- $(foreach GOTOOL,$(GOTOOLS),          \
		$(GO) get -u $(GOTOOL) ;             \
	)

.PHONY: all

