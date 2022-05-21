use rishab
create table rishab(id int identity,name varchar(50),address varchar(50),salary money)
insert into rishab values('rishab','jaipur',99999),('rohAN','manali',80000),('naman','kasol',40000),('aman','jaipur',20000),('punnet','noida',90000)
select*from rishab
alter table rishab add email varchar(50),city varchar(50)
alter table rishab drop column city
update rishab set email='dsjflkj' where id=1
update rishab set email ='faksjdsa' where email is null
delete from rishab where id=3
sp_rename 'rishab.id','sid'
create table cus1( id int primary key,name varchar(50),salary money)
insert into cus1 values(1,'niki',900000),(2,'shubhangi',80000),(3,'mia',70000),(4,'sheetal',60000),(5,'neha',60000)
select*from cus1
insert into cus1 values(6,'sim',80000)
create table cus2(id int foreign key references cus1(id),name varchar(50),salary money)
insert into cus2 values(1,'rohan',30000),(2,'suaf',60000),(3,'saif',50000),(4,'hsukahf',80000)
insert into cus2 values(1,'niki',900000)
update cus2 set name ='rishab' where name= 'rohan'
select*from cus2
select*from cus1 union select*from cus2        --set opertaors
select*from cus1 union all select*from cus2
select*from cus1 intersect select*from cus2
select*from cus1 except select*from cus2
select* from cus1 inner join cus2 on cus1.id=cus2.id     --ansi joins
select*from cus1 left outer join cus2 on cus1.id=cus2.id
select*from cus1 right outer join cus2 on cus1.id=cus2.id
select*from cus1 full outer join cus2 on cus1.id=cus2.id 
select*from cus1 cross join cus2                    
select*from cus2 as c1,cus2 as c2 where c1.id=c2.id --non ansi(self join)
select*from cus1 ,cus2 where cus1.id>cus2.id     --equi join
select*from cus1
begin transaction
delete from cus1 where id=7
begin transaction 
rollback
--tcl commands(rollback,commit,savepoint)
select*from cus2
begin transaction 
update cus2 set name ='hasan' where id=4
commit
begin transaction 
rollback

begin transaction t2
update cus2 set salary=90000 where id=1
save transaction t2

begin transaction t3
insert into cus2 values(5,'mitali',90000)
save transaction t3

begin transaction t4
delete from cus2 where id=3
save transaction t4

begin transaction t4
rollback

select*from cus1                    --paramterless stored procedure
create procedure proce  
as begin
insert into cus1 values(8,'nikhil',70000)
end
execute proce

create procedure prom(@id int,@name varchar(50),@salary varchar(50))  ---input paramertrize stored procedure
as begin
insert into cus2 values(@id,@name,@salary)
end
execute dbo.prom 1,'rihan',80000
select*from cus2

create procedure preo(@id int ,@pf int out,@pt int out) ----output paramerterize stored procedure
as begin
declare @t money
select @t=salary from cus2 where id=@id
set @pf=@t*.1
set @pt=@t*.2
end
declare @pff int,@ptt int
execute preo 2,@pff out ,@ptt out
print @pff
print @ptt

