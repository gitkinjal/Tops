Create database Ola;
Use Ola;
Create Table Driver
(
Driver_ID INT Primary Key Auto_increment,
Driver_Name Varchar(32),
Fare INT,
Date DATE,
OTP INT,
Available ENUM ('Y','N'),
Journey Varchar (50),
Taxi_no Varchar(32)
);
Create Table Passanger
(
Passanger_ID INT Primary Key,
Passanger_Name Varchar(32),
OTP INT,
Journey Varchar(50),
Foreign Key Passanger(Passanger_ID) references Driver(Driver_ID)
);
select * from Driver
inner join Passanger
on Driver.Driver_ID=Passanger.Passanger_ID;

select * from Driver
left join Passanger
on Driver.Driver_ID=Passanger.Passanger_ID;

select * from Driver
right join Passanger
on Driver.Driver_ID=Passanger.Passanger_ID;


