create table details(consumerno number(7,0) primary key,c_name varchar(20),gender varchar(10),date_of_conn date,address varchar(20),email varchar(20),mobile_no number(10,0),payment_status varchar(5) check(payment_status in('Yes','No')));
insert into details values(consumernum.nextval,'Meenakshy','Female','24-FEB-2000','MeenakshyBhavan','meenakshy@gmail.com','3451679070','No');
insert into details values(consumernum.nextval,'Varun','Male','04-MAY-2005','VarunBhavan','varun123@gmail.com','9937891230','No');
insert into details values(consumernum.nextval,'Babu','Male','15-JUN-1995','KrishnaVilas','babu@gmail.com','7653421342','No');
insert into details values(consumernum.nextval,'Mary','Female','09-JAN-1990','MaryBhavan',null,'9034516900','No');
insert into details values(consumernum.nextval,'Mohammed','Male','26-MAR-2011','Chettuparambil','mohameed@gmail.com','8904562341','No');

create table details(consumerno number(7,0) primary key,c_name varchar(20),gender varchar(7),date_of_conn date,address varchar(20),email varchar(20),mobile_no number(10,0),payment_status varchar(5) check(payment_status in('Yes','No')));
