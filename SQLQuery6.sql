DROP TABLE IF EXISTS [Services];
CREATE TABLE [Services](
    ServiceID INT IDENTITY(1, 1),
    ServiceName varchar(250),
    StatusID INT
);

DROP TABLE IF EXISTS [ServiceStatus];
CREATE TABLE [ServiceStatus](
    StatusID INT IDENTITY(1, 1),
    Status varchar(250)
);

DROP TABLE IF EXISTS [Sales];
CREATE TABLE [Sales](
    ServiceID INT,
    Guest varchar(250),
    Price INT,
    DatePurchased DATE,
    AmountPurchased INT,
    TavernID INT
);
DROP TABLE IF EXISTS [GoodsReceived];
CREATE TABLE [GoodsReceived](
    SupplyID INT,
    TavernID INT,
    Cost INT,
    Amount INT,
    Date DATETIME
);
DROP TABLE IF EXISTS [Inventory];
CREATE TABLE [Inventory](
    SupplyID INT,
    TavernID INT,
    DateOfInventory DATETIME,
    Quantity INT
);
DROP TABLE IF EXISTS [Users];
CREATE TABLE [Users](
    UserID INT IDENTITY(1,1),
    UserName varchar(250),
    RoleID INT
);
DROP TABLE IF EXISTS [Tavern];
CREATE TABLE [Tavern](
    TavernID INT IDENTITY(1, 1),
    TavernName varchar(250),
    FloorCount INT,
    OwnerID INT,
    LocationID INT
);
ALTER TABLE [GoodsReceived]
ALTER COLUMN Date date;
ALTER TABLE [Inventory]
ALTER COLUMN DateOfInventory date;
DROP TABLE IF EXISTS [Supply];
CREATE TABLE [Supply](
	SupplyID INT IDENTITY(1, 1),
	SupplyName varchar(250),
	SupplyCost INT
);
DROP TABLE IF EXISTS [Role];
CREATE TABLE [Role](
	RoleID INT IDENTITY(1, 1),
	RoleName varchar(250)
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
VALUES ('Mace',60)
INSERT INTO [Supply]
VALUES ('Scythe',55)
INSERT INTO [Supply]
VALUES ('Booze',5)
INSERT INTO [Supply]
VALUES ('Mead',4)
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