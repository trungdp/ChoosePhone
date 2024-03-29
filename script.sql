create database [ChoosePhone]
USE [ChoosePhone]
GO

/****** Object:  Table [dbo].[Account]    Script Date: 10/28/2019 03:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/28/2019 03:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CartID] [varchar](32) NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateCollect] [datetime] NOT NULL,
	[CollectedMoney] [money] NOT NULL,
	[IntoMoney] [money] NOT NULL,
	[TotalMoney] [money] NOT NULL,
	[SellAt] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[Note] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/28/2019 03:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [varchar](32) NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Number] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/28/2019 03:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IDCard] [varchar](10) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Sex] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCustomer]    Script Date: 10/28/2019 03:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCustomer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IDCard] [varchar](10) NOT NULL,
	[Sex] [int] NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PromotionCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_MemberCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatingSystem]    Script Date: 10/28/2019 03:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingSystem](
	[OperatingSystemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED 
(
	[OperatingSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/28/2019 03:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[CartID] [varchar](32) NOT NULL,
	[ProductID] [int] NOT NULL identity(1,1),
	[DateOrdered] [datetime] NOT NULL,
	[DateShipping] [datetime] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Status] [int] NOT NULL,
	[ShippingAddress] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 10/28/2019 03:38:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProducerID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BasicPrice] [money] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[OperationSystemID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[PromotionCode] [varchar](10) NOT NULL,
	[Thumbnail] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[PromoFront] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionCode] [varchar](10) NOT NULL,
	[ProductID] [int] NOT NULL identity(1,1),
	[PromotionName] [varchar](20) NOT NULL,
	[ObjectPromotion] [int] NOT NULL,
	[PromotionPercent] [float] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[PromotionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Ratio] [float] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Cart]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_OperatingSystem] FOREIGN KEY([OperationSystemID])
REFERENCES [dbo].[OperatingSystem] ([OperatingSystemID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_OperatingSystem]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Promotion] FOREIGN KEY([PromotionCode])
REFERENCES [dbo].[Promotion] ([PromotionCode])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Promotion]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Size]
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_P] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_P]
GO
/****** Object:  StoredProcedure [dbo].[Account_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Account_All]
AS
Select AccountID, UserName, Password
From [Account]
GO
/****** Object:  StoredProcedure [dbo].[Account_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Account_Delete]
	@AccountID [int]
AS
Delete From [Account] 
Where  AccountID = @AccountID  

GO
/****** Object:  StoredProcedure [dbo].[Account_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Account_Insert]
	@AccountID [int] OUTPUT,
	@UserName [nvarchar](50),
	@Password [nvarchar](50)
AS
Insert Into [Account] 
( UserName, Password)
Values ( @UserName, @Password) 
Set @AccountID = IDENT_CURRENT('Account')
GO
/****** Object:  StoredProcedure [dbo].[Account_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Account_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@ProductsPerPage INT
	AS
	BEGIN
SET NOCOUNT ON
DECLARE @Account TABLE
(	RowNumber INT,
	AccountID INT,
	UserName NVARCHAR(50),
	Password NVARCHAR(50)
)
INSERT INTO @Account
SELECT ROW_NUMBER() OVER (ORDER BY AccountID),
 AccountID, UserName, Password
FROM dbo.Account
WHERE UserName like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(AccountID) FROM @Account
-- extract the requested page of products
SELECT * FROM @Account
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
 AND RowNumber <= @PageNumber * @ProductsPerPage
end
GO
/****** Object:  StoredProcedure [dbo].[Account_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Account_Single]
	@AccountID [int]
AS
Select AccountID, UserName, Password
From [Account] 
Where  AccountID = @AccountID  
GO
/****** Object:  StoredProcedure [dbo].[Account_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Account_Update]
	@AccountID [int],
	@UserName [nvarchar](50),
	@Password [nvarchar](50)
AS
Update [Account] 
Set UserName = @UserName, 
Password = @Password 
Where  AccountID = @AccountID  

GO
/****** Object:  StoredProcedure [dbo].[Bill_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Bill_All]
AS
Select BillID, CustomerID, CartID, ProductID, DateCollect, CollectedMoney, IntoMoney, TotalMoney, SellAt, CashierID, Note
From [Bill]
GO
/****** Object:  StoredProcedure [dbo].[Bill_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Bill_Delete]
	@BillID [int]
AS
Delete From [Bill] 
Where  BillID = @BillID  

GO
/****** Object:  StoredProcedure [dbo].[Bill_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Bill_Insert]
	@BillID [int] OUTPUT,
	@CustomerID [int],
	@CartID [varchar](32),
	@ProductID [int],
	@DateCollect [datetime],
	@CollectedMoney [money],
	@IntoMoney [money],
	@TotalMoney [money],
	@SellAt [int],
	@CashierID [int],
	@Note [nvarchar](1000)
AS
Insert Into [Bill] 
( CustomerID, CartID, ProductID, DateCollect, CollectedMoney, IntoMoney, TotalMoney, SellAt, CashierID, Note)
Values ( @CustomerID, @CartID, @ProductID, @DateCollect, @CollectedMoney, @IntoMoney, @TotalMoney, @SellAt, @CashierID, @Note) 
Set @BillID = IDENT_CURRENT('Bill')
GO
/****** Object:  StoredProcedure [dbo].[Bill_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Bill_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@BillsPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Bill TABLE
(	RowNumber INT,
	BillID INT,
	CustomerID INT,
	CartID VARCHAR(32),
	ProductID INT,
	DateCollect DATETIME,
	CollectedMoney MONEY,
	IntoMoney MONEY,
	TotalMoney MONEY,
	SellAt INT,
	CashierID INT,
	Note NVARCHAR(1000)
)
INSERT INTO @Bill
SELECT ROW_NUMBER() OVER (ORDER BY BillID),
 BillID, CustomerID, CartID, ProductID, DateCollect,CollectedMoney,IntoMoney,TotalMoney,SellAt, CashierID,Note
FROM dbo.Bill
WHERE BillID like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(BillID) FROM @Bill
-- extract the requested page of products
SELECT * FROM @Bill
WHERE RowNumber > (@PageNumber - 1) * @BillsPerPage
 AND RowNumber <= @PageNumber * @BillsPerPage
end
GO
/****** Object:  StoredProcedure [dbo].[Bill_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Bill_Single]
	@BillID [int]
AS
Select BillID, CustomerID, CartID, ProductID, DateCollect, CollectedMoney, IntoMoney, TotalMoney, SellAt, CashierID, Note
From [Bill] 
Where  BillID = @BillID  
GO
/****** Object:  StoredProcedure [dbo].[Bill_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Bill_Update]
	@BillID [int],
	@CustomerID [int],
	@CartID [varchar](32),
	@ProductID [int],
	@DateCollect [datetime],
	@CollectedMoney [money],
	@IntoMoney [money],
	@TotalMoney [money],
	@SellAt [int],
	@CashierID [int],
	@Note [nvarchar](1000)
AS
Update [Bill] 
Set CustomerID = @CustomerID, 
CartID = @CartID, 
ProductID = @ProductID, 
DateCollect = @DateCollect, 
CollectedMoney = @CollectedMoney, 
IntoMoney = @IntoMoney, 
TotalMoney = @TotalMoney, 
SellAt = @SellAt, 
CashierID = @CashierID, 
Note = @Note 
Where  BillID = @BillID  

GO
/****** Object:  StoredProcedure [dbo].[Cart_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Cart_All]
AS
Select CartID, ProductID, DateCreated, Number, SubTotal, Description
From [Cart]
GO
/****** Object:  StoredProcedure [dbo].[Cart_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Cart_Delete]
	@CartID [varchar](32)
AS
Delete From [Cart] 
Where  CartID = @CartID  

GO
/****** Object:  StoredProcedure [dbo].[Cart_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Cart_Insert]
	@CartID [varchar](32) OUTPUT,
	@ProductID [int],
	@DateCreated [datetime],
	@Number [int],
	@SubTotal [money],
	@Description [nvarchar](1000)
AS
Insert Into [Cart] 
( CartID, ProductID, DateCreated, Number, SubTotal, Description)
Values ( @CartID, @ProductID, @DateCreated, @Number, @SubTotal, @Description) 
GO
/****** Object:  StoredProcedure [dbo].[Cart_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cart_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@CartPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Cart TABLE	
(	
	RowNumber INT,
	CartID VARCHAR(32),
	ProductID INT,
	DateCreated DATETIME,
	Number INT,
	SubTotal MONEY,
	Description NVARCHAR(1000)
)
INSERT INTO @Cart
SELECT ROW_NUMBER() OVER (ORDER BY CartID),
 CartID, ProductID, DateCreated, Number, SubTotal,Description
FROM dbo.Cart
WHERE ProductID like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(CartID) FROM @Cart
-- extract the requested page of products
SELECT * FROM @Cart
WHERE RowNumber > (@PageNumber - 1) * @CartPerPage
 AND RowNumber <= @PageNumber * @CartPerPage
END
    
GO
/****** Object:  StoredProcedure [dbo].[Cart_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Cart_Single]
	@CartID [varchar](32)
AS
Select CartID, ProductID, DateCreated, Number, SubTotal, Description
From [Cart] 
Where  CartID = @CartID  
GO
/****** Object:  StoredProcedure [dbo].[Cart_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Cart_Update]
	@CartID [varchar](32),
	@ProductID [int],
	@DateCreated [datetime],
	@Number [int],
	@SubTotal [money],
	@Description [nvarchar](1000)
AS
Update [Cart] 
Set ProductID = @ProductID, 
DateCreated = @DateCreated, 
Number = @Number, 
SubTotal = @SubTotal, 
Description = @Description 
Where  CartID = @CartID  

GO
/****** Object:  StoredProcedure [dbo].[Employee_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Employee_All]
AS
Select EmployeeID, Name, LastName, IDCard, DateOfBirth, Sex, Address, PhoneNumber, Email, AccountID
From [Employee]
GO
/****** Object:  StoredProcedure [dbo].[Employee_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Employee_Delete]
	@EmployeeID [int]
AS
Delete From [Employee] 
Where  EmployeeID = @EmployeeID  

GO
/****** Object:  StoredProcedure [dbo].[Employee_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Employee_Insert]
	@EmployeeID [int] OUTPUT,
	@Name [nvarchar](50),
	@LastName [nvarchar](50),
	@IDCard [varchar](10),
	@DateOfBirth [datetime],
	@Sex [int],
	@Address [nvarchar](100),
	@PhoneNumber [varchar](10),
	@Email [nvarchar](50),
	@AccountID [int]
AS
Insert Into [Employee] 
( Name, LastName, IDCard, DateOfBirth, Sex, Address, PhoneNumber, Email, AccountID)
Values ( @Name, @LastName, @IDCard, @DateOfBirth, @Sex, @Address, @PhoneNumber, @Email, @AccountID) 
Set @EmployeeID = IDENT_CURRENT('Employee')
GO
/****** Object:  StoredProcedure [dbo].[Employee_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@EmployeesPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Employee TABLE
(
	RowNumber INT,
	EmployeeID INT,                                
	Name NVARCHAR(50),
	LastName NVARCHAR(50),
	IDCard VARCHAR(10),
	DateOfBirth datetime,
	Sex INT,
	Address NVARCHAR(100),
	PhoneNumber VARCHAR(10),
	Email nVARCHAR(50),
	AccountID int

)
INSERT INTO @Employee
SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID),
	EmployeeID,                                
	Name,
	LastName,
	IDCard,
	DateOfBirth,
	Sex,
	Address,
	PhoneNumber,
	Email,
	AccountID
FROM dbo.Employee
WHERE Name like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(EmployeeID) FROM @Employee
-- extract the requested page of products
SELECT * FROM @Employee
WHERE RowNumber > (@PageNumber - 1) * @EmployeesPerPage
 AND RowNumber <= @PageNumber * @EmployeesPerPage
END
GO
/****** Object:  StoredProcedure [dbo].[Employee_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Employee_Single]
	@EmployeeID [int]
AS
Select EmployeeID, Name, LastName, IDCard, DateOfBirth, Sex, Address, PhoneNumber, Email, AccountID
From [Employee] 
Where  EmployeeID = @EmployeeID  
GO
/****** Object:  StoredProcedure [dbo].[Employee_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Employee_Update]
	@EmployeeID [int],
	@Name [nvarchar](50),
	@LastName [nvarchar](50),
	@IDCard [varchar](10),
	@DateOfBirth [datetime],
	@Sex [int],
	@Address [nvarchar](100),
	@PhoneNumber [varchar](10),
	@Email [nvarchar](50),
	@AccountID [int]
AS
Update [Employee] 
Set Name = @Name, 
LastName = @LastName, 
IDCard = @IDCard, 
DateOfBirth = @DateOfBirth, 
Sex = @Sex, 
Address = @Address, 
PhoneNumber = @PhoneNumber, 
Email = @Email, 
AccountID = @AccountID 
Where  EmployeeID = @EmployeeID  

GO
/****** Object:  StoredProcedure [dbo].[GetInformationSchema]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetInformationSchema]
	@TableName [nvarchar](255) = null
AS


if (@TableName is null)
	begin
		Exec GetInformationSchemaTables
		Exec GetInformationSchemaTableConstraints
		Exec GetInformationSchemaColumns
		Exec GetInformationSchemaColumnUsage
   end

if(@TableName is not null)
	begin
		Exec GetInformationSchemaTables @TableName
		Exec GetInformationSchemaTableConstraints @TableName
		Exec GetInformationSchemaColumns @TableName
		Exec GetInformationSchemaColumnUsage @TableName
    end
	


GO
/****** Object:  StoredProcedure [dbo].[GetInformationSchemaColumns]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetInformationSchemaColumns]
	@TableName [nvarchar](255) = null
AS


  
	SELECT c.*
	FROM Information_Schema.Tables t
	inner join Information_Schema.Columns c
	on c.Table_Name = t.Table_Name
	--WHERE t.TABLE_TYPE IN ('BASE TABLE', 'VIEW') 
	WHERE (t.Table_Name = @TableName or @TableName is null)
	and t.TABLE_TYPE IN ('BASE TABLE') 
	and t.Table_Name <> 'dtproperties'
    and t.Table_Name <> 'sysdiagrams'

	ORDER BY t.TABLE_NAME


GO
/****** Object:  StoredProcedure [dbo].[GetInformationSchemaColumnUsage]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetInformationSchemaColumnUsage]
	@TableName [nvarchar](255) = null
AS
select ccu.*
from Information_Schema.Tables t
inner join Information_Schema.Constraint_Column_Usage ccu
on ccu.Table_Name = t.Table_Name
where (t.Table_Name = @TableName or @TableName is null)
	and t.Table_Type IN ('BASE TABLE') 
	and t.Table_Name <> 'dtproperties'
    and t.Table_Name <> 'sysdiagrams'


GO
/****** Object:  StoredProcedure [dbo].[GetInformationSchemaTableConstraints]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetInformationSchemaTableConstraints]
	@TableName [nvarchar](255) = null
AS



   select tc.*
	from Information_Schema.Tables t
	inner join Information_Schema.Table_Constraints tc
	on t.Table_Name = tc.Table_Name
	where (t.Table_Name = @TableName or @TableName is null)
	and t.Table_Type IN ('BASE TABLE') 
	and t.Table_Name <> 'dtproperties'
    and t.Table_Name <> 'sysdiagrams'

	Order by t.Table_Name	


GO
/****** Object:  StoredProcedure [dbo].[GetInformationSchemaTables]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetInformationSchemaTables]
	@TableName [nvarchar](255) = null
AS


  SELECT t.*
	from Information_Schema.Tables t
where (t.Table_Name = @TableName or @TableName is null)
and t.Table_Name <> 'dtproperties'
and t.Table_Name <> 'sysdiagrams'


GO
/****** Object:  StoredProcedure [dbo].[IsIdentity]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[IsIdentity]
	@TableName [nvarchar](255) = null,
	@ColumnName [nvarchar](255) = null,
	@IsIdentity [bit] = 0 OUTPUT
AS
if exists(select *
		from information_schema.columns 
		where 
		table_schema = 'dbo' 
		and columnproperty(object_id(@TableName), @ColumnName,'IsIdentity') = 1 
		)
			set @IsIdentity = 1
else
			set @IsIdentity = 0
GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MemberCustomer_All]
AS
Select CustomerID, AccountID, Name, LastName, IDCard, Sex, PhoneNumber, Address, Email, PromotionCode
From [MemberCustomer]
GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MemberCustomer_Delete]
	@CustomerID [int]
AS
Delete From [MemberCustomer] 
Where  CustomerID = @CustomerID  

GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MemberCustomer_Insert]
	@CustomerID [int] OUTPUT,
	@AccountID [int],
	@Name [nvarchar](50),
	@LastName [nvarchar](50),
	@IDCard [varchar](10),
	@Sex [int],
	@PhoneNumber [varchar](10),
	@Address [nvarchar](100),
	@Email [nvarchar](50),
	@PromotionCode [varchar](10)
AS
Insert Into [MemberCustomer] 
( AccountID, Name, LastName, IDCard, Sex, PhoneNumber, Address, Email, PromotionCode)
Values ( @AccountID, @Name, @LastName, @IDCard, @Sex, @PhoneNumber, @Address, @Email, @PromotionCode) 
Set @CustomerID = IDENT_CURRENT('MemberCustomer')
GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MemberCustomer_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@CustomersPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Customer TABLE
(
	RowNumber INT,
	CustomerID INT,                                
    [AccountID]     INT            NOT NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [LastName]      NVARCHAR (50)  NOT NULL,
    IDCard      VARCHAR (10)   NOT NULL,
    [Sex]           INT            NOT NULL,
    [PhoneNumber]   VARCHAR (10)   NOT NULL,
    [Address]       NVARCHAR (100) NOT NULL,
    [Email]         NVARCHAR (50)  NOT NULL,
    [PromotionCode] VARCHAR (10)   NOT NULL

)
INSERT INTO @Customer
SELECT ROW_NUMBER() OVER (ORDER BY CustomerID),
 CustomerID, AccountID, Name, LastName, IDCard,Sex,PhoneNumber,Address,Email, PromotionCode
FROM dbo.MemberCustomer
WHERE Name like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(CustomerID) FROM @Customer
-- extract the requested page of products
SELECT * FROM @Customer
WHERE RowNumber > (@PageNumber - 1) * @CustomersPerPage
 AND RowNumber <= @PageNumber * @CustomersPerPage
END
GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MemberCustomer_Single]
	@CustomerID [int]
AS
Select CustomerID, AccountID, Name, LastName, IDCard, Sex, PhoneNumber, Address, Email, PromotionCode
From [MemberCustomer] 
Where  CustomerID = @CustomerID  
GO
/****** Object:  StoredProcedure [dbo].[MemberCustomer_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[MemberCustomer_Update]
	@CustomerID [int],
	@AccountID [int],
	@Name [nvarchar](50),
	@LastName [nvarchar](50),
	@IDCard [varchar](10),
	@Sex [int],
	@PhoneNumber [varchar](10),
	@Address [nvarchar](100),
	@Email [nvarchar](50),
	@PromotionCode [varchar](10)
AS
Update [MemberCustomer] 
Set AccountID = @AccountID, 
Name = @Name, 
LastName = @LastName, 
IDCard = @IDCard, 
Sex = @Sex, 
PhoneNumber = @PhoneNumber, 
Address = @Address, 
Email = @Email, 
PromotionCode = @PromotionCode 
Where  CustomerID = @CustomerID  

GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OperatingSystem_All]
AS
Select OperatingSystemID, Name, Version, Description
From [OperatingSystem]
GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OperatingSystem_Delete]
	@OperatingSystemID [int]
AS
Delete From [OperatingSystem] 
Where  OperatingSystemID = @OperatingSystemID  

GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OperatingSystem_Insert]
	@OperatingSystemID [int] OUTPUT,
	@Name [nvarchar](50),
	@Version [nvarchar](50),
	@Description [nvarchar](1000)
AS
Insert Into [OperatingSystem] 
( Name, Version, Description)
Values ( @Name, @Version, @Description) 
Set @OperatingSystemID = IDENT_CURRENT('OperatingSystem')
GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OperatingSystem_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@OperatingSystemPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @OperatingSystem TABLE
(
	RowNumber INT,
	OperatingSystemID INT,                                
	Name NVARCHAR(50),
	Version NVARCHAR(50),
	Description NVARCHAR(1000)
)
INSERT INTO @OperatingSystem
SELECT ROW_NUMBER() OVER (ORDER BY OperatingSystemID),
 OperatingSystemID, Name, Version, Description
FROM dbo.OperatingSystem
WHERE Name like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(OperatingSystemID) FROM @OperatingSystem
-- extract the requested page of products
SELECT * FROM @OperatingSystem
WHERE RowNumber > (@PageNumber - 1) * @OperatingSystemPerPage
 AND RowNumber <= @PageNumber *  @OperatingSystemPerPage
END
GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OperatingSystem_Single]
	@OperatingSystemID [int]
AS
Select OperatingSystemID, Name, Version, Description
From [OperatingSystem] 
Where  OperatingSystemID = @OperatingSystemID  
GO
/****** Object:  StoredProcedure [dbo].[OperatingSystem_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OperatingSystem_Update]
	@OperatingSystemID [int],
	@Name [nvarchar](50),
	@Version [nvarchar](50),
	@Description [nvarchar](1000)
AS
Update [OperatingSystem] 
Set Name = @Name, 
Version = @Version, 
Description = @Description 
Where  OperatingSystemID = @OperatingSystemID  

GO
/****** Object:  StoredProcedure [dbo].[Order_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Order_All]
AS
Select OrderID, CustomerID, CartID, ProductID, DateOrdered, DateShipping, SubTotal, Status, ShippingAddress
From [Order]
GO
/****** Object:  StoredProcedure [dbo].[Order_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Order_Delete]
	@OrderID [int]
AS
Delete From [Order] 
Where  OrderID = @OrderID  

GO
/****** Object:  StoredProcedure [dbo].[Order_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Order_Insert]
	@OrderID [int] OUTPUT,
	@CustomerID [int],
	@CartID [varchar](32),
	@ProductID [int],
	@DateOrdered [datetime],
	@DateShipping [datetime],
	@SubTotal [money],
	@Status [int],
	@ShippingAddress [nvarchar](1000)
AS
Insert Into [Order] 
( OrderID, CustomerID, CartID, ProductID, DateOrdered, DateShipping, SubTotal, Status, ShippingAddress)
Values ( @OrderID, @CustomerID, @CartID, @ProductID, @DateOrdered, @DateShipping, @SubTotal, @Status, @ShippingAddress) 
GO
/****** Object:  StoredProcedure [dbo].[Order_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Search]
	@Word NVARCHAR(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@OrdersPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Order TABLE
(
	RowNumber INT,
	[OrderID]         INT             NOT NULL,
    [CustomerID]      INT             NULL,
    [CartID]          VARCHAR (32)    NOT NULL,
    [ProductID]       INT             NOT NULL,
    [DateOrdered]     DATETIME        NOT NULL,
    [DateShipping]    DATETIME        NOT NULL,
    [SubTotal]        MONEY           NOT NULL,
    [Status]          INT             NOT NULL,
    [ShippingAddress] NVARCHAR (1000) NOT NULl

)
INSERT INTO @Order
SELECT ROW_NUMBER() OVER (ORDER BY OrderID),
 OrderID, CustomerID, CartID, ProductID, DateOrdered,DateOrdered,SubTotal,Status,ShippingAddress
FROM dbo.[Order]
WHERE OrderID like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(OrderID) FROM @Order
-- extract the requested page of products
SELECT * FROM @Order
WHERE RowNumber > (@PageNumber - 1) * @OrdersPerPage
 AND RowNumber <= @PageNumber * @OrdersPerPage
END
GO
/****** Object:  StoredProcedure [dbo].[Order_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Order_Single]
	@OrderID [int]
AS
Select OrderID, CustomerID, CartID, ProductID, DateOrdered, DateShipping, SubTotal, Status, ShippingAddress
From [Order] 
Where  OrderID = @OrderID  
GO
/****** Object:  StoredProcedure [dbo].[Order_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Order_Update]
	@OrderID [int],
	@CustomerID [int],
	@CartID [varchar](32),
	@ProductID [int],
	@DateOrdered [datetime],
	@DateShipping [datetime],
	@SubTotal [money],
	@Status [int],
	@ShippingAddress [nvarchar](1000)
AS
Update [Order] 
Set CustomerID = @CustomerID, 
CartID = @CartID, 
ProductID = @ProductID, 
DateOrdered = @DateOrdered, 
DateShipping = @DateShipping, 
SubTotal = @SubTotal, 
Status = @Status, 
ShippingAddress = @ShippingAddress 
Where  OrderID = @OrderID  

GO
/****** Object:  StoredProcedure [dbo].[Producer_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Producer_All]
AS
Select ProducerID, Name, Description
From [Producer]
GO
/****** Object:  StoredProcedure [dbo].[Producer_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Producer_Delete]
	@ProducerID [int]
AS
Delete From [Producer] 
Where  ProducerID = @ProducerID  

GO
/****** Object:  StoredProcedure [dbo].[Producer_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Producer_Insert]
	@ProducerID [int] OUTPUT,
	@Name [nvarchar](50),
	@Description [nvarchar](1000)
AS
Insert Into [Producer] 
( Name, Description)
Values ( @Name, @Description) 
Set @ProducerID = IDENT_CURRENT('Producer')
GO
/****** Object:  StoredProcedure [dbo].[Producer_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Producer_Single]
	@ProducerID [int]
AS
Select ProducerID, Name, Description
From [Producer] 
Where  ProducerID = @ProducerID  
GO
/****** Object:  StoredProcedure [dbo].[Producer_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Producer_Update]
	@ProducerID [int],
	@Name [nvarchar](50),
	@Description [nvarchar](1000)
AS
Update [Producer] 
Set Name = @Name, 
Description = @Description 
Where  ProducerID = @ProducerID  

GO
/****** Object:  StoredProcedure [dbo].[Product_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Product_All]
AS
Select ProductID, ProducerID, Name, BasicPrice, Description, OperationSystemID, SizeID, DateAdded, PromotionCode, Thumbnail, Image, PromoFront
From [Product]
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Product_Delete]
	@ProductID [int]
AS
Delete From [Product] 
Where  ProductID = @ProductID  

GO
/****** Object:  StoredProcedure [dbo].[Product_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Product_Insert]
	@ProductID [int] OUTPUT,
	@ProducerID [int],
	@Name [nvarchar](50),
	@BasicPrice [money],
	@Description [nvarchar](1000),
	@OperationSystemID [int],
	@SizeID [int],
	@DateAdded [datetime],
	@PromotionCode [varchar](10),
	@Thumbnail [nvarchar](255),
	@Image [nvarchar](255),
	@PromoFront [bit]
AS
Insert Into [Product] 
( ProducerID, Name, BasicPrice, Description, OperationSystemID, SizeID, DateAdded, PromotionCode, Thumbnail, Image, PromoFront)
Values ( @ProducerID, @Name, @BasicPrice, @Description, @OperationSystemID, @SizeID, @DateAdded, @PromotionCode, @Thumbnail, @Image, @PromoFront) 
Set @ProductID = IDENT_CURRENT('Product')
GO
/****** Object:  StoredProcedure [dbo].[Product_Search]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Search]
	@Word nvarchar(50),
	@DescriptionLength INT,
	@PageNumber INT,
	@ProductsPerPage INT
	AS
BEGIN
SET NOCOUNT ON
DECLARE @Products TABLE
(
	RowNumber INT,
	ProductID INT,
	Name NVARCHAR(50),
	Description NVARCHAR(MAX),
	BasicPrice MONEY,
	OperationSystemID INT,
	SizeID INT,
	ProducerID INT,
	DateAdded DATETIME,
	PromotionCode VARCHAR(10),
	Thumbnail nvarchar(255),
	Image nvarchar(255)

)
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY ProductID),
 ProductID, Name, Description, BasicPrice, OperationSystemID,SizeID,ProducerID,DateAdded,PromotionCode, Thumbnail,Image
FROM Product
WHERE Name like N'%' + @Word + '%'
-- return the total number of products using an OUTPUT variable
SELECT COUNT(ProductID) FROM @Products
-- extract the requested page of products
SELECT * FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
 AND RowNumber <= @PageNumber * @ProductsPerPage
END


GO
/****** Object:  StoredProcedure [dbo].[Product_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Product_Single]
	@ProductID [int]
AS
Select ProductID, ProducerID, Name, BasicPrice, Description, OperationSystemID, SizeID, DateAdded, PromotionCode, Thumbnail, Image, PromoFront
From [Product] 
Where  ProductID = @ProductID  
GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Product_Update]
	@ProductID [int],
	@ProducerID [int],
	@Name [nvarchar](50),
	@BasicPrice [money],
	@Description [nvarchar](1000),
	@OperationSystemID [int],
	@SizeID [int],
	@DateAdded [datetime],
	@PromotionCode [varchar](10),
	@Thumbnail [nvarchar](255),
	@Image [nvarchar](255),
	@PromoFront [bit]
AS
Update [Product] 
Set ProducerID = @ProducerID, 
Name = @Name, 
BasicPrice = @BasicPrice, 
Description = @Description, 
OperationSystemID = @OperationSystemID, 
SizeID = @SizeID, 
DateAdded = @DateAdded, 
PromotionCode = @PromotionCode, 
Thumbnail = @Thumbnail, 
Image = @Image, 
PromoFront = @PromoFront 
Where  ProductID = @ProductID  

GO
/****** Object:  StoredProcedure [dbo].[Promotion_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Promotion_All]
AS
Select PromotionCode, ProductID, PromotionName, ObjectPromotion, PromotionPercent, Description
From [Promotion]
GO
/****** Object:  StoredProcedure [dbo].[Promotion_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Promotion_Delete]
	@PromotionCode [varchar](10)
AS
Delete From [Promotion] 
Where  PromotionCode = @PromotionCode  

GO
/****** Object:  StoredProcedure [dbo].[Promotion_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Promotion_Insert]
	@PromotionCode [varchar](10) OUTPUT,
	@ProductID [int],
	@PromotionName [varchar](20),
	@ObjectPromotion [int],
	@PromotionPercent [float](53),
	@Description [nvarchar](1000)
AS
Insert Into [Promotion] 
( PromotionCode, ProductID, PromotionName, ObjectPromotion, PromotionPercent, Description)
Values ( @PromotionCode, @ProductID, @PromotionName, @ObjectPromotion, @PromotionPercent, @Description) 
GO
/****** Object:  StoredProcedure [dbo].[Promotion_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Promotion_Single]
	@PromotionCode [varchar](10)
AS
Select PromotionCode, ProductID, PromotionName, ObjectPromotion, PromotionPercent, Description
From [Promotion] 
Where  PromotionCode = @PromotionCode  
GO
/****** Object:  StoredProcedure [dbo].[Promotion_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Promotion_Update]
	@PromotionCode [varchar](10),
	@ProductID [int],
	@PromotionName [varchar](20),
	@ObjectPromotion [int],
	@PromotionPercent [float](53),
	@Description [nvarchar](1000)
AS
Update [Promotion] 
Set ProductID = @ProductID, 
PromotionName = @PromotionName, 
ObjectPromotion = @ObjectPromotion, 
PromotionPercent = @PromotionPercent, 
Description = @Description 
Where  PromotionCode = @PromotionCode  

GO
/****** Object:  StoredProcedure [dbo].[Size_All]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Size_All]
AS
Select SizeID, Width, Height, Ratio
From [Size]
GO
/****** Object:  StoredProcedure [dbo].[Size_Delete]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Size_Delete]
	@SizeID [int]
AS
Delete From [Size] 
Where  SizeID = @SizeID  

GO
/****** Object:  StoredProcedure [dbo].[Size_Insert]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Size_Insert]
	@SizeID [int] OUTPUT,
	@Width [float](53),
	@Height [float](53),
	@Ratio [float](53)
AS
Insert Into [Size] 
( Width, Height, Ratio)
Values ( @Width, @Height, @Ratio) 
Set @SizeID = IDENT_CURRENT('Size')
GO
/****** Object:  StoredProcedure [dbo].[Size_Single]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Size_Single]
	@SizeID [int]
AS
Select SizeID, Width, Height, Ratio
From [Size] 
Where  SizeID = @SizeID  
GO
/****** Object:  StoredProcedure [dbo].[Size_Update]    Script Date: 10/28/2019 03:38:12 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Size_Update]
	@SizeID [int],
	@Width [float](53),
	@Height [float](53),
	@Ratio [float](53)
AS
Update [Size] 
Set Width = @Width, 
Height = @Height, 
Ratio = @Ratio 
Where  SizeID = @SizeID  

GO
