PODMAN = podman
ifeq ($(shell id -u), 0)
$(error Image is supposed to be built as non-root user.)
endif
DIR = .
FILE = Dockerfile
IMAGE = reverse-proxy
BUILD_ARGS =

.PHONY: build rebuild test pull prune enter

build:
	$(PODMAN) $(PODMAN_FLAGS) build $(BUILD_ARGS) -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

rebuild: pull
	$(PODMAN) $(PODMAN_FLAGS) build --no-cache $(BUILD_ARGS) -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

test:
	$(PODMAN) $(PODMAN_FLAGS) run --rm -it $(IMAGE) /usr/bin/caddy -v

pull:
	$(PODMAN) $(PODMAN_FLAGS) pull $(shell grep FROM Dockerfile | sed 's/^FROM//g';)

prune:
	$(PODMAN) $(PODMAN_FLAGS) image prune --force

enter:
	$(PODMAN) $(PODMAN_FLAGS) run --rm -it --entrypoint=sh $(IMAGE)

