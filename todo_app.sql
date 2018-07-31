DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;


CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;


CREATE TABLE tasks(
id SERIAL NOT NULL,
title varchar(255) NOT NULL,
description text,
created_at timestamp without time zone NOT NULL DEFAULT now(),
updated_at timestamp without time zone,
completed boolean NOT NULL DEFAULT false,
PRIMARY KEY (id)
);

ALTER TABLE tasks DROP completed,

ADD completed_at timestamp DEFAULT null,

ALTER updated_at SET NOT NULL,
ALTER updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (default, 'STUDY SQL', 'COMPLETE THIS EXERCISE', default, default, NULL);

INSERT INTO tasks (title, description)
VALUES ('STUDY POSTGRESQL', 'READ ALL THE DOCUMENTATION');

SELECT title FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now()
WHERE title = 'STUDY SQL';

SELECT title, description FROM tasks 
WHERE completed_at IS NULL;

SELECT * FROM tasks
ORDER BY created_at DESC;


