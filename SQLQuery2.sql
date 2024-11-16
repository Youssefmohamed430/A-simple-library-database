create database [Library]
	on primary(
		name = [Library],
		filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library.mdf',
		size = 50MB,
		maxsize = 100MB,
		filegrowth = 20%
	)
	log on
	(
		name = Library_log,
		filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library_log.lldf',
		size = 50MB,
		maxsize = 100MB,
		filegrowth = 20%
	)

Create table [Member]
(
	MemberId int primary key,
	[name] nvarchar(50),
	Gender char,
	phone nvarchar(50),
)

create table section 
(
	ID int primary key,
	[name] nvarchar(50)
)

create table Book
(
	BookId int primary key,
	ISBN  int unique,
	Title nvarchar(50),
	authors nvarchar(50),
	[Type] nvarchar(50),
	MemberId int,
	SectionId int 
	foreign key (MemberId) references [Member](MemberId) ,
	foreign key (SectionId) references section(ID) 
)

create table Librarian
(
	LibId int primary key,
	[name] nvarchar(50),
	SectionId int,
	foreign key (SectionId) references section(ID) 
)

