============
Contributing
============
If you would like to add a language server to this repository, the requirements are that

- The image entrypoint is the language server executable and in "exec form",
- An entry is added to the wrapper script ``dockered-lsp.sh``,
- Long-form options are used for all commands, where available,
- The image uses the ``-alpine`` variant of its base image, if possible, otherwise the ``-slim`` variant,
- If there is no language-specific image that is appropriate to use as a base, ``debian/stable-slim`` is to be used,
- There is a ``README.md`` for the Docker Hub page, and
- There is a GitHub action to build and publish the image and ``README.md`` to Docker Hub.

It is not required to provide multiple versions, but it may be useful to have multiple images for different versions of the *language*, such as is the case with Elixir.  Your ``Dockerfile`` just needs to install the language server, and end with an ``ENTRYPOINT`` instruction that points to the language server itself, in "exec form" so that signals are passed to the language server.  Depending on whether the language server is controlled via stdio or a socket, you will need to specify appropriate options to ``docker run`` in the wrapper script.  (This would usually be ``--interactive`` for stdio, and either just ``--publish=`` or ``--publish-all=`` with ``EXPOSE`` instructions in the ``Dockerfile`` for sockets.)

Long-form options are preferred to make scripts (including ``Dockerfile`` ``RUN`` instructions) clearer, without requiring the reader to look up several single-letter options.

The Alpine and "slim" base-images are preferred in the interest of saving space.
