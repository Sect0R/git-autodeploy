#!/bin/bash

git pull

if [ -x "$(command -v yarn)" ]; then
    yarn build;
else
    if [ -x "$(command -v npm)" ]; then
        npm run build;
    else
        webpack;
    fi
fi