select * from Person order by salary DESC;
select * from Person order by salary asc;
select distinct (country) from Person;
select country from Person group by country;
select count(*), country from Person group by country having count(*) >10;

select * from Person;
-- 1. Lấy danh sách các quốc gia duy nhất
select distinct (country) from Person;

-- 2. Sắp xếp danh sách người theo tên đầy đủ theo thứ tự tăng dần
select * from Person order by fullname asc;

-- 3. Sắp xếp danh sách người theo nghề nghiệp (job) theo thứ tự giảm dần
select * from Person order by job desc;

-- 4. Lấy danh sách các nghề nghiệp (job) duy nhất mà người trong bảng đang làm
select distinct (job) from Person;

-- 5. Lấy tổng số người theo từng quốc gia và sắp xếp theo số lượng người giảm dần
select count(*), country from Person group by country order by count(*) desc; 
-- select count(job), country from Person group by country order by count(job) desc;

-- 6. Tính tổng lương (salary) của tất cả người trong bảng
select sum(salary) as total_sum from Person;

-- 7. Tính tổng lương trung bình của người theo từng nghề nghiệp (job) và sắp xếp theo lương trung bình tăng dần
select sum(salary)/count(*) as trungbinh, job from Person group by job order by sum(salary)/count(*) asc; 

-- 8. Lấy ra người có lương (salary) lớn hơn 50000 và ngày sinh (birthday) nằm trong khoảng ‘1990-01-01’ đến ‘1995-12-31’
select fullname from Person 
where salary > 50000 and birthday between '1990-01-01' and '1995-12-31';

-- 9. Lấy ra người có lương (salary) lớn hơn 60000 và nghề nghiệp (job) là ‘Developer’ hoặc ‘Engineer’
select fullname from Person
where salary > 60000 and job = 'Developer' or job = 'Enginerr';

-- 10. Lấy ra danh sách các nghề nghiệp (job) duy nhất mà có ít nhất 3 người làm
select count(*), job from Person group by job having count(*) >3;

-- 11. Lấy ra người nam (gender = ‘Male’) có lương (salary) cao nhất
select fullname from Person
where gender = 'M' 
order by salary desc
limit 1;

-- 12. Lấy ra người nữ (gender = ‘Female’) có lương (salary) thấp nhất
select fullname from Person
where gender = 'F' 
order by salary asc
limit 1;

-- 13. Lấy danh sách người (không trùng lặp) theo thứ tự tên đầy đủ tăng dần
select fullname from Person group by fullname order by fullname asc;

-- 14. Đếm số người sinh vào các tháng khác nhau và sắp xếp theo thứ tự số lượng tăng dần
select count(*) as quantity , month(birthday) as 'MonthOfBirth' from Person
where month(birthday) between 1 and 12
group by month(birthday)
order by quantity;