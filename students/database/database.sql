CREATE DATABASE "Students_Ruby";
USE "Students_Ruby";

CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	surname TEXT NOT NULL,
	name TEXT NOT NULL,
	patronymic TEXT NOT NULL,
	tg TEXT,
	email TEXT,
	phone TEXT,
	git TEXT  
);