#!/bin/bash -xe
unlink "$HOME/.zshenv"
ls "$XDG_CONFIG_HOME" | xargs -I {} unlink {}
