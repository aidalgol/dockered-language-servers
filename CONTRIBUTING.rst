============
Contributing
============
If you would like to add a language server to this repository, the requirements are that

- The image entrypoint is the language server executable and in "exec form",
- The wrapper script follows ``wrapper-template.sh``,
- Long-form options are used for all commands, where available,
- The image uses the Alpine variant of its base image (if available), and
- There is a ``Makefile`` rule for building the image.

It is not required to provide multiple versions, but it may be useful to have multiple images for different versions of the *language*, such as is the case with Elixir.  Your ``Dockerfile`` just needs to install the language server, and end with an ``ENTRYPOINT`` instruction that points to the language server itself, in "exec form" so that signals are passed to the language server.  Depending on whether the language server is controlled via stdio or a socket, you will need to specify appropriate options in to ``docker run`` in the wrapper script.  (This would usually be ``--interactive`` for stdio, and either just ``--publish=`` or ``--publish-all=`` with ``EXPOSE`` instructions in the ``Dockerfile`` for sockets.)
