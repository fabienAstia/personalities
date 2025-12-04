DROP TABLE IF EXISTS t_evaluations, t_strengths_and_weaknesses, t_roles, t_mbti_types, t_includes, t_professions, t_matches, t_psych_pref, t_constraints, t_users, t_questions, t_answers;

CREATE TABLE t_evaluations(
	id int GENERATED ALWAYS AS IDENTITY,
	label varchar(9) NOT NULL,
	CONSTRAINT t_evaluations_pk PRIMARY key(id),
	CONSTRAINT t_evaluations_label_uk UNIQUE (label)
);

CREATE TABLE t_strengths_and_weaknesses (
	id int GENERATED ALWAYS AS IDENTITY,
	trait varchar(70) NOT NULL,
	evaluation_id int NOT NULL,
	CONSTRAINT t_strengths_and_weaknesses_pk PRIMARY KEY (id),
	CONSTRAINT t_strengths_and_weaknesses_trait_uk UNIQUE (trait),
	CONSTRAINT t_strengths_and_weaknesses_evaluation_id FOREIGN KEY (evaluation_id)
		REFERENCES t_evaluations(id)
);

CREATE TABLE t_psych_pref(
	id int GENERATED ALWAYS AS IDENTITY,
	code char(1) NOT NULL,
	CONSTRAINT t_dimensions_pk PRIMARY KEY (id),
	CONSTRAINT t_dimensions_uk UNIQUE (code)
);

CREATE TABLE t_constraints(
	id int GENERATED ALWAYS AS IDENTITY,
	minimum_value int NOT NULL,
	maximum_value int NOT NULL,
	CONSTRAINT t_constraints_pk PRIMARY KEY (id),
	CONSTRAINT t_constraints_uk UNIQUE (minimum_value, maximum_value)
);

CREATE TABLE t_mbti_types(
	id int GENERATED ALWAYS AS IDENTITY,
	code char(4) NOT NULL,
	name varchar(15) NOT NULL,
	description varchar(255) NOT NULL,
	population_percentage decimal(3,1) NOT NULL,
	interesting_fact varchar(255) NOT NULL,
	image varchar(255) NOT NULL, --vérifier le max
	CONSTRAINT t_mbti_types_pk PRIMARY KEY (id),
	CONSTRAINT t_mbti_types_code_uk UNIQUE (code),
	CONSTRAINT t_mbti_types_name_uk UNIQUE (name),
	CONSTRAINT t_mbti_types_description_uk UNIQUE (description),
	CONSTRAINT t_mbti_types_interesting_fact_uk UNIQUE (interesting_fact),
	CONSTRAINT t_mbti_types_image_uk UNIQUE (image)
);

CREATE TABLE t_includes(
	mbti_type_id int NOT NULL,
	personality_trait_id int NOT NULL,
	CONSTRAINT t_includes_mbti_type_fk FOREIGN KEY (mbti_type_id)
		REFERENCES t_mbti_types(id),
	CONSTRAINT t_includes_trait_fk FOREIGN KEY (personality_trait_id)
		REFERENCES t_strengths_and_weaknesses(id),
	CONSTRAINT t_includes_uk PRIMARY KEY (mbti_type_id, personality_trait_id)
);

CREATE TABLE t_roles(
	id int GENERATED ALWAYS AS IDENTITY,
	role varchar(10) NOT NULL,
	CONSTRAINT t_roles_pk PRIMARY KEY (id),
	CONSTRAINT t_roles_role_uk UNIQUE (role)
);

CREATE TABLE t_professions(
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(100) NOT NULL,
	CONSTRAINT t_professions_pk PRIMARY KEY(id),
	CONSTRAINT t_professions_name_uk UNIQUE (name)
);

CREATE TABLE t_matches(
	mbti_type_id int NOT NULL,
	profession_id int NOT NULL,
	CONSTRAINT t_matches_mbti_type_fk FOREIGN KEY (mbti_type_id)
		REFERENCES t_mbti_types(id),
	CONSTRAINT t_matches_profession_fk FOREIGN KEY (profession_id)
		REFERENCES t_professions(id),
	CONSTRAINT t_matches_uk PRIMARY KEY (mbti_type_id, profession_id)
);

CREATE TABLE t_users (
	id int GENERATED ALWAYS AS IDENTITY,
	username varchar(255) NOT NULL,
	password varchar(60) NOT NULL, --16 NOT encoded
	role_id int NOT NULL,
	mbti_type_id int,
	CONSTRAINT t_users_pk PRIMARY KEY (id),
	CONSTRAINT t_users_username_uk UNIQUE (username),
	CONSTRAINT t_users_role_fk FOREIGN KEY (role_id)
		REFERENCES t_roles(id),
	CONSTRAINT t_users_mbti_type_id FOREIGN KEY (mbti_type_id)
		REFERENCES t_mbti_types (id)
);

CREATE TABLE t_questions (
	id int GENERATED ALWAYS AS IDENTITY,
	"label" varchar(255) NOT NULL,
	order_question int NOT NULL, 
	constraint_id int NOT NULL, 
	psych_pref_id int NOT NULL,
	CONSTRAINT t_questions_pk PRIMARY KEY (id),
	CONSTRAINT t_questions_label_uk UNIQUE ("label"),
	CONSTRAINT t_questions_order_uk UNIQUE (order_question),
	CONSTRAINT t_questions_constraints_fk FOREIGN KEY (constraint_id)
		REFERENCES t_constraints(id),
	CONSTRAINT t_questions_psych_pref_fk FOREIGN KEY (psych_pref_id)
		REFERENCES t_psych_pref (id)
);

CREATE TABLE t_answers(
	id int GENERATED ALWAYS AS IDENTITY,
	rating int NOT NULL,
	user_id int NOT NULL,
	question_id int NOT NULL,
	CONSTRAINT t_answers_pk PRIMARY KEY (id),
	CONSTRAINT t_answers_users_fk FOREIGN KEY (user_id)
		REFERENCES t_users(id),
	CONSTRAINT t_answers_questions_fk FOREIGN KEY (question_id)
		REFERENCES t_questions(id),
	CONSTRAINT t_answers_user_question_uk UNIQUE (user_id, question_id)
);
