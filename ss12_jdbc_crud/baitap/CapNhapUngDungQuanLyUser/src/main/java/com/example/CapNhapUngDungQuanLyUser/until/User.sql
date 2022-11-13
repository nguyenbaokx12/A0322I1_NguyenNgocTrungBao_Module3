CREATE DATABASE	User;
USE User;

CREATE TABLE User(
id int primary key	auto_increment,
`name` varchar(50),
email varchar(50),
country varchar(50)
);

select * from User;
drop table User;

DELIMITER $$

CREATE PROCEDURE `search`(name_search varchar(120))
BEGIN
  -- statements
  select * from product where (name like concat ('%',name_search,'%'));
  END $$

DELIMITER ;

call search("");