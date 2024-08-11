-- create schema guvi;
use guvi;
create table users(
id int,
name varchar(255),
email varchar(255),
status boolean
);
insert into users values(1, 'Lokesh', 'lokesh@gmail.com', true);

insert into users values
(2, 'Host', 'host@gmail.com', true);
insert into users values
(3, 'Host', 'host@gmail.com', true),
(4, 'gost', 'host@gmail.com', true);

select * from users;


alter table users
add mobile varchar(255);

alter table users
drop column mobile;


drop table users;

create table users(
id int unique not null auto_increment,
name varchar(255)not null,
email varchar(255)not null,
mobile varchar(12),
status boolean  default true,
createdAt timestamp default current_timestamp,
primary key (id)
); 

insert into users(name,email,mobile)values('Raj', 'raj@gmail.com','833878738');


insert into users(name,email,mobile) values
('arun','arun@gmail.com','987654340'),
('khal','khal@gmail.com','987654366'),
('bala','bala@gmail.com','1234567890'),
('nisanth','nisanth@gmail.com','098767890'),
('varsha','varsha@gmail.com','987654567'),
('janani','janani@gmail.com','567890987'),
('ananya','ananya@gmail.com','87654567778');

select * from users;

create table product(
id int unique not null auto_increment,
name varchar(255),
price decimal default 0.0,

primary key (id)
);

insert into product(name,price) values
('Curd',46.00),
('Milk',26.00),
('Biscuts',10.00),
('Choclate',5.00),
('Cake',250.00),
('Toothpaste',20.00),
('Dal',96.00),
('Rice',64.00);

select * from product;

create table invoice(
id int unique not null auto_increment,
userID int,
productID int,
quantity int,
primary key(id),
foreign key (userID) references users(id),
foreign key (productID) references product(id)
);
insert into invoice(userID,productID,quantity) values
 (1,1,1),
(1,1,1),(1,2,1),(2,1,2),(3,4,1),(5,6,2),(4,2,3),(1,7,2),(7,1,1);

select * from invoice;

-- select * from invoice i   join users u on i.userId = u.id join product p on i.productid = p.id 

select userId,sum(totalprice) from (
select i.userId,u.name as customerName,p.name as productName,i.quantity,(i.quantity*p.price) as totalprice
from invoice i  join users u on i.userId = u.id join product p on   p.id =i.productId)as result group by userId ;

select userId,count(*) from invoice i  join users u on i.userId = u.id join product p on i.productId = p.id group by userId;

select userId,sum(i.quantity*p.price) ,avg(i.quantity*p.price),min(i.quantity*p.price),max(i.quantity*p.price)
from invoice i  join users u on i.userId = u.id join product p on i.productId = p.id group by userId;

select productId ,count(productId),sum(i.quantity*p.price)
from invoice i  join users u on i.userId = u.id join product p on i.productId = p.id  group by productId;
create table users(

user_id integer auto_increment primary key,

user_name varchar (255),

email varchar (255),

createdAt datetime,

batch integer

);



select * from users;


INSERT INTO users (user_name, email, createdAt, batch)

values ('karthik','karthi@gmail.com',CURRENT_TIMESTAMP(),1),

('gayu','gayu@gmail.com',CURRENT_TIMESTAMP(),2),

('maha','maha@gmail.com',CURRENT_TIMESTAMP(),3),

('mugilan','mugil@gmail.com',CURRENT_TIMESTAMP(),4),

('iniya','iniya@gmail.com',CURRENT_TIMESTAMP(),5);


delete from users where user_id in(1,2,3,4,5);



alter table users

add foreign key (batch) references batch_data (batch_id);



create table codeketa(

code_id integer auto_increment primary key,

user_id integer,

number_of_problem integer,

status_problem varchar(255),

FOREIGN KEY (user_id) REFERENCES users(user_id)

);

delete from codeketa where code_id in(6,7,8,9,10);

select * from codeketa;

drop table codeketa;

INSERT INTO codeketa( user_id,number_of_problem,status_problem) VALUES

(6,20,’pending’),

( 6,20,’finished’),

(7,40,’finished’),

(7,40,’finished’),

(8,50,’finished’);

select * from codeketa;

delete from codeketa where code_id in(2,3,4,5);

delete from users where user_id in(1,2,3,4,5);

DELETE FROM codeketa;



create table  company_drives (

drive_id INTEGER AUTO_INCREMENT PRIMARY KEY,

user_id INTEGER,

drive_date DATE,

company VARCHAR(100),

FOREIGN KEY (user_id) REFERENCES users(user_id)

);

INSERT INTO company_drives(user_id, drive_date, company) VALUES

(6,makedate(2024, 3), “Apple”),

(6,makedate(2024, 5), “Amazon”),

(7,makedate(2024, 3), “Zomato”),

(7,makedate(2023, 12), “Flipkart”),

(8,makedate(2023,5), “TCS”);

select * from company_drives;

delete from company_drives where user_id in(1,2,3,4,5);



create table batch_data(

batch_id int auto_increment primary key,

batch_name varchar(100)

);

insert into batch_data(batch_name)values

('full stack-2023'),

('full stack-2023'),

(‘html-2023’),

(‘css-2023’),

(‘mongodb-2023’);

select * from batch_data;

alter table batch_data

add foreign key (batch_id)references users(batch);


select  users.batch,batch_data.batch_id

FROM users

INNER JOIN batch_data on users.batch = batch_data.batch_id;


CREATE TABLE mentors (

mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,

mentorname VARCHAR(100),

mentoremail VARCHAR(100)

);

INSERT INTO mentors(mentorname, mentoremail) VALUES

('Surya', 'suryakumar@gmail.com'),

('Viji' , 'vijay@gmail.com'),

('arun','arun@gmail.com'),

('prabhu' ,'prabhu@gmail.com');

INSERT INTO mentors(mentorname, mentoremail) VALUES

('naga”,”naga@gmail.com');

select * from mentors;



CREATE TABLE topics (

topicid INTEGER AUTO_INCREMENT PRIMARY KEY,

topic VARCHAR(200),

topic_date DATE,

mentor_id integer,

FOREIGN KEY (mentor_id) REFERENCES mentors(mentorid)

);

INSERT INTO topics(topic, topic_date, mentor_id) VALUES

('HTML — Basics', '2023–04–01', 1),

('NodeJS — Basics', '2023–06–03', 2),

('JavaScript — Basics', '2023–07–05', 3),

('React — Basics', '2023–08–06', 4),

('mysql -Basic','2023–09–5',5);

select * from topics;



CREATE TABLE tasks (

taskid INTEGER AUTO_INCREMENT PRIMARY KEY,

topic_id integer,

task VARCHAR(1000),

batch_id INTEGER,

FOREIGN KEY (topic_id) REFERENCES topics(topicid)

);

INSERT INTO tasks(topic_id, task, batch_id)VALUES

(1, 'HTML Task', 1),

(2, 'Javascript Task', 2),

(3, 'React Task',3),

(4, 'NodeJs Task',4),

(5, 'Mysql task',5);

select * from tasks;
— attendance table

CREATE TABLE attendance (

attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY,

user_id integer,

topicsid INTEGER,

attended BOOLEAN,

FOREIGN KEY ( user_id) REFERENCES users( user_id),

FOREIGN KEY (topicsid) REFERENCES topics(topicid)

);

insert  INTO attendance( user_id, topicsid, attended) VALUES

(6, 3, true),

(6, 1, true),

(7, 2, false),

(7, 4, true),

(8, 4, true);

select * from attendance;



