#! /usr/bin/fish
for line in (cat emacs.d.remote)
    echo "git clone $line"
end
