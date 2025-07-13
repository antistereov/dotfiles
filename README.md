# Dotfiles

This repository contains my dotfiles for various tools. Most of it are my very own decisions. I got some inspiration from [typecraft](https://www.youtube.com/@typecraft_dev). I can really recommend his videos.

## Installation

### 1. Clone this repository

Run the following command to clone this repository.

```bash
git clone https://github.com/antistereov/dotfiles.git
```

### 1. Install required tools

If you want to use any of the tools listed in this repository, you should check out the READMEs in the corresponding sub-directory.

### 2. Use `stow` to create syslinks

Go to the root of this repository and run:

```bash
    stow -d . -t $HOME/.config --adopt
```

> **Note:** Make sure to run this command every time you update this repository.
