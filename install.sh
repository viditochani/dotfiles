#!/bin/sh

BACKUP_DIR="$HOME/.backup"
[[ ! -d "BACKUP_DIR" ]] && mkdir "$BACKUP_DIR"
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
  echo "$name";
done

command -v git >/dev/null 2>&1 || ({ echo "Git required for plugins"; exit; })
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
