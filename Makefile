ELIXIRLS-DOCKERFILES = $(wildcard Dockerfile.elixir-ls-*)
ELIXIRLS-VERSIONS = $(subst Dockerfile.elixir-ls-,,$(ELIXIRLS-DOCKERFILES))
ELIXIRLS-TARGETS = $(patsubst %,elixir-ls-%,$(ELIXIRLS-VERSIONS))

.PHONY: $(ELIXIRLS-TARGETS)

$(ELIXIRLS-TARGETS):%:
	docker build \
	  --tag=$(subst elixir-ls-,elixir-ls:,$*) \
	  --file=$(subst elixir-ls-,Dockerfile.elixir-ls-,$*) .
