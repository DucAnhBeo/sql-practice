select count(*)as total_actors from actor;

select max(length)  from film;
select min(length) from film;

select count(*) from film
where rating = 'R';

select avg(rental_rate) from film
where film.length > 60;
