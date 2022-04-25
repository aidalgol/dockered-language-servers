===========================
Dockerised Language Servers
===========================

ARCHIVED 2022-04-25
===================
As I have moved away from Docker containers in favour of Nix environments, I am archiving this project.  If anyone wishes to take over this project, I am happy to hand over ownership of the repository and the DockerHub account under which the images have been published.


Overview
========
This repository is an attempt at providing `Dockerfiles` for various language servers, along with a wrapper script, that can be run transparently by any LSP_ client, without the client having to know anything about Docker.  Simply build the image you need, and point your text editor to the corresponding wrapper script.

Contributions, questions, and feedback are more than welcome, especially at this early stage.


Usage
=====
Any language server available through this project can be run by invoking the ``dockered-lsp`` script (located under ``bin``) with the name of their language server.  For example ``dockered-lsp bash-language-server``.  For some language servers, we provide a symlink to this script named after the language server executable, meaning that you can simply add this repository's ``bin`` directory to your ``$PATH`` environment variable, without having to configure your client specially to use the wrapper script.  (This is not provided for all language servers, because some use a generic name for their executable, such as elixir-ls, whose executable is named ``language_server.sh``.)

The images are automatically built and pushed to Docker Hub periodically, and since ``docker run`` will automatically try to pull images that do not exist in the local registry, no further setup is required when using the ``dockered-lsp`` script.


Optional Home Directory Isolation
=================================
By default, ``dockered-lsp`` mounts your home directory inside the container at the same path as your home directory in the host.  i.e. ``$HOME`` on the host, is ``$HOME`` in the container.  This allows the containers to be run by any client without the client having to do path translation itself.  The downside to this is that it exposes your entire home directory to the container, potentially exposing sensitive files to malicious or misbehaving containers.

If you wish to expose only certain subdirectories of your home directory, you can specify them in ``~/.config/dockered-lsp/home-mounts``, one per line.  So, for example, to expose only ``~/src``, create that file with only one line: ``src``.


Example Configurations
======================
lsp-mode_
---------
::

  (dir-locals-set-class-variables 'elixirls-1-10
    '((elixir-mode .
        ((lsp-elixir-server-command . ("/path/to/dockered-language-servers/dockered-lsp.sh" "elixir-1.10"))
         (eval . (lsp))))))

  (dir-locals-set-directory-class
   "/path/to/elixir-1.10/project" 'elixirls-1-10)



Related Tools
=============
lsp-docker_
-----------
A companion Emacs package to `lsp-mode`_ that eliminates the need for wrapper scripts, but at the cost of making your Emacs init a bit more complicated.  This is what the original author was using before starting this project, as they found it simpler to use a transparent wrapper script for each language server and configure `lsp-mode` on a per-project basis with Directory Variables.

rid_ (Run In Docker)
----------------------
A tool for running commands inside Docker containers, with a configuration syntax akin to that of docker-compose_, and that can also generate wrapper scripts.  May be used with the `Dockerfiles` in this repository.


Contributing
============
See `CONTRIBUTING.rst`_.

.. _LSP: https://microsoft.github.io/language-server-protocol
.. _lsp-docker: https://github.com/emacs-lsp/lsp-docker
.. _lsp-mode: https://github.com/emacs-lsp/lsp-mode
.. _rid: https://github.com/xendk/rid
.. _docker-compose: https://docs.docker.com/compose
.. _CONTRIBUTING.rst: CONTRIBUTING.rst
