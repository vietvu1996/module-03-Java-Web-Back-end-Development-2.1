create database quanlysinhvien;
use quanlysinhvien;

create table class(
class_id int auto_increment primary key,
class_name varchar(50),
startdate datetime,
status bit(1)
);

insert into class (class_id, class_name, startdate, status)
values(1, "A1", '2008-12-22', 1);

insert into class (class_id, class_name, startdate, status)
values(2, "A2", "2008-12-20", 1);

insert into class (class_id, class_name, startdate, status)
values(3, "B3", "2023-11-29", 0);

create table student(
student_id int auto_increment primary key,
student_name varchar(50),
address varchar(50),
phone_number varchar(12),
status bit(1),
class_id int,
foreign key (class_id) references class(class_id)
);

insert into student (student_id, student_name, address, phone_number, status, class_id)
values(1, "Hung", "Ha noi", "0912113113", 1, 1);

insert into student (student_id, student_name, address, phone_number, status, class_id)
values(2, "Hoa", "Hai phong", "", 1, 1);

insert into student (student_id, student_name, address, phone_number, status, class_id)
values(3, "Manh", "HCM", "0123123123", 0, 2);

create table subject(
sub_id int auto_increment primary key,
sub_name varchar(25),
credit int,
status bit(1)
);

insert into subject(sub_id, sub_name, credit, status)
values(1, "CF", 5, 1);

insert into subject(sub_id, sub_name, credit, status)
values(2, "C", 6, 1);

insert into subject(sub_id, sub_name, credit, status)
values(3, "HDJ", 5, 1);

insert into subject(sub_id, sub_name, credit, status)
values(4, "RDBMS", 10, 1);

create table mark(
mark_id int auto_increment primary key,
sub_id int,
student_id int,
mark int,
exam_times int,
foreign key (sub_id) references subject(sub_id),
foreign key (student_id) references student(student_id)
);

insert into mark( sub_id, student_id, mark, exam_times)
values( 1, 1, 8, 1),
( 1, 2, 10, 2),
( 2, 1, 12, 1);

select * from student;

select * from student
where status = 1;

select * from subject 
where credit < 10;

select student.student_id, student.student_name, class.class_name from student
student join class on student.class_id = class.class_id
where class.class_name = "A1";



select student.student_id, 
student.student_name, 
subject.sub_name, mark.mark 
from student
join mark on student.student_id = mark.student_id 
join subject on mark.sub_id = subject.sub_id
where subject.sub_name = 'CF'
group by  student.student_id, 
student.student_name, 
subject.sub_name, mark.mark ;
