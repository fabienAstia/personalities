#!/bin/bash
set -e
set -x
JAR_NAME="personalities-business-0.0.1-SNAPSHOT.jar"
JAR_PATH="/var/lib/jenkins/agent1/workspace/personalities_CD_pipe/personalities-business/target"
DEPLOY_DIR="/srv/fabien-astiasaran/personalities/personalities-api-deployment"
SECRET_FILE="/etc/personalities/secret.properties"

PID=$(pgrep -u jenkins -f "$JAR_NAME" || true)
if [ -n "$PID" ]; then # -n = non-vide
	kill -15 "$PID"
else
	echo "no matching process found"
fi
rm -rf "$DEPLOY_DIR/$JAR_NAME"
mkdir -p "$DEPLOY_DIR"
cd "$DEPLOY_DIR"
cp "$JAR_PATH"/"$JAR_NAME" "$DEPLOY_DIR"

if [ -f "$DEPLOY_DIR/app.log" ]; then
    mv "$DEPLOY_DIR/app.log" "$DEPLOY_DIR/personalities-$(date +'%Y%m%d-%H%M%S').log"
fi

BUILD_ID=dontKillMe nohup java -jar "$DEPLOY_DIR/$JAR_NAME" \
--spring.profiles.active=prod \
--spring.config.additional-location="$SECRET_FILE" \
>> "$DEPLOY_DIR/app.log" 2>&1 &
