CREATE DATABASE UsersDB

CREATE TABLE USERTYPE
(
USERTYPEID INT IDENTITY (1,1) NOT NULL,
USERTYPENAME VARCHAR (300),
CONSTRAINT PK_USERTYPEID PRIMARY KEY (USERTYPEID),
)

CREATE TABLE USERS
(
USERID INT IDENTITY (1,1) NOT NULL,
USERNAME VARCHAR (200),
EMAIL VARCHAR (300),
USERPASS VARCHAR (300),
USERTYPEID INT,
CONSTRAINT PK_USERID PRIMARY KEY (USERID),
CONSTRAINT FK_USERTYPEID_USERTYPE FOREIGN KEY (USERTYPEID) REFERENCES USERTYPE(USERTYPEID),
)

CREATE TABLE PERMIT
(
PERMITID INT IDENTITY (1,1) NOT NULL,
PERMITNAME VARCHAR (300),
CONSTRAINT PK_PERMITID PRIMARY KEY (PERMITID),
)

CREATE TABLE USERPERMIT
(
USERPERMITID INT IDENTITY (1,1) NOT NULL,
USERTYPEID INT,
PERMITID INT,
CONSTRAINT PK_USERPERMITID PRIMARY KEY (USERPERMITID),
CONSTRAINT FK_USERTYPEID_USERPERMIT FOREIGN KEY (USERTYPEID) REFERENCES USERTYPE(USERTYPEID),
CONSTRAINT FK_PERMITID_USERPERMIT FOREIGN KEY (PERMITID) REFERENCES PERMIT(PERMITID),
)

INSERT INTO USERTYPE (USERTYPENAME) VALUES ('Admin')
INSERT INTO PERMIT (PERMITNAME) VALUES ('View')
INSERT INTO PERMIT (PERMITNAME) VALUES ('Insert')
INSERT INTO PERMIT (PERMITNAME) VALUES ('Edit')
INSERT INTO PERMIT (PERMITNAME) VALUES ('Delete')
INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (1,1)
INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (1,2)
INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (1,3)
INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (1,4)
INSERT INTO USERS (USERNAME,USERPASS,USERTYPEID) VALUES ('Carl','18','1')

CREATE TABLE PRODUCT
(
PRODID INT IDENTITY (1,1),
BRAND VARCHAR (300),
MODEL VARCHAR (300),
PRICE VARCHAR (300),
CONSTRAINT PK_PRODID PRIMARY KEY (PRODID)
)
