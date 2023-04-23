use TaxiBooking
select * from Booking
select * from Customers
select * from Locations
select * from Drivers
select * from Payments
select * from Vehicles
select * from Reviews


alter table Customers
ADD customerStatus bit;
alter table Customers
ADD customerUpdate date;

--1 trigger delete emeliyyatinin evezine silinmek istenen melumatin yada melumatlarin statusunu false edecek
create trigger task_1
on Customers
after delete 
as
update Costumers  set customerStatus=0
delete from Costumers where customerID=1

--Diger trigger cedvele nese melumat daxil olduqda consolda melumat daxil edildi yazacaq
create trigger task_2
on Customers
after insert 
as
print 'Melumat daxil edildi'
insert into Customers (customerID,customerName,customerPhoneNumber,customerEmailAdress,customerPaymentInformation) values(1,'Namiq','0509090978','namiqlov12@gmail.com','amount on hand')

--Basqa bir trigger ise Updated sutununa data update olunduqda hazirki tarixi yazacaq
create trigger task_3
on Drivers
after update
as 
Update Costumers set customerUpdate=GETDATE()

