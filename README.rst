===========================
Dockerised Language Servers
===========================

Overview
=============
This repository is an attempt at providing `Dockerfiles` for various language servers, along with a wrapper script, that can be run transparently by any LSP_ client, without the client having to know anything about Docker.  Simply build the image you need, and point your text editor to the corresponding wrapper script.

Contributions, questions, and feedback are more than welcome, especially at this early stage.


Contributing
============
If you would like to add a language server to this repository, the requirements are that

- The image entrypoint is the language server executable and in "exec form",
- The wrapper script follows ``wrapper-template.sh``,
- The image uses the Alpine variant of its base image (if available), and
- There is a ``Makefile`` rule for building the image.

It is not required to provide multiple versions, but it may be useful to have multiple images for different versions of the *language*, such as is the case with Elixir.  Your ``Dockerfile`` just needs to install the language server, and end with an ``ENTRYPOINT`` insturction that points to the language server itself, in "exec form" so that signals are passed to the language server.  Depending on whether the language server is controlled via stdio or a socket, you will need to specify appropriate options in to ``docker run`` in the wrapper script.  (This would usually be ``--interactive`` for stdio, and either just ``--publish=`` or ``--publish-all=`` with ``EXPOSE`` instructions in the ``Dockerfile`` for sockets.)


Related Tools
=============

lsp-docker_
-----------
A companion Emacs package to `lsp-mode`_ that eliminates the need for wrapper scripts, but at the cost of making your Emacs init a bit more complicated.  This is what the original author was using before starting this project, as they found it simpler to use a transparent wrapper script for each language server and configure `lsp-mode` on a per-project basis with Directory Variables.

rid_ (Run In Docker)
----------------------
A tool for running commands inside Docker containers, with a configuration syntax akin to that of docker-compose_, and that can also generate wrapper scripts.  May be used with the `Dockerfiles` in this repository.


.. _LSP: https://microsoft.github.io/language-server-protocol
.. _lsp-docker: https://github.com/emacs-lsp/lsp-docker
.. _lsp-mode: https://github.com/emacs-lsp/lsp-mode
.. _rid: https://github.com/xendk/rid
.. _docker-compose: https://docs.docker.com/compose
