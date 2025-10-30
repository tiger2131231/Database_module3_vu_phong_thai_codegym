create database student_management
use student_management

create table class(
id int primary key auto_increment,
name varchar(50)
);
create table teacher(
id int primary key auto_increment,
name varchar(50),
age int check (age>18),
country varchar(250)
);