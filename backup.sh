#!/usr/bin/env bash

function backupDotFiles() {
  cp "${HOME}/.bashrc" "$HOME"/.dotfiles
  cp "${HOME}/.zshrc" "$HOME"/.dotfiles
  cp -r "${HOME}/.zsh" "$HOME"/.dotfiles
  cp -r "${HOME}/.oh-my-zsh/custom" "$HOME"/.dotfiles
  
  cp -r "${HOME}/.config/helix" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/hoard" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/kitty" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/koneko" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/nvim" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/nvim.bak" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/polybar" "$HOME"/.dotfiles
  cp -r "${HOME}/.config/rofi" "$HOME"/.dotfiles
}

function backupPackages() {
  exa "${HOME}"/go/bin | cut -d'@' -f1 | grep -vE '^$' >"${HOME}"/.dotfiles/go-packages.lst
  pacman -Qqe > "${HOME}"/.dotfiles/pacman-packages.lst
  paru -Qqe > "${HOME}"/.dotfiles/aur-packages.lst
  pip list > "${HOME}"/.dotfiles/pip-packages.lst
}

function backupVscode() {
  code --list-extensions >"${HOME}"/.dotfiles/vscode-packages.lst
}

function backupAll() {
  backupDotFiles
  backupPackages
  backupVscode
}

function restorePackages() {
  sudo pacman -Syu
  cat "{$HOME}"/.dotfiles/pacman-packages.lst | tr '\n' ' ' | xargs sudo pacman -S
}

function backupHomeDir() {
  if [ ! -d "$1" ]; then
    echo "$1 is not a valid directory"
  fi
  FOLDER=$(echo "$1" | sed 's/\/$//g')
  sudo rsync -aP --exclude-from=files/rsync-homedir-excludes.txt "${HOME}/" "${FOLDER}/"
}

# function restoreDotfiles() {
#   bash install.sh dotfiles
# }

# function restoreAll() {
#   restorePackages
# }

case "$1" in
"dotfiles")
  backupDotFiles
  ;;
"packages" | "pkgs" | "pacman")
  backupPackages
  ;;
"vscode")
  backupVscode
  ;;
"homedir" | "home")
  backupHomeDir "$2"
  ;;
"restore")
  restoreAll
  ;;
*)
  backupAll
  ;;
esac
