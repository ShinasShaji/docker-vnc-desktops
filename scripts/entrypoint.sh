#!/usr/bin/env bash
set -e

# 1. Persist env vars and configure SSH
/setup/setup-env-vars.sh

# 2. Launch SSH daemon
/usr/sbin/sshd

# 3. Hand off to startup script
exec /startup.sh "$@"
