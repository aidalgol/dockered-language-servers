===========================
Dockerised Language Servers
===========================

Overview
=============
This repository is an attempt at providing `Dockerfiles` for various language servers, along with a wrapper script, that can be run transparently by any LSP_ client, without the client having to know anything about Docker.  Simply build the image you need, and point your text editor to the corresponding wrapper script.

Contributions, questions, and feedback are more than welcome, especially at this early stage.


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
