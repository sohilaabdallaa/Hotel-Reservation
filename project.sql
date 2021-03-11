drop database hotelreservationsystem;
create database hotelreservationsystem ;
use hotelreservationsystem;

CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT ,
  `username` varchar(250) DEFAULT NULL,
   `displayname` varchar(250) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  checkstate varchar(25) NULL,
  PRIMARY KEY (`UserID`)
);


										/****  Admins  *****/
insert into user (username , displayname , password , email , phone , role ) values 
("Ramses Hilton" , "Ramses Hilton" , "Ramses", "ramseshiltomegyept@gmail.com" , "999", "admin");
insert into user (username , displayname , password , email , phone , role ) values 
("sheraton" , "sheraton" , "sheraton" , "sheratongyept@gmail.com" , "0233369800" , "admin");
insert into user (username , displayname , password , email , phone , role ) values 
("Four Seasons Hotel" , "Four Seasons" , "Four Seasons" , "fourseasonsegyept@gmail.com" , "999" , "admin");
insert into user (username , displayname , password , email , phone , role ) values 
("Cairo Marriott Hotel" , "Marriott" , "Marriott" , "marriottegyept@gmail.com" , "999" , "admin");
insert into user (username , displayname , password , email , phone , role ) values 
("Great Pyramid Inn Hotel" , "Great Pyramid" , "Great Pyramid" , "greatpyramidsegyept@gmail.com" , "999" , "admin");


									/**** Clients *****/
insert into user (username , displayname , password , email , phone , balance , role,checkstate ) values 
("omneyaEid" , "omneya" , 12345 , "omneyaeid827@gmail.com" , "01060846630" ,20000, "client","in");
insert into user (username , displayname , password , email , phone , balance , role ,checkstate) values 
("sohilaabdalla" , "sohila" , 12345 , "sohilaabdalla113@gmail.com" , "01145129920" ,10000, "client","in");
insert into user (username , displayname , password , email , phone , balance , role,checkstate ) values 
("mostafaAdel" , "mostafa" , 12345 , "mostafaa11@gmail.com" , "010012584660" ,20000, "client","in");
insert into user (username , displayname , password , email , phone, balance, role,checkstate ) values 
("omneya" , "omneya" , "omneya" , "monaeid9334@gmail.com" , "010525787877" ,1000, "client","in");
insert into user (username , displayname , password , email , phone , balance , role ,checkstate) values 
("sohila" , "sohila" , "sohila" , "sohilaabdalla113@gmail.com" , "012358558" ,2000, "client","in");
insert into user (username , displayname , password , email , phone ,balance, role,checkstate ) values 
("mostafa" , "mostafa" ,"mostafa", "mostafaa11@gmail.com" , "015842587" ,4000, "client","out");
insert into user (username , displayname , password , email , phone , balance , role ,checkstate) values 
("Hala" , "hala" , "hala" , "omneyaeid5@gmail.com" , "01587588755" ,3000, "client","out");



CREATE TABLE `hotels` (
  `hotelID` int NOT NULL auto_increment,
  `hotelName` varchar(45) DEFAULT NULL,
  `roomNumber` int DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `availability` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `strars` int DEFAULT NULL,
  `meals` int DEFAULT NULL, /*NEW UPDATEED*/
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `city` varchar(25),
  `googleMap`varchar(200),
  `hotelFacilities` varchar(250) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`hotelID`),
   KEY `hotelID_idx` (`UserID`) 
);

									/****     Hotels    *****/
insert into hotels (hotelName,roomNumber,rating,availability,price,location,strars,meals,email,phone,city,googleMap,hotelFacilities,UserID) values
("Ramses Hilton",1,"8.1","available",761,"Tahrir Square",5,3,
"ramseshiltomegyept@gmail.com",999,"cairo",
"https://g.page/RamsesHilton?share","(swimming pool,free wifi , parking , Bar , Family rooms)",1);

insert into hotels (hotelName,roomNumber,rating,availability,price,location,strars,meals,email,phone,city,googleMap,hotelFacilities,UserID) values
("sheraton",2,"8.5","available",681,"Galae Square",5,3,
"sheratongyept@gmail.com", 0233369800,"giza",
"https://goo.gl/maps/i5y6tHXh59QS5VSo6","(swimming pool,free wifi , parking , Family rooms)",2);

insert into hotels (hotelName,roomNumber,rating,availability,price,location,strars,meals,email,phone,city,googleMap,hotelFacilities,UserID) values
("Four Seasons",3,"8.1","available",4150,"Nile Plaza",5,1,
"fourseasonsegyept@gmail.com",999,"cairo",
"https://goo.gl/maps/d5kwUL9k6fvkEcJf6","(swimming pool,free wifi , parking , Bar , Family rooms)",3);

insert into hotels (hotelName,roomNumber,rating,availability,price,location,strars,meals,email,phone,city,googleMap,hotelFacilities,UserID) values
("Cairo Marriott Hotel & Omar Khayyam Casino",4,"5","available",2383,"Zamalik",5,2,
"marriottegyept@gmail.com",999,"cairo",
"https://goo.gl/maps/fLMexipsEJgGAQxL7","(swimming pool,free wifi , parking , Bar , Family rooms)",4);

insert into hotels (hotelName,roomNumber,rating,availability,price,location,strars,meals,email,phone,city,googleMap,hotelFacilities,UserID) values
("Great Pyramid Inn",5,"5","available",618,"El-Haramm",5,2,
"greatpyramidsegyept@gmail.com",999,"giza",
"https://g.page/great-pyramid-inn?share","(swimming pool,free wifi , parking , Bar , Family rooms)",5);



create table photos
(
   `photoid` int NOT NULL auto_increment,
   `image` varchar(255) DEFAULT NULL,
   `hotelID` int DEFAULT NULL,
   PRIMARY KEY (`photoid`),
    KEY `hotelID_idx` (`hotelID`) 
);
insert into photos (image ,hotelID) values ("1.jpeg",1);
insert into photos (image ,hotelID) values ("4.jpg",1);

insert into photos (image ,hotelID) values ("2.jpg",2);
insert into photos (image ,hotelID) values ("3.jpg",2);

insert into photos (image ,hotelID) values ("5.jpg",3);
insert into photos (image ,hotelID) values ("6.jpg",3);

insert into photos (image ,hotelID) values ("7.jpg",4);
insert into photos (image ,hotelID) values ("8.jpg",4);

insert into photos (image ,hotelID) values ("9.jpg",5);
insert into photos (image ,hotelID) values ("10.jpeg",5);


CREATE TABLE `branches` (
  `branshid` int NOT NULL auto_increment,
  `hotelID` int DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branshid`),
  KEY `hotelID_idx` (`hotelID`),
  CONSTRAINT `hotelID` FOREIGN KEY (`hotelID`) REFERENCES `hotels` (`hotelID`)
);
					/****  Branchs  *****/
insert into branches (hotelID,location,name) values (1,'cairo','main branch');
insert into branches (hotelID,location,name) values (1,'giza','second branch');
insert into branches (hotelID,location,name) values (2,'giza','main branch');
insert into branches (hotelID,location,name) values (2,'cairo','second branch');
insert into branches (hotelID,location,name) values (3,'cairo','main branch');
insert into branches (hotelID,location,name) values (4,'giza','main branch');
insert into branches (hotelID,location,name) values (4,'cairo','second branch');
insert into branches (hotelID,location,name) values (5,'giza','main branch');
		
				
CREATE TABLE `rooms` (
  `roomID` int NOT NULL auto_increment,
  `roomsavailable` varchar(25) DEFAULT NULL,
  `roomType` varchar(45) DEFAULT NULL,
  `roomFacilities` varchar(250) DEFAULT NULL,
  `paymentamount` double DEFAULT NULL,
  `hotelID` int DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `hotelID_idx` (`hotelID`)
);

							/****    Rooms  *****/
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("not avaliable","single room","bed,table,tv,Free Wifi",500,1);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("not avaliable","doublex","bed,table,1 swimming pool,tv,wc,Bar",1000,2);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("not avaliable","double room","2 beds ,table,tv,wc,Bar",800,5);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("not avaliable","single room","bed,table,tv,Free parking",900,3);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("not avaliable","doublex","bed,table,tv,1 swimming pool,wc,living room",1500,4);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("avaliable","double room","2 beds ,table,tv,wc,Free parking,1 swimming pool",500,1);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("avaliable","single room","bed,table,tv,Bar,1 swimming pool",400,5);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("avaliable","doublex","bed,table,tv,wc,Bar,1 swimming pool",600,3);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("avaliable","double room","2 beds ,table,tv,wc,Free parking",300,2);
insert into rooms (roomsavailable,roomType,roomFacilities,paymentamount,hotelID) values("avaliable","double room","2 beds ,table,tv,wc,Free Wifi",700,4);




CREATE TABLE `reservation` (
 `reservationID` int NOT NULL auto_increment,
  `clientid` int DEFAULT NULL,
  `hotelname` varchar(45) DEFAULT NULL,
  `dateFrom`  date DEFAULT NULL,
   `dateTo` date DEFAULT NULL,
   `numberofadults` int DEFAULT NULL,
  `numberofchildren` int DEFAULT NULL,
  `paymentmethod` varchar(45) DEFAULT NULL,
  `paymentamount` double DEFAULT NULL,
  `payconfirm` VARCHAR(45) NULL , /* NEW ADDED HERE */
  `roomID` int DEFAULT NULL, 
  `rating` VARCHAR(45) NULL , /* NEW ADDED HERE */
 `comment` VARCHAR(255) NULL, /* NEW ADDED HERE */
   PRIMARY KEY (`reservationID`),
  KEY `roomID_idx` (`roomID`),
  KEY `clientid` (`clientid`),
  CONSTRAINT `clientid` FOREIGN KEY (`clientid`) REFERENCES `user` (`UserID`),
  CONSTRAINT `roomID` FOREIGN KEY (`roomID`) REFERENCES `rooms` (`roomID`)
);
 /*truncate reservation;*/
			
            /**    Reservation    **/
insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren,rating) values 
(6,"Ramses Hilton","2021-01-06","2021-01-10","paypal",500,"Not Confirmed",1,2,1,'5');
insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren,rating) values 
(7,"Cairo Marriott Hotel & Omar Khayyam Casino","2021-01-14","2021-01-20","crdit card",1000,"Not Confirmed",2,2,1,'10');
insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren,rating) values 
(8,"sheraton","2021-01-25","2021-02-01","crdit card",800,"Not Confirmed",3,1,3,'9');
insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren,rating) values 
(9,"Four Seasons","2021-02-01","2021-02-03","Visa",900,"Not Confirmed",4,3,1,'10');
insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren,rating) values 
(10,"Great Pyramid Inn","2021-01-19","2021-01-22","Master Card",1500,"Not Confirmed",5,1,1,'10');



/*ALTER TABLE `hotelreservationsystem`.`reservation` 
ADD COLUMN `rating` VARCHAR(45) NULL AFTER `roomID`,
ADD COLUMN `comment` VARCHAR(255) NULL AFTER `rating`;*/

/*ALTER TABLE `hotelreservationsystem`.`reservation` 
ADD COLUMN `payconfirm` VARCHAR(45) NULL AFTER `paymentamount`;*/


/*ALTER TABLE user 
ADD column  AFTER checkstate varchar(25) NULL role ;*/

/*truncate user;*/

SELECT  user.username,user.checkstate
FROM user
JOIN reservation ON reservation.clientid=user.UserID WHERE  reservation.hotelname="Ramses Hilton";




delete from reservation where clientid=1;
select * from user ;
select * from rooms ;
select * from hotels;
select * from photos;
select * from branches;
select * from reservation;

insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,paymentamount,payconfirm,roomID,numberofadults,numberofchildren) values 
(7,"sheraton","1/11/2021","1/20/2021","Master Card",1500,'unconfirmed',9,1,1);

SELECT * from reservation WHERE dateFrom >= "06/01/2021" or dateFrom <="22/01/2021";

update rooms set roomsavailable="available" where roomID=6;

UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'in' WHERE (`UserID` = '6');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'in' WHERE (`UserID` = '7');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'in' WHERE (`UserID` = '8');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'in' WHERE (`UserID` = '9');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'in' WHERE (`UserID` = '10');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'out' WHERE (`UserID` = '11');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'out' WHERE (`UserID` = '12');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'out' WHERE (`UserID` = '13');
UPDATE `hotelreservationsystem`.`user` SET `checkstate` = 'out' WHERE (`UserID` = '14');


select * from reservation ;