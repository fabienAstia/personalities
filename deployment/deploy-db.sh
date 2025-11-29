#!/bin/bash
set -e #stop on error
set -x #display command lines as they run
PROJECT="personalities-db-deployment"
DESTINATION="/srv/fabien-astiasaran/personalities/$PROJECT"

if [ -e "$DESTINATION" ]; then
	rm -rf "$DESTINATION"
fi

mkdir -p "$DESTINATION"/Scripts
cp -r /home/jenkins/agent1/workspace/personalities-db-deployment/Scripts/* \
"$DESTINATION"/Scripts/
cd "$DESTINATION"/Scripts/

psql -v ON_ERROR_STOP=1 postgresql://$ddl_username:$ddl_password@localhost:5432/personalities_db <<SQL
	\i ./with_strength_and_weakness.ddl.sql
    \i ./1-order_question.dml.sql
    \i ./2-professions.dml.sql
    \i ./3-eval_and_traits.dml.sql
    \q
SQL
