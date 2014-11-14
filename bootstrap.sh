#!/bin/sh

set -x

PARENT_DIR=$(cd "$(dirname "$0")"; pwd)
PARENT_DIRNAME=$(basename "$PARENT_DIR")
CONFIGS=$(find $PARENT_DIR/home -mindepth 1 -maxdepth 1 -not \( \
  -name "$PARENT_DIRNAME" -o \
  -name 'bootstrap.sh' -o \
  -name ".git" -o \
  -name ".gitmodules" -o \
  -name ".DS_Store" \))
JEDI_DIR="$PARENT_DIR/home/vim/bundle/plugin-jedi"

init() {
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

update() {
    # Update all submodules
    (cd "$PARENT_DIR" && git submodule update --init)

    # Update Jedi
    if [ -e "$JEDI_DIR" ]; then
        (cd "$JEDI_DIR" && git submodule update --init)
    fi
}

usage() {
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
