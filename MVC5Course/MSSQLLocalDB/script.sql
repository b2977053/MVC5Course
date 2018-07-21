USE [master]
GO
/****** Object:  Database [Fabrics]    Script Date: 2018/7/21 下午 11:43:55 ******/
CREATE DATABASE [Fabrics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fabrics', FILENAME = N'C:\Users\CST-THINKPAD\Downloads\Fabrics.mdf_SQL2014\Fabrics.mdf' , SIZE = 23552KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fabrics_log', FILENAME = N'C:\Users\CST-THINKPAD\Downloads\Fabrics.mdf_SQL2014\Fabrics_log.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fabrics] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fabrics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fabrics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fabrics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fabrics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fabrics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fabrics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fabrics] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fabrics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fabrics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fabrics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fabrics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fabrics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fabrics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fabrics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fabrics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fabrics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fabrics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fabrics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fabrics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fabrics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fabrics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fabrics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fabrics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fabrics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fabrics] SET  MULTI_USER 
GO
ALTER DATABASE [Fabrics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fabrics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fabrics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fabrics] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Fabrics] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Fabrics]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[MiddleName] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NULL,
	[Gender] [char](1) NULL,
	[DateOfBirth] [datetime] NULL,
	[CreditRating] [float] NULL,
	[XCode] [char](7) NULL,
	[OccupationId] [int] NULL,
	[TelephoneNumber] [nvarchar](20) NULL,
	[Street1] [nvarchar](100) NULL,
	[Street2] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](15) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Notes] [nvarchar](max) NULL,
	[IdNumber] [char](10) NULL,
 CONSTRAINT [pk_ClientId] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Occupation](
	[OccupationId] [int] IDENTITY(1,1) NOT NULL,
	[OccupationName] [varchar](60) NULL,
 CONSTRAINT [pk_OccupationId] PRIMARY KEY CLUSTERED 
(
	[OccupationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[OrderDate] [datetime] NULL,
	[OrderTotal] [numeric](18, 2) NULL,
	[OrderStatus] [char](1) NULL,
 CONSTRAINT [pkOrderId] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderId] [int] NOT NULL,
	[LineNumber] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [numeric](18, 3) NOT NULL,
	[LineTotal] [numeric](18, 2) NOT NULL,
 CONSTRAINT [pk_OrderId_LineNumber] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[LineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](80) NULL,
	[Price] [smallmoney] NULL,
	[Active] [bit] NULL,
	[Stock] [numeric](18, 3) NULL,
 CONSTRAINT [pk_ProductId] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Client_city]    Script Date: 2018/7/21 下午 11:43:55 ******/
CREATE NONCLUSTERED INDEX [Client_city] ON [dbo].[Client]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Client_dateofbirth]    Script Date: 2018/7/21 下午 11:43:55 ******/
CREATE NONCLUSTERED INDEX [Client_dateofbirth] ON [dbo].[Client]
(
	[DateOfBirth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Client_firstName]    Script Date: 2018/7/21 下午 11:43:55 ******/
CREATE NONCLUSTERED INDEX [Client_firstName] ON [dbo].[Client]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Client_lastName]    Script Date: 2018/7/21 下午 11:43:55 ******/
CREATE NONCLUSTERED INDEX [Client_lastName] ON [dbo].[Client]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Occupation] FOREIGN KEY([OccupationId])
REFERENCES [dbo].[Occupation] ([OccupationId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Occupation]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_Order_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_Order_ClientId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [fk_OrderLine_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [fk_OrderLine_OrderId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [fk_OrderLine_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [fk_OrderLine_ProductId]
GO
/****** Object:  StoredProcedure [dbo].[usp_Fabrics]    Script Date: 2018/7/21 下午 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Fabrics]
    (@CreateClients INT = 2500,
    @CreateOrders INT = 5000)
AS
BEGIN
    SET NOCOUNT ON
    SET STATISTICS IO OFF
    
    DECLARE @TimeStarted AS DATETIME = GetDate()
    DECLARE @BulkInsertSize AS INT = 1000
    DECLARE @Randomizer AS INT = CHECKSUM(30052007) -- Using all the same seed, We try to get the same database for everybody 
        
    IF OBJECT_ID('dbo.OrderLine') IS NOT NULL
        DROP TABLE OrderLine
    CREATE TABLE OrderLine(OrderId int NOT NULL, LineNumber int, ProductId int NOT NULL, Qty numeric(18, 3) NOT NULL, LineTotal numeric(18, 2) NOT NULL, CONSTRAINT pk_OrderId_LineNumber PRIMARY KEY CLUSTERED (OrderId ASC, LineNumber ASC))
    IF OBJECT_ID('dbo.Order') IS NOT NULL
        DROP TABLE [Order]
    IF OBJECT_ID('dbo.Product') IS NOT NULL
        DROP TABLE dbo.Product
    IF  OBJECT_ID('dbo.Client') IS NOT NULL
        DROP TABLE Client
    CREATE TABLE Client (ClientId INTEGER IDENTITY (1, 1) NOT NULL CONSTRAINT pk_ClientId PRIMARY KEY, FirstName varchar(40), MiddleName varchar(40), LastName varchar(40), Gender char(1), DateOfBirth datetime,
        CreditRating FLOAT, XCode CHAR(7), OccupationId INTEGER, TelephoneNumber VARCHAR(20), Street1 VARCHAR(100), Street2 VARCHAR(100), City varchar(100), ZipCode VARCHAR(15), Longitude FLOAT, Latitude FLOAT, Notes varchar(max))
    IF OBJECT_ID('dbo.Occupation') IS NOT NULL
        DROP TABLE Occupation
    CREATE TABLE Occupation (OccupationId INTEGER IDENTITY (1, 1) NOT NULL CONSTRAINT pk_OccupationId PRIMARY KEY, OccupationName varchar(60))
    
    DECLARE @tblCity TABLE (CityId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40),StateCode CHAR(2), Longitude FLOAT, Latitude FLOAT, Popul INTEGER, Surface FLOAT)
    DECLARE @tblMaleFirstName TABLE (MaleFirstNameId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblFemaleFirstName TABLE (FemaleFirstNameId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblLastName TABLE (LastNameId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblTempClient TABLE (FirstName varchar(40), MiddleName varchar(40), LastName varchar(40), Gender char(1), DateOfBirth datetime,
        CreditRating FLOAT, XCode CHAR(7), OccupationId INTEGER, TelephoneNumber VARCHAR(20), Street1 VARCHAR(100), Street2 VARCHAR(100), City varchar(100), ZipCode VARCHAR(15), Longitude FLOAT, Latitude FLOAT, Notes varchar(max))
    
    DECLARE @tblStreetNames TABLE (StreetNamesId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblStreetTypes TABLE (StreetTypesId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblStreetZones TABLE (StreetZoneId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
      
    -- rough copy from http://www.census.gov/genealogy/Names/
    INSERT INTO @tblMaleFirstName(Name) VALUES('James'),('John'),('Robert'),('Michael'),('William'),('David'),('Richard'),('Charles'),('Joseph'),('Thomas'),('Christopher'),('Daniel'),('Paul'),('Mark'),('Donald'),('George'),('Kenneth'),('Steven'),('Edward'),('Brian'),('Ronald'),('Anthony'),('Kevin'),('Jason'),('Matthew'),('Gary'),('Timothy'),('Jose'),('Larry'),('Jeffrey'),('Frank'),('Scott'),('Eric'),('Stephen'),('Andrew'),('Raymond'),('Gregory'),('Joshua'),('Jerry'),('Dennis'),('Walter'),('Patrick'),('Peter'),('Harold'),('Douglas'),('Henry'),('Carl'),('Arthur'),('Ryan'),('Roger'),('Joe'),('Juan'),('Jack'),('Albert'),('Jonathan'),('Justin'),('Terry'),('Gerald'),('Keith'),('Samuel'),('Willie'),('Ralph'),('Lawrence'),('Nicholas'),('Roy'),('Benjamin'),('Bruce'),('Brandon'),('Adam'),('Harry'),('Fred'),('Wayne'),('Billy'),('Steve'),('Louis'),('Jeremy'),('Aaron'),('Randy'),('Howard'),('Eugene'),('Carlos'),('Russell'),('Bobby'),('Victor'),('Martin'),('Ernest'),('Phillip'),('Todd'),('Jesse'),('Craig'),('Alan'),('Shawn'),('Clarence'),('Sean'),('Philip'),('Chris'),('Johnny'),('Earl'),('Jimmy'),('Antonio'),('Danny'),('Bryan'),('Tony'),('Luis'),('Mike'),('Stanley'),('Leonard'),('Nathan'),('Dale'),('Manuel'),('Rodney'),('Curtis'),('Norman'),('Allen'),('Marvin'),('Vincent'),('Glenn'),('Jeffery'),('Travis'),('Jeff'),('Chad'),('Jacob'),('Lee'),('Melvin'),('Alfred'),('Kyle'),('Francis'),('Bradley'),('Jesus'),('Herbert'),('Frederick'),('Ray'),('Joel'),('Edwin'),('Don'),('Eddie'),('Ricky'),('Troy'),('Randall'),('Barry'),('Alexander'),('Bernard'),('Mario'),('Leroy'),('Francisco'),('Marcus'),('Micheal'),('Theodore'),('Clifford'),('Miguel'),('Oscar'),('Jay'),('Jim'),('Tom'),('Calvin'),('Alex'),('Jon'),('Ronnie'),('Bill'),('Lloyd'),('Tommy'),('Leon'),('Derek'),('Warren'),('Darrell'),('Jerome'),('Floyd'),('Leo'),('Alvin'),('Tim'),('Wesley'),('Gordon'),('Dean'),('Greg'),('Jorge'),('Dustin'),('Pedro'),('Derrick'),('Dan'),('Lewis'),('Zachary'),('Corey'),('Herman'),('Maurice'),('Vernon'),('Roberto'),('Clyde'),('Glen'),('Hector'),('Shane'),('Ricardo'),('Sam'),('Rick'),('Lester'),('Brent'),('Ramon'),('Charlie'),('Tyler'),('Gilbert'),('Gene'),('Marc'),('Reginald'),('Ruben'),('Brett'),('Angel'),('Nathaniel'),('Rafael'),('Leslie'),('Edgar'),('Milton'),('Raul'),('Ben'),('Chester'),('Cecil'),('Duane'),('Franklin'),('Andre'),('Elmer'),('Brad'),('Gabriel'),('Ron'),('Mitchell'),('Roland'),('Arnold'),('Harvey'),('Jared'),('Adrian'),('Karl'),('Cory'),('Claude'),('Erik'),('Darryl'),('Jamie'),('Neil'),('Jessie'),('Christian'),('Javier'),('Fernando'),('Clinton'),('Ted'),('Mathew'),('Tyrone'),('Darren'),('Lonnie'),('Lance'),('Cody'),('Julio'),('Kelly'),('Kurt'),('Allan'),('Nelson'),('Guy'),('Clayton'),('Hugh'),('Max'),('Dwayne'),('Dwight'),('Armando'),('Felix'),('Jimmie'),('Everett'),('Jordan'),('Ian'),('Wallace'),('Ken'),('Bob'),('Jaime'),('Casey'),('Alfredo'),('Alberto'),('Dave'),('Ivan'),('Johnnie'),('Sidney'),('Byron'),('Julian'),('Isaac'),('Morris'),('Clifton'),('Willard'),('Daryl'),('Ross'),('Virgil'),('Andy'),('Marshall'),('Salvador'),('Perry'),('Kirk'),('Sergio'),('Marion'),('Tracy'),('Seth'),('Kent'),('Terrance'),('Rene'),('Eduardo'),('Terrence'),('Enrique'),('Freddie'),('Wade'),('Austin'),('Stuart'),('Fredrick'),('Arturo'),('Alejandro'),('Jackie'),('Joey'),('Nick'),('Luther'),('Wendell'),('Jeremiah'),('Evan'),('Julius'),('Dana'),('Donnie'),('Otis'),('Shannon'),('Trevor'),('Oliver'),('Luke'),('Homer'),('Gerard'),('Doug'),('Kenny'),('Hubert'),('Angelo'),('Shaun'),('Lyle'),('Matt'),('Lynn'),('Alfonso'),('Orlando'),('Rex'),('Carlton'),('Ernesto'),('Cameron'),('Neal'),('Pablo'),('Lorenzo'),('Omar'),('Wilbur'),('Blake'),('Grant'),('Horace'),('Roderick'),('Kerry'),('Abraham'),('Willis'),('Rickey'),('Jean'),('Ira'),('Andres'),('Cesar'),('Johnathan'),('Malcolm'),('Rudolph'),('Damon'),('Kelvin'),('Rudy'),('Preston'),('Alton'),('Archie'),('Marco'),('Wm'),('Pete'),('Randolph'),('Garry'),('Geoffrey'),('Jonathon'),('Felipe'),('Bennie'),('Gerardo'),('Ed'),('Dominic'),('Robin'),('Loren'),('Delbert'),('Colin'),('Guillermo'),('Earnest'),('Lucas'),('Benny'),('Noel'),('Spencer'),('Rodolfo'),('Myron'),('Edmund'),('Garrett'),('Salvatore'),('Cedric'),('Lowell'),('Gregg'),('Sherman'),('Wilson'),('Devin'),('Sylvester'),('Kim'),('Roosevelt'),('Israel'),('Jermaine'),('Forrest'),('Wilbert'),('Leland'),('Simon'),('Guadalupe'),('Clark'),('Irving'),('Carroll'),('Bryant'),('Owen'),('Rufus'),('Woodrow'),('Sammy'),('Kristopher'),('Mack'),('Levi'),('Marcos'),('Gustavo'),('Jake'),('Lionel'),('Marty'),('Taylor'),('Ellis'),('Dallas'),('Gilberto'),('Clint'),('Nicolas'),('Laurence'),('Ismael'),('Orville'),('Drew'),('Jody'),('Ervin'),('Dewey'),('Al'),('Wilfred'),('Josh'),('Hugo'),('Ignacio'),('Caleb'),('Tomas'),('Sheldon'),('Erick'),('Frankie'),('Stewart'),('Doyle'),('Darrel'),('Rogelio'),('Terence'),('Santiago'),('Alonzo'),('Elias'),('Bert'),('Elbert'),('Ramiro'),('Conrad'),('Pat'),('Noah'),('Grady'),('Phil'),('Cornelius'),('Lamar'),('Rolando'),('Clay'),('Percy'),('Dexter'),('Bradford'),('Merle'),('Darin'),('Amos'),('Terrell'),('Moses'),('Irvin'),('Saul'),('Roman'),('Darnell'),('Randal'),('Tommie'),('Timmy'),('Darrin'),('Winston'),('Brendan'),('Toby'),('Van'),('Abel'),('Dominick'),('Boyd'),('Courtney'),('Jan'),('Emilio'),('Elijah'),('Cary'),('Domingo'),('Santos'),('Aubrey'),('Emmett'),('Marlon'),('Emanuel'),('Jerald'),('Edmond'),('Emil'),('Dewayne'),('Will'),('Otto'),('Teddy'),('Reynaldo'),('Bret'),('Morgan'),('Jess'),('Trent'),('Humberto'),('Emmanuel'),('Stephan'),('Louie'),('Vicente'),('Lamont'),('Stacy'),('Garland'),('Miles'),('Micah'),('Efrain'),('Billie'),('Logan'),('Heath'),('Rodger'),('Harley'),('Demetrius'),('Ethan'),('Eldon'),('Rocky'),('Pierre'),('Junior'),('Freddy'),('Eli'),('Bryce'),('Antoine'),('Robbie'),('Kendall'),('Royce'),('Sterling'),('Mickey'),('Chase'),('Grover'),('Elton'),('Cleveland'),('Dylan'),('Chuck'),('Damian'),('Reuben'),('Stan'),('August'),('Leonardo'),('Jasper'),('Russel'),('Erwin'),('Benito'),('Hans'),('Monte'),('Blaine'),('Ernie'),('Curt'),('Quentin'),('Agustin'),('Murray'),('Jamal'),('Devon'),('Adolfo'),('Harrison'),('Tyson'),('Burton'),('Brady'),('Elliott'),('Wilfredo'),('Bart'),('Jarrod'),('Vance'),('Denis'),('Damien'),('Joaquin'),('Harlan'),('Desmond'),('Elliot'),('Darwin'),('Ashley'),('Gregorio'),('Buddy'),('Xavier'),('Kermit'),('Roscoe'),('Esteban'),('Anton'),('Solomon'),('Scotty'),('Norbert'),('Elvin'),('Williams'),('Nolan'),('Carey'),('Rod'),('Quinton'),('Hal'),('Brain'),('Rob'),('Elwood'),('Kendrick'),('Darius'),('Moises'),('Son'),('Marlin'),('Fidel'),('Thaddeus'),('Cliff'),('Marcel'),('Ali'),('Jackson'),('Raphael'),('Bryon'),('Armand'),('Alvaro'),('Jeffry'),('Dane'),('Joesph'),('Thurman'),('Ned'),('Sammie'),('Rusty'),('Michel'),('Monty'),('Rory'),('Fabian'),('Reggie'),('Mason'),('Graham'),('Kris'),('Isaiah'),('Vaughn'),('Gus'),('Avery'),('Loyd'),('Diego'),('Alexis'),('Adolph'),('Norris'),('Millard'),('Rocco'),('Gonzalo'),('Derick'),('Rodrigo'),('Gerry'),('Stacey'),('Carmen'),('Wiley'),('Rigoberto'),('Alphonso'),('Ty'),('Shelby'),('Rickie'),('Noe'),('Vern'),('Bobbie'),('Reed'),('Jefferson'),('Elvis'),('Bernardo'),('Mauricio'),('Hiram'),('Donovan'),('Basil'),('Riley'),('Ollie'),('Nickolas'),('Maynard'),('Scot'),('Vince'),('Quincy'),('Eddy'),('Sebastian'),('Federico'),('Ulysses'),('Heriberto'),('Donnell'),('Cole'),('Denny'),('Davis'),('Gavin'),('Emery'),('Ward'),('Romeo'),('Jayson'),('Dion'),('Dante'),('Clement'),('Coy'),('Odell'),('Maxwell'),('Jarvis'),('Bruno'),('Issac'),('Pascal') 
    INSERT INTO @tblFemaleFirstName(Name) VALUES('Mary'),('Patricia'),('Linda'),('Barbara'),('Elizabeth'),('Jennifer'),('Maria'),('Susan'),('Margaret'),('Dorothy'),('Lisa'),('Nancy'),('Karen'),('Betty'),('Helen'),('Sandra'),('Donna'),('Carol'),('Ruth'),('Sharon'),('Michelle'),('Laura'),('Sarah'),('Kimberly'),('Deborah'),('Jessica'),('Shirley'),('Cynthia'),('Angela'),('Melissa'),('Brenda'),('Amy'),('Anna'),('Rebecca'),('Virginia'),('Kathleen'),('Pamela'),('Martha'),('Debra'),('Amanda'),('Stephanie'),('Carolyn'),('Christine'),('Marie'),('Janet'),('Catherine'),('Frances'),('Ann'),('Joyce'),('Diane'),('Alice'),('Julie'),('Heather'),('Teresa'),('Doris'),('Gloria'),('Evelyn'),('Jean'),('Cheryl'),('Mildred'),('Katherine'),('Joan'),('Ashley'),('Judith'),('Rose'),('Janice'),('Kelly'),('Nicole'),('Judy'),('Christina'),('Kathy'),('Theresa'),('Beverly'),('Denise'),('Tammy'),('Irene'),('Jane'),('Lori'),('Rachel'),('Marilyn'),('Andrea'),('Kathryn'),('Louise'),('Sara'),('Anne'),('Jacqueline'),('Wanda'),('Bonnie'),('Julia'),('Ruby'),('Lois'),('Tina'),('Phyllis'),('Norma'),('Paula'),('Diana'),('Annie'),('Lillian'),('Emily'),('Robin'),('Peggy'),('Crystal'),('Gladys'),('Rita'),('Dawn'),('Connie'),('Florence'),('Tracy'),('Edna'),('Tiffany'),('Carmen'),('Rosa'),('Cindy'),('Grace'),('Wendy'),('Victoria'),('Edith'),('Kim'),('Sherry'),('Sylvia'),('Josephine'),('Thelma'),('Shannon'),('Sheila'),('Ethel'),('Ellen'),('Elaine'),('Marjorie'),('Carrie'),('Charlotte'),('Monica'),('Esther'),('Pauline'),('Emma'),('Juanita'),('Anita'),('Rhonda'),('Hazel'),('Amber'),('Eva'),('Debbie'),('April'),('Leslie'),('Clara'),('Lucille'),('Jamie'),('Joanne'),('Eleanor'),('Valerie'),('Danielle'),('Megan'),('Alicia'),('Suzanne'),('Michele'),('Gail'),('Bertha'),('Darlene'),('Veronica'),('Jill'),('Erin'),('Geraldine'),('Lauren'),('Cathy'),('Joann'),('Lorraine'),('Lynn'),('Sally'),('Regina'),('Erica'),('Beatrice'),('Dolores'),('Bernice'),('Audrey'),('Yvonne'),('Annette'),('June'),('Samantha'),('Marion'),('Dana'),('Stacy'),('Ana'),('Renee'),('Ida'),('Vivian'),('Roberta'),('Holly'),('Brittany'),('Melanie'),('Loretta'),('Yolanda'),('Jeanette'),('Laurie'),('Katie'),('Kristen'),('Vanessa'),('Alma'),('Sue'),('Elsie'),('Beth'),('Jeanne'),('Vicki'),('Carla'),('Tara'),('Rosemary'),('Eileen'),('Terri'),('Gertrude'),('Lucy'),('Tonya'),('Ella'),('Stacey'),('Wilma'),('Gina'),('Kristin'),('Jessie'),('Natalie'),('Agnes'),('Vera'),('Willie'),('Charlene'),('Bessie'),('Delores'),('Melinda'),('Pearl'),('Arlene'),('Maureen'),('Colleen'),('Allison'),('Tamara'),('Joy'),('Georgia'),('Constance'),('Lillie'),('Claudia'),('Jackie'),('Marcia'),('Tanya'),('Nellie'),('Minnie'),('Marlene'),('Heidi'),('Glenda'),('Lydia'),('Viola'),('Courtney'),('Marian'),('Stella'),('Caroline'),('Dora'),('Jo'),('Vickie'),('Mattie'),('Terry'),('Maxine'),('Irma'),('Mabel'),('Marsha'),('Myrtle'),('Lena'),('Christy'),('Deanna'),('Patsy'),('Hilda'),('Gwendolyn'),('Jennie'),('Nora'),('Margie'),('Nina'),('Cassandra'),('Leah'),('Penny'),('Kay'),('Priscilla'),('Naomi'),('Carole'),('Brandy'),('Olga'),('Billie'),('Dianne'),('Tracey'),('Leona'),('Jenny'),('Felicia'),('Sonia'),('Miriam'),('Velma'),('Becky'),('Bobbie'),('Violet'),('Kristina'),('Toni'),('Misty'),('Mae'),('Shelly'),('Daisy'),('Ramona'),('Sherri'),('Erika'),('Katrina'),('Claire'),('Lindsey'),('Lindsay'),('Geneva'),('Guadalupe'),('Belinda'),('Margarita'),('Sheryl'),('Cora'),('Faye'),('Ada'),('Natasha'),('Sabrina'),('Isabel'),('Marguerite'),('Hattie'),('Harriet'),('Molly'),('Cecilia'),('Kristi'),('Brandi'),('Blanche'),('Sandy'),('Rosie'),('Joanna'),('Iris'),('Eunice'),('Angie'),('Inez'),('Lynda'),('Madeline'),('Amelia'),('Alberta'),('Genevieve'),('Monique'),('Jodi'),('Janie'),('Maggie'),('Kayla'),('Sonya'),('Jan'),('Lee'),('Kristine'),('Candace'),('Fannie'),('Maryann'),('Opal'),('Alison'),('Yvette'),('Melody'),('Luz'),('Susie'),('Olivia'),('Flora'),('Shelley'),('Kristy'),('Mamie'),('Lula'),('Lola'),('Verna'),('Beulah'),('Antoinette'),('Candice'),('Juana'),('Jeannette'),('Pam'),('Kelli'),('Hannah'),('Whitney'),('Bridget'),('Karla'),('Celia'),('Latoya'),('Patty'),('Shelia'),('Gayle'),('Della'),('Vicky'),('Lynne'),('Sheri'),('Marianne'),('Kara'),('Jacquelyn'),('Erma'),('Blanca'),('Myra'),('Leticia'),('Pat'),('Krista'),('Roxanne'),('Angelica'),('Johnnie'),('Robyn'),('Francis'),('Adrienne'),('Rosalie'),('Alexandra'),('Brooke'),('Bethany'),('Sadie'),('Bernadette'),('Traci'),('Jody'),('Kendra'),('Jasmine'),('Nichole'),('Rachael'),('Chelsea'),('Mable'),('Ernestine'),('Muriel'),('Marcella'),('Elena'),('Krystal'),('Angelina'),('Nadine'),('Kari'),('Estelle'),('Dianna'),('Paulette'),('Lora'),('Mona'),('Doreen'),('Rosemarie'),('Angel'),('Desiree'),('Antonia'),('Hope'),('Ginger'),('Janis'),('Betsy'),('Christie'),('Freda'),('Mercedes'),('Meredith'),('Lynette'),('Teri'),('Cristina'),('Eula'),('Leigh'),('Meghan'),('Sophia'),('Eloise'),('Rochelle'),('Gretchen'),('Cecelia'),('Raquel'),('Henrietta'),('Alyssa'),('Jana'),('Kelley'),('Gwen'),('Kerry'),('Jenna'),('Tricia'),('Laverne'),('Olive'),('Alexis'),('Tasha'),('Silvia'),('Elvira'),('Casey'),('Delia'),('Sophie'),('Kate'),('Patti'),('Lorena'),('Kellie'),('Sonja'),('Lila'),('Lana'),('Darla'),('May'),('Mindy'),('Essie'),('Mandy'),('Lorene'),('Elsa'),('Josefina'),('Jeannie'),('Miranda'),('Dixie'),('Lucia'),('Marta'),('Faith'),('Lela'),('Johanna'),('Shari'),('Camille'),('Tami'),('Shawna'),('Elisa'),('Ebony'),('Melba'),('Ora'),('Nettie'),('Tabitha'),('Ollie'),('Jaime'),('Winifred'),('Kristie'),('Marina'),('Alisha'),('Aimee'),('Rena'),('Myrna'),('Marla'),('Tammie'),('Latasha'),('Bonita'),('Patrice'),('Ronda'),('Sherrie'),('Addie'),('Francine'),('Deloris'),('Stacie'),('Adriana'),('Cheri'),('Shelby'),('Abigail'),('Celeste'),('Jewel'),('Cara'),('Adele'),('Rebekah'),('Lucinda'),('Dorthy'),('Chris'),('Effie'),('Trina'),('Reba'),('Shawn'),('Sallie'),('Aurora'),('Lenora'),('Etta'),('Lottie'),('Kerri'),('Trisha'),('Nikki'),('Estella'),('Francisca'),('Josie'),('Tracie'),('Marissa'),('Karin'),('Brittney'),('Janelle'),('Lourdes'),('Laurel'),('Helene'),('Fern'),('Elva'),('Corinne'),('Kelsey'),('Ina'),('Bettie'),('Elisabeth'),('Aida'),('Caitlin'),('Ingrid'),('Iva'),('Eugenia'),('Christa'),('Goldie'),('Cassie'),('Maude'),('Jenifer'),('Therese'),('Frankie'),('Dena'),('Lorna'),('Janette'),('Latonya'),('Candy'),('Morgan'),('Consuelo'),('Tamika'),('Rosetta'),('Debora'),('Cherie'),('Polly'),('Dina'),('Jewell'),('Fay'),('Jillian'),('Dorothea'),('Nell'),('Trudy'),('Esperanza'),('Patrica'),('Kimberley'),('Shanna'),('Helena'),('Carolina'),('Cleo'),('Stefanie'),('Rosario'),('Ola'),('Janine'),('Mollie'),('Lupe'),('Alisa'),('Lou'),('Maribel'),('Susanne'),('Bette'),('Susana'),('Elise'),('Cecile'),('Isabelle'),('Lesley'),('Jocelyn'),('Paige'),('Joni'),('Rachelle'),('Leola'),('Daphne'),('Alta'),('Ester'),('Petra'),('Graciela'),('Imogene'),('Jolene'),('Keisha'),('Lacey'),('Glenna'),('Gabriela'),('Keri'),('Ursula'),('Lizzie'),('Kirsten'),('Shana'),('Adeline'),('Mayra'),('Jayne'),('Jaclyn'),('Gracie'),('Sondra'),('Carmela'),('Marisa'),('Rosalind'),('Charity'),('Tonia'),('Beatriz'),('Marisol'),('Clarice'),('Jeanine'),('Sheena'),('Angeline'),('Frieda'),('Lily'),('Robbie'),('Shauna'),('Millie'),('Claudette'),('Cathleen'),('Angelia'),('Gabrielle'),('Autumn'),('Katharine'),('Summer'),('Jodie'),('Staci'),('Lea'),('Christi'),('Jimmie'),('Justine'),('Elma'),('Luella'),('Margret'),('Dominique'),('Socorro'),('Rene'),('Martina'),('Margo'),('Mavis'),('Callie'),('Bobbi'),('Maritza'),('Lucile'),('Leanne'),('Jeannine'),('Deana'),('Aileen'),('Lorie'),('Ladonna'),('Willa'),('Manuela'),('Gale'),('Selma'),('Dolly'),('Sybil'),('Abby'),('Lara'),('Dale'),('Ivy'),('Dee'),('Winnie'),('Leia')
    INSERT INTO @tblLastName(Name) VALUES('Smith'),('Johnson'),('Williams'),('Jones'),('Brown'),('Davis'),('Miller'),('Wilson'),('Moore'),('Taylor'),('Anderson'),('Thomas'),('Jackson'),('White'),('Harris'),('Martin'),('Thompson'),('Garcia'),('Martinez'),('Robinson'),('Clark'),('Rodriguez'),('Lewis'),('Lee'),('Walker'),('Hall'),('Allen'),('Young'),('Hernandez'),('King'),('Wright'),('Lopez'),('Hill'),('Scott'),('Green'),('Adams'),('Baker'),('Gonzalez'),('Nelson'),('Carter'),('Mitchell'),('Perez'),('Roberts'),('Turner'),('Phillips'),('Campbell'),('Parker'),('Evans'),('Edwards'),('Collins'),('Stewart'),('Sanchez'),('Morris'),('Rogers'),('Reed'),('Cook'),('Morgan'),('Bell'),('Murphy'),('Bailey'),('Rivera'),('Cooper'),('Richardson'),('Cox'),('Howard'),('Ward'),('Torres'),('Peterson'),('Gray'),('Ramirez'),('James'),('Watson'),('Brooks'),('Kelly'),('Sanders'),('Price'),('Bennett'),('Wood'),('Barnes'),('Ross'),('Henderson'),('Coleman'),('Jenkins'),('Perry'),('Powell'),('Long'),('Patterson'),('Hughes'),('Flores'),('Washington'),('Butler'),('Simmons'),('Foster'),('Gonzales'),('Bryant'),('Alexander'),('Russell'),('Griffin'),('Diaz'),('Hayes'),('Myers'),('Ford'),('Hamilton'),('Graham'),('Sullivan'),('Wallace'),('Woods'),('Cole'),('West'),('Jordan'),('Owens'),('Reynolds'),('Fisher'),('Ellis'),('Harrison'),('Gibson'),('Mcdonald'),('Cruz'),('Marshall'),('Ortiz'),('Gomez'),('Murray'),('Freeman'),('Wells'),('Webb'),('Simpson'),('Stevens'),('Tucker'),('Porter'),('Hunter'),('Hicks'),('Crawford'),('Henry'),('Boyd'),('Mason'),('Morales'),('Kennedy'),('Warren'),('Dixon'),('Ramos'),('Reyes'),('Burns'),('Gordon'),('Shaw'),('Holmes'),('Rice'),('Robertson'),('Hunt'),('Black'),('Daniels'),('Palmer'),('Mills'),('Nichols'),('Grant'),('Knight'),('Ferguson'),('Rose'),('Stone'),('Hawkins'),('Dunn'),('Perkins'),('Hudson'),('Spencer'),('Gardner'),('Stephens'),('Payne'),('Pierce'),('Berry'),('Matthews'),('Arnold'),('Wagner'),('Willis'),('Ray'),('Watkins'),('Olson'),('Carroll'),('Duncan'),('Snyder'),('Hart'),('Cunningham'),('Bradley'),('Lane'),('Andrews'),('Ruiz'),('Harper'),('Fox'),('Riley'),('Armstrong'),('Carpenter'),('Weaver'),('Greene'),('Lawrence'),('Elliott'),('Chavez'),('Sims'),('Austin'),('Peters'),('Kelley'),('Franklin'),('Lawson'),('Fields'),('Gutierrez'),('Ryan'),('Schmidt'),('Carr'),('Vasquez'),('Castillo'),('Wheeler'),('Chapman'),('Oliver'),('Montgomery'),('Richards'),('Williamson'),('Johnston'),('Banks'),('Meyer'),('Bishop'),('Mccoy'),('Howell'),('Alvarez'),('Morrison'),('Hansen'),('Fernandez'),('Garza'),('Harvey'),('Little'),('Burton'),('Stanley'),('Nguyen'),('George'),('Jacobs'),('Reid'),('Kim'),('Fuller'),('Lynch'),('Dean'),('Gilbert'),('Garrett'),('Romero'),('Welch'),('Larson'),('Frazier'),('Burke'),('Hanson'),('Day'),('Mendoza'),('Moreno'),('Bowman'),('Medina'),('Fowler'),('Brewer'),('Hoffman'),('Carlson'),('Silva'),('Pearson'),('Holland'),('Douglas'),('Fleming'),('Jensen'),('Vargas'),('Byrd'),('Davidson'),('Hopkins'),('May'),('Terry'),('Herrera'),('Wade'),('Soto'),('Walters'),('Curtis'),('Neal'),('Caldwell'),('Lowe'),('Jennings'),('Barnett'),('Graves'),('Jimenez'),('Horton'),('Shelton'),('Barrett'),('Obrien'),('Castro'),('Sutton'),('Gregory'),('Mckinney'),('Lucas'),('Miles'),('Craig'),('Rodriquez'),('Chambers'),('Holt'),('Lambert'),('Fletcher'),('Watts'),('Bates'),('Hale'),('Rhodes'),('Pena'),('Beck'),('Newman'),('Haynes'),('Mcdaniel'),('Mendez'),('Bush'),('Vaughn'),('Parks'),('Dawson'),('Santiago'),('Norris'),('Hardy'),('Love'),('Steele'),('Curry'),('Powers'),('Schultz'),('Barker'),('Guzman'),('Page'),('Munoz'),('Ball'),('Keller'),('Chandler'),('Weber'),('Leonard'),('Walsh'),('Lyons'),('Ramsey'),('Wolfe'),('Schneider'),('Mullins'),('Benson'),('Sharp'),('Bowen'),('Daniel'),('Barber'),('Cummings'),('Hines'),('Baldwin'),('Griffith'),('Valdez'),('Hubbard'),('Salazar'),('Reeves'),('Warner'),('Stevenson'),('Burgess'),('Santos'),('Tate'),('Cross'),('Garner'),('Mann'),('Mack'),('Moss'),('Thornton'),('Dennis'),('Mcgee'),('Farmer'),('Delgado'),('Aguilar'),('Vega'),('Glover'),('Manning'),('Cohen'),('Harmon'),('Rodgers'),('Robbins'),('Newton'),('Todd'),('Blair'),('Higgins'),('Ingram'),('Reese'),('Cannon'),('Strickland'),('Townsend'),('Potter'),('Goodwin'),('Walton'),('Rowe'),('Hampton'),('Ortega'),('Patton'),('Swanson'),('Joseph'),('Francis'),('Goodman'),('Maldonado'),('Yates'),('Becker'),('Erickson'),('Hodges'),('Rios'),('Conner'),('Adkins'),('Webster'),('Norman'),('Malone'),('Hammond'),('Flowers'),('Cobb'),('Moody'),('Quinn'),('Blake'),('Maxwell'),('Pope'),('Floyd'),('Osborne'),('Paul'),('Mccarthy'),('Guerrero'),('Lindsey'),('Estrada'),('Sandoval'),('Gibbs'),('Tyler'),('Gross'),('Fitzgerald'),('Stokes'),('Doyle'),('Sherman'),('Saunders'),('Wise'),('Colon'),('Gill'),('Alvarado'),('Greer'),('Padilla'),('Simon'),('Waters'),('Nunez'),('Ballard'),('Schwartz'),('Mcbride'),('Houston'),('Christensen'),('Klein'),('Pratt'),('Briggs'),('Parsons'),('Mclaughlin'),('Zimmerman'),('French'),('Buchanan'),('Moran'),('Copeland'),('Roy'),('Pittman'),('Brady'),('Mccormick'),('Holloway'),('Brock'),('Poole'),('Frank'),('Logan'),('Owen'),('Bass'),('Marsh'),('Drake'),('Wong'),('Jefferson'),('Park'),('Morton'),('Abbott'),('Sparks'),('Patrick'),('Norton'),('Huff'),('Clayton'),('Massey'),('Lloyd'),('Figueroa'),('Carson'),('Bowers'),('Roberson'),('Barton'),('Tran'),('Lamb'),('Harrington'),('Casey'),('Boone'),('Cortez'),('Clarke'),('Mathis'),('Singleton'),('Wilkins'),('Cain'),('Bryan'),('Underwood'),('Hogan'),('Mckenzie'),('Collier'),('Luna'),('Phelps'),('Mcguire'),('Allison'),('Bridges'),('Wilkerson'),('Nash'),('Summers'),('Atkins'),('Wilcox'),('Pitts'),('Conley'),('Marquez'),('Burnett'),('Richard'),('Cochran'),('Chase'),('Davenport'),('Hood'),('Gates'),('Clay'),('Ayala'),('Sawyer'),('Roman'),('Vazquez'),('Dickerson'),('Hodge'),('Acosta'),('Flynn'),('Espinoza'),('Nicholson'),('Monroe'),('Wolf'),('Morrow'),('Kirk'),('Randall'),('Anthony'),('Whitaker'),('Oconnor'),('Skinner'),('Ware'),('Molina'),('Kirby'),('Huffman'),('Bradford'),('Charles'),('Gilmore'),('Dominguez'),('Oneal'),('Bruce'),('Lang'),('Combs'),('Kramer'),('Heath'),('Hancock'),('Gallagher'),('Gaines'),('Shaffer'),('Short'),('Wiggins'),('Mathews'),('Mcclain'),('Fischer'),('Wall'),('Small'),('Melton'),('Hensley'),('Bond'),('Dyer'),('Cameron'),('Grimes'),('Contreras'),('Christian'),('Wyatt'),('Baxter'),('Snow'),('Mosley'),('Shepherd'),('Larsen'),('Hoover'),('Beasley'),('Glenn'),('Petersen'),('Whitehead'),('Meyers'),('Keith'),('Garrison'),('Vincent'),('Shields'),('Horn'),('Savage'),('Olsen'),('Schroeder')
    INSERT INTO @tblLastName(Name) VALUES('Hartman'),('Woodard'),('Mueller'),('Kemp'),('Deleon'),('Booth'),('Patel'),('Calhoun'),('Wiley'),('Eaton'),('Cline'),('Navarro'),('Harrell'),('Lester'),('Humphrey'),('Parrish'),('Duran'),('Hutchinson'),('Hess'),('Dorsey'),('Bullock'),('Robles'),('Beard'),('Dalton'),('Avila'),('Vance'),('Rich'),('Blackwell'),('York'),('Johns'),('Blankenship'),('Trevino'),('Salinas'),('Campos'),('Pruitt'),('Moses'),('Callahan'),('Golden'),('Montoya'),('Hardin'),('Guerra'),('Mcdowell'),('Carey'),('Stafford'),('Gallegos'),('Henson'),('Wilkinson'),('Booker'),('Merritt'),('Miranda'),('Atkinson'),('Orr'),('Decker'),('Hobbs'),('Preston'),('Tanner'),('Knox'),('Pacheco'),('Stephenson'),('Glass'),('Rojas'),('Serrano'),('Marks'),('Hickman'),('English'),('Sweeney'),('Strong'),('Prince'),('Mcclure'),('Conway'),('Walter'),('Roth'),('Maynard'),('Farrell'),('Lowery'),('Hurst'),('Nixon'),('Weiss'),('Trujillo'),('Ellison'),('Sloan'),('Juarez'),('Winters'),('Mclean'),('Randolph'),('Leon'),('Boyer'),('Villarreal'),('Mccall'),('Gentry'),('Carrillo'),('Kent'),('Ayers'),('Lara'),('Shannon'),('Sexton'),('Pace'),('Hull'),('Leblanc'),('Browning'),('Velasquez'),('Leach'),('Chang'),('House'),('Sellers'),('Herring'),('Noble'),('Foley'),('Bartlett'),('Mercado'),('Landry'),('Durham'),('Walls'),('Barr'),('Mckee'),('Bauer'),('Rivers'),('Everett'),('Bradshaw'),('Pugh'),('Velez'),('Rush'),('Estes'),('Dodson'),('Morse'),('Sheppard'),('Weeks'),('Camacho'),('Bean'),('Barron'),('Livingston'),('Middleton'),('Spears'),('Branch'),('Blevins'),('Chen'),('Kerr'),('Mcconnell'),('Hatfield'),('Harding'),('Ashley'),('Solis'),('Herman'),('Frost'),('Giles'),('Blackburn'),('William'),('Pennington'),('Woodward'),('Finley'),('Mcintosh'),('Koch'),('Best'),('Solomon'),('Mccullough'),('Dudley'),('Nolan'),('Blanchard'),('Rivas'),('Brennan'),('Mejia'),('Kane'),('Benton'),('Joyce'),('Buckley'),('Haley'),('Valentine'),('Maddox'),('Russo'),('Mcknight'),('Buck'),('Moon'),('Mcmillan'),('Crosby'),('Berg'),('Dotson'),('Mays'),('Roach'),('Church'),('Chan'),('Richmond'),('Meadows'),('Faulkner'),('Oneill'),('Knapp'),('Kline'),('Barry'),('Ochoa'),('Jacobson'),('Gay'),('Avery'),('Hendricks'),('Horne'),('Shepard'),('Hebert'),('Cherry'),('Cardenas'),('Mcintyre'),('Whitney'),('Waller'),('Holman'),('Donaldson'),('Cantu'),('Terrell'),('Morin'),('Gillespie'),('Fuentes'),('Tillman'),('Sanford'),('Bentley'),('Peck'),('Key'),('Salas'),('Rollins'),('Gamble'),('Dickson'),('Battle'),('Santana'),('Cabrera'),('Cervantes'),('Howe'),('Hinton'),('Hurley'),('Spence'),('Zamora'),('Yang'),('Mcneil'),('Suarez'),('Case'),('Petty'),('Gould'),('Mcfarland'),('Sampson'),('Carver'),('Bray'),('Rosario'),('Macdonald'),('Stout'),('Hester'),('Melendez'),('Dillon'),('Farley'),('Hopper'),('Galloway'),('Potts'),('Bernard'),('Joyner'),('Stein'),('Aguirre'),('Osborn'),('Mercer'),('Bender'),('Franco'),('Rowland'),('Sykes'),('Benjamin'),('Travis'),('Pickett'),('Crane'),('Sears'),('Mayo'),('Dunlap'),('Hayden'),('Wilder'),('Mckay'),('Coffey'),('Mccarty'),('Ewing'),('Cooley'),('Vaughan'),('Bonner'),('Cotton'),('Holder'),('Stark'),('Ferrell'),('Cantrell'),('Fulton'),('Lynn'),('Lott'),('Calderon'),('Rosa'),('Pollard'),('Hooper'),('Burch'),('Mullen'),('Fry'),('Riddle'),('Levy'),('David'),('Duke'),('Odonnell'),('Guy'),('Michael'),('Britt'),('Frederick'),('Daugherty'),('Berger'),('Dillard'),('Alston'),('Jarvis'),('Frye'),('Riggs'),('Chaney'),('Odom'),('Duffy'),('Fitzpatrick'),('Valenzuela'),('Merrill'),('Mayer'),('Alford'),('Mcpherson'),('Acevedo'),('Donovan'),('Barrera'),('Albert'),('Cote'),('Reilly'),('Compton'),('Raymond'),('Mooney'),('Mcgowan'),('Craft'),('Cleveland'),('Clemons'),('Wynn'),('Nielsen'),('Baird'),('Stanton'),('Snider'),('Rosales'),('Bright'),('Witt'),('Stuart'),('Hays'),('Holden'),('Rutledge'),('Kinney'),('Clements'),('Castaneda'),('Slater'),('Hahn'),('Emerson'),('Conrad'),('Burks'),('Delaney'),('Pate'),('Lancaster'),('Sweet'),('Justice'),('Tyson'),('Sharpe'),('Whitfield'),('Talley'),('Macias'),('Irwin'),('Burris'),('Ratliff'),('Mccray'),('Madden'),('Kaufman'),('Beach'),('Goff'),('Cash'),('Bolton'),('Mcfadden'),('Levine'),('Good'),('Byers'),('Kirkland'),('Kidd'),('Workman'),('Carney'),('Dale'),('Mcleod'),('Holcomb'),('England'),('Finch'),('Head'),('Burt'),('Hendrix'),('Sosa'),('Haney'),('Franks'),('Sargent'),('Nieves'),('Downs'),('Rasmussen'),('Bird'),('Hewitt'),('Lindsay'),('Le'),('Foreman'),('Valencia'),('Oneil'),('Delacruz'),('Vinson'),('Dejesus'),('Hyde'),('Forbes'),('Gilliam'),('Guthrie'),('Wooten'),('Huber'),('Barlow'),('Boyle'),('Mcmahon'),('Buckner'),('Rocha'),('Puckett'),('Langley'),('Knowles'),('Cooke'),('Velazquez'),('Whitley'),('Noel'),('Vang'),('Shea'),('Rouse'),('Hartley'),('Mayfield'),('Elder'),('Rankin'),('Hanna'),('Cowan'),('Lucero'),('Arroyo'),('Slaughter'),('Haas'),('Oconnell'),('Minor'),('Kendrick'),('Shirley'),('Kendall'),('Boucher'),('Archer'),('Boggs'),('Odell'),('Dougherty'),('Andersen'),('Newell'),('Crowe'),('Wang'),('Friedman'),('Bland'),('Swain'),('Holley'),('Felix'),('Pearce'),('Childs'),('Yarbrough'),('Galvan'),('Proctor'),('Meeks'),('Lozano'),('Mora'),('Rangel'),('Bacon'),('Villanueva'),('Schaefer'),('Rosado'),('Helms'),('Boyce'),('Goss'),('Stinson'),('Smart'),('Lake'),('Ibarra'),('Hutchins'),('Covington'),('Reyna'),('Gregg'),('Werner'),('Crowley'),('Hatcher'),('Mackey'),('Bunch'),('Womack'),('Polk'),('Jamison'),('Dodd'),('Childress'),('Childers'),('Camp'),('Villa'),('Dye'),('Springer'),('Mahoney'),('Dailey'),('Belcher'),('Lockhart'),('Griggs'),('Costa'),('Connor'),('Brandt'),('Winter'),('Walden'),('Moser'),('Tracy'),('Tatum'),('Mccann'),('Akers'),('Lutz'),('Pryor'),('Law'),('Orozco'),('Mcallister'),('Lugo'),('Davies'),('Shoemaker'),('Madison'),('Rutherford'),('Newsome'),('Magee'),('Chamberlain'),('Blanton'),('Simms'),('Godfrey'),('Flanagan'),('Crum'),('Cordova'),('Escobar'),('Downing'),('Sinclair'),('Donahue'),('Krueger'),('Mcginnis'),('Gore'),('Farris'),('Webber'),('Corbett'),('Andrade'),('Starr'),('Lyon'),('Yoder'),('Hastings'),('Mcgrath'),('Spivey'),('Krause'),('Harden'),('Crabtree'),('Kirkpatrick'),('Hollis'),('Brandon'),('Arrington'),('Ervin'),('Clifton'),('Ritter'),('Mcghee'),('Bolden'),('Maloney'),('Gagnon'),('Dunbar'),('Ponce'),('Pike'),('Mayes'),('Heard'),('Beatty'),('Mobley'),('Kimball'),('Butts'),('Montes'),('Herbert'),('Grady'),('Eldridge'),('Braun'),('Hamm'),('Gibbons'),('Seymour'),('Moyer'),('Manley'),('Herron'),('Plummer'),('Elmore'),('Cramer'),('Gary'),('Rucker'),('Hilton'),('Blue'),('Pierson'),('Fontenot'),('Field'),('Ganaye')
    INSERT INTO Occupation(OccupationName) VALUES('Actor'),('Actuary'),('Advertising'),('Advocate'),('Aeronautical Engineer'),('Aerospace Industry Trades'),('Agricultural Economist'),('Agricultural Engineer'),('Agricultural Extension Officer'),('Agricultural Inspector'),('Agricultural Technician'),('Agriculture'),('Agriculturist'),('Agronomist'),('Air Traffic Controller'),('Ambulance Emergency Care Worker'),('Animal Scientist'),('Anthropologist'),('Aquatic Scientist'),('Archaeologist'),('Architect'),('Architectural Technologist'),('Archivist'),('Area Manager'),('Armament Fitter'),('Armature Winder'),('Art Editor'),('Artist'),('Assayer Sampler'),('Assembly Line Worker'),('Assistant Draughtsman'),('Astronomer'),('Attorney'),('Auctioneer'),('Auditor'),('Automotive Body Repairer'),('Automotive Electrician'),('Automotive Mechinist'),('Automotive Trimmer'),('Babysitting Career'),('Banking Career'),('Beer Brewing'),('Biochemist'),('Biokineticist'),('Biologist'),('Biomedical Engineer'),('Biomedicaltechnologist'),('Blacksmith'),('Boilermaker'),('Bookbinder'),('Bookkeeper'),('Botanist'),('Branch Manager'),('Bricklayer'),('Bus Driver'),('Business Analyst'),('Business Economist'),('Butler'),('Cabin Attendant'),('Carpenter'),('Cartographer'),('Cashier'),('Ceramics Technologist'),('Chartered Accountant'),('Chartered Management Accountant'),('Chartered Secretary'),('Chemical Engineer'),('Chemist'),('Chiropractor'),('City Treasurer'),('Civil Engineer'),('Civil Investigator'),('Cleaner'),('Clergyman'),('Clerk'),('Clinical Engineering'),('Clinical Technologist'),('Clothing Designer'),('Clothing Manager'),('Coal Technologist'),('Cobbler'),('Committee Clerk'),('Computer Industry'),('Concrete Technician'),('Conservation And Wildlife'),('Construction Manager'),('Copy Writer'),('Correctional Services'),('Costume Designer'),('Crane Operator'),('Credit Controller'),('Crop Protection And Animal Health'),('Customer And Excise Officer'),('Customer Service Agent'),('Dancer'),('Data Capturer'),('Database Administrator'),('Dealer In Oriental Carpets'),('Decor Designer'),('Dental Assistant And Oral Hygienist'),('Dental Technician'),('Dental Therapist'),('Dentist'),('Detective'),('Diamond Cutting'),('Diesel Fitter'),('Diesel Loco Driver'),('Diesel Mechanic'),('Die-Sinker And Engraver'),('Dietician'),('Diver'),('Dj'),('Domestic Appliance Mechanician'),('Domestic Personnel'),('Domestic Radio And Television Mechanician'),('Domestic Worker'),('Draughtsman'),('Driver And Stacker'),('Earth Moving Equipment Mechanic'),('Ecologist'),('Economist Technician'),('Editor'),('Eeg Technician'),('Electrical And Electronic Engineer'),('Electrical Engineering Technician'),('Electrician'),('Electrician (Construction)'),('Engineering'),('Engineering Technician'),('Entomologist'),('Environmental Health Officer'),('Estate Agent'),('Explosive Expert'),('Explosive Technologist'),('Extractive Metallurgist'),('Farm Foreman'),('Farm Worker'),('Farmer'),('Fashion Buyer'),('Film And Production'),('Financial And Investment Manager'),('Fire-Fighter'),('Fireman At The Airport'),('Fitter And Turner'),('Flight Engineer'),('Florist'),('Food Scientist And Technologist'),('Footwear'),('Forester Service'),('Funeral Director'),('Furrier'),('Game Ranger'),('Gardener'),('Geneticist'),('Geographer'),('Geologist'),('Geotechnologist'),('Goldsmith And Jeweller'),('Grain Grader'),('Graphic Designer'),('Gravure Machine Minder'),('Hairdresser'),('Herpetologist'),('Home Economist'),('Homoeopath'),('Horticulturist'),('Hospital Porter'),('Hospitality Industry'),('Human Resource Manager'),('Hydrologist'),('Ichthyologist'),('Industrial Designer'),('Industrial Engineer'),('Industrial Engineering Technologist'),('Industrial Technician'),('Inspector'),('Instrument Maker'),('Insurance'),('Interior Designer'),('Interpreter'),('Inventory And Store Manager'),('Jeweler'),('Jockey'),('Joiner And Woodmachinist'),('Journalist'),('Knitter'),('Labourer'),('Land Surveyor'),('Landscape Architect'),('Law'),('Learner Official'),('Leather Chemist'),('Leather Worker'),('Lecturer'),('Librarian'),('Life-Guard'),('Lift Mechanic'),('Light Delivery Van Driver'),('Linesman'),('Locksmith'),('Machine Operator'),('Machine Worker'),('Magistrate'),('Mail Handler'),('Make-Up Artist'),('Management Consultant'),('Manager'),('Marine Biologist'),('Marketing'),('Marketing Manager'),('Materials Engineer'),('Mathematician'),('Matron'),('Meat Cutting Technician'),('Mechanical Engineer'),('Medical Doctor'),('Medical Orthotist Prosthetist'),('Medical Physicist'),('Merchandise Planner'),('Messenger'),('Meteorological Technician'),('Meteorologist'),('Meter-Reader'),('Microbiologist'),('Mine Surveyor'),('Miner'),('Mining Engineer'),('Model'),('Model Builder'),('Motor Mechanic'),('Musician'),('Nature Conservator'),('Navigating Officer'),('Navigator'),('Nuclear Scientist'),('Nursing'),('Nutritionist'),('Occupational Therapist'),('Oceanographer'),('Operations Researcher'),('Optical Dispenser'),('Optical Technician'),('Optometrist'),('Ornithologist'),('Paint Technician'),('Painter And Decorator'),('Paper Technologist'),('Patent Attorney'),('Personal Trainer'),('Personnel Consultant'),('Petroleum Technologist'),('Pharmacist'),('Pharmacist Assistant'),('Photographer'),('Physicist'),('Physiologist'),('Physiotherapist'),('Piano Tuner'),('Pilot'),('Plumber'),('Podiatrist'),('Police Officer'),('Post Office Clerk'),('Power Plant Operator'),('Private Secretary'),('Production Manager'),('Project Manager'),('Projectionist'),('Psychologist'),('Psychometrist'),('Public Relations Practitioner'),('Purchasing Manager'),('Quality Control Inspector'),('Quantity Surveyor'),('Radiation Protectionist'),('Radio'),('Radiographer'),('Receptionist'),('Recreation Manager'),('Rigger'),('Road Construction Plant Operator'),('Roofer'),('Rubber Technologist'),('Sales Representative'),('Salesperson'),('Saw Operator'),('Scale Fitter'),('Sea Transport Worker'),('Secretary'),('Security Officer'),('Sheetmetal Worker'),('Shop Assistant'),('Shopfitter'),('Singer'),('Social Worker'),('Sociologist'),('Soil Scientist'),('Speech And Language Therapist'),('Sport Manager'),('Spray Painter'),('Statistician'),('Swimming Pool Superintendent'),('Systems Analyst'),('Tailor'),('Taxidermist'),('Teacher'),('Technical Illustrator'),('Technical Writer'),('Teller'),('Terminologist'),('Textile Designer'),('Theatre Technology'),('Tourism Manager'),('Traffic Officer'),('Translator'),('Travel Agent'),('Typist'),('Valuer And Appraiser'),('Vehicle Driver'),('Veterinary Nurse'),('Veterinary Surgeon'),('Viticulturist'),('Watchmaker'),('Weather Observer'),('Weaver'),('Welder'),('Wood Scientist'),('Wood Technologist'),('Yard Official'),('Zoologist')
    -- names largely inspired from http://www.publiclibraries.com/
    INSERT INTO @tblStreetNames VALUES ('%sz% %nth% Street'),('P.O. Box %bn%'),('%sn% %sz% Route %rn%'),('%sz% %nth% Avenue'),('%sn% %sz% County Route %rn%'),('%sn% %sz% State Route %rn%'),('%sz% %nth%  Road'),('%sn% %sz% Church %st%'),('%sn% %sz% Maple %st%'),('%sn% %sz% Second %st%'),('%sn% %sz% Washington %st%'),('%sn% %sz% Third %st%'),('%sn% %sz% Elm %st%'),('%sn% %sz% Broadway'),('%sn% %sz% Genesee %st%'),('%sn% %sz% Central %st%'),('%sn% %sz% Fifth %st%'),('%sn% %sz% First %st%'),('%sn% %sz% State %st%'),('%sn% %sz% Broad %st%'),('%sn% %sz% Library %st%'),('%sn% %sz% Market %st%'),('%sn% %sz% School %st%'),('%sn% %sz% Oak %st%'),('%sn% %sz% Union %st%'),('%sn% %sz% Franklin %st%'),('%sn% %sz% Lake %st%'),('%sn% %sz% Village %st%'),('%sn% %sz% Canal %st%'),('%sn% %sz% Civic %st%'),('%sn% %sz% Grand %st%'),('%sn% %sz% Lincoln %st%'),('%sn% %sz% Morris %st%'),('%sn% %sz% River %st%'),('%sn% %sz% Front %st%'),('%sn% %sz% Northern %st%'),('%sn% %sz% Jefferson %st%'),('%sn% %sz% Pacific %st%'),('%sn% %sz% Richmond %st%'),('%sn% %sz% Seventh %st%'),('%sn% %sz% University %st%'),('%sn% %sz% Bedford %st%'),('%sn% %sz% Cedar %st%'),('%sn% %sz% Chapel %st%'),('%sn% %sz% Clinton %st%'),('%sn% %sz% Delaware %st%'),('%sn% %sz% Erie %st%'),('%sn% %sz% Fourth %st%'),('%sn% %sz% Harbor %st%'),('%sn% %sz% Hillside %st%'),('%sn% %sz% Hudson %st%'),('%sn% %sz% Lafayette %st%'),('%sn% %sz% Merrick %st%'),('%sn% %sz% Ocean %st%'),('%sn% %sz% Railroad %st%'),('%sn% %sz% Ridge %st%'),('%sn% %sz% Salina %st%'),('%sn% %sz% Barnes %st%'),('%sn% %sz% Chestnut %st%'),('%sn% %sz% Jackson %st%'),('%sn% %sz% Mission %st%'),('%sn% %sz% Orange %st%'),('%sn% %sz% Pearl %st%'),('%sn% %sz% Sixth %st%'),('%sn% %sz% Walnut %st%'),('%sn% %sz% Williams %st%'),('%sn% %sz% Academy %st%'),('%sn% %sz% Amsterdam %st%'),('%sn% %sz% Astoria %st%'),('%sn% %sz% Auburn %st%'),('%sn% %sz% Bell %st%'),('%sn% %sz% Buffalo %st%'),('%sn% %sz% Cayuga %st%'),('%sn% %sz% Colonial %st%'),('%sn% %sz% Elmwood %st%'),('%sn% %sz% Essex %st%'),('%sn% %sz% Ferry %st%'),('%sn% %sz% Forest %st%'),('%sn% %sz% Fulton %st%'),('%sn% %sz% Grand Army %st%'),('%sn% %sz% Greenwood %st%'),('%sn% %sz% Hempstead %st%'),('%sn% %sz% High %st%'),('%sn% %sz% Highland %st%'),('%sn% %sz% Jerusalem %st%'),('%sn% %sz% John %st%'),('%sn% %sz% Laurel %st%'),('%sn% %sz% Linden %st%'),('%sn% %sz% Madison %st%'),('%sn% %sz% Magnolia %st%'),('%sn% %sz% Metropolitan %st%'),('%sn% %sz% Miller %st%'),('%sn% %sz% Mohawk %st%'),('%sn% %sz% Monroe %st%'),('%sn% %sz% Montcalm %st%'),('%sn% %sz% Moorpark %st%'),('%sn% %sz% Mountain %st%'),('%sn% %sz% Nichols %st%'),('%sn% %sz% Ogden %st%'),('%sn% %sz% Old Post %st%'),('%sn% %sz% Rockaway %st%'),('%sn% %sz% Rockaway Beach %st%'),('%sn% %sz% Santa Monica %st%'),('%sn% %sz% Seneca %st%'),('%sn% %sz% Sullivan %st%'),('%sn% %sz% Utica %st%'),('%sn% %sz% Victory %st%'),('%sn% %sz% Vince Tofany %st%'),('%sn% %sz% Water %st%'),('%sn% %sz% Westchester %st%'),('%sn% %sz% Western %st%'),('%sn% %sz% Atlantic %st%'),('%sn% %sz% Bullis %st%'),('%sn% %sz% Caroline %st%'),('%sn% %sz% Centre %st%'),('%sn% %sz% Clark %st%'),('%sn% %sz% College %st%'),('%sn% %sz% Columbia %st%'),('%sn% %sz% Columbus %st%'),('%sn% %sz% Compton %st%'),('%sn% %sz% Cortland %st%'),('%sn% %sz% Crenshaw %st%'),('%sn% %sz% Day %st%'),('%sn% %sz% Division %st%'),('%sn% %sz% Fiske %st%'),('%sn% %sz% Garfield %st%'),('%sn% %sz% Hopkins %st%'),('%sn% %sz% Huntington Dr. %st%'),('%sn% %sz% James %st%'),('%sn% %sz% Jersey %st%'),('%sn% %sz% Kings %st%'),('%sn% %sz% Lawrence %st%'),('%sn% %sz% Leland %st%'),('%sn% %sz% Lexington %st%'),('%sn% %sz% Mariposa %st%'),('%sn% %sz% Middlefield %st%'),('%sn% %sz% Mill %st%'),('%sn% %sz% Montecito %st%'),('%sn% %sz% Ninth %st%'),('%sn% %sz% Noble %st%'),('%sn% %sz% Orchard %st%'),('%sn% %sz% Pike %st%'),('%sn% %sz% Powell %st%'),('%sn% %sz% Whitney %st%'),('%sn% %sz% Wildwood %st%'),('%sn% %sz% Woodrow %st%'),('%sn% %sz% Adam Clayton Powell, Jr. %st%'),('%sn% %sz% Adams %st%'),('%sn% %sz% Albany %st%'),('%sn% %sz% Albany Shaker %st%'),('%sn% %sz% Alder %st%'),('%sn% %sz% Aldrich %st%'),('%sn% %sz% Alma %st%'),('%sn% %sz% Almond %st%'),('%sn% %sz% Amboy %st%'),('%sn% %sz% American Legion %st%'),('%sn% %sz% Arkie Albanese %st%'),('%sn% %sz% Arlington %st%'),('%sn% %sz% Arnett %st%'),('%sn% %sz% Artesia %st%'),('%sn% %sz% Asch Loop %st%'),('%sn% %sz% Astor %st%'),('%sn% %sz% Avalon %st%'),('%sn% %sz% Avocado %st%'),('%sn% %sz% Bailey %st%'),('%sn% %sz% Baird %st%'),('%sn% %sz% Bank %st%'),('%sn% %sz% Banta Suite 200 %st%'),('%sn% %sz% Bartlett %st%'),('%sn% %sz% Barton %st%'),('%sn% %sz% Bayview %st%'),('%sn% %sz% Beach 54 %st%'),('%sn% %sz% Beaver Dam %st%'),('%sn% %sz% Bedell %st%'),('%sn% %sz% Belmont %st%'),('%sn% %sz% Bennett %st%'),('%sn% %sz% Blue Point %st%'),('%sn% %sz% Bluegrass %st%'),('%sn% %sz% Bona Venture %st%'),('%sn% %sz% Boon %st%'),('%sn% %sz% Boston Post %st%'),('%sn% %sz% Boston State %st%'),('%sn% %sz% Bowen %st%'),('%sn% %sz% Bradley %st%'),('%sn% %sz% Bridge %st%'),('%sn% %sz% Brown %st%'),('%sn% %sz% Bruce %st%'),('%sn% %sz% Brunswick %st%'),('%sn% %sz% Brutus %st%'),('%sn% %sz% Buckram %st%'),('%sn% %sz% Budd %st%'),('%sn% %sz% Bull %st%'),('%sn% %sz% Bungtown %st%'),('%sn% %sz% Busti-Sugar Grove %st%'),('%sn% %sz% Butternut %st%'),('%sn% %sz% Calkins %st%'),('%sn% %sz% Canada %st%'),('%sn% %sz% Carll %st%'),('%sn% %sz% Castle Hill %st%'),('%sn% %sz% Castleton %st%'),('%sn% %sz% Chenango %st%'),('%sn% %sz% Cherry %st%'),('%sn% %sz% Chili %st%'),('%sn% %sz% Church At. Rockaway %st%'),('%sn% %sz% City Island %st%'),('%sn% %sz% Civic Suite %st%'),('%sn% %sz% Clarke %st%'),('%sn% %sz% Clarkson Hamlin %st%'),('%sn% %sz% Classic %st%'),('%sn% %sz% Cleveland %st%'),('%sn% %sz% Clinton Union %st%'),('%sn% %sz% Closter %st%'),('%sn% %sz% Clover %st%'),('%sn% %sz% Clubhouse %st%'),('%sn% %sz% Clymer %st%'),('%sn% %sz% Cohen %st%'),('%sn% %sz% Collins %st%'),('%sn% %sz% Commercial %st%'),('%sn% %sz% Commonwealth %st%'),('%sn% %sz% Community %st%'),('%sn% %sz% Cook %st%'),('%sn% %sz% Cooper %st%'),('%sn% %sz% Coopers Farm %st%'),('%sn% %sz% Cragsmoor %st%'),('%sn% %sz% Craig %st%'),('%sn% %sz% Crane %st%'),('%sn% %sz% Creamery %st%'),('%sn% %sz% Crosby %st%'),('%sn% %sz% Cross Bay %st%'),('%sn% %sz% Croton %st%'),('%sn% %sz% Cuyler %st%'),('%sn% %sz% Dakota %st%'),('%sn% %sz% Davison %st%'),('%sn% %sz% Dayan %st%'),('%sn% %sz% Deauville %st%'),('%sn% %sz% Decatur %st%'),('%sn% %sz% Deer %st%'),('%sn% %sz% Depot %st%'),('%sn% %sz% Dewey %st%'),('%sn% %sz% Dillon %st%'),('%sn% %sz% Douglas %st%'),('%sn% %sz% Dove %st%'),('%sn% %sz% Dr. Samuel Mccree %st%'),('%sn% %sz% Draper %st%'),('%sn% %sz% Duanesburg %st%'),('%sn% %sz% Eames %st%'),('%sn% %sz% Eastern %st%'),('%sn% %sz% Eastwood %st%'),('%sn% %sz% Eighth %st%'),('%sn% %sz% El Camino Real %st%'),('%sn% %sz% Eldert %st%'),('%sn% %sz% Elizabeth %st%'),('%sn% %sz% Elmgrove %st%'),('%sn% %sz% Ely %st%'),('%sn% %sz% Emerald %st%'),('%sn% %sz% Falls %st%'),('%sn% %sz% Farmedge %st%'),('%sn% %sz% Farmers %st%'),('%sn% %sz% Florence %st%'),('%sn% %sz% Fluvanna %st%'),('%sn% %sz% Flywheel %st%'),('%sn% %sz% Foothill %st%'),('%sn% %sz% Fort Hill %st%'),('%sn% %sz% Francis Lewis %st%'),('%sn% %sz% Frankfort %st%'),('%sn% %sz% Freedom Plains %st%'),('%sn% %sz% Friendly %st%'),('%sn% %sz% Fruitvale %st%'),('%sn% %sz% Galena %st%'),('%sn% %sz% Gardiner %st%'),('%sn% %sz% George %st%'),('%sn% %sz% Gerritsen Bartlett %st%'),('%sn% %sz% Giffords %st%'),('%sn% %sz% Gilliland %st%'),('%sn% %sz% Glasgow %st%'),('%sn% %sz% Glebe %st%'),('%sn% %sz% Glen %st%'),('%sn% %sz% Glen Cove %st%'),('%sn% %sz% Glenn %st%'),('%sn% %sz% Glenridge %st%'),('%sn% %sz% Graham %st%'),('%sn% %sz% Grant %st%'),('%sn% %sz% Greeley %st%'),('%sn% %sz% Greenbush %st%'),('%sn% %sz% Greenpoint %st%'),('%sn% %sz% Gun Hill %st%'),('%sn% %sz% Guy R. Brewer %st%'),('%sn% %sz% Hamlin Clarkson %st%'),('%sn% %sz% Harlem %st%'),('%sn% %sz% Harris %st%'),('%sn% %sz% Harrisburg %st%'),('%sn% %sz% Harvard %st%'),('%sn% %sz% Haseco %st%'),('%sn% %sz% Hauppauge %st%'),('%sn% %sz% Hawley %st%'),('%sn% %sz% Hawthorne %st%'),('%sn% %sz% Helderberg %st%'),('%sn% %sz% Henrietta %st%'),('%sn% %sz% Henry %st%'),('%sn% %sz% Henry Johnson %st%'),('%sn% %sz% Hepburn %st%'),('%sn% %sz% Hertel %st%'),('%sn% %sz% Hicksville %st%'),('%sn% %sz% Higbie %st%'),('%sn% %sz% Hillsdale %st%'),('%sn% %sz% Holbrook %st%'),('%sn% %sz% Hollis %st%'),('%sn% %sz% Honeywell %st%'),('%sn% %sz% Horace Harding Expressway %st%'),('%sn% %sz% Houston %st%'),('%sn% %sz% Huguenot %st%'),('%sn% %sz% Idle Hour %st%'),('%sn% %sz% Imperial %st%'),('%sn% %sz% International %st%'),('%sn% %sz% Irving %st%'),('%sn% %sz% Ivory %st%'),('%sn% %sz% Jamestown %st%'),('%sn% %sz% Jericho %st%'),('%sn% %sz% Jewel %st%'),('%sn% %sz% Jillson %st%'),('%sn% %sz% John James Audubon %st%'),('%sn% %sz% Joseph %st%'),('%sn% %sz% Katonah %st%'),('%sn% %sz% Kelly %st%'),('%sn% %sz% Kentucky %st%'),('%sn% %sz% Kern %st%'),('%sn% %sz% Kings Ferry %st%'),('%sn% %sz% Kingsbridge %st%'),('%sn% %sz% Kingsbury %st%'),('%sn% %sz% Kirby %st%'),('%sn% %sz% Knower %st%'),('%sn% %sz% Knowledge %st%'),('%sn% %sz% Lake Shore %st%'),('%sn% %sz% Lakeshore %st%'),('%sn% %sz% Lakeville %st%'),('%sn% %sz% Larchmont %st%'),('%sn% %sz% Lawmar %st%'),('%sn% %sz% Lefferts %st%'),('%sn% %sz% Lehigh %st%'),('%sn% %sz% Leroy %st%'),('%sn% %sz% Lewis %st%'),('%sn% %sz% Liberty %st%'),('%sn% %sz% Liberty Rock %st%'),('%sn% %sz% Lilac %st%'),('%sn% %sz% Live Oak %st%'),('%sn% %sz% Lockport %st%'),('%sn% %sz% Long Beach %st%'),('%sn% %sz% Lorraine %st%'),('%sn% %sz% Los Alamos %st%'),('%sn% %sz% Losson %st%'),('%sn% %sz% Lowerre %st%'),('%sn% %sz% Lyell %st%'),('%sn% %sz% Lyons %st%'),('%sn% %sz% Madison 34th %st%'),('%sn% %sz% Malcolm X %st%'),('%sn% %sz% Mamaroneck %st%'),('%sn% %sz% Maples %st%'),('%sn% %sz% Marathon %st%'),('%sn% %sz% Marcellus %st%'),('%sn% %sz% Marconi %st%'),('%sn% %sz% Martin Luther King, Jr. %st%'),('%sn% %sz% Martine %st%'),('%sn% %sz% Mccoy %st%'),('%sn% %sz% Meadow %st%'),('%sn% %sz% Meadowbrook %st%'),('%sn% %sz% Mechanic %st%'),('%sn% %sz% Meridian %st%'),('%sn% %sz% Merritts %st%'),('%sn% %sz% Merry %st%'),('%sn% %sz% Middlery %st%'),('%sn% %sz% Middletown %st%'),('%sn% %sz% Miller Hill %st%'),('%sn% %sz% Millpond %st%'),('%sn% %sz% Milton %st%'),('%sn% %sz% Mitchell %st%'),('%sn% %sz% Moe %st%'),('%sn% %sz% Monell %st%'),('%sn% %sz% Montauk %st%'),('%sn% %sz% Montgomery %st%'),('%sn% %sz% Montrose %st%'),('%sn% %sz% Morrison %st%'),('%sn% %sz% Morton %st%'),('%sn% %sz% Mosholu %st%'),('%sn% %sz% Mother Gaston %st%'),('%sn% %sz% Mt. Baker %st%'),('%sn% %sz% Murray %st%'),('%sn% %sz% Naches %st%'),('%sn% %sz% Naples %st%'),('%sn% %sz% Nelson %st%'),('%sn% %sz% Nevada %st%'),('%sn% %sz% New Dorp %st%'),('%sn% %sz% New Hartford %st%'),('%sn% %sz% New Scotland %st%'),('%sn% %sz% Newbridge %st%'),('%sn% %sz% Newport %st%'),('%sn% %sz% Nicholas %st%'),('%sn% %sz% Nicolet %st%'),('%sn% %sz% Nostrand %st%'),('%sn% %sz% Nostrand Near %st%'),('%sn% %sz% Nott %st%'),('%sn% %sz% Oakridge %st%'),('%sn% %sz% Oakwood %st%'),('%sn% %sz% Oldry %st%'),('%sn% %sz% Onderdonk %st%'),('%sn% %sz% Oneida %st%'),('%sn% %sz% Oriental %st%'),('%sn% %sz% Oscawana Lake %st%'),('%sn% %sz% Osceola %st%'),('%sn% %sz% Oswego %st%'),('%sn% %sz% Overland %st%'),('%sn% %sz% Oyster Bay %st%'),('%sn% %sz% Packetts %st%'),('%sn% %sz% Palatine %st%'),('%sn% %sz% Paper Mill %st%'),('%sn% %sz% Parkview %st%'),('%sn% %sz% Pestle %st%'),('%sn% %sz% Peterboro %st%'),('%sn% %sz% Pidgeon Hill %st%'),('%sn% %sz% Pine %st%'),('%sn% %sz% Plank %st%'),('%sn% %sz% Pondfield %st%'),('%sn% %sz% Ponquogue %st%'),('%sn% %sz% Portage %st%'),('%sn% %sz% Porter %st%'),('%sn% %sz% Pratt %st%'),('%sn% %sz% Pritchard %st%'),('%sn% %sz% Proctor %st%'),('%sn% %sz% Prospect %st%'),('%sn% %sz% Public %st%'),('%sn% %sz% Public Works %st%'),('%sn% %sz% Purchase %st%'),('%sn% %sz% Quogue %st%'),('%sn% %sz% Rainier %st%'),('%sn% %sz% Ralph Near %st%'),('%sn% %sz% Ramapo %st%'),('%sn% %sz% Ransomville %st%'),('%sn% %sz% Read %st%'),('%sn% %sz% Riverside %st%'),('%sn% %sz% Robin %st%'),('%sn% %sz% Rock %st%'),('%sn% %sz% Rock City %st%'),('%sn% %sz% Roosevelt Av. %st%'),('%sn% %sz% Ross %st%'),('%sn% %sz% Sag Harbor %st%'),('%sn% %sz% Saint Edwards %st%'),('%sn% %sz% Salina %st%'),('%sn% %sz% San Vicente %st%'),('%sn% %sz% Sanford %st%'),('%sn% %sz% Santa Clara %st%'),('%sn% %sz% Santa Fe %st%'),('%sn% %sz% Schuyler %st%'),('%sn% %sz% Scofield %st%'),('%sn% %sz% Searingtown %st%'),('%sn% %sz% Seaview %st%'),('%sn% %sz% Sedgwick %st%'),('%sn% %sz% Sheridan %st%'),('%sn% %sz% Sherrill %st%'),('%sn% %sz% Silver Spur %st%'),('%sn% %sz% Sir Francis Drake %st%'),('%sn% %sz% Skillman %st%'),('%sn% %sz% Slauson %st%'),('%sn% %sz% Soundview %st%'),('%sn% %sz% Southern %st%'),('%sn% %sz% Sponable %st%'),('%sn% %sz% Spring %st%'),('%sn% %sz% Springfield %st%'),('%sn% %sz% Station %st%'),('%sn% %sz% Stevenson %st%'),('%sn% %sz% Stewart %st%'),('%sn% %sz% Stockton %st%'),('%sn% %sz% Strawtown %st%'),('%sn% %sz% Suite 2 %st%'),('%sn% %sz% Summit %st%'),('%sn% %sz% Sutphin %st%'),('%sn% %sz% Sutter %st%'),('%sn% %sz% Sybils %st%'),('%sn% %sz% Tarrytown %st%'),('%sn% %sz% Telephone %st%'),('%sn% %sz% Terryville %st%'),('%sn% %sz% Thomas %st%'),('%sn% %sz% Thomas %st%'),('%sn% %sz% Thomas Indian School %st%'),('%sn% %sz% Thompson %st%'),('%sn% %sz% Thomson %st%'),('%sn% %sz% Thornton %st%'),('%sn% %sz% Titicus %st%'),('%sn% %sz% Tonawanda %st%'),('%sn% %sz% Torrance %st%'),('%sn% %sz% Trenton Falls %st%'),('%sn% %sz% Truxtun %st%'),('%sn% %sz% Tulip %st%'),('%sn% %sz% Tunstead %st%'),('%sn% %sz% Ulster %st%'),('%sn% %sz% Uniondale %st%'),('%sn% %sz% Utica Near Tilden %st%'),('%sn% %sz% Vancouver %st%'),('%sn% %sz% Vanderbilt %st%'),('%sn% %sz% Vanowen %st%'),('%sn% %sz% Ventura %st%'),('%sn% %sz% Vernon %st%'),('%sn% %sz% Verona %st%'),('%sn% %sz% Vestal %st%'),('%sn% %sz% Veterans Memorial %st%'),('%sn% %sz% Victoria Pl. %st%'),('%sn% %sz% Vine %st%'),('%sn% %sz% Vleigh %st%'),('%sn% %sz% Walton %st%'),('%sn% %sz% Warner %st%'),('%sn% %sz% Washington %st%'),('%sn% %sz% Waterstone %st%'),('%sn% %sz% Waverly %st%'),('%sn% %sz% Webster %st%'),('%sn% %sz% Wellesley %st%'),('%sn% %sz% Wembley Dr. %st%'),('%sn% %sz% Wesley %st%'),('%sn% %sz% Whippoorwill %st%'),('%sn% %sz% Whitaker %st%'),('%sn% %sz% White %st%'),('%sn% %sz% Willets %st%'),('%sn% %sz% Willett %st%'),('%sn% %sz% William %st%'),('%sn% %sz% William Floyd %st%'),('%sn% %sz% Willis %st%'),('%sn% %sz% Winton %st%'),('%sn% %sz% Wolcott %st%'),('%sn% %sz% Woodbridge %st%'),('%sn% %sz% Woodfield %st%'),('%sn% %sz% Woodgate %st%'),('%sn% %sz% Woods %st%'),('%sn% %sz% York %st%'),('%sn% %sz% Young %st%')
    INSERT INTO @tblStreetTypes VALUES('Street'),('St.'),('Avenue'),('Ave.'),('Road'),('Blvd.'),('Rd.'),('Boulevard'),('Drive'),('Lane'),('St'),('Ave'),('Way'),('Place'),('Blvd'),('Rd'),('Parkway'),('Highway'),('Plaza'),('Turnpike'),('Extension'),('Square'),('Hwy'),('Hwy.'),('Trail'),('Circle'),('Court'),('Mall'),('Pkwy.'),('Center'),('Green'),('Landing'),('Park'),('Crossing')
    INSERT INTO @tblStreetZones VALUES(''),(''),(''),('North'),('South'),('East'),('West'),('Lower'),('Main'),('Old')
    -- http://www.realestate3d.com/gps/latlong.htm
    -- http://en.wikipedia.org/wiki/List_of_United_States_cities_by_population
    INSERT INTO @tblCity(Name, statecode, longitude, latitude, popul, surface) VALUES('New York', 'NY', '40.77', '73.98', '8175133', '302.6'),('Los Angeles', 'CA', '33.93', '118.4', '3792621', '468.7'),('Chicago', 'IL', '41.98', '87.9', '2695598', '227.6'),('Houston', 'TX', '29.97', '95.35', '2099451', '599.6'),('Philadelphia', 'PA', '39.88', '75.25', '1526006', '134.1'),('Phoenix', 'AZ', '33.43', '112.02', '1445632', '516.7'),('San Antonio', 'TX', '29.53', '98.47', '1327407', '460.9'),('San Diego', 'CA', '32.82', '117.17', '1307402', '325.2'),('Dallas', 'TX', '32.97', '97.03', '1197816', '340.5'),('San Jose', 'CA', '37.37', '121.92', '945942', '176.5'),('Jacksonville', 'NC', '34.82', '81.7', '821784', '747'),('Indianapolis', 'IN', '39.73', '86.27', '820445', '361.4'),('San Francisco', 'CA', '37.75', '122.68', '805235', '46.9'),('Austin', 'TX', '39.83', '117.13', '790390', '297.9'),('Columbus', 'OH', '41.45', '97.35', '787033', '217.2'),('Fort Worth', 'TX', '32.82', '97.35', '741206', '339.8'),('Charlotte', 'VA', '38.13', '80.93', '731424', '297.7'),('Detroit', 'MN', '46.82', '95.88', '713777', '138.8'),('El Paso', 'TX', '31.8', '106.4', '649121', '255.2'),('Memphis', 'TN', '35.35', '90', '646889', '315.1'),('Baltimore', 'MD', '39.33', '76.67', '620961', '80.9'),('Boston', 'MA', '42.37', '71.03', '617594', '48.3'),('Seattle', 'WA', '47.53', '122.3', '608660', '83.9'),('Washington', 'DC', '38.95', '77.46', '601723', '61'),('Nashville', 'TN', '36.12', '86.68', '601222', '475.1'),('Denver', 'CO', '39.75', '104.87', '600158', '153'),('Louisville', 'KY', '38.23', '85.73', '597337', '325.2'),('Milwaukee', 'WI', '43.12', '88.05', '594833', '96.1'),('Portland', 'OR', '45.6', '122.6', '583776', '133.4'),('Las Vegas', 'NV', '36.08', '115.17', '583756', '135.8'),('Albuquerque', 'NM', '35.05', '106.6', '545852', '187.7'),('Tucson', 'AZ', '32.12', '110.93', '520116', '226.7'),('Fresno', 'CA', '36.77', '119.72', '494665', '112'),('Sacramento', 'CA', '38.7', '121.6', '466488', '97.9'),('Long Beach', 'CA', '33.82', '118.15', '462257', '50.3'),('Kansas City', 'MO', '39.32', '94.72', '459787', '315'),('Atlanta', 'GA', '33.88', '84.52', '420003', '133.2'),('Omaha', 'NE', '41.3', '95.9', '408958', '127.1'),('Raleigh', 'NC', '35.87', '78.78', '403892', '142.9'),('Miami', 'FL', '25.92', '80.43', '399457', '35.9'),('Cleveland', 'OH', '41.57', '81.87', '396815', '77.7'),('Tulsa', 'OK', '36.2', '95.9', '391906', '196.8'),('Oakland', 'CA', '37.73', '122.22', '390724', '55.8'),('Minneapolis', 'MN', '45.07', '93.47', '382578', '54'),('Wichita', 'TX', '37.65', '98.5', '382368', '159.3'),('Bakersfield', 'CA', '35.43', '119.05', '347483', '142.2'),('New Orleans', 'LA', '30.03', '90.25', '343829', '169.4'),('Honolulu', 'HI', '21.35', '157.93', '337256', '60.5'),('Tampa', 'FL', '27.97', '82.53', '335709', '113.4'),('Aurora', 'OR', '45.25', '122.75', '325078', '154.7'),('Santa Ana', 'CA', '33.67', '117.88', '324528', '27.3'),('Pittsburgh', 'PA', '40.5', '80.22', '305704', '55.4'),('Riverside', 'CA', '33.95', '117.45', '303871', '81.1'),('Cincinnati', 'OH', '39.1', '84.67', '296943', '77.9'),('Lexington', 'KY', '38.05', '85', '295803', '283.6'),('Anchorage', 'AK', '61.22', '150.02', '291826', '1704.7'),('Stockton', 'CA', '37.9', '121.25', '291707', '61.7'),('Toledo', 'WA', '46.48', '122.8', '287208', '80.7'),('Saint Paul', 'MN', '44.93', '93.05', '285068', '52'),('Newark', 'NJ', '40.7', '74.17', '277140', '24.2'),('Greensboro', 'NC', '36.08', '79.95', '269666', '126.5'),('Buffalo', 'NY', '42.93', '78.73', '261310', '40.4'),('Lincoln', 'NE', '40.85', '96.75', '258379', '89.1'),('Fort Wayne', 'IN', '41', '85.2', '253691', '110.6'),('Norfolk', 'VA', '41.98', '97.43', '242803', '54.1'),('Orlando', 'FL', '28.55', '81.33', '238300', '102.4'),('Laredo', 'TX', '27.53', '99.47', '236091', '88.9'),('Madison', 'WI', '43.13', '89.33', '233209', '76.8'),('Winston-Salem', 'NC', '36.13', '80.23', '229617', '132.4'),('Lubbock', 'TX', '33.65', '101.82', '229573', '122.4'),('Baton Rouge', 'LA', '30.53', '91.15', '229493', '76.9'),('Reno', 'NV', '39.5', '119.78', '225221', '103'),('Chesapeake', 'VA', '37.5', '76.2', '222209', '340.8'),('Scottsdale', 'AZ', '33.62', '111.92', '217385', '183.9'),('Birmingham', 'AL', '33.57', '86.75', '212237', '146.1'),('Rochester', 'NY', '43.92', '92.5', '210565', '54.6'),('Spokane', 'WA', '47.67', '117.53', '208916', '59.2'),('Montgomery', 'AL', '32.3', '86.4', '205764', '159.6'),('Boise', 'ID', '43.57', '116.22', '205671', '79.4'),('Richmond', 'VA', '37.5', '77.33', '204214', '59.8'),('Des Moines', 'IA', '41.53', '93.65', '203433', '80.9'),('Modesto', 'CA', '37.63', '120.95', '201165', '36.9'),('Fayetteville', 'NC', '36', '94.17', '200654', '145.8'),('Shreveport', 'LA', '32.52', '93.82', '199311', '105.4'),('Akron', 'CO', '40.17', '103.22', '199110', '62'),('Tacoma', 'WA', '47.27', '122.58', '198397', '49.7'),('Oxnard', 'CA', '34.2', '119.2', '197899', '26.9'),('Augusta', 'ME', '44.32', '81.97', '195844', '302.5'),('Mobile', 'AL', '30.68', '88.25', '195111', '139.1'),('Little Rock', 'AR', '35.22', '92.38', '193524', '119.2'),('Amarillo', 'TX', '35.23', '101.7', '190695', '99.5'),('Grand Rapids', 'MN', '47.22', '93.52', '188040', '44.4'),('Tallahassee', 'FL', '30.38', '84.37', '181376', '100.2'),('Worcester', 'MA', '42.27', '71.87', '181045', '37.4'),('Newport News', 'VA', '37.13', '76.5', '180719', '68.7'),('Huntsville', 'AL', '34.65', '86.77', '180105', '209.1'),('Knoxville', 'TN', '35.82', '83.98', '178874', '98.5'),('Providence', 'RI', '41.73', '71.43', '178042', '18.4'),('Brownsville', 'TX', '25.9', '97.43', '175023', '132.3'),('Jackson', 'WY', '43.6', '110.73', '173514', '111'),('Santa Rosa', 'CA', '38.52', '122.82', '167815', '41.3'),('Chattanooga', 'TN', '35.03', '85.2', '167674', '137.2'),('Ontario', 'OR', '44.02', '117.62', '163924', '49.9'),('Springfield', 'MO', '39.85', '93.38', '159498', '81.7'),('Lancaster', 'PA', '40.13', '118.22', '156633', '94.3'),('Eugene', 'OR', '44.12', '123.22', '156185', '43.7'),('Salem', 'OR', '44.92', '123', '154637', '47.9'),('Peoria', 'IL', '40.67', '89.68', '154065', '174.4'),('Sioux Falls', 'SD', '43.58', '96.73', '153888', '73'),('Rockford', 'IL', '42.2', '89.1', '152871', '61.1'),('Palmdale', 'CA', '35.05', '118.13', '152750', '106'),('Corona', 'NM', '34.1', '105.68', '152374', '38.8'),('Salinas', 'CA', '36.67', '121.6', '150441', '23.2'),('Torrance', 'CA', '33.8', '118.33', '145438', '20.5'),('Syracuse', 'NY', '43.12', '76.12', '145170', '25'),('Bridgeport', 'CT', '41.17', '73.13', '144229', '16'),('Hayward', 'CA', '37.65', '122.12', '144186', '45.3'),('Dayton', 'OH', '39.9', '84.2', '141527', '55.7'),('Alexandria', 'MN', '45.87', '95.38', '139966', '15'),('Savannah', 'GA', '32.13', '81.2', '136286', '103.2'),('Fullerton', 'CA', '33.87', '117.97', '135161', '22.4'),('Clarksville', 'TN', '36.62', '87.42', '132929', '97.6'),('McAllen', 'TX', '26.18', '98.23', '129877', '48.3'),('New Haven', 'CT', '41.27', '72.9', '129779', '18.7'),('Columbia', 'SC', '38.82', '92.22', '129272', '132.2'),('Killeen', 'TX', '31.08', '97.68', '127921', '53.6'),('Topeka', 'KS', '39.07', '95.67', '127473', '60.2'),('Cedar Rapids', 'IA', '41.88', '91.7', '126326', '70.8'),('Olathe', 'KS', '38.85', '94.9', '125872', '59.7'),('Elizabeth', 'NC', '36.27', '76.18', '124969', '12.3'),('Waco', 'TX', '31.62', '97.22', '124805', '89'),('Hartford', 'CT', '41.73', '72.65', '124775', '17.4'),('Visalia', 'CA', '36.32', '119.4', '124442', '36.2'),('Gainesville', 'FL', '29.68', '82.27', '124354', '61.3'),('Concord', 'NH', '43.2', '122.05', '122067', '30.5'),('Miramar', 'CA', '32.87', '117.15', '122041', '29.5'),('Lafayette', 'LA', '30.2', '92', '120623', '49.2'),('Charleston', 'WV', '38.37', '81.6', '120083', '109'),('Beaumont', 'CA', '33.93', '116.95', '118296', '82.8'),('Allentown', 'PA', '40.65', '75.43', '118032', '17.5'),('Evansville', 'IN', '38.05', '87.53', '117429', '44.2'),('Abilene', 'TX', '32.42', '99.68', '117063', '106.8'),('Athens', 'OH', '39.21', '83.32', '115452', '116.4'),('Lansing', 'MI', '42.77', '84.6', '114297', '36'),('Ann Arbor', 'MI', '42.22', '83.75', '113934', '27.8'),('El Monte', 'CA', '34.08', '118.03', '113475', '9.6'),('Provo', 'UT', '40.22', '111.72', '112488', '41.7'),('Midland', 'TX', '31.95', '102.18', '111147', '72.1'),('Norman', 'OK', '35.23', '97.47', '110925', '178.8'),('Manchester', 'NH', '42.93', '71.43', '109565', '33.1'),('Pueblo', 'CO', '38.28', '104.52', '106595', '53.6'),('Wilmington', 'VT', '42.88', '77.92', '106476', '51.5'),('Fargo', 'ND', '46.9', '96.8', '105549', '48.8'),('Carlsbad', 'NM', '33.13', '117.28', '105328', '37.7'),('Fairfield', 'NJ', '40.87', '74.28', '105321', '37.4'),('Billings', 'MT', '45.8', '108.53', '104170', '43.4'),('Green Bay', 'WI', '44.48', '88.13', '104057', '45.5'),('Burbank', 'CA', '34.2', '118.37', '103340', '17.3'),('Flint', 'MI', '42.97', '83.75', '102434', '33.4'),('Erie', 'PA', '42.08', '80.18', '101786', '19.1'),('South Bend', 'IN', '41.7', '86.32', '101168', '41.5')
    
    DECLARE @tblLatinWords TABLE (LatinWordsId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    INSERT INTO @tblLatinWords VALUES ('ad'),('do'),('ea'),('et'),('eu'),('ex'),('id'),('in'),('ut'),('non'),('qui'),('sed'),('sit'),('est'),('duis'),('elit'),('enim'),('esse'),('amet'),('anim'),('aute'),('sunt'),('sint'),('quis'),('nisi'),('lorem'),('velit'),('nulla'),('dolor'),('culpa'),('magna'),('minim'),('ipsum'),('irure'),('exclamo'),('labore'),('mollit'),('dolore'),('cillum'),('aliqua'),('fugiat'),('tempor'),('veniam'),('ullamco'),('nostrud'),('officia'),('aliquip'),('commodo'),('eiusmod'),('laboris'),('laborum'),('deserunt'),('animus'), ('pariatur'),('proident'),('occaecat'),('prae'),('penitus'),('voluptate'),('misericordia'),('consequat'),('cupidatat'),('excepteur'),('incididunt'),('consectetur'),('adipisicing'),('numerus'),('exercitation'),('reprehenderit')
    DECLARE @tblColor TABLE (ColorId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblMoreColor TABLE (ColorId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblFabricType TABLE (FabricTypeId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblFabricExtra TABLE (FabricExtraId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, Name varchar(40))
    DECLARE @tblTempProduct TABLE (ProductId [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY, ProductName varchar(80))
    INSERT INTO @tblColor(name) VALUES ('white'),('cream'),('lemon'),('yellow'),('cerise'),('pink'),('lilac'),('purple'),('sky blue'),('turquoise'),('royal blue'),('navy'),('lime'),('grass'),('green'),('orange'),('rust'),('red'),('bordeaux'),('khakhi'),('beige'),('black'),('multicolor')
    INSERT INTO @tblFabricType(name) VALUES ('fleece fabric'),('sequin fabric'),('100% cotton jersey fabric'),('gingham fabric'),('polycotton fabric'),('polyester organza voile fabric'),('satin fabric'),('faux fur'),('calico'),('stretch fabric'),('felt fabric'),('velvet fabric'),('leatherette fabric'),('curtain lining'),('stretch wool suiting fabric'),('crushed velvet dress fabric'),('corduroy fabric')
    INSERT INTO @tblFabricExtra(name) VALUES ('mushrooms'),('ducks'),('flowers'),('circles'),('hearts'),('bicycles'),('bears'),('dots'),('squares'),('smurfs'),('mickeys'),('pearls')
    -- not used
    --INSERT INTO @tblMoreColor(name) VALUES ('alice blue'),('antique white'),('aquamarine'),('azure'),('beige'),('bisque'),('black'),('blanched almond'),('blue'),('blue violet'),('brown'),('burlywood'),('cadet blue'),('chartreuse'),('chocolate'),('coral'),('cornflower blue'),('cornsilk'),('cyan'),('dark goldenrod'),('dark green'),('dark khaki'),('dark olive green'),('dark orange'),('dark orchid'),('dark salmon'),('dark sea green'),('dark slate blue'),('dark slate gray'),('dark turquoise'),('dark violet'),('deep pink'),('deep sky blue'),('dim gray'),('dodger blue'),('firebrick'),('floral white'),('forest green'),('gainsboro'),('ghost white'),('gold'),('goldenrod'),('gray'),('green yellow'),('honeydew'),('hot pink'),('indian red'),('ivory'),('khaki'),('lavender'),('lavender blush'),('lawn green'),('lemon chiffon'),('light blue'),('light coral'),('light cyan'),('light goldenrod'),('light goldenrod yellow'),('light gray'),('light pink'),('light salmon'),('light sea green'),('light sky blue'),('light slate blue'),('light slate gray'),('light steel blue'),('light yellow'),('lime green'),('linen'),('maroon'),('medium aquamarine'),('medium blue'),('medium orchid'),('medium purple'),('medium sea green'),('medium slate blue'),('medium spring green'),('medium turquoise'),('medium violet red'),('midnight blue'),('mint cream'),('misty rose'),('moccasin'),('navajo white'),('navy'),('old lace'),('olive drab'),('orange'),('orange red'),('orchid'),('pale goldenrod'),('pale green'),('pale turquoise'),('pale violet red'),('papaya whip'),('peach puff'),('peru'),('pink'),('plum'),('powder blue'),('purple'),('red'),('rosy brown'),('royal blue'),('saddle brown'),('salmon'),('sandy brown'),('sea green'),('seashell'),('sienna'),('sky blue'),('slate blue'),('slate gray'),('snow'),('spring green'),('steel blue'),('tan'),('thistle'),('tomato'),('turquoise'),('violet'),('violet red'),('wheat'),('white'),('white smoke'),('yellow'),('yellow green')
    DECLARE @ProductName AS VARCHAR(80)
    DECLARE @ColorCount   AS INTEGER = (SELECT COUNT(*) FROM @tblColor)
    DECLARE @MoreColorCount   AS INTEGER = (SELECT COUNT(*) FROM @tblMoreColor)
    DECLARE @FabricTypeCount   AS INTEGER = (SELECT COUNT(*) FROM @tblFabricType)
    DECLARE @FabricExtraCount   AS INTEGER = (SELECT COUNT(*) FROM @tblFabricExtra)
        
    DECLARE @Color        AS VARCHAR(80)
    DECLARE @Color2       AS VARCHAR(80)
    DECLARE @MoreColor    AS VARCHAR(80)
    DECLARE @FabricType   AS VARCHAR(80)
    DECLARE @FabricExtra  AS VARCHAR(80)
    CREATE TABLE Product (ProductId INTEGER IDENTITY (1, 1) NOT NULL CONSTRAINT pk_ProductId PRIMARY KEY, ProductName varchar(80), Price SMALLMONEY, Active BIT, Stock NUMERIC(18,3))

    INSERT INTO Product(ProductName, Price, Active, Stock) 
        SELECT UPPER(SUBSTRING(FullName,1,1))+SUBSTRING(FullName,2,255) [FullName], 
        (50 + ABS(CHECKSUM([Fabric])) % 50 + CASE WHEN [Motif]='' THEN 0 ELSE 10 + ABS(CHECKSUM([Motif]) % 10) END) /10.0 [Price],
        1,
        FLOOR(RAND() * 200000)/100.0
        FROM 
        (SELECT C.name + ' ' + F.NAME [FullName], F.NAME [Fabric],'' [Motif]
                FROM @tblColor C
                CROSS JOIN @tblFabricType F
            UNION ALL
                SELECT C.name + ' ' + F.NAME + ' with ' + C2.NAME + ' ' + E.NAME [FullName], F.Name [Fabric], e.Name [Motif] 
                    FROM @tblColor C
                    CROSS JOIN @tblFabricType F
                    CROSS JOIN @tblColor C2
                    CROSS JOIN @tblFabricExtra E
                    WHERE C.NAME != C2.NAME 
                    AND CHECKSUM(C.name + ' ' + F.NAME + ' with ' + C2.NAME + ' ' + E.NAME) % 100 = 0 -- take pseudo-random 1%
                    ) NAMES
    
    DECLARE @MaleFirstNameCount   AS INTEGER = (SELECT COUNT(*) FROM @tblMaleFirstName)
    DECLARE @FemaleFirstNameCount AS INTEGER = (SELECT COUNT(*) FROM @tblFemaleFirstName)
    DECLARE @LastNameCount        AS INTEGER = (SELECT COUNT(*) FROM @tblLastName)
    DECLARE @OccupationCount      AS INTEGER = (SELECT COUNT(*) FROM Occupation)
    
    DECLARE @StreetNamesCount AS INTEGER = (SELECT COUNT(*) FROM @tblStreetNames)
    DECLARE @StreetZonesCount AS INTEGER = (SELECT COUNT(*) FROM @tblStreetZones)
    DECLARE @tblStreetTypesCount AS INTEGER = (SELECT COUNT(*) FROM @tblStreetTypes)
    DECLARE @CityCount            AS INTEGER = (SELECT COUNT(*) FROM @tblCity)
    DECLARE @LatinWordsCount      AS INTEGER = (SELECT COUNT(*) FROM @tblLatinWords)
    DECLARE @FirstName            AS VARCHAR(255)
    DECLARE @MiddleName           AS VARCHAR(255)
    DECLARE @LastName             AS VARCHAR(255)
    
    
    DECLARE @DateOfBirth          AS DATETIME
    DECLARE @CreditRating         AS INTEGER
    DECLARE @Gender               AS CHAR
    DECLARE @Dummy                AS INTEGER = RAND(@Randomizer)
    DECLARE @XCode                AS CHAR(7)
    DECLARE @OccupationId         AS INTEGER
    
    DECLARE @TelephoneNumber      AS VARCHAR(20)
    
    DECLARE @CityId               AS INTEGER
    DECLARE @Street1              AS VARCHAR(100)
    DECLARE @Street2              AS VARCHAR(100)
    DECLARE @City                 AS VARCHAR(100)
    DECLARE @ZipCode              AS VARCHAR(15)
    DECLARE @Longitude            AS FLOAT
    DECLARE @Latitude             AS FLOAT
    
    DECLARE @Notes                AS VARCHAR(max)
    
    DECLARE @ClientId             AS INTEGER = 0
    DECLARE @Number                  AS INTEGER = 0
    WHILE @ClientId < @CreateClients
    BEGIN
        SET @ClientId = @ClientId + 1
        
        -- Name and personal info
        IF RAND() >= 0.5    
            SELECT @FirstName = (SELECT Name FROM @tblMaleFirstName WHERE MaleFirstNameId = (FLOOR(POWER(RAND(),1.5) * @MaleFirstNameCount) + 1)),
                 @MiddleName = (SELECT Name FROM @tblMaleFirstName WHERE MaleFirstNameId = (FLOOR(POWER(RAND(),1.2) * @MaleFirstNameCount) + 1)),
                 @Gender = 'M'
        ELSE
            SELECT @FirstName = (SELECT Name FROM @tblFemaleFirstName WHERE FemaleFirstNameId = (FLOOR(POWER(RAND(),1.5) * @FemaleFirstNameCount) + 1)), 
                @MiddleName = (SELECT Name FROM @tblFemaleFirstName WHERE FemaleFirstNameId = (FLOOR(POWER(RAND(),1.2) * @FemaleFirstNameCount) + 1)), 
                @Gender = 'F'
        
        IF RAND()>0.9 SET @MiddleName = NULL     -- we clear the middle Name for 10% of the population 
        SET @LastName = (SELECT Name FROM @tblLastName WHERE LastNameId = (FLOOR(POWER(RAND(),1.5) * @LastNameCount) + 1))
        
        SET @DateOfBirth = CONVERT(datetime, '1991-01-11', 126) - FLOOR(POWER(RAND(),1.5)* 365.0 * 80.0) -- clients are between 18 and 98 years old
        SET @xCode = CHAR(FLOOR(RAND() * 26)+65) + CHAR(FLOOR(RAND() * 26)+65) + CHAR(FLOOR(RAND() * 10)+48)
             + ' ' + CHAR(FLOOR(RAND() * 10)+48) + CHAR(FLOOR(RAND() * 26)+65) + CHAR(FLOOR(RAND() * 26)+65)
        SET @OccupationId = FLOOR(RAND() * @OccupationCount) + 1
        SET @CityId = (FLOOR(POWER(RAND(),1.5) * @CityCount) + 1)
        SET @CreditRating = FLOOR(POWER(RAND(), 1 + (ABS(CHECKSUM(@CityId)) % 7.0) * (@OccupationId / @OccupationCount)) * 10)
        
        -- Address
        SELECT @City = C.Name,
            @Longitude = C.longitude + RAND() - 0.5,
            @Latitude = C.latitude + RAND() * 2 - 1
            FROM @tblCity C  WHERE C.CityId = @CityId
        SET @Street1 = (SELECT Name FROM @tblStreetNames WHERE StreetNamesId = (FLOOR(POWER(RAND(),1.5) * @StreetNamesCount) + 1))
        
        IF CHARINDEX('%sn%',@Street1) > 0 SET @Street1 = REPLACE(@Street1,'%sn%', FLOOR(POWER(RAND(),1.5) * 5000 + 1))
        IF CHARINDEX('%sz%',@Street1) > 0 SET @Street1 = REPLACE(@Street1,'%sz%', (SELECT Name FROM @tblStreetZones WHERE StreetZoneId = (FLOOR(RAND()*  @StreetZonesCount) + 1)))
        IF CHARINDEX('%st%',@Street1) > 0 SET @Street1 = REPLACE(@Street1,'%st%', (SELECT Name FROM @tblStreetTypes WHERE StreetTypesId = (FLOOR(RAND()*  RAND() * @tblStreetTypesCount) + 1)))
        IF CHARINDEX('%nth%',@Street1) > 0
        BEGIN
            SET @Number = FLOOR(RAND()*RAND()*200)+1
            SELECT @Street1 = REPLACE(@Street1,'%nth%', 
                CAST(@Number AS VARCHAR(255)) + CASE WHEN @Number IN (11,12,13) THEN 'th' ELSE CASE @Number % 10 WHEN 1 THEN 'st' WHEN 2 THEN 'nd' WHEN 3 THEN 'rd' ELSE 'th' END END)
        END
        IF CHARINDEX('%rn%',@Street1) > 0 SET @Street1 = REPLACE(@Street1,'%rn%', CAST(FLOOR(RAND() * 95 + 5) AS VARCHAR(255)))
        IF CHARINDEX('%bn%',@Street1) > 0 SET @Street1 = REPLACE(@Street1,'%bn%', CAST(FLOOR(RAND() * 1500 + 5) AS VARCHAR(255)))
        SET @Street1 = RTRIM(LTRIM(REPLACE(REPLACE(@Street1,'   ',' '),'  ',' ')))
        SET @Street2 = NULL
        SET @TelephoneNumber = (SELECT '(' + CAST(FLOOR(RAND()* 900)+100 AS VARCHAR(255)) +  ') ' + CAST(FLOOR(RAND()* 900)+100 AS VARCHAR(255)) + ' - ' + right('0000' + CAST(FLOOR(RAND()* 10000) AS VARCHAR(255)) , 4))
        SET @ZipCode = CAST((SELECT FLOOR(RAND()* 90000) + 10000) AS VARCHAR(255))
        IF (RAND()>0.5)
        BEGIN
            IF (RAND()>0.5) 
                SET @Street2 = 'Flat ' + CAST(FLOOR(POWER(RAND(),1.5) * 25 + 1) AS VARCHAR(255))
            ELSE
            BEGIN
                SET @Number = FLOOR(RAND()*RAND()*15)+1
                SELECT @Street2 = CAST(@Number AS VARCHAR(255)) + CASE WHEN @Number IN (11,12,13) THEN 'th' ELSE CASE @Number % 10 WHEN 1 THEN 'st' WHEN 2 THEN 'nd' WHEN 3 THEN 'rd' ELSE 'th' END END
                    + ' Floor'
            END
        END
        
        -- notes
        
        DECLARE @Word AS VARCHAR(255)
                    
        DECLARE @String        AS VARCHAR(MAX)
        DECLARE @StringLength  AS INT
        DECLARE @NotesLength   AS INT
        SET @NotesLength = FLOOR(POWER(RAND(),1.5) * 100) + 1
        SET @Notes = null
        WHILE @NotesLength > 0
        BEGIN
            SET @NotesLength = @NotesLength - 1
            SET @StringLength = FLOOR(POWER(RAND(),1.5) * 7) + 3
            SET @String = null
            WHILE @StringLength > 0
            BEGIN
                SET @StringLength = @StringLength - 1
                SELECT @Word = (SELECT Name FROM @tblLatinWords WHERE LatinWordsId = (FLOOR(POWER(RAND(),1.5) * @LatinWordsCount) + 1))
                SET @String = CASE WHEN @String IS NULL THEN UPPER(SUBSTRING(@Word,1,1)) + SUBSTRING(@Word,2,LEN(@Word)-1)
                    ELSE @String +' '+ @Word END 
            END
            SET @String = @String + '.'
            SET @Notes = CASE WHEN @Notes IS NULL THEN @String
                ELSE @Notes + ' ' + @String END 
        END
        INSERT INTO @tblTempClient    -- WITH (NOWAIT) doesn't seem to improve time
            (FirstName, MiddleName, LastName, DateOfBirth, Gender, CreditRating, XCode, OccupationId, 
            TelephoneNumber, Street1, Street2, City, ZipCode, Longitude, Latitude, Notes) 
            VALUES (@FirstName, @MiddleName,  @LastName,  @DateOfBirth, @Gender, @CreditRating, @XCode, @OccupationId, 
            @TelephoneNumber, @Street1, @Street2, @City, @ZipCode, @Longitude, @Latitude, @Notes)
            
        IF (@ClientId % @BulkInsertSize = 0) OR (@ClientId = @CreateClients)
        BEGIN
            PRINT 'Creating Clients: ' + CAST((@ClientId * 100 / @CreateClients) AS VARCHAR) + '%                                                                                                                                                                                      '
            INSERT INTO Client SELECT * FROM @tblTempClient
            DELETE FROM @tblTempClient -- why can't we truncate temp-table?
        END
    END 
    DECLARE @ProductCount         AS INTEGER = (SELECT COUNT(*) FROM Product)
    DECLARE @ClientCount          AS INTEGER = (SELECT COUNT(*) FROM Client)
    DECLARE @OrderId              AS INTEGER = 0
    DECLARE @LineTotal            AS NUMERIC(18,2)
    DECLARE @OrderTotal           AS NUMERIC(18,2)
    DECLARE @ProductId            AS INTEGER
    DECLARE @Qty                  AS NUMERIC(18,3)
    
    CREATE TABLE [Order] (OrderId INTEGER NOT NULL CONSTRAINT pkOrderId PRIMARY KEY, ClientId INT, OrderDate DATETIME,
        OrderTotal NUMERIC(18,2), OrderStatus CHAR)
    
    DECLARE @tblTempOrder TABLE (OrderId INT, ClientId INT, OrderDate DATETIME, OrderTotal NUMERIC(18,2), OrderStatus CHAR)
    DECLARE @tblTempOrderLine TABLE (OrderId INT, LineNumber INT, ProductId INT, Qty NUMERIC(18, 3), LineTotal NUMERIC(18,2))
    WHILE @OrderId < @CreateOrders
    BEGIN
        SET @OrderId = @OrderId + 1
        DECLARE @OrderDate AS DATETIME =  CONVERT(datetime, '2011-01-11', 126) -  FLOOR(3650.0 * (@CreateOrders - @OrderId) / @CreateOrders ) + 0.375 + 0.5 * (1 - POWER(RAND(),1.5));
        INSERT INTO @tblTempOrder(OrderId, ClientId, OrderDate, OrderStatus) 
            VALUES(
            @OrderId,
            FLOOR(POWER(RAND(),1.5) * @ClientCount) + 1,
            @OrderDate,
            CASE    
                WHEN @OrderDate > '1 June, 2011' AND RAND()> 0.5 THEN -- Recent orders
                    CASE FLOOR(RAND()*2)
                        WHEN 0 THEN 'O' -- Open
                        ELSE 'S' -- StandBy
                    END
                
                ELSE
                    CASE FLOOR(RAND()*10)
                        WHEN 0 THEN 'R' -- Refunded
                        WHEN 1 THEN 'C' -- Canceled
                        WHEN 2 THEN 'C' -- Canceled
                        ELSE 'P' -- Paid
                    END
            END 
            )
        
        DECLARE @LineNumber AS INTEGER = 1 + FLOOR(POWER(RAND(),1.5) * 15)
        SET @OrderTotal = 0
            
        WHILE @LineNumber > 0
        BEGIN
            SET @ProductId = FLOOR(POWER(RAND(),1.5) * @ProductCount) + 1
            SET @Qty = FLOOR(RAND() * 20 + 1) * FLOOR(RAND() * 20 + 1) * 5.0 / POWER(10,FLOOR(RAND() * 3))
            SET @LineTotal = ROUND(@Qty * (SELECT Price FROM Product WHERE ProductId = @ProductId),2)
            SET @OrderTotal = @OrderTotal + @LineTotal
            
            INSERT INTO @tblTempOrderLine(OrderId, LineNumber, ProductId, Qty, LineTotal) 
            VALUES(@OrderId, 
                @LineNumber,
                @ProductId,
                @Qty,
                @LineTotal)
            SET @LineNumber = @LineNumber - 1
        END    
                
        UPDATE @tblTempOrder SET OrderTotal = @OrderTotal WHERE OrderId = @OrderId
        
        IF (@OrderId % @BulkInsertSize = 0) OR (@OrderId = @CreateOrders)
        BEGIN
            PRINT 'Creating Orders: ' + CAST((@OrderId * 100 / @CreateOrders) AS VARCHAR) + '%                                                                                                                                                                                      '
            INSERT INTO [Order] SELECT * FROM @tblTempOrder
            DELETE FROM @tblTempOrder
            INSERT INTO [OrderLine] SELECT * FROM @tblTempOrderLine
            DELETE FROM @tblTempOrderLine
        END
    END
    
    -- Create Indexes only after the data is in for speed
    
    PRINT 'Creating Indexes and foreign keys'
    
    CREATE INDEX Client_firstName ON Client(firstName)
    CREATE INDEX Client_lastName ON Client(lastName) 
    CREATE INDEX Client_dateofbirth ON Client(dateofbirth) 
    CREATE INDEX Client_city ON Client(city) 
    ALTER TABLE dbo.Client ADD CONSTRAINT FK_Client_Occupation 
        FOREIGN KEY(OccupationId) 
        REFERENCES dbo.Occupation(OccupationId) 
        ON UPDATE  NO ACTION 
        ON DELETE  NO ACTION 
        
        
    ALTER TABLE dbo.[Order] ADD CONSTRAINT fk_Order_ClientId FOREIGN KEY ( ClientId ) REFERENCES dbo.Client ( ClientId ) 
    ALTER TABLE dbo.OrderLine ADD CONSTRAINT fk_OrderLine_ProductId FOREIGN KEY ( ProductId ) REFERENCES dbo.Product ( ProductId ) 
    ALTER TABLE dbo.OrderLine ADD CONSTRAINT fk_OrderLine_OrderId FOREIGN KEY ( OrderId ) REFERENCES dbo.[Order] ( OrderId )
        
    DECLARE @TimeFinished AS DATETIME = GetDate()
    PRINT 'Fabrics table and data created (in ' + CAST(DATEDIFF(second, @TimeStarted, @TimeFinished) AS VARCHAR(max)) + ' s)'   
    -- Simple Count
	SET STATISTICS IO ON
    SELECT 'Client' [Table], COUNT(*) [Count] FROM Client
        UNION SELECT 'Order', COUNT(*) FROM [Order]
        UNION SELECT 'OrderLine', COUNT(*) FROM OrderLine
        UNION SELECT 'Product', COUNT(*) FROM Product
        UNION SELECT 'Occupation', COUNT(*) FROM Occupation
        
    --    Table      Count
    -- ---------- -----------
    -- Client     2500
    -- Occupation 330
    -- Order      5000
    -- OrderLine  32705
    -- Product    1554     
END

GO
USE [master]
GO
ALTER DATABASE [Fabrics] SET  READ_WRITE 
GO
