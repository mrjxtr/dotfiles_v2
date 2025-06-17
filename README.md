# MrJxtr Dotfiles

This contains the dotfiles for my system

## Requirements

Ensure you have the followin installed on your system

```bash
sudo pacman -S git stow
```

## Installation

First, clone the dotfiles repository in your $HOME directory

```bash
git clone git@github.com:mrjxtr/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```bash
stow .
```
