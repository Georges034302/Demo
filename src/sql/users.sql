CREATE TABLE mydb.users(
    ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100000, INCREMENT BY 1),
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    DOB VARCHAR(255) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS mydb.admins(
    ID INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    PASSWORD VARCHAR(100) NOT NULL UNIQUE,
    DOB date
)AUTO_INCREMENT=100;

CREATE TABLE mydb.BLOGS (
    BlogID INTEGER NOT NULL NOT NULL AUTO_INCREMENT,
    ID INTEGER NOT NULL,
    Text VARCHAR(255),
    PRIMARY KEY (BlogID),
    FOREIGN KEY (ID) REFERENCES USERS(ID)
);

SET FOREIGN_KEY_CHECKS=0;

SET GLOBAL FOREIGN_KEY_CHECKS=0;

INSERT INTO mydb.users(NAME,EMAIL,PASSWORD,DOB)
VALUES 
    ('John Smith','john.smith@uts.com','hello123','2000-12-05'),
    ('David Alen Jones','alen.david@example.com','demo123','2002-07-11'),
    ('jim123','jim.l@uts.com','Jim Lee','2001-12-04'),
    ('Emilia Adams','emilia.a@gmail.com','adams123','1999-11-11'),
    ('Carl Ridle','carl.r@uts.com','mmm123','2004-05-08'),
    ('Paula Costa','paula.costa@uts.com','uts123','1998-01-02'),
    ('Jessica Jones','jess.jones@example.com','hijess123','2003-07-12'),
    ('Carol Knox','carol.k@gmail.com','knox123','1995-10-11'),
    ('Andreas Brehme','andy.b@uts.com','ger123','1988-12-05');

INSERT INTO mydb.admins(NAME,EMAIL,PASSWORD,DOB)
VALUES 
    ('John Smith','john.smith@example.com','Helloworld123','2000-12-05'),
    ('Luthor Mathius','luther.m@example.com','Helloworld111','2002-07-11');