delete from schema_test.t_matches; delete from schema_test.t_professions;
delete from schema_test.t_includes; delete from schema_test.t_strengths_and_weaknesses;
delete from schema_test.t_evaluations; delete from schema_test.t_mbti_types;
delete from schema_test.t_questions; delete from schema_test.t_psych_pref;
delete from schema_test.t_constraints; delete from schema_test.t_users; 
delete from schema_test.t_roles;

INSERT INTO schema_test.t_roles (role) VALUES
    ('ROLE_ADMIN'), ('ROLE_USER');

INSERT INTO schema_test.t_users (username, password, role_id, mbti_type_id) VALUES
    ('test@gmail.com', '$2a$12$lXisCrw6wVSTLHOSSYghYe/kI7dFcC6pysAqH7xmFaS3WYBdO9fom',
    (select id from schema_test.t_roles tr where tr.role = 'ROLE_ADMIN'), NULL);

INSERT INTO schema_test.t_constraints(minimum_value, maximum_value) VALUES
    (-3, 3);

INSERT INTO schema_test.t_psych_pref(code) VALUES
    ('E'), ('I'), ('N'), ('S'), ('T'), ('F'), ('P'), ('J');

INSERT INTO schema_test.t_questions(label, order_question, constraint_id, psych_pref_id) VALUES
    ('Question pour choisir E', 1, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'E')),
    ('Question pour choisir I', 2, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'I')),
    ('Question pour choisir N', 3, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'N')),
    ('Question pour choisir S', 4, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'S')),
    ('Question pour choisir T', 5, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'T')),
    ('Question pour choisir F', 6, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'F')),
    ('Question pour choisir P', 7, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'P')),
    ('Question pour choisir J', 8, (select id from schema_test.t_constraints where minimum_value = -3 and maximum_value = 3),
        (select id from schema_test.t_psych_pref where code = 'J'));

INSERT INTO schema_test.t_mbti_types (code, name, description, population_percentage, interesting_fact, image) VALUES
	('ISTJ', 'Le Logisticien',
	'Les ISTJ sont des personnes disciplinées et fiables, attachées aux traditions et aux règles, qui s’assurent que chaque détail est pris en compte et que tout est fait dans les règles.',
	11.6,
	'C''est le type de personnalité le plus représenté parmi les comptables et les militaires.',
	'ISTJ.webp'),

	('ISFJ', 'Le Défenseur',
	'Les ISFJ sont des protecteurs chaleureux et loyaux, profondément dévoués à leurs proches et toujours prêts à faire passer le bien-être des autres avant le leur.',
	13.7,
	'Beaucoup d''infirmiers et de travailleurs sociaux sont ISFJ en raison de leur nature protectrice.',
	'ISFJ.webp'),

	('INFJ', 'L''Avocat',
	'Les INFJ sont des idéalistes calmes et passionnés, animés par une grande empathie et de fortes valeurs, déterminés à guider et inspirer les autres pour un monde meilleur.',
	1.5,
	'C''est le type le plus rare de tous, ne représentant qu''environ 1,5 % de la population.',
	'INFJ.webp'),

	('INTJ', 'L''Architecte',
	'Les INTJ sont des penseurs stratégiques et indépendants, axés sur l’efficacité et la réalisation d’objectifs ambitieux.',
	2.1,
	'Beaucoup de chefs d’entreprise et de stratèges sont INTJ, notamment Elon Musk.',
	'INTJ.webp'),

	('ISTP', 'Le Virtuose',
	'Les ISTP sont des individus pragmatiques, ingénieux et réservés, à l’aise avec la mécanique et la résolution de problèmes concrets, abordant le monde comme un terrain d’expérimentation.',
	5.4,
	'Ce type est surreprésenté chez les ingénieurs et les artisans, appréciant les solutions pratiques.',
	'ISTP.webp'),

	('ISFP', 'L''Aventurier',
	'Les ISFP sont des esprits libres et artistiques, sensibles et spontanés, qui suivent leur cœur et recherchent sans cesse de nouvelles expériences.',
	8.8,
	'De nombreux artistes et designers sont ISFP, ce qui correspond à leur nature expressive.',
	'ISFP.webp'),

	('INFP', 'Le Médiateur',
	'Les INFP sont des âmes poétiques et bienveillantes, guidées par un riche monde intérieur et de profondes valeurs, toujours prêtes à soutenir les autres et à défendre des causes qui leur tiennent à cœur.',
	4.4,
	'J.R.R. Tolkien, auteur du Seigneur des Anneaux, est souvent cité comme un INFP typique.',
	'INFP.webp'),

	('INTP', 'Le Logicien',
	'Les INTP sont des esprits analytiques et novateurs, animés par une curiosité insatiable et le désir de tout comprendre de manière logique.',
	3.3,
	'C''est l''un des types les plus communs chez les philosophes et les programmeurs',
	'INTP.webp'),

	('ESTP', 'L''Entrepreneur',
	'Les ESTP sont des fonceurs vifs et audacieux, qui adorent l’action et le risque, vivant volontiers sur le fil du rasoir pour saisir chaque opportunité.',
	4.3,
	'James Bond est souvent cité comme un parfait exemple d’ESTP, audacieux et opportuniste.',
	'ESTP.webp'),

	('ESFP', 'L''Amuseur',
	'Les ESFP sont des personnes joviales et extraverties, spontanées et pleines d’énergie, avec qui on ne s’ennuie jamais.',
	8.5,
	'Ils sont souvent sous les projecteurs, qu''il s''agisse d''acteurs, musiciens ou influenceurs.',
	'ESFP.webp'),

	('ENFP', 'L''Inspirateur',
	'Les ENFP sont des explorateurs enthousiastes, débordants d’idées et de curiosité, cherchant toujours de nouvelles opportunités.',
	8.1,
	'Robin Williams était un ENFP classique, plein d’énergie et de créativité.',
	'ENFP.webp'),

	('ENTP', 'L''Innovateur',
	'Les ENTP sont des esprits astucieux et curieux, incapables de résister à un défi intellectuel.',
	3.2,
	'Ils adorent le débat et peuvent défendre une idée juste pour le plaisir de la discussion.',
	'ENTP.webp'),

	('ESTJ', 'Le Directeur',
	'Les ESTJ sont des organisateurs efficaces et pragmatiques, qui prennent naturellement les commandes et s’assurent que tout avance de manière ordonnée et productive.',
	8.7,
	'Ils sont souvent à la tête d’organisations, appréciant la structure et l’ordre.',
	'ESTJ.webp'),

	('ESFJ', 'Le Consul',
	'Les ESFJ sont des individus sociables et attentionnés, guidés par un profond sens de la communauté et du devoir, qui s’épanouissent en prenant soin des autres et en maintenant l’harmonie autour d’eux.',
	12.3,
	'C''est le type de personnalité le plus courant parmi les enseignants et hôtes d’événements.',
	'ESFJ.webp'),

	('ENFJ', 'Le Protagoniste',
	'Les ENFJ sont des meneurs charismatiques et empathiques, profondément altruistes, capables d’inspirer et de rassembler les autres autour d’une vision positive.',
	2.4,
	'Oprah Winfrey est souvent considérée comme un parfait exemple d’ENFJ, charismatique et inspirante.',
	'ENFJ.webp'),

	('ENTJ', 'Le Commandant',
	'Les ENTJ sont des leaders nés, ambitieux et déterminés, qui n’hésitent pas à imposer leur vision et à organiser efficacement les autres pour atteindre leurs objectifs audacieux.',
	1.8,
	'C''est le type le plus représenté chez les PDG et les stratèges politiques.',
	'ENTJ.webp');

INSERT INTO schema_test.t_evaluations(label) VALUES
    ('Force'), ('Faiblesse');

INSERT INTO schema_test.t_strengths_and_weaknesses(trait, evaluation_id) VALUES
    ('Stratégique', (select id from schema_test.t_evaluations where label = 'Force')),
    ('Froid', (select id from schema_test.t_evaluations where label = 'Faiblesse'));

INSERT INTO schema_test.t_includes(mbti_type_id, personality_trait_id) VALUES
    ((select id from schema_test.t_mbti_types where code = 'INTJ'), (select id from schema_test.t_strengths_and_weaknesses where trait = 'Stratégique')),
    ((select id from schema_test.t_mbti_types where code = 'INTJ'), (select id from schema_test.t_strengths_and_weaknesses where trait = 'Froid'));

INSERT INTO schema_test.t_professions(name) VALUES
    ('Ingénieur IT');

INSERT INTO schema_test.t_matches(mbti_type_id, profession_id) VALUES
    ((select id from schema_test.t_mbti_types where code = 'INTJ'), (select id from schema_test.t_professions where name = 'Ingénieur IT'));