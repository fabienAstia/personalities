#!/bin/bash
set -e
set -x
cd "/home/jenkins/agent1/workspace/personalities-front-deployment/personalities-vue"
cat <<EOF> .env.production
VITE_API_URL=https://fabien-astiasaran.com/api
EOF

npm install
npm run build
rm -rf "/srv/fabien-astiasaran/www/personalities/"
mkdir -p "/srv/fabien-astiasaran/www/personalities/"
cp -r /home/jenkins/agent1/workspace/personalities-front-deployment/personalities-vue/dist/* \
/srv/fabien-astiasaran/www/personalities/
