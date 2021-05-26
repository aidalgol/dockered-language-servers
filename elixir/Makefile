ELIXIRLS-DOCKERFILES = $(wildcard Dockerfile.*)
ELIXIRLS-VERSIONS = $(subst Dockerfile.,,$(ELIXIRLS-DOCKERFILES))
ELIXIRLS-TARGETS = $(patsubst %,elixir-ls-%,$(ELIXIRLS-VERSIONS))

.PHONY: $(ELIXIRLS-TARGETS)

$(ELIXIRLS-TARGETS):%:
	docker build \
	  --tag=$(subst elixir-ls-,elixir-ls:,$*) \
	  --file=$(subst elixir-ls-,Dockerfile.,$*) .
