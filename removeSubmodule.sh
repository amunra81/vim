#!/bin/bash
if [ "$1" == '' ]; then
        echo "Provide a folder" >&2
        exit 1;
fi

if [ -d "$1" ]; then
        echo "Let's fuck it" >&2
        git submodule deinit -f $1
        git add .gitmodules
        git rm -r $1
        #git rm -r --cached $1
        rm -rf .git/modules/$1
        git submodule update
        exit 0;
fi

echo "$1 is not a folder"
exit 1
