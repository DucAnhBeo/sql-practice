create database Example;

create table Ex(
id int,
fullname text,
birthday date,
salary double,
address text
);

insert into Ex (id, fullname, birthday, salary, address) values (1, 'Gonzales McDougall', '2023-03-20', 83, 'Apt 239');
insert into Ex (id, fullname, birthday, salary, address) values (2, 'Nicolas Huonic', '2023-01-13', 85, 'Apt 47');
insert into Ex (id, fullname, birthday, salary, address) values (3, 'Pieter de la Valette Parisot', '2023-04-03', 15, 'Room 230');
insert into Ex (id, fullname, birthday, salary, address) values (4, 'Hamlin Brantzen', '2023-03-30', 80, 'PO Box 12681');
insert into Ex (id, fullname, birthday, salary, address) values (5, 'Irv Ranken', '2023-05-25', 57, 'Apt 471');
insert into Ex (id, fullname, birthday, salary, address) values (6, 'Will Looby', '2023-07-22', 2, 'Suite 29');
insert into Ex (id, fullname, birthday, salary, address) values (7, 'Jenn Anstiss', '2023-03-18', 12, 'Suite 62');
insert into Ex (id, fullname, birthday, salary, address) values (8, 'Ivonne Collick', '2023-09-13', 3, 'Suite 30');
insert into Ex (id, fullname, birthday, salary, address) values (9, 'Reta Piscopiello', '2023-06-15', 48, '3rd Floor');
insert into Ex (id, fullname, birthday, salary, address) values (10, 'Zacharia Holligan', '2023-03-02', 20, '3rd Floor');

select * from Ex;