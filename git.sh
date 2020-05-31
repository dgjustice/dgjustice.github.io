set -eux

git config --global url."https://".insteadOf git://
git config --global user.name "dgjustice"
git config --global user.email "djustice@wificidr.net"
git config --global credential.helper "/bin/bash /app/credentials.sh"
