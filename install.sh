#!/bin/sh

BACKUP_DIR="$HOME/.backup";
if [ ! -d "$BACKUP_DIR" ]; then mkdir "$BACKUP_DIR"; fi
for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    echo "WARNING: $target exists, moving to $BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/.$name"
  fi
  if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
    echo "Creating $target"
    ln -s "$PWD/$name" "$target"
  fi
done

command -v git >/dev/null 2>&1 || ({ echo "Git required for plugins"; exit; })
if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall
