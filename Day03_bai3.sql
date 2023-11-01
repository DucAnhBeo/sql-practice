select * from Person;

-- 1
select distinct(job) from Person;

-- 2
select * from Person where job = 'Manager' and salary >70000;

-- 3
-- alter table Person
-- add age int;

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE Person
-- set age = year(curdate()) - year(birthday) where age = null; 

select fullname, birthday from Person 
where birthday between '1988-01-01' and '1998-12-31';

-- 4
select count(*), country from Person group by country;

-- 5
select count(*), gender from Person group by gender;

-- 6
select job, country from Person group by job,country ;

-- 7
select * from Person order by birthday desc;

-- 8
select count(*), job from Person group by job having count(*) > 3;
