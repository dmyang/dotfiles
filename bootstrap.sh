#!/bin/sh

set -x

PWD_NAME=${PWD##*/}
PWD_ABS_PATH=$(pwd -P)
CONFIGS=$(find $PWD_ABS_PATH/home -maxdepth 1 -not \( -name "$PWD_NAME" -o \
                                                      -name 'bootstrap.sh' -o \
                                                      -name ".git" -o \
                                                      -name ".gitmodules" \
                                                      -name ".DS_Store" \))
JEDI_DIR="$PWD_ABS_PATH/home/vim/bundle/plugin-jedi"

function init() {
    update

    # Remove existing configs and symlink new files
    cd "$HOME"
    for config in $CONFIGS
    do
        new_config="$HOME/.$(basename $config)"
        [ -L "$new_config" ] && rm "$new_config"
        [ -d "$new_config" ] && rm -r "$new_config"
        ln -is "$config" $new_config
    done

    echo "Setup complete."
}

function update() {
    # Update all submodules
    (cd "$PWD_ABS_PATH" && git submodule update --init)

    # Update Jedi
    if [ -e "$JEDI_DIR" ]; then
        (cd "$JEDI_DIR" && git submodule update --init)
    fi
}

function usage() {
    echo "Usage: `basename $0` init - intializes all submodules and links files
                 `basename $0` update - updates all submodules"
    exit $E_BADARGS
}

if [ ! "$#" -ne 0 ]; then
    usage
fi

case "$1" in
    init)
        init
        ;;
    update)
        update
        ;;
    *)
        usage
        ;;
esac
