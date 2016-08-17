Linux Defaults
==============

vimrc, bashrc, ect. I guess the popular term nowadays is `dotfiles`.

The setup 
---------

Setup Fish Shell

.. code-block:: shell-session

    sudo add-apt-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
    cd /home/tom/.config/
    ln -s /home/tom/hacking/linux_defaults/home/.config/fish/ fish
    chsh -s `which fish`

Setup Terminator

.. code-block:: shell-session

    sudo apt-get install terminator
    gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
    gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
    ln -s /home/tom/hacking/linux_defaults/home/.config/terminator/ terminator

Powerlines
----------

Basically followed the steps here http://askubuntu.com/a/283909
or use fish shell

Git
---

.. code-block:: cmd

    sudo ln -s ~/hacking/linux_defaults/bin/git-merged-branches /usr/local/bin/git-merged-branches

In ``.gitconfig`` add the following line::

    [alias]
        merged-branches = !git-merged-branches

