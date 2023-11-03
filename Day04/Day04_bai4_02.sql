-- auto_increment

-- Bai tap 2

create table student(
student_id int primary key , 
student_name text,
student_age int
);

create table course(
course_id int primary key,
course_name text,
course_description text
);

create table enrollment(
enrollment_id int primary key,
student_id int,
foreign key (student_id) references student(student_id),
course_id int,
foreign key (course_id) references course(course_id)
);

insert into student (student_id,student_name,student_age)
values (1, 'Nguyễn Thành An' , 10)
		, (2, 'Bùi Quang Anh', 11)
        , (3, 'Đỗ Thùy Anh', 12)
        , (4, 'Đỗ Tiến Anh', 13)
        , (5, 'Nguyễn Đức Anh', 14)
        , (6, 'Nguyễn Tuấn Anh', 15)
        , (7, 'Trần Hoàng Anh', 16)
        , (8, 'Trịnh Quang Bách', 17)
        , (9, 'Lê Mậu Hải Đăng', 18)
        , (10, 'Nguyễn Phúc Bảo', 19);
        
insert into course(course_id, course_name, course_description)
values (1, 'Tin học' , 'Học c++')
		, (2, 'Thể dục', 'Sức khỏe')
        , (3, 'Đại số', 'Số học')
        , (4, 'Giải tích 1', 'Tính toán 1')
        , (5, 'Giải tích 2', 'Tính toán 2')
        , (6, 'Vật lí', 'Đo đạc')
        , (7, 'Xác suất', 'Lô đê')
        , (8, 'Cấu giải', 'Phức tạp')
        , (9, 'Thuyết trình', 'Nói')
        , (10, 'Lịch sử', 'Cụ lenin');
		
insert into enrollment (enrollment_id, student_id, course_id)
values (1, 1 , 3)
		, (2, 4, 2)
        , (3, 6, 9)
        , (4, 4, 6)
        , (5, 8, 7)
        , (6, 5, 8)
        , (7, 9, 10)
        , (8, 10, 6)
        , (9, 2, 3)
        , (10, 2, 5);
        
-- 1. Lấy danh sách tất cả sinh viên và thông tin khóa học mà học đã đăng ký
select student.*, course.*
from student
inner join enrollment 
on student. student_id = enrollment.student_id
inner join course
on course.course_id = enrollment .course_id;

-- 2. Lấy tên của tất cả các khóa học mà một sinh viên cụ thể đã đăng ký 
select course.*
from student
inner join enrollment 
on student. student_id = enrollment.student_id
inner join course
on course.course_id = enrollment .course_id
where student.student_id = 1;

-- 3. Lấy ra danh sách tất cả sinh viên và số lượng khóa học mà họ đã đăng ký
select student.*, count(course.course_id) as course_count
from student
left join enrollment 
on student. student_id = enrollment.student_id
left join course
on course.course_id = enrollment .course_id
group by student.student_id, student.student_name;

-- 4.Lấy tất cả các khóa học chưa có sinh viên nào đăng ký
select course.*,  count(student.student_id) as student_count
from student
right join enrollment 
on student. student_id = enrollment.student_id
right join course
on course.course_id = enrollment .course_id
group by course.course_id, course.course_name
having student_count = 0 ;

-- 5. Lấy tất cả sinh viên và thông tin khóa học mà họ đã đăng ký, sắp xếp theo tên sinh viên và tên khóa học 
select student.*, course.*
from student
inner join enrollment 
on student. student_id = enrollment.student_id
inner join course
on course.course_id = enrollment .course_id
order by student.student_name, course.course_name;

-- 6. Lấy tất cả sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký
select student.*, course.course_name
from student
inner join enrollment 
on student. student_id = enrollment.student_id
inner join course
on course.course_id = enrollment .course_id;

-- 7. Lấy danh sách tất cả sinh viên và thông tin của họ, cùng với tên khóa học mà họ đăng ký. Sắp xếp theo tên sinh viên và tuổi từ cao đến thấp
select student.*, course.course_name
from student
inner join enrollment 
on student. student_id = enrollment.student_id
inner join course
on course.course_id = enrollment .course_id
order by student.student_name desc , student.student_age desc;

-- 8. Lấy tất cả các khóa học và số lượng sinh viên đã đăng ký vào mỗi khóa học
select course.*,  count(student.student_id) as student_count
from student
right join enrollment 
on student. student_id = enrollment.student_id
right join course
on course.course_id = enrollment .course_id
group by course.course_id, course.course_name
