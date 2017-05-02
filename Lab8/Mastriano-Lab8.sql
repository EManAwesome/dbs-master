DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS DirectorsOfMovies;
DROP TABLE IF EXISTS ActorsInMovies;

create table People (
	PID			int		not null primary key,
	Name			char(50)	not null,
	Address		varchar(50)	not null,
	DoB			date		not null,
	Spouse			char(50),
	HairColor		char(20),
	EyeColor		char(20),
	InchesTall		int		not null,
	WeightLbs		int		not null,
	FavColor		char(50)
);

Create table Actors(
	PID 			int		not null references People(pid),
	ScreenActorsGuildDate	varchar(75),
	primary key(PID)
);

create table Directors(
	PID			int		not null references People(pid),
	FilmSchool		char(50),
	DirectorsGuildDate	varchar(75),
	FavLensMaker	char(50),
	primary key(PID)
);

create table Movies(
	MID			int		not null primary key,
	Title 			char(75)	not null,
ReleaseYear		int		not null, 
MPAANum		int, 
DomesticBOSales	int, 
ForeignBOSales	int, 
DiskSales		int
);


Create table ActorsInMovies(
	MID		int	not null references Movies(mid),
	PID		int	not null references People(pid),
	Role		char(75)	not null,
primary key(MID, PID)
);

create table DirectorsOfMovies(
	MID		int	not null references Movies(mid),
	PID		int	not null references People(pid),
	primary key(MID, PID)
);


insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(007, "Sean Connery", "30 Wellington Square", 08/25/1930, "Micheline Roquebrune", "White", "Brown", 74, 195, "Black");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(001, "Dwayne Johnson", "Hayward, CA", 05/02/1972, '', '', "Brown", 77, 260, "Rad");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(002, "Robert De Niro", "Manhattan, NYC", 08/17/1943, "Grace Hightower", "White", "Brown", 69, 174, "White");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(003, "Kevin Costner", "Lynwood, CA", 01/18/1955, "Christine Baumgartner", "Gray", "Blue", 73, 174, "Teal");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(004, "Harrison Ford", "Chicago, IL", 07/13/193042, "Calista Flockhart", "Gray", "Hazel", 72, 170, "Dark");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(005, "Julian Glover", "Hampstead, London", 03/27/1935, "Jamie Glover", "White", "Hazel", 74, 175, "Classy");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(006, "Kevin James", "Burlington Mall, MA", 04/26/1965, "Steffiana de la Cruz", "Brown", "Brown", 68, 280, "Justice");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(008, "Brian De Palma", "Manhattan", 09/11/1940, '', "White", "Brown", 73, 190, "Acting");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(009, "Justin Lin", "Cypress, CA", 10/11/1979, '', "Black", "Brown", 72, 210, "Speed");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(010, "Steven Spielberg", "Cincinnati, OH", 12/18/1946, "Kate Capshaw", "White", "Hazel", 71,  170, "Intrigue");

insert into People(PID, Name, Address, DoB, Spouse, HairColor, EyeColor, InchesTall, WeightLbs, FavColor)
values(011, "Steve Carr", "Brooklyn, NY", 08/25/1962, '', "Gray", "Brown", 75, 190, "Yes");


insert into Actors(PID, ScreenActorsGuildDate)
values(007, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(001, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(002, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(003, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(004, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(005, '');

insert into Actors(PID, ScreenActorsGuildDate)
values(006, '');

insert into Directors(PID, FilmSchool, DirectorsGuildDate, FavLensMaker)
values(008, "School of Hard Knocks", '', "Ray-Ban");

insert into Directors(PID, FilmSchool, DirectorsGuildDate, FavLensMaker)
values(009, "School of the Dead", '', "Coach");

insert into Directors(PID, FilmSchool, DirectorsGuildDate, FavLensMaker)
values(010, "Summer School", '', "Sferoflex");

insert into Directors(PID, FilmSchool, DirectorsGuildDate, FavLensMaker)
values(011, "Aperture New Schooling Initiative", '', "Lens of Truth");


insert into Movies(MID, Title, ReleaseYear, MPAANum, DomesticBOSales, ForeignBOSales, DiskSales)
values(01, "Paul Blart: Mall Cop", 2009, 100, 146000000, 183300000, 99999999);

insert into Movies(MID, Title, ReleaseYear, MPAANum, DomesticBOSales, ForeignBOSales, DiskSales)
values(02, "Fast & Furious 6", 2011, 6, 6, 6, 6);

insert into Movies(MID, Title, ReleaseYear, MPAANum, DomesticBOSales, ForeignBOSales, DiskSales)
values(03, "The Untouchables", 1987, 79, 76300000, 106200000, 5000);

insert into Movies(MID, Title, ReleaseYear, MPAANum, DomesticBOSales, ForeignBOSales, DiskSales)
values(04, "Indiana Jones and the Last Crusade", 1989, 83, 197000000, 474180000, 48);

insert into DirectorsOfMovies(MID, PID)
values(01, 011);

insert into DirectorsOfMovies(MID, PID)
values(02, 009);

insert into DirectorsOfMovies(MID, PID)
values(03, 008);

insert into DirectorsOfMovies(MID, PID)
values(04, 010);


insert into ActorsInMovies(MID, PID, Role)
values(01, 006, "Paul Blart");

insert into ActorsInMovies(MID, PID, Role)
values(02, 001, "Hobbs");

insert into ActorsInMovies(MID, PID, Role)
values(03, 007, "Jim Malone");

insert into ActorsInMovies(MID, PID, Role)
values(03, 003, "Eliot Ness");

insert into ActorsInMovies(MID, PID, Role)
values(03, 002, "Al Capone");

insert into ActorsInMovies(MID, PID, Role)
values(04, 007, "Henry Jones");

insert into ActorsInMovies(MID, PID, Role)
values(04, 004, "Indiana Jones");

insert into ActorsInMovies(MID, PID, Role)
values(04, 005, "Walter Donovan");

