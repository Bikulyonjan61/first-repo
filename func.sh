#!/bin/bash
check_file() {
        if [[ -f "$1" ]]; then
        echo "$1 is a file"
    elif [[ -d "$1" ]]; then
        echo "$1 is a directory"
    else
        echo "$1 does not exist"
        return 1
    fi
}

check_file "hello.sh"
check_file "check_file.sh"
check_file "count_lines.sh"