CREATE DATABASE student;
USE student;
DROP TABLE class;
CREATE TABLE class(
id int auto_increment primary key,
name varchar(50)
)auto_increment = 1000;
CREATE TABLE teacher(
id int auto_increment primary key,
name varchar(50),
age int,
country varchar(50)
)auto_increment = 1000;

INSERT INTO class(name)
values
('Trung Bao');

SELECT * FROM class;


