create database transport;
use transport;

create table vehicle(
	id int,
	reg_no varchar(25) NOT NULL,
	brand varchar(50),
	name varchar(50),
	type varchar(50),
	model int,
	base_rate int NOT NULL,
	primary key(id)
);

create table rider(
	id int,
	name varchar(255),
	cnic varchar(100) NOT NULL,
	gender char(1),
	phone_no varchar(50),
	dob date,
	primary key(id)
);

create table driver(
	id int,
	name varchar(255),
	cnic varchar(100) NOT NULL,
	gender char(1),
	phone_no varchar(50),
	dob date,
	joined_date date,
	vehicle_id int,
	primary key(id),
	foreign key(vehicle_id) references vehicle(id)
);

create table payment(
	id int,
	txn_id varchar(100) NOT NULL,
	amount int NOT NULL,
	type varchar(100),
	time date,
	primary key(id)
);

create table location(
	id int,
	address varchar(255),
	city varchar(100),
	country varchar(100),
	zip_code int,
	primary key(id)
);

create table trip(
	id int,
	driver_id int,
	rider_id int,
	dest_loc_id int,
	origin_loc_id int,
	rider_rating int,
	driver_rating int,
	payment_id int,
	distance float,
	primary key(id),
	foreign key(driver_id) references driver(id),
	foreign key(rider_id) references rider(id),
	foreign key(dest_loc_id) references location(id),
	foreign key(origin_loc_id) references location(id),
	foreign key(payment_id) references payment(id)
);

insert into vehicle values(1, "LHE 1337", "Toyoto", "GLI", "Sedan", 2011, 50);
insert into vehicle values(2, "LHR 9001", "Suzuki", "Mehran", "Mini Sedan", 2003, 25);
insert into vehicle values(3, "LHZ 6164", "Honda", "Civic", "Luxury Sedan", 2018, 100);

insert into location values(1, "123, Sector-B, DHA", "Lahore", "Pakistan", 5001); 
insert into location values(2, "901, Sector-A, Bahria Town", "Islamabad", "Pakistan", 1234); 
insert into location values(3, "911, Sector-D, Model Town", "Lahore", "Pakistan", 9865); 

insert into driver values(1, "Minhaal Ali", "35202-XXXXXXX-XX", 'M', '+923001234567', '2000-05-07', '2020-07-01', 1);
insert into driver values(2, "Ahmad Khan", "35201-XXXXXXX-XX", 'M', '+923001264561', '1995-01-08', '2019-02-11', 2);
insert into driver values(3, "Fizza Riaz", "35207-XXXXXXX-XX", 'F', '+923077391274', '1990-02-19', '2022-02-11', 3);

insert into rider values(1, "Ali Anser", '35202-XXXXXXX-XX', 'M', '+9212345678', '2004-05-03');
insert into rider values(2, "Raza Ali", '35201-XXXXXXX-XX', 'M', '+9298765432', '2001-12-30');
insert into rider values(3, "Muhammad Abdullah", '35202-XXXXXXX-XX', 'M', '+9212312374', '2003-11-27');

insert into payment values(1, '12357238', 700, 'Cash', '2033-02-01');
insert into payment values(2, '1234123', 1500, 'Credit Card', '2033-02-01');
insert into payment values(3, '5653', 3000, 'Cash', '2033-02-01');

insert into trip values(1, 1, 1, 1, 2, 5, 5, 1, 1.5);
insert into trip values(2, 2, 2, 1, 2, 4, 5, 2, 10);
insert into trip values(3, 3, 3, 1, 2, 5, 4, 3, 5);
