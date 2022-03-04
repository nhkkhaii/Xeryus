create database XERYUS
use XERYUS

--
CREATE TABLE Account
(
	UserID	int not null IDENTITY(1,1),
	UserName varchar(50),
	Password varchar(50),
	Phone varchar(11),
	Email varchar(50),
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Status bit,
	CreatedDate Datetime default getdate(),
	Address nvarchar(250)
)
alter table Account add
constraint PK_AC_ID primary key(UserID)
--
create table Brand_of_Shoes
(
	Brand_of_ShoesID int not null IDENTITY(1,1),
	Brand_of_Shoes nvarchar(30),	
	Explain nvarchar(500),
	Questions_TimeAdded Datetime default getdate()
)
alter table Brand_of_Shoes add
constraint PK_BOS_BOSID primary key(Brand_of_ShoesID) 
--
create table Shoes
(
	ShoesID varchar(15) not null,
	ShoesName nvarchar(250),
	ShoesType nvarchar(50),
	Shoes_TimeAdded Datetime default getdate(),
	ShoesColor nvarchar(100),
	Brand_of_ShoesID int not null,
)
alter table Shoes add
constraint PK_S_SID primary key(ShoesID),
constraint FK_BOS_S_BOSID foreign key(Brand_of_ShoesID)
references Brand_of_Shoes(Brand_of_ShoesID)
on delete cascade
on update cascade
--

create table Branch
(
	BranchID int not null IDENTITY(1,1),
	BranchName nvarchar(250),
	BranchName_TimeAdded Datetime default getdate(),
	BranchAddress nvarchar(300) ,
	SubjectsID int not null,
)
alter table Branch add
constraint PK_B_BID primary key (BranchID)
--
create table Bill
(
	BillID int not null IDENTITY(1,1),
	BillName nvarchar(250),
	ShoesID varchar(15) not null,
	Bill_Createdtime Datetime default getdate(),
	BranchID int not null,
)
alter table Bill add
constraint PK_Bill_BID primary key(BillID),
constraint FK_S_Bill_SID foreign key(ShoesID)
references Shoes(ShoesID)
on delete cascade
on update cascade,
constraint FK_B_Bill_BID foreign key(BranchID)
references Branch(BranchID)
on delete cascade
on update cascade
--
create table Size
(
	IDSize int not null identity(1,1),
	SizeUS int,
	SizeVN int 
)
alter table Size add
constraint PK_SIZE primary key(IDSize)
--
create table Shoes_Price_Size
(
	ShoesID  varchar(15) not null,
	IDSize int not null,
	Price money
)
alter table Shoes_Price_Size add
constraint PK_S_SIZE_P primary key(ShoesID,IDSize),
constraint FK_SHOES_SIZE_SHOESID foreign key(ShoesID)
references Shoes(ShoesID)
on delete cascade
on update cascade,
constraint FK_SHOES_SIZE_IDSIZE foreign key(IDSize)
references Size(IDSize)
on delete cascade
on update cascade
--
insert into Brand_of_Shoes values('Air Jordan',N'Air Jordan là thương hiệu giày dép và trang thiết bị thể thao được thành lập, thiết kế và sản xuất riêng dành riêng cho Michael Jordan bởi một nhánh của Nike có tên thương mại là “Jordan Brand”.','1984')
insert into Brand_of_Shoes values('Adidas',N'Adidas là tập đoàn đa quốc gia đến từ nước Đức, chuyên sản xuất các mặt hàng giầy dép, quần áo, phụ kiện. Tiền thân của hãng là công ty Gebruder Dassler Schuhfabrik được ra đời vào năm 1924 bởi hai anh em nhà Dassler là Adi Dassler và Rudolf.','1924')
insert into Brand_of_Shoes values('Nike',N'Nike là nhà cung cấp toàn cầu về giày, quần áo và dụng cụ thể thao số một thế giới. Được thành lập vào ngày 25 tháng 1 năm 1964 với tên Blue Ribbon Sports bởi Bill Bowerman và Phil Knight, sau đó chính thức có tên gọi là Nike vào ngày 30 tháng 5 năm 1971.','1971-5-30')