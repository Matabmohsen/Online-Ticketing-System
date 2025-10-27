 

1)create table user1
(
    name varchar(20) not null,
    username varchar(12) not null,
    password varchar(30) not null,
    email varchar(50) not null,
    gender char(6) ,
    address varchar(100),
    phoneNumber varchar(11) not null,
    primary key (username)
);

    2)create table ticket 
(
    id varchar(10) not null,
    eventName varchar(20) not null,
    type varchar(8) not null,
    price integer not null,
    partyDate date not null,
    promotion varchar(3),
    userUsername varchar(12) not null,
    primary key (id),
    foreign key (userUsername) references user1 (username)
);

3) CREATE TABLE PARTY (
  Partyname VARCHAR(50) NOT NULL,
  artist VARCHAR(50) NOT NULL,
  place VARCHAR(50) NOT NULL,
  p_date DATE NOT NULL,
  organizers VARCHAR(100),
  PRIMARY KEY (Partyname)
);
alter table party add unique(artist);

4)CREATE TABLE ADMINN (
  username VARCHAR(50) NOT NULL ,	
  newAdmin VARCHAR(20) ,
   password VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  AdminName VARCHAR(50) NOT NULL,
    PRIMARY KEY (AdminName)
    );

5) CREATE TABLE payment (
  p_type VARCHAR(50),
  ticketid varchar(10),
  refund integer,
  promotion integer,
  PRIMARY KEY (p_type, ticketid),
  FOREIGN KEY (ticketid) REFERENCES ticket (id)
);

6) CREATE TABLE adminparty (
  partyname VARCHAR(50),
  partyartist VARCHAR(50),
  adminusername VARCHAR(50),
  PRIMARY KEY (partyname, partyartist, adminusername),
  FOREIGN KEY (adminusername) REFERENCES ADMINN (AdminName),
  FOREIGN KEY (partyartist) REFERENCES PARTY (artist),
  FOREIGN KEY (partyname) REFERENCES PARTY (Partyname)
);

7) create table User1Party (
  Partyname VARCHAR(50),
  partyartist VARCHAR(50),
  Userusername VARCHAR(12),
    primary key(Partyname,partyartist,Userusername),
    FOREIGN KEY (Userusername) REFERENCES user1 (username),
  FOREIGN KEY (partyartist) REFERENCES party(artist),
  FOREIGN KEY (Partyname) REFERENCES party(Partyname)
);

8) CREATE TABLE phoneNo (
    phoneNumber varchar(11) NOT NULL,
    username VARCHAR(20) Not null
);

ALTER TABLE phoneNo ADD FOREIGN KEY (username) REFERENCES user1 (username);
alter table payment modify promotion varchar(3);
alter table adminn add parent_admin VARCHAR(50);
alter table adminn add  newAdmin VARCHAR(20);
alter table adminn add unique (username);
alter table adminn add FOREIGN KEY (parent_admin) REFERENCES ADMINN (username);
