create sequence consumernum
start with 10000; 
increment by 1 ;
no cycle;
create table elect(cnsm_no integer primary key,c_read integer,p_read integer);
insert into payment values(10000,2345,1345,null);
insert into payment values(10001,3000,1500,null);
insert into payment values(10002,4220,1110,null);
insert into payment values(10003,3345,1340,null);
insert into payment values(10004,4346,2246,null);
select* from elect;
