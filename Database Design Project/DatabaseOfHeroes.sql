DROP TABLE IF EXISTS ClassA;
DROP TABLE IF EXISTS ClassB;
DROP TABLE IF EXISTS GeneralClass;
DROP TABLE IF EXISTS SupportClass;
DROP TABLE IF EXISTS BigThree;
DROP TABLE IF EXISTS Emitters;
DROP TABLE IF EXISTS Transformations;
DROP TABLE IF EXISTS Mutants;
DROP TABLE IF EXISTS LeagueOfVillains;
DROP TABLE IF EXISTS EightPreceptsOfDeath;
DROP TABLE IF EXISTS ReservoirDogs;
DROP TABLE IF EXISTS Soloes;
DROP TABLE IF EXISTS Villains;
DROP TABLE IF EXISTS Heroes;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Quirkless;
DROP TABLE IF EXISTS Quirked;
DROP TABLE IF EXISTS Quirks;
DROP TABLE IF EXISTS People;

CREATE TABLE People(
PID		int not null unique,
fName 		text not null,
lName		text,
Age		int,
Gender		char(10),
primary key(PID)
);

CREATE TABLE Quirks(
QID		varchar(10) not null unique,
Name		varchar(50) not null unique,
QRange	text not null CHECK(QRange IN('Contact', 'Close', 'Medium', 'Long', 'All', 'Unknown')),
primary key(QID)
);

CREATE TABLE Emitters(
ETID		varchar(10) not null unique references Quirks(QID),
DescLink	text not null,
primary key(ETID)
);

CREATE TABLE Mutants(
MTID		varchar(10) not null unique references Quirks(QID),
AffectedArea	text not null,
DescLink	text not null,
primary key(MTID)
);

CREATE TABLE Transformations(
TTID		varchar(10) not null unique references Quirks(QID),
DescLink	text not null,
primary key(TTID)
);

CREATE TABLE Quirkless(
PID		int not null unique references People(PID),
Occupation	text not null,
primary key(PID)
);

CREATE TABLE Quirked(
PID		int not null unique references People(PID),
QID		varchar(10) not null references Quirks(QID),
primary key(PID, QID)
);

CREATE TABLE Heroes(
HID		int not null unique references Quirked(PID),
Alias		text not null,
HeroName	text,
primary key(HID)
);

CREATE TABLE Students(
SID		int not null unique references Quirked(PID),
Alias		text not null,
Year		int not null,
primary key(SID)
);

CREATE TABLE ClassA(
CAID		int not null unique references Students(SID),
SeatNum	int not null unique,
primary key(CAID)
);

CREATE TABLE ClassB(
CBID		int not null unique references Students(SID),
SeatNum	int,
primary key(CBID)
);

CREATE TABLE BigThree(
BTID		int not null unique references Students(SID),
Mentor		int not null references Heroes(HID),
primary key(BTID)
);

CREATE TABLE GeneralClass(
GCID		int not null unique references Students(SID),
StudyTopic	text,
primary key(GCID)
);

CREATE TABLE SupportClass(
SCID		int not null unique references Students(SID),
PrimGear	varchar(50) not null,	
primary key(SCID)
);

CREATE TABLE Villains(
VID		int not null unique references Quirked(PID),
Alias		text,
primary key(VID)
);

CREATE TABLE LeagueOfVillains(
LVID		varchar(4) not null unique,
VID		int not null unique references Villains(VID),
primary key(LVID)
);

CREATE TABLE EightPreceptsOfDeath(
EPID		varchar(4) not null unique,
VID		int not null unique references Villains(VID),
primary key(EPID)
);

CREATE TABLE ReservoirDogs(
RDID		varchar(4) not null unique,
VID		int not null unique references Villains(VID),
primary key(RDID)
);

CREATE TABLE Soloes(
SVID		varchar(4) not null unique,
VID		int not null unique references Villains(VID),
primary key(SVID)
);

INSERT INTO People
VALUES(001, 'Izuku', 'Midoriya', 15, 'male'), 
(002, 'Toshinori', 'Yagi', null, 'male'), 
(003, 'Shoto', 'Todoroki', 16, 'male'), 
(004, 'Ochaco', 'Uraraka', 15, 'female'), 
(005, 'Bakugo', 'Katsuki', 15, 'male'), 
(006, 'Tsuyu', 'Asui', 16, 'female'), 
(007, 'Neito', 'Monoma', 15, 'male'), 
(008, 'Tetsutetsu', 'Tetsutetsu', 15, 'male'), 
(009, 'Ibara', 'Shiozaki', 15, 'female'),
(010, 'Mei', 'Hatsume', 16, 'female'),
(011, 'Hitoshi', 'Shinso', 15, 'male'),
(012, 'Mirio', 'Togata', null, 'male'),
(013, 'Takami', 'Amajiki', null, 'male'),
(014, 'Shota', 'Aizawa', 30, 'male'),
(015, 'Hizashi', 'Yamada', 30, 'male'),
(016, 'Nemuri', 'Kayama', 31, 'female'),
(017, 'Chizome', 'Akaguro', 31, 'male'),
(018, 'Tomura', 'Shigaraki', null, 'male'),
(019, 'Kurogiri', '', null, 'male'),
(020, 'Mustard', '', null, 'male'),
(021, 'Moonfish', '', null, 'male'),
(022, 'Chisaki', '', null, 'male'),
(023, 'Yellow', '', null, 'male'),
(024, 'Inko', 'Midoriya', 41, 'female'),
(025, 'Naomasa', 'Tsukauchi', 36, 'male'),
(026, 'Tsunagu', 'Hakamata', 35, 'male'),
(027, 'Yuu', 'Takeyama', 23, 'female'),
(028, 'Fumikage', 'Tokoyami', 15, 'male'),
(029, 'Sir', 'Nighteye', null, 'male'),
(030, 'Fatgum', '', null, 'male'),
(031, 'Alan', 'Bond', 40, 'male');

INSERT INTO Quirkless
VALUES (024, 'Mother'),
(025, 'Police Officer');

INSERT INTO Quirks
VALUES('Q001', 'One For All', 'Close'),
('Q002', 'Half-Cold Half-Hot', 'Medium'),
('Q003', 'Zero Gravity', 'Contact'),
('Q004', 'Explosion', 'Close'),
('Q005', 'Frog-Form', 'Long'),
('Q006', 'Copy', 'Contact'),
('Q007', 'Steel', 'Close'),
('Q008', 'Vines', 'Long'),
('Q009', 'Zoom', 'Long'),
('Q010', 'Brainwashing', 'Long'),
('Q011', 'Permeation', 'Close'),
('Q012', 'Manifest', 'Close'),
('Q013', 'Eraser', 'Long'),
('Q014', 'Voice', 'Long'),
('Q015', 'Somnambulist', 'All'),
('Q016', 'Bloodcurdle', 'Contact'),
('Q017', 'Disintegration', 'Contact'),
('Q018', 'Warp Gate', 'All'),
('Q019', 'Sleep Gas', 'All'),
('Q020', 'Dental Manipulation', 'Long'),
('Q021', 'Overhaul', 'Contact'),
('Q022', 'Fiber Master', 'All'),
('Q023', 'Gigantification', 'Close'),
('Q024', 'Dark Shadow', 'All'),
('Q025', 'Foresight', 'Contact'),
('Q026', 'Absorbing Fat', 'Contact'),
('Q777', 'Ultimate Spy', 'All'),
('Q999', 'Unknown', 'Unknown');

INSERT INTO Emitters
VALUES('Q001', 'http://bokunoheroacademia.wikia.com/wiki/One_For_All'),
('Q002', 'http://bokunoheroacademia.wikia.com/wiki/Half-Cold_Half-Hot'),
('Q003', 'http://bokunoheroacademia.wikia.com/wiki/Zero_Gravity'),
('Q004', 'http://bokunoheroacademia.wikia.com/wiki/Explosion'),
('Q010', 'http://bokunoheroacademia.wikia.com/wiki/Brainwashing'),
('Q013', 'http://bokunoheroacademia.wikia.com/wiki/Erasure'),
('Q014', 'http://bokunoheroacademia.wikia.com/wiki/Voice'),
('Q015', 'http://bokunoheroacademia.wikia.com/wiki/Somnambulist'),
('Q016', 'http://bokunoheroacademia.wikia.com/wiki/Bloodcurdle'),
('Q017', 'http://bokunoheroacademia.wikia.com/wiki/Disintegration'),
('Q018', 'http://bokunoheroacademia.wikia.com/wiki/Warp_Gate'),
('Q019', 'http://bokunoheroacademia.wikia.com/wiki/Sleep_Gas'),
('Q021', 'http://bokunoheroacademia.wikia.com/wiki/Overhaul_(Quirk)'),
('Q022', 'http://bokunoheroacademia.wikia.com/wiki/Fiber_Master'),
('Q025', 'http://bokunoheroacademia.wikia.com/wiki/Foresight');

INSERT INTO Mutants
VALUES('Q005', 'Whole Body', 'http://bokunoheroacademia.wikia.com/wiki/Frog-Form'),
('Q008', 'Hair', 'http://bokunoheroacademia.wikia.com/wiki/Vines'),
('Q009', 'Eyes', 'http://bokunoheroacademia.wikia.com/wiki/Zoom'),
('Q026', 'Body', 'http://bokunoheroacademia.wikia.com/wiki/Absorbing_Fat');

INSERT INTO Transformations
VALUES('Q006', 'http://bokunoheroacademia.wikia.com/wiki/Copy'),
('Q007', 'http://bokunoheroacademia.wikia.com/wiki/Steel'),
('Q011', 'http://bokunoheroacademia.wikia.com/wiki/Permeation'),
('Q012', 'http://bokunoheroacademia.wikia.com/wiki/Manifest'),
('Q020', 'http://bokunoheroacademia.wikia.com/wiki/Dental_Manipulation'),
('Q023', 'http://bokunoheroacademia.wikia.com/wiki/Gigantification'),
('Q024', 'http://bokunoheroacademia.wikia.com/wiki/Dark_Shadow'),
('Q777', 'https://en.wikipedia.org/wiki/Sean_Connery');


INSERT INTO Quirked
VALUES(001, 'Q001'), 
(002, 'Q001'), 
(003, 'Q002'), 
(004, 'Q003'), 
(005, 'Q004'), 
(006, 'Q005'), 
(007, 'Q006'), 
(008, 'Q007'), 
(009, 'Q008'),
(010, 'Q009'),
(011, 'Q010'),
(012, 'Q011'),
(013, 'Q012'),
(014, 'Q013'),
(015, 'Q014'),
(016, 'Q015'),
(017, 'Q016'),
(018, 'Q017'),
(019, 'Q018'),
(020, 'Q019'),
(021, 'Q020'),
(022, 'Q021'),
(023, 'Q999'),
(026, 'Q022'),
(027, 'Q023'),
(028, 'Q024'),
(029, 'Q025'),
(030, 'Q026'),
(031, 'Q777');

INSERT INTO Heroes
VALUES(002, 'Symbol of Peace', 'All Might'),
(014, 'Erasing Hero', 'Eraserhead'),
(015, '', 'Present Mic'),
(016, '18+ Only Hero', 'Midnight'),
(026, 'Stylish', 'Best Jeanist'),
(027, '', 'Mount Lady'),
(029, 'All-Seeing', ''),
(030, 'BMI Hero', '');

INSERT INTO Students
VALUES(001, 'Deku', 1),
(003, 'Shoto', 1),
(004, 'Uravity', 1),
(005, '', 1),
(006, 'Froppy', 1),
(007, 'Phantom Thief', 1),
(008, 'Real Steel', 1),
(009, 'Maria', 1),
(010, '', 1),
(011, '', 1),
(012, 'Lemillion', 3),
(013, 'Suneater', 3),
(028, 'Jet-Black', 1);

INSERT INTO Villains
VALUES(017, 'Hero Killer Stain'),
(018, 'Tenko Shimura'),
(019, 'Black Fog'),
(020, 'Merciless Villain'),
(021, 'Flesh Stalker'),
(022, 'Plague Doctor'),
(023, ''),
(031, 'Goldeneye');

INSERT INTO ClassA
VALUES(001, 18),
(003, 15),
(004, 5),
(005,17),
(006, 3),
(028, 14);

INSERT INTO ClassB
VALUES(007, 6),
(008, 3),
(009, 2);

INSERT INTO BigThree
VALUES(012, 029),
(013, 030);

INSERT INTO SupportClass
VALUES(010, 'Hoverpack and boots');

INSERT INTO GeneralClass
VALUES(011, 'Hero');

INSERT INTO LeagueOfVillains
VALUES('LV01', 018),
('LV02', 019),
('LV04', 020),
('LV03', 021);

INSERT INTO EightPreceptsOfDeath
VALUES('EP01', 022);

INSERT INTO ReservoirDogs
VALUES('RD01', 023);

INSERT INTO Soloes
VALUES('SV01', 017),
('SV02', 031);

CREATE VIEW CurrentFirstYears AS
SELECT People.pid, People.fname, People.lname, People.age, People.gender, Students.alias
FROM People, Students
WHERE People.pid = Students.sid
 and Students.Year = 1;

CREATE VIEW CurrentMentors AS
SELECT People.pid, People.fname, People.lname, Heroes.alias
FROM People, Heroes, BigThree
WHERE heroes.hid = BigThree.mentor
 and People.pid = heroes.hid

CREATE VIEW EmitterWielders AS
SELECT People.pid, People.fname, People.lname, Quirks.qid, Quirks.name, Quirks.qrange
FROM Quirks, Emitters, People, Quirked
WHERE Quirks.qid = Emitters.etid
 and Quirks.qid = Quirked.qid
 and People.pid = Quirked.pid;

CREATE OR REPLACE FUNCTION getQuirkInfo(int, refcursor)
RETURNS refcursor as $$
DECLARE
	QuirkWanted int := $1;
	QuirkInfo refcursor := $2;
BEGIN
	OPEN QuirkInfo for
		SELECT Quirks.QID, Quirks.name, Quirks.qrange
		FROM Quirks, Quirked
		WHERE Quirked.pid = QuirkWanted
		 and Quirks.qid = Quirked.qid;
	RETURN QuirkInfo;
END;
$$
language plpgsql;

CREATE OR REPLACE FUNCTION getHeroesWith(text, refcursor)
RETURNS refcursor as $$
DECLARE
	QuirkWanted text := $1;
	HeroInfo refcursor := $2;
BEGIN
	OPEN HeroInfo for
		SELECT Heroes.HID, People.fname, People.lname, Heroes.alias, Heroes.HeroName, Quirks.QID, Quirks.name
		FROM Quirks, Quirked, People, Heroes
		WHERE Quirks.qid like QuirkWanted
		 and Quirks.qid = quirked.QID
		 and Heroes.hid = quirked.pid
		 and People.pid = quirked.pid;
	RETURN HeroInfo;
END;
$$
language plpgsql;

SELECT p.pid, p.fname, p.lname, q.qid, q.name
FROM Quirked d inner join Mutants m on d.qid = m.mtid
	inner join Quirks q on d.qid = q.qid
	inner join People p on d.pid = p.pid
order by PID ASC;

SELECT s.sid, p.fname, p.lname, s.alias, q.qid, q.name, q.qrange  
FROM Quirks q, People p, Students s, Quirked d
WHERE q.qrange in('Contact', 'Close')
 and	q.qid = d.qid
 and	p.pid = d.pid
 and	s.sid = p.pid
order by SID ASC;

CREATE ROLE Mod;
CREATE ROLE Viewer;

GRANT SELECT, INSERT, UPDATE, DELETE on People TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Quirks TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Mutants TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Emitters TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Transformations TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Quirkless TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Quirked TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Heroes TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Students TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on ClassA TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on ClassB TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on BigThree TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on SupportClass TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on GeneralClass TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Villains TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on LeagueOfVillains TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on EightPreceptsOfNight TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on ReservoirDogs TO Mod;
GRANT SELECT, INSERT, UPDATE, DELETE on Soloes TO Mod;


GRANT SELECT on People TO Viewer;
GRANT SELECT on Quirks TO Viewer;
GRANT SELECT on Mutants TO Viewer;
GRANT SELECT on Emitters TO Viewer;
GRANT SELECT on Transformations TO Viewer;
GRANT SELECT on Quirkless TO Viewer;
GRANT SELECT on Quirked TO Viewer;
GRANT SELECT on Heroes TO Viewer;
GRANT SELECT on Students TO Viewer;
GRANT SELECT on ClassA TO Viewer;
GRANT SELECT on ClassB TO Viewer;
GRANT SELECT on BigThree TO Viewer;
GRANT SELECT on SupportClass TO Viewer;
GRANT SELECT on GeneralClass TO Viewer;
GRANT SELECT on Villains TO Viewer;
GRANT SELECT on LeagueOfVillains TO Viewer;
GRANT SELECT on EightPreceptsOfNight TO Viewer;
GRANT SELECT on ReservoirDogs TO Viewer;
GRANT SELECT on Soloes TO Viewer;