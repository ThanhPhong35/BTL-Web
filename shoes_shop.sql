CREATE DATABASE shopping
USE [shopping]
GO

SET DATEFORMAT DMY;

CREATE TABLE [dbo].[Role](
    [roleId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [roleName] [nvarchar](50) NOT NULL
);

CREATE TABLE [dbo].[Account](
	[userid] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[fullname] [nvarchar](50) NULL ,
	[username] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](50) NULL,
	[images] [varchar](500) NULL,
	[phone] [varchar](20) NULL,
	[status] int,
	[code] [varchar](50),
	[roleid] [int] FOREIGN KEY REFERENCES [dbo].[Role](roleId) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[cname] [nvarchar](50) NOT NULL,
	[cimage] [nvarchar](max) NULL,
);


CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	FOREIGN KEY ([cateID]) REFERENCES [dbo].[Category]([cid]) ON UPDATE CASCADE ON DELETE CASCADE,
);


CREATE TABLE [dbo].[Order](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [date] [date] NOT NULL,
    [cusid] [int] NOT NULL,
	[status] [int] NOT NULL,
    [totalmoney] [money] NULL,
    PRIMARY KEY ([id]),
    FOREIGN KEY ([cusid]) REFERENCES [dbo].[Account]([userid])ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE [dbo].[OrderDetail](
    [oid] [int] NOT NULL,
    [pid] [int] NOT NULL,
    [quantity] [float] NOT NULL,
    [price] [float] NOT NULL,
    PRIMARY KEY ([oid], [pid]),
    FOREIGN KEY ([oid]) REFERENCES [dbo].[Order]([id]) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ([pid]) REFERENCES [dbo].[product]([id]) ON UPDATE CASCADE ON DELETE CASCADE, 
);

-- Inserting a sample role
INSERT INTO [dbo].[Role] ([roleName])
VALUES ('Admin');
INSERT INTO [dbo].[Role] ([roleName])
VALUES ('User');

-- Chèn dữ liệu vào bảng Account
-- Inserting diverse sample data into the Account table with specific names and roleid values (2)
INSERT INTO [dbo].[Account]([fullname], [username], [email], [password], [images], [phone], [status], [code], [roleid])
VALUES 
    (N'Nguyễn Thị Quyên', N'Quyen', N'quyennguyen@email.com', N'123', NULL, N'0987654321', 1, N'6482934', 1),
    (N'Trần Văn Đức', N'DucTran', N'ductran@email.com', N'123', NULL, N'0123456789', 1, N'6482934', 2),
    (N'Phạm Thị Linh', N'LinhPham', N'linhpham@email.com', N'securepass', NULL, N'0369852147', 0, N'6482934', 2),
    (N'Lê Thị Mai', N'MaiLe', N'maile@email.com', N'pass1234', NULL, N'0909090909', 1, N'6482934', 2),
    (N'Vũ Thị Hương', N'HuongVu', N'huongvu@email.com', N'mypassword123', NULL, N'0123456780', 1, N'6482934', 2),
    (N'Nguyễn Văn Tuấn', N'TuanNguyen', N'tuan_nguyen@email.com', N'pass456', NULL, N'0123456799', 1, N'6482934', 2),
    (N'Huỳnh Thị An', N'AnHuynh', N'anhuynh@email.com', N'abc123', NULL, N'0123456789', 1, N'6482934', 2),
    (N'Lý Thị Hạnh', N'HanhLy', N'hanhly@email.com', N'mysecretpassword', NULL, N'0987654321', 0, N'6482934', 2),
    (N'Đặng Thị Thúy', N'ThuyDang', N'thuydang@email.com', N'password5678', NULL, N'0369852147', 1, N'6482934', 2),
    (N'Mai Văn Bình', N'BinhMai', N'binhmai@email.com', N'binhpass', NULL, N'0909090909', 1, N'6482934', 2),
    (N'Nguyễn Thị Tâm', N'TamNguyen', N'tamnguyen@email.com', N'mypassword9876', NULL, N'0123456780', 1, N'6482934', 2),
    (N'Lê Văn Quân', N'QuanLe', N'quanle@email.com', N'mypass123', NULL, N'0123456799', 1, N'6482934', 2);

INSERT INTO [dbo].[Category] ([cname], [cimage])
VALUES 
    (N'GIÀY ADIDAS', N'image/logo_adidas.png'),
    (N'GIÀY NIKE', N'image/logo_nike.png'),
    (N'GIÀY BITI''S', N'image/logo_bitis.png'),
    (N'GIÀY CONVERSE', N'image/logo_converse.png');



INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100.0000, N'Giày thể thao nam Adidas Enerergy Falcon EE9844', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120.0000, N'Giày Adidas Nova Run EE9266
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130.0000, N'Dép đúc thể thao nam Adidas Adilette Boost Slides Đen - EH2256
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1)

INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180.0000, N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Outdoors Waterproof Boots Sports Shoes', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 120.0000, N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Outdoors Waterproof Boots Sports Shoes', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 120.0000, N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3)
INSERT [dbo].[product] ([name], [image], [price], [title], [description], [cateID]) VALUES (N'Men''s Outdoors Waterproof Boots Sports Shoes', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 120.0000, N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', 3)


use shopping
insert into Category
values ('Hi',NULL)

select * from [dbo].[account]
where 
    [fullname] like '%Quyen%' or
    [username] like '%Quyen%' or
    [email] like '%Quyen%' or
    [phone] like '%Quyen%';

select top 1 *
FROM [dbo].[Account]
ORDER BY [userid] DESC;

SELECT * FROM [dbo].[Category]
WHERE [cid] = 1;

UPDATE [dbo].[product]
SET
    [name] = ?,
    [image] = ?,
    [price] = ?, 
    [title] = ?,
    [description] = ?,
    [cateID] = 2 
WHERE
    [id] = ?; 

	-- Đặt định dạng mặc định cho cơ sở dữ liệu thành 'DMY' (DD/MM/YYYY)
SET DATEFORMAT DMY;

select * from [Order]


update [Order]
set [status] = 1
where id = 1