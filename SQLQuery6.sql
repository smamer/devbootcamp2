DROP TABLE IF EXISTS [Role];
CREATE TABLE [Role](
	RoleID INT PRIMARY KEY IDENTITY(1, 1),
	RoleName varchar(250)
);
DROP TABLE IF EXISTS [Supply];
CREATE TABLE [Supply](
	SupplyID INT PRIMARY KEY IDENTITY(1, 1),
	SupplyName varchar(250),
	SupplyCost MONEY
);
DROP TABLE IF EXISTS [ServiceStatus];
CREATE TABLE [ServiceStatus](
    StatusID INT PRIMARY KEY IDENTITY(1, 1),
    Status varchar(250)
);
DROP TABLE IF EXISTS [Services];
CREATE TABLE [Services](
    ServiceID INT PRIMARY KEY IDENTITY(1, 1),
    ServiceName varchar(250),
    StatusID INT FOREIGN KEY REFERENCES ServiceStatus(StatusID)
);
DROP TABLE IF EXISTS [ServiceSupplies];
CREATE TABLE [ServiceSupplies](
	SupplyID INT FOREIGN KEY REFERENCES Supply(SupplyID),
	ServiceID INT FOREIGN KEY REFERENCES Services(ServiceID)
);
DROP TABLE IF EXISTS [Sales];
CREATE TABLE [Sales](
    ServiceID INT FOREIGN KEY REFERENCES Services(ServiceID),
    Guest varchar(250),
    Price MONEY,
    DatePurchased DATE,
    AmountPurchased INT,
    TavernID INT
);
DROP TABLE IF EXISTS [GoodsReceived];
CREATE TABLE [GoodsReceived](
    SupplyID INT FOREIGN KEY REFERENCES Supply(SupplyID),
    TavernID INT,
    Cost MONEY,
    Amount INT,
    Date DATETIME
);
DROP TABLE IF EXISTS [Inventory];
CREATE TABLE [Inventory](
    SupplyID INT FOREIGN KEY REFERENCES Supply(SupplyID),
    TavernID INT,
    DateOfInventory DATETIME,
    Quantity INT
);
DROP TABLE IF EXISTS [Users];
CREATE TABLE [Users](
    UserID INT IDENTITY(1,1),
    UserName varchar(250),
    RoleID INT FOREIGN KEY REFERENCES Role(RoleID)
);
DROP TABLE IF EXISTS [Tavern];
CREATE TABLE [Tavern](
    TavernID INT IDENTITY(1, 1),
    TavernName varchar(250),
    FloorCount INT,
    UserID INT,
    LocationID INT
);
ALTER TABLE [Tavern]
ADD PRIMARY KEY (TavernID);
ALTER TABLE [Users]
ADD PRIMARY KEY (UserID);
ALTER TABLE [Taverns]
ADD FOREIGN KEY (UserID) REFERENCES Users(UserID);
ALTER TABLE [GoodsReceived]
ADD FOREIGN KEY (TavernID) REFERENCES Tavern(TavernID);
ALTER TABLE [Sales]
ADD FOREIGN KEY (TavernID) REFERENCES Tavern(TavernID);
ALTER TABLE [GoodsReceived]
ALTER COLUMN Date date;
ALTER TABLE [Iventory]
ADD FOREIGN KEY (TavernID) REFERENCES Tavern(TavernID);
ALTER TABLE [Inventory]
ALTER COLUMN DateOfInventory date;
ALTER TABLE [Users]
ADD FOREIGN KEY (RoleID) REFERENCES Role(RoleID);
DROP TABLE IF EXISTS GuestStatus;
CREATE TABLE GuestStatus(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Status varchar(250)
);
DROP TABLE IF EXISTS Class;
CREATE TABLE Class(
	ID INT PRIMARY KEY IDENTITY(1,1),
	ClassType varchar(250)
);
DROP TABLE IF EXISTS Guests;
CREATE TABLE Guests(
	GuestID INT PRIMARY KEY IDENTITY(1,1),
	Names varchar(250),
	Notes varchar(250),
	Birthday date,
	Cakeday date,
	GuestStatus INT FOREIGN KEY REFERENCES GuestStatus(ID),
);
DROP TABLE IF EXISTS GuestClass;
CREATE TABLE GuestClass(
	GuestID INT FOREIGN KEY REFERENCES Guests(GuestID),
	Class INT FOREIGN KEY REFERENCES Class(ID),
	ClassLevel INT
);
INSERT INTO [GoodsReceived]
VALUES (1,1,10,10,'2022-02-23')
INSERT INTO [GoodsReceived]
VALUES (2,2,8,20,'2022-02-22')
INSERT INTO [GoodsReceived]
VALUES (1,2,6,18,'2022-02-23')
INSERT INTO [GoodsReceived]
VALUES (3,4,15,25,'2022-02-21')
INSERT INTO [GoodsReceived]
VALUES (5,1,10,18,'2022-02-20')
INSERT INTO [Inventory]
VALUES (1,1,'2022-02-20',30)
INSERT INTO [Inventory]
VALUES (4,2,'2022-02-23',40)
INSERT INTO [Inventory]
VALUES (4,1,'2022-02-22',100)
INSERT INTO [Inventory]
VALUES (5,1,'2022-02-22',180)
INSERT INTO [Inventory]
VALUES (4,1,'2022-02-20',5)
INSERT INTO [Sales]
VALUES (1,'John-Edwards',10,'2022-02-20',1,1)
INSERT INTO [Sales]
VALUES (2,'Frank-Sallula',20,'2022-02-22',3,4)
INSERT INTO [Sales]
VALUES (1,'Yennifer-Geralt',10,'2022-02-21',1,1)
INSERT INTO [Sales]
VALUES (4,'Domino-Domingo',8,'2022-02-20',1,5)
INSERT INTO [Sales]
VALUES (4,'Hon-Nolo',8,'2022-02-23',1,5)
INSERT INTO [Tavern] 
VALUES ('TavernTavern',5,1,1)
INSERT INTO [Tavern] 
VALUES ('Summit',5,2,2)
INSERT INTO [Tavern]
VALUES ('FinalSleep',4,3,3)
INSERT INTO [Tavern]
VALUES ('StayInn',5,4,4)
INSERT INTO [Tavern]
VALUES ('HotelMotel',5,5,5)
INSERT INTO [Services]
VALUES ('SwordSharpening',1)
INSERT INTO [Services]
VALUES ('Bandaging',1)
INSERT INTO [Services]
VALUES ('Mapping',1)
INSERT INTO [Services]
VALUES ('Horse-Stables',1)
INSERT INTO [Services]
VALUES ('Haircut',5)
INSERT INTO [ServiceStatus]
VALUES ('Active')
INSERT INTO [ServiceStatus]
VALUES ('Discontinued')
INSERT INTO [ServiceStatus]
VALUES ('Out-Of-Stock')
INSERT INTO [ServiceStatus]
VALUES ('Inactive')
INSERT INTO [ServiceStatus]
VALUES ('Discounted')
INSERT INTO [Supply]
VALUES ('Sword',50)
INSERT INTO [Supply]
VALUES ('Bandages',3)
INSERT INTO [Supply]
VALUES ('Hay',2)
INSERT INTO [Supply]
VALUES ('Knife',5)
INSERT INTO [Supply]
VALUES ('Map',10)
INSERT INTO [Users]
VALUES ('John-Jacob',1)
INSERT INTO [Users]
VALUES ('Hef-Mano',2)
INSERT INTO [Users]
VALUES ('William-Uni',3)
INSERT INTO [Users]
VALUES ('Peter-Nao',4)
INSERT INTO [Users]
VALUES ('Mike-Lisic',5)
INSERT INTO [Role]
VALUES ('Manager')
INSERT INTO [Role]
VALUES ('Custodian')
INSERT INTO [Role]
VALUES ('Librarian')
INSERT INTO [Role]
VALUES ('Secretary')
INSERT INTO [Role]
VALUES ('Blacksmith')
INSERT INTO [ServiceSupplies]
VALUES (1,1)
INSERT INTO [ServiceSupplies]
VALUES (2,2)
INSERT INTO [ServiceSupplies]
VALUES (3,4)
INSERT INTO [ServiceSupplies]
VALUES (4,5)
INSERT INTO [ServiceSupplies]
VALUES (5,3)
INSERT INTO [GuestStatus]
VALUES ('Healthy')
INSERT INTO [GuestStatus]
VALUES ('Sickly')
INSERT INTO [GuestStatus]
VALUES ('Injured')
INSERT INTO [GuestStatus]
VALUES ('Timid')
INSERT INTO [GuestStatus]
VALUES ('Aggressive')
INSERT INTO [Class]
VALUES ('Fighter')
INSERT INTO [Class]
VALUES ('Mage')
INSERT INTO [Class]
VALUES ('Rogue')
INSERT INTO [Class]
VALUES ('Healer')
INSERT INTO [Class]
VALUES ('Tank')
INSERT INTO [Guests]
VALUES ('Ulys-Hoakman','Very-quiet','1996-09-09','2018-04-28',4)
INSERT INTO [Guests]
VALUES ('Hammer-Phrok','Massive','1981-10-01','2015-02-14',5)
INSERT INTO [Guests]
VALUES ('Gen-Krim','Seems-trustworthy','1999-05-10','2020-07-06',1)
INSERT INTO [Guests]
VALUES ('Havert-Aik','Methodical','1998-09-21','2017-05-26',1)
INSERT INTO [Guests]
VALUES ('Owen-Wince','Missing-an-arm','1974-11-09','2009-08-07',3)
INSERT INTO [GuestClass]
VALUES (1,1,13)
INSERT INTO [GuestClass]
VALUES (1,3,8)
INSERT INTO [GuestClass]
VALUES (2,5,40)
INSERT INTO [GuestClass]
VALUES (3,4,34)
INSERT INTO [GuestClass]
VALUES (3,2,28)