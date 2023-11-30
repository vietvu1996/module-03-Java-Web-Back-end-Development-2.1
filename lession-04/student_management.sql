use quanlysinhvien;

CREATE TABLE class(
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    startdate DATETIME NOT NULL,
    status BIT
);

CREATE TABLE student(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);

CREATE TABLE Subject(
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(30) NOT NULL,
    credit  TINYINT NOT NULL DEFAULT 1 
    CHECK (Credit >= 1),
    status BIT DEFAULT 1
);

CREATE TABLE Mark(
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0,
    CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

select student.address, count(student.student_id) as 'số lượng học viên'
from student
group by student.address;

select student.student_id, student.student_name, avg(mark.mark) from student
join mark on student.student_id = mark.student_id
group by student.student_id, student.student_name
having avg(mark.mark) > 15;

select student.student_id, student.student_name, avg(mark.mark) from student
join mark on student.student_id = mark.student_id
group by student.student_id, student.student_name
having avg(mark.mark) >= ALL (select avg(mark.mark) 
from mark
group by mark.student_id
);