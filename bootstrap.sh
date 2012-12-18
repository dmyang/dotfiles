#!/bin/sh

set -ex

PWD_NAME=${PWD##*/}
PWD_ABS_PATH=$(pwd -P)
CONFIGS=$(find $PWD_ABS_PATH -maxdepth 1 -not \( -name "$PWD_NAME" -o \
                                                 -name 'bootstrap.sh' -o \
                                                 -name ".git" -o \
                                                 -name ".gitmodules" \))

# Initialize all submodules
(cd "$PWD_ABS_PATH" && git submodule update --init)

# Symlink all files
cd "$HOME"
for config in $CONFIGS
do
    new_config="$HOME/.$(basename $config)"
    [ -L "$new_config" ] && rm "$new_config"
    [ -d "$new_config" ] && rm -rI "$new_config"
    ln -is "$config" $new_config
done
