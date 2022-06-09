---sequence creation for consumerno---
create sequence consumernum
    start with 10000
    increment by 1
    nocycle;


---create details table--
create table details(consumerno number(7,0) primary key,c_name varchar(20),gender varchar(10),date_of_conn date,address varchar(20),email varchar(20),mobile_no number(10,0),payment_status varchar(5) check(payment_status in('Yes','No')));

---create payment table--
create table payment(consumerno number(7,0) references details,c_read number(10,0),p_read number(10,0),total number(10,0));

---craete history table---
create table history(resp_date date,resp_amount number(10,0));

---insertion for details table---
insert into details values(consumernum.nextval,'Meenakshy','Female','24-FEB-2000','MeenakshyBhavan','meenakshy@gmail.com','3451679070','No');
insert into details values(consumernum.nextval,'Varun','Male','04-MAY-2005','VarunBhavan','varun123@gmail.com','9937891230','No');
insert into details values(consumernum.nextval,'Babu','Male','15-JUN-1995','KrishnaVilas','babu@gmail.com','7653421342','No');
insert into details values(consumernum.nextval,'Mohammed','Male','26-MAR-2011','Chettuparambil','mohameed@gmail.com','8904562341','No');
insert into details values(consumernum.nextval,'ANN Maria','Female','20-APR-2006','SuperBhavan','daddygirl@gmail.com','1112223334','No');
insert into details values(consumernum.nextval,'Janvy','Female','09-JUN-2006','JanvyBhavan','janvy@gmail.com','5556667778','No');


---insertion for payment table----
insert into payment values(10000,2345,1345,null);
insert into payment values(10001,3000,1500,null);
insert into payment values(10002,4220,1110,null);
insert into payment values(10004,4346,2246,null);
insert into payment values(10022,3346,2850,null);
insert into payment values(10023,2346,1950,null);




--for bill button--
---function for total calculation-- 
create or replace function total_calc(consumer_no in number)
return number as 
e_current payment.c_read%type;
e_previous payment.p_read%type;
d_read number(20);
rate number(20);
begin
select c_read,p_read into e_current,e_previous from payment where consumerno=consumer_no;
d_read := (e_current - e_previous);
IF (d_read <= 50) THEN
  rate := d_read*5;
ELSIF (d_read > 50 AND d_read <= 100) THEN
	rate := (50*5)+((d_read - 50)*10);
ELSIF (d_read >=101 AND d_read <= 200) THEN
	rate := ((50*5)+(50*10)+(d_read-100)*15);
ELSE
	rate := ((50*5)+(50*10)+(100*15)+(d_read-200)*20);
END IF;
return rate;
end;

---main program for function---
declare
  ptotal number(10,0);
begin
  ptotal=total_calc();
end;

---then we should add an update startement to update payment table---
update payment set total=ptotal where consumerno=userid;

 
---for paynow button--
---trigger for updation of tables details and payment and insertion to history--- 
 create or replace trigger payment_changes
  after update of payment_status on details for each row
  when(new.payment_status='Yes')
  declare
    payed number(10,0);
  begin
  select total into payed from payment where consumerno=:old.consumerno;
  insert into history values(sysdate,payed,:old.consumerno);
  update payment set total=null where consumerno=:old.consumerno;
  end;