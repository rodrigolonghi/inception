CREATE DATABASE tododb;
USE tododb;
CREATE TABLE todo_items (
	id int(5),
	name varchar(255),
	completed boolean
);
INSERT INTO todo_items VALUES (1, 'Test item', 1);