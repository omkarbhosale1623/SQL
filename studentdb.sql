create database studentDB;
use studentDB
show tables;
create table students(
student_id int primary key auto_increment,
name varchar(100) not null,
email varchar(100) unique,
dob date,
registered_on timestamp default current_timestamp);



create table courses(
course_id int primary key auto_increment,
course_name varchar(200) not null,
credit_hour int default 3);

create table enrollment(
enrollment_id int primary key auto_increment,
student_id int,
course_id int,
enrollment_date date default(current_date),

foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
); 

insert into students(name, email, dob) values
("Omkar", "omkarbhosale00007@gmail.com", '2003-06-01'),
("Omkar2", "obhosale442@gmail.com", '2002-06-10'),
("xyz", "xyz@gmail.com", '2004-01-02'),
("ABC", "abc@gmail.com", '2007-09-15'),
("MNO", "mno@gmail.com", '2000-01-01');

select * from students;

insert into courses (course_name, credit_hour) values
("Stats for AI&DS", 6),
("SQL Masters", 9);

select * from courses;

insert into enrollment(student_id, course_id) values
(1,1),
(1,2),
(2,1),
(3,2);

select * from enrollment;


SELECT * FROM students, courses, enrollment;


alter table students modify phone varchar(20);

alter table students drop column phone;

select * from students;

rename table enrollment to courseEnrollment;

show tables;

drop table courseEnrollment;

