#!/bin/sh

BACKUP_DIR="$HOME/.backup"
[[ -d "BACKUP_DIR" ]] && mkdir "$BACKUP_DIR"
for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    echo "WARNING: $target exists, copying to $BACKUP_DIR."
    cp -r "$target" "$BACKUP_DIR/$target"
  fi
  if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
    echo "Creating $target"
    ln -s "$PWD/$name" "$target"
  fi
done

command -v git >/dev/null 2>&1 || ({ echo "Git required for plugins"; exit; })
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
