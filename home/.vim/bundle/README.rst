
Setting Up VIM
==============

Install Vundle
--------------

.. code-block:: shell-session

    $ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
    $ sh ./install.sh


Install ctags
-------------

.. code-block:: shell-session

    sudo apt-get install exuberant-ctags
    cd /working/directory
    ctags *.py


Install ag (silver searcher)
----------------------------

.. code-block:: shell-session

    apt-get install silversearcher-ag


Install Vim Packages
--------------------

.. code-block:: shell-session

    vim +NeoBundleInstall +qall

