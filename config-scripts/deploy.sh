#!/bin/bash
echo "Deploy monolith begin"
echo "Setting work dir -> "
dir=~/
echo "Getting code --> "
git clone -b monolith https://github.com/express42/reddit.git
echo "Make dep ---> "
cd reddit/ && bundle install
echo "Startind puma daemon ----> "
puma -d
echo " -> Done!"
