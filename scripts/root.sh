#!/bin/bash
set -e

# System packages
apt-get update -qq
apt-get install -y -qq curl git build-essential procps file tmux

# Skill dependencies (apt)
# jq: session-logs, trello | ripgrep: session-logs
apt-get install -y -qq jq ripgrep

# Fix npm permissions for global installs as node user
chown -R node:node /usr/local/lib/node_modules /usr/local/bin /usr/local/share /usr/local/lib /usr/local/include 2>/dev/null || true

# Prepare Homebrew directories
mkdir -p /home/linuxbrew/.linuxbrew
chown -R node:node /home/linuxbrew/.linuxbrew

# Install Go toolchain
curl -fsSL https://go.dev/dl/go1.23.6.linux-amd64.tar.gz | tar -C /usr/local -xz

# Clean apt cache
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Finalize permissions
chown -R node:node /home/node

# Root setup complete
