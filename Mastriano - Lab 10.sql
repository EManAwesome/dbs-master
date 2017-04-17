create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);

insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);



create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);



create function PreReqsFor(int, refcursor)
returns refcursor as $$
declare
	courseNumWanted int := $1;
	resSet refcursor := $2;
begin
	open resSet for
		select preReqNum
		from Prerequisites
		where courseNum = courseNumWanted;
	return resSet;
end;
$$
language plpgsql;



create function IsPreReqFor(int, refcursor)
returns refcursor as $$
declare
	preReqNumWanted int := $1;
	resSet refcursor := $2;
begin
	open resSet for
		select courseNUm
		from Prerequisites
		where preReqNum = preReqNumWanted;
	return resSet;
end;
$$
language plpgsql;