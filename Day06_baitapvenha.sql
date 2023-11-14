-- 1 Lấy danh sách tên các diễn viên (actors) có họ bắt đầu bằng chữ “S”.
select * from actor
where last_name like 'a%';

-- 2 Lấy danh sách các bộ phim (films) được phát hành trong khoảng từ năm 2000 đến năm 2010.
select * from film
where release_year between 2000 and 2010;

-- 3 Lấy danh sách các bộ phim (films) có rating là “PG” hoặc “PG-13”.
select * from film
where rating = 'PG' or rating = 'PG-13';

-- 4 Lấy danh sách diễn viên (actors) và số lượng bộ phim (films) mà họ tham gia, sắp xếp theo số lượng bộ phim giảm dần.
select film.film_id,film.title,film.description, count(*) as quantity from film 
inner join film_actor on film.film_id = film_actor.film_id
inner join actor on film_actor.actor_id = actor.actor_id
group by film.film_id
order by quantity desc;

-- 5 Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
select film.title, category.name 
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category 
on category.category_id = film_category.category_id;

-- 6 Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
select film.title, count(actor.actor_id) as quantity
from film
inner join film_actor
on film.film_id = film_actor. film_id
inner join actor
on actor.actor_id = film_actor.actor_id
group by film.title
order by quantity desc;

-- 7 Lấy danh sách các diễn viên (actors) có số lượng (films) tham gia lớn hơn 30
select actor.first_name,actor.last_name, count(film.film_id) as quantity
from film
inner join film_actor
on film.film_id = film_actor. film_id
inner join actor
on actor.actor_id = film_actor.actor_id
group by actor.first_name, actor.last_name
having quantity > 30;

-- 8 Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
select actor.first_name,actor.last_name, count(film.film_id) as quantity
from film
inner join film_actor
on film.film_id = film_actor. film_id
inner join actor
on actor.actor_id = film_actor.actor_id
group by actor.first_name, actor.last_name
having quantity = 0;

-- 9 Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
select film_id, title, sum(rental_duration * rental_rate) 
from film
group by film_id, title
order by sum(rental_duration * rental_rate) desc;

-- 10 Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror”.
select film.title, category.name
from film 
inner join film_category
on film.film_id = film_category.film_id
inner join category
on category.category_id = film_category.category_id
where category.name = 'Horror';

