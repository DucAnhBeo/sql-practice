-- 1. Find Customer Referee
select name from Customer
where referee_id !=2 or referee_id is null;

-- 2. Recyclable and Low Fat Products
select Products.product_id from Products
where low_fats = 'Y' and recyclable = 'Y';

-- 3. Invalid Tweets
select Tweets.tweet_id from Tweets
where length(Tweets.content)>15;

-- 4. Employee Bonus
select Employee.name, Bonus.bonus
from Employee
left join Bonus
on Employee.empId = Bonus.empId
having COALESCE(bonus, 0) < 1000;

-- 5. Employees With Missing Information
select employee_id from Employees where employee_id not in (select employee_id from salaries)
union 
select employee_id from salaries where employee_id not in(select employee_id from employees)
order by employee_id;