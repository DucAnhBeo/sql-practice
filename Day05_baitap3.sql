-- 1 Tìm địa chỉ có chứa từ 'San'
select address from address
where address.address like '%San%';

-- 2 Tìm địa chỉ bắt đầu bằng 1 và kết thúc bằng chữ y
select address from address
where address.address like '1%' and address.address like '%y';

-- 3 Tìm địa chỉ chứa chữ a vị trí thứ 3
select address from address
where address.address like '__a%';

-- 4 Tìm tên khách hàng có địa chỉ kết thúc bằng chữ o
select last_name from customer
where customer.last_name like '%o';

-- 5 Tìm tên bộ phim có chứa category = 'Games'
select film.title, category.name 
from film
inner join film_category 
on film.film_id = film_category.film_id
inner join category
on category.category_id = film_category.category_id
where category.name like '%Games%';

-- 6 Từ bảng Person tìm nhân viên lương trong khoảng 2000 dến 3000
select fullname from Person
where salary between 2000 and 3000;

-- 7 Từ bảng Person tìm nhân viên sinh tháng 7 đến tháng 12
select fullname from Person
where month(birthday) between 7 and 12;

-- 8 Lấy danh sách những người có sinh nhật trong tháng này và hiện thông tin happy birthday
select fullname, 
case
	when month(birthday) = month(now())
	then 'happy birthday'
	end as 'cheer'
from Person
where month(birthday) = month(now());

-- 9 TÌm tất cả những ai có năm sinh 2000, 1990 , 1991 bảng Person
select * from Person
where year(birthday) in (2000, 1990, 1991);