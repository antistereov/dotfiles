#!/bin/bash


echo "Installing Catppuccin..."
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

echo "Installing tmux-cpu..."
mkdir -p ~/.config/tmux/plugins/tmux-cpu
git clone https://github.com/tmux-plugins/tmux-cpu.git ~/.config/tmux/plugins/tmux-cpu

echo "Installing tmux-battery..."
mkdir -p ~/.config/tmux/plugins/tmux-battery
git clone https://github.com/tmux-plugins/tmux-battery.git ~/.config/tmux/plugins/tmux-battery

echo "Applying custom configuration..."
tmux source ~/.config/tmux/tmux.conf
