CREATE DATABASE student;

CREATE TABLE student (
	id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT NOT NULL,
    phone TEXT UNIQUE,
    telegram TEXT UNIQUE,
    email TEXT UNIQUE,
    git TEXT UNIQUE
);