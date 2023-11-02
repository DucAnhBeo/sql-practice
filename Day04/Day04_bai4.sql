-- bai tap 1

select * from country;
select * from city;
select * from address;
select * from film_category;
select * from category;
select * from film_text;
select * from film;
select * from film_actor;
select * from actor;
select * from store;
select * from customer;

-- 1. Lấy ra tên các thành phố và tên các quốc gia tương ứng với thành phố đó
select city.city as city, country.country as country
from city inner join country
on city.country_id = country.country_id;

-- 2. Lấy ra tên các thành phố của nước Mỹ
select city.city as cityUS
from city inner join country
on city.country_id = country.country_id
where country.country ='United States';

-- 3. Lấy ra các địa chỉ của thành phố Hanoi
select address.address as addressHN
from address inner join city
on address.city_id = city.city_id;

-- 4.  Lấy ra tên, mô tả, tên category của các bộ phim có rating = R
select film.title , film.description , category.name as category
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on category.category_id = film_category.category_id
where film.rating = 'R';

-- 5. Lấy ra thông tin khách của các bộ phim mà diễn viên NICK WAHLBERG tham gia
select film.*
from film
inner join film_actor
on film.film_id = film_actor.film_id
inner join actor
on actor.actor_id = film_actor.actor_id
where actor.first_name = 'NICK' and actor.last_name = 'WAHLBERG';

-- 6. Tìm email của các khách hàng ở Mỹ
 select customer.email 
 from customer
 inner join address
 on customer.address_id= address.address_id
 inner join city
 on city.city_id = address.city_id
 inner join country
 on country.country_id = city.country_id
 where country.country ='United States';
