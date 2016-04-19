#! /usr/bin/fish

function help_text
    echo "Usage: [options] arguments..."
    echo "Arguments:"
    echo "-m : notify-send Message"
    echo "-e : use espeak instead of notify-send"
    echo "-t : set time"
    exit 1
end

set args (getopt -s sh met: $argv); or help_text
set args (fish -c "for el in $args; echo \$el; end")

set i 1
while true
    switch $args[$i]
        case "-m"
            echo "notify-send message"
        case "-e"
            echo "use espeak instead"
        case "t"
            echo "set time"
        case "--"
            break
    end
end


function timeit
    echo $argv[1]
end
