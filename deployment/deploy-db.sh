#!/bin/bash
set -e #stop on error
set -x #display command lines as they run
PROJECT="personalities-db-deployment"
DESTINATION="/srv/fabien-astiasaran/personalities/$PROJECT"

if [ -e "$DESTINATION" ]; then
	rm -rf "$DESTINATION"
fi

mkdir -p "$DESTINATION"/Scripts
cp -r /var/lib/jenkins/agent1/workspace/personalities_CD_pipe/Scripts/* \
"$DESTINATION"/Scripts/
cd "$DESTINATION"/Scripts/

psql -v ON_ERROR_STOP=1 postgresql://$ddl_username:$ddl_password@localhost:5432/personalities_db <<SQL
	\i ./DDL/schema_public.ddl.sql
    \i ./DML/prod/1-order_question.dml.sql
    \i ./DML/prod/2-professions.dml.sql
    \i ./DML/prod/3-eval_and_traits.dml.sql
    \i ./DDL/schema_test.ddl.sql
    \q
SQL
