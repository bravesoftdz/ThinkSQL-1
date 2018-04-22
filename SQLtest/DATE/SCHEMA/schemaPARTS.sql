--Parts schema taken from 'A Guide to The SQL Standard' Date/Darwen

--Note: you must be connected as ADMIN to have privilege to CREATE USERs and SCHEMAs authorized by others

CREATE USER PARTS;

CREATE SCHEMA PARTS AUTHORIZATION PARTS
	CREATE TABLE S (SNO CHAR(5) NOT NULL,
		SNAME CHAR(20),
		STATUS DECIMAL(3),
		CITY CHAR(15),
		PRIMARY KEY (SNO) )

	CREATE TABLE P (PNO CHAR(6) NOT NULL,
		PNAME CHAR(6),
		COLOR CHAR(6),
		WEIGHT DECIMAL(3),
		CITY CHAR(15),
		PRIMARY KEY (PNO) )

	CREATE TABLE SP (SNO CHAR(5) NOT NULL,
		PNO CHAR(6) NOT NULL,
		QTY DECIMAL(5),
		PRIMARY KEY (SNO, PNO),
		FOREIGN KEY (SNO) REFERENCES S,
		FOREIGN KEY (PNO) REFERENCES P )
;
.

COMMIT;

CONNECT TO 'THINKSQL' USER 'PARTS';

INSERT INTO S (SNO,SNAME,STATUS,CITY) VALUES ('S1','Smith',20,'London');
INSERT INTO S (SNO,SNAME,STATUS,CITY) VALUES ('S2','Jones',10,'Paris');
INSERT INTO S (SNO,SNAME,STATUS,CITY) VALUES ('S3','Blake',30,'Paris');
INSERT INTO S (SNO,SNAME,STATUS,CITY) VALUES ('S4','Clark',20,'London');
INSERT INTO S (SNO,SNAME,STATUS,CITY) VALUES ('S5','Adams',30,'Athens');

INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P1','Nut','Red',12,'London');
INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P2','Bolt','Green',17,'Paris');
INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P3','Screw','Blue',17,'Rome');
INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P4','Screw','Red',14,'London');
INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P5','Cam','Blue',12,'Paris');
INSERT INTO P (PNO,PNAME,COLOR,WEIGHT,CITY) VALUES ('P6','Cog','Red',19,'London');

INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P1',300);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P2',200);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P3',400);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P4',200);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P5',100);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S1','P6',100);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S2','P1',300);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S2','P2',400);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S3','P2',200);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S4','P2',200);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S4','P4',300);
INSERT INTO SP (SNO,PNO,QTY) VALUES ('S4','P5',400);

COMMIT; 

SELECT * FROM S;
SELECT * FROM P;
SELECT * FROM SP;
