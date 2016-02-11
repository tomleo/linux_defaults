function l
    # ls -alhp --color | sed 1d | awk '{print $9, $5}' | column -t
    pwd
    echo "------"
    ls -alhp --color | sed 1d | awk '{print $9}' | column -t
end
