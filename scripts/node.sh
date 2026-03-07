#!/bin/bash
set -e

# ─── Homebrew ─────────────────────────────────────────────────
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ─── uv (Python package manager) ─────────────────────────────
curl -LsSf https://astral.sh/uv/install.sh | sh

# Node setup complete — package managers (brew, uv) are ready
# Run 'install-skills' to install all skill dependencies
