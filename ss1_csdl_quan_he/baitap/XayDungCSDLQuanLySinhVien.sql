CREATE DATABASE student;
USE student;
DROP TABLE class;

CREATE TABLE class(
id int auto_increment primary key,
name varchar(50)
);


CREATE TABLE teacher(
id int auto_increment primary key,
name varchar(50),
age int,
country varchar(50)
);

INSERT INTO class(id, name)
VALUES
('Trung Bao');

INSERT INTO teacher(name, age, country)
VALUES
('Nguyen Van A',32,'Viet Nam');

SELECT * FROM `class`;
SELECT * FROM teacher;



