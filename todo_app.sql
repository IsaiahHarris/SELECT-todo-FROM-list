DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;


CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;


CREATE TABLE tasks(
id integer NOT NULL,
title varchar(255) NOT NULL,
description text,
created_at timestamp without time zone NOT NULL DEFAULT now(),
updated_at timestamp without time zone,
completed boolean NOT NULL DEFAULT false,
PRIMARY KEY (id)
);

ALTER TABLE tasks DROP completed;