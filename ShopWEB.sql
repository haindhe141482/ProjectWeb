create database ShopWEB
use ShopWEB
create table Contact(
ContactID int primary key not null identity(1,1),
[Content] nvarchar(255) not null,
status bit default 1
);
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] varchar(30) unique,
	[pass] varchar(32) not null check(len(pass)>=8),
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
Go
Create table  Category(cid int primary key identity(1,1), cname nvarchar(50)
)
Create table Product([id] int primary key  IDENTITY(1,1) NOT NULL,name nvarchar(100) not null,image varchar(100),
 price money check(price>=0),[title] [nvarchar](max) NULL,
[description] nvarchar(max),cateID int foreign key references Category(cid),[sell_ID] [int] NULL
)
create table Customer(cid int primary key identity(1,1), cname nvarchar(30) not null,
cphone varchar(30), cAddress nvarchar(100), username varchar(30) not null unique,
password varchar(32) not null check(len(password)>=8), status bit default 1)
Create table Bill(oID varchar(32) primary key,dateCreate dateTime default getdate(),
cname nvarchar(30) not null,cphone varchar(30), cAddress nvarchar(100), total money,
status int default 0,cid int foreign key references Customer(cid))
create table BillDetail(id int foreign key references Product(id),
oID varchar(32) foreign key references Bill(oID), quantity int, price money, total money,
primary key(id,oID))
INSERT [dbo].[Category] ( [cname]) VALUES ( N'Đồ Champion')
INSERT [dbo].[Category] ( [cname]) VALUES ( N'Đồ Adidas')
INSERT [dbo].[Category] ([cname]) VALUES ( N'Đồ Nike')
INSERT [dbo].[Category] ([cname]) VALUES (N'Đồ Puma')
SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Adam', N'123456789', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Anjolie', N'dunghoinhe', 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[product] ON 
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (1, N'Áo CHAMPION GRADIENT', N'images/Anh1.jpeg', 53.0000,N'HÀNG CHÍNH HÃNG ÁO THUN CHAMPION GRADIENT BLACK 2021**', N'Mặc siêu mát me', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (2, N'QUẦN SHORT CHAMPION BLUE 2021', N'images/Anh2.jpeg', 48.0000,N'HÀNG CHÍNH HÃNG' ,N'Mặc siêu mát ', 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'QUẦN SHORT CHAMPION WHITE STRAIGHT', N'images/Anh3.jpeg', 58.0000,N'HÀNG CHÍNH HÃNG', N'Mặc siêu thích , thoáng mát cho mùa hè , thỏa má đi chơi', 1, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'HÃNG ÁO THUN CHAMPION EMBROIDERED', N'images/Anh4.jpeg', 39.0000,N'HÀNG CHÍNH HÃNG', N'Mô tả sản phẩm
- Size M: Từ 50kg đến 58kg (cao từ 1m55 đến 1m65)

- Size L: Từ 55kg đến 68kg (cao từ 1m63 đến 1m74)
- Size XL: Từ 63kg đến 80kg (cao từ 1m65 đến 1m77)


HƯỚNG DẪN SỬ DỤNG: 
- Lần đầu đem về chỉ nên xả với nước mát rồi phơi khô.    
- Không giặt máy trong 2 tuần đầu sau khi mặc.    
- Phân loại màu trước khi giặt.    
- Lộn mặt trái sản phẩm ra ngoài.    
- Không sử dụng các hoá chất tẩy để giặt.    
- Chú ý phơi ngang sản phẩm và phơi trong bóng râm, tránh tiếp xúc trực tiếp dưới ánh nắng mặt trời', 1, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'TÚI ADIDAS NATIONAL 3-STRIPES BLACK/ WHITE 2021', N'images/Anh6.jpeg', 53.0000,N'HÀNG CHÍNH HÃNG', N'Mô tả sản phẩm
STYLE: CM3824

COLORWAY: BLACK



Kích thước: 11,5cm x 3,25cm x 4,25cm 

100% polyester 

Túi đeo chéo hoặc thắt lưng có thể điều chỉnh

Túi zip phía trước 

Khóa bên trong fob

Đai vải có thể điều chỉnh', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'ÁO THUN ADIDAS DESIGNED 2 MOVE MIX BLACK 2021', N'images/Anh6.jpeg', 53.0000,N'HÀNG CHÍNH HÃNG', N'Mô tả sản phẩm
STYLE: CM3824

COLORWAY: BLACK



Kích thước: 11,5cm x 3,25cm x 4,25cm 

100% polyester 

Túi đeo chéo hoặc thắt lưng có thể điều chỉnh

Túi zip phía trước 

Khóa bên trong fob

Đai vải có thể điều chỉnh', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'ÁO THUN ADIDAS DESIGNED 2 MOVE MIX BLACK 2021', N'images/Anh7.jpeg', 53.0000,N'Hàng Chính hãng', N'Mô tả sản phẩm
STYLE: FL0261

COLORWAY: 



Luôn cam kết tập luyện hàng ngày. Áo thun tập huấn adidas này có cảm giác co giãn và vừa vặn quen thuộc. Băng keo thương hiệu adidas tuyến tính tăng thêm góc cạnh thời trang.



Phù hợp mang thường xuyên 

Cổ thuyền 

91% polyester tái chế, 9% elastane áo đơn 

Áo thun tay ngắn thoải mái 

Được làm bằng polyester tái chế để tiết kiệm tài nguyên và giảm lượng khí thải', 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (8, N'ADIDAS ZX 2K BOOST SHOCK PINK BLACK', N'images/Anh8.jpeg', 53.0000,N' HÀNG chính hãng', N'Mô tả sản phẩm
STYLE: FY2011

COLORWAY: Shock Pink / Grey Two / Core Black



Khi mang đôi giày adidas ZX 2K Boost đậm chất công nghệ này chính là lúc bạn hòa mình nguồn năng lượng của thành phố. Bạn cảm nhận thấy điều đó trong từng bước chân xuống phố. Cảm nhận rõ hơn về bản thân cũng như mọi người. Trọn vẹn trong từng khoảnh khắc. Cảm nhận mãnh liệt ấy. Suy nghĩ sẽ không vướng bận về bất kỳ điều gì khác nữa.



Thân giày bằng vải lưới với các chi tiết phủ ngoài bằng TPU
Giày sneaker đàn hồi, nâng đỡ
Đế giữa Boost đặc trưng
Đế ngoài bằng cao su', 2, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (9, N'7718 - HÀNG CHÍNH HÃNG NIKE JORDAN 1 LOW SMOKE GREY 2021 **SUPER HOT** [553558 039]
', N'images/Anh9.jpeg', 53.0000,N'NIKE JORDAN 1', N'Mô tả sản phẩm
STYLE: 553558 039
COLORWAY: SMOKE GREY




Sự đa dạng về kiểu dáng và màu sắc cho nên các tín đồ của sneaker có thể thảo sức lựa chọn theo sở thích và phong cách. Các mẫu giày Jordan 1 chính hãng được sản xuất với số lượng không nhiều cho nên khi có được “siêu phẩm” này chắc chắn bạn sẽ trở nên nổi bật và làm nhiều người phải ganh tỵ đấy.


Với thiết kế đế ngoài bằng cao su của Jordan 1 có các rãnh uốn sâu di chuyển sải chân bằng bàn chân của bạn. Phần trên bằng da bền ôm sát cổ chân vừa giúp bảo vệ khỏi những va chạm bên ngoài, đồng thời tạo cảm giác chắn chắn khi di chuyển, mang đến hiệu quả cao cho các hoạt động thể thao của mình


Khi sở hữu Nike Jordan 1, bạn không chỉ có được đôi giày thời trang và chất liệu tốt mà còn có được cả những giá trị lịch sử xoay quanh chúng. Và đây Jordan 1 được đánh giá là một trong những đôi giày giàu giá trị lịch sử nhất. Không những vậy, Jordan 1 còn là đôi giày đánh dấu sự bắt đầu của kỉ nguyên Nike –Jordan trong giới shoegame. Nếu như ai đó hỏi đâu là dòng giày Jordan được mua nhiều nhất thì câu trả lời chắc chắn là nike Jordan 1

', 3, 10)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (10, N'JACKET NIKE CORINTHIANS LUTE BLACK/GOLD 2021', N'images/Anh10.jpeg', 53.0000,N'JACKET NIKE CORINTHIANS LUTE BLACK', N'Mô tả sản phẩm : Mặc siêu mát , siêu  thẩm mĩ', 3, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (11, N'JORDAN 1 MID BLACK CHILE RED 2021', N'images/Anh11.jpeg', 2215.0000,N'NIKE JORDAN 1', N'💲BEST SELLER💲 HÀNG CHÍNH HÃNG NIKE JORDAN 1 MID BLACK CHILE RED 2021**[O]', 3, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (12, N'ÁO THUN NIKE "JUST DO IT" WHITE **2021**', N'images/Anh12.jpeg', 102.0000,N'ÁO THUN NIKE "JUST DO IT" WHITE **2021**', N'Mô tả sản phẩm
The Nike Tee Just Do it là chiếc áo basic của nhà Nike, chiếc áo thun casual của hãng thời trang dành cho thể thao này được kết hợp với rất nhiều công nghệ, kể cả Dri Fit được chống thấm và khô thoáng cực kỳ tuyệt vời.

+ Chất liệu: 100% Cotton cho sự thoải mái tốt nhất.
+ Thích ứng với máy giặt mà không sợ tổn thương áo
+ Cổ áo chống co giãn cực kỳ tuyệt vời', 3, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (13, N'DÉP PUMA SUEDE LEADCAT SANDALS BLACK', N'images/Anh13.jpeg', 175.0000,N' FLASH EVENT 70% HÀNG CHÍNH HÃNG', N'Mô tả sản phẩm
COLORWAY : BLACK 



﻿﻿﻿﻿﻿+ Quai làm từ chất liệu da lộn
+ Đế đi nhẹ tạo cảm giác cực kỳ thoải mái
+ Đế đúc nguyên khối , phần đế dép chống nước 100% ﻿﻿﻿﻿
﻿﻿
﻿
Dép Puma Suede Leadcat là mẫu sandals được yêu thích của thương hiệu Puma
Đôi dép được thiết kế với phong cách cổ điển đang được ưa chuộng nhất hiên nay ', 4, 16)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (14, N'HÀNG CHÍNH HÃNG PUMA RS-X3 PUZZLE PINK 2021**', N'images/Anh14.jpeg', 123.0000,N'HÀNG CHÍNH HÃNG PUMA RS-X3 PUZZLE PINK 2021**', N'Mô tả sản phẩm
Puma RS-X là phiên bản được làm mới lại từ chất liệu, dây và cả thiết kế. Công nghệ chạy chữ ký từ những năm 80 trở lại với thiết kế mới được xây dựng cho tương lai. Kèm theo đó là hệ thống Running System rất nổi tiếng của Puma từ những thập niên 80 - 90 trải dài từ mũi giày đến gót chân

+ Mang hơi hướng của những đôi giày Chunky Sneaker cồng kềnh
+ Chất liệu được sử dụng với màu sắc tương phản bao gồm da - nhựa PU và cao su tự nhiên
+ Đế giữa bằng nhựa PU cho khối lượng cực kỳ nhẹ
+ Đế ngoài bằng cao su tự nhiên cho cảm giác bám đường rất tốt', 4, 11)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (15, N'LEGGINGS PUMA BLACK 2021**[9 WOMEN 585959', N'images/Anh15.jpeg', 412.0000,N'HÀNG CHÍNH HÃNG QUẦN LEGGINGS', N'HÀNG CHÍNH HÃNG QUẦN LEGGINGS PUMA BLACK 2021**[9 WOMEN 585959 51]', 4, 11)
	
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (16, N'TÚI PUMA PRO TRAINING II MEDIUM BLACK DUFFEL 2021*', N'images/Anh16.jpeg', 127.0000,N' FLASH EVENT 70% HÀNG CHÍNH HÃNG', N'Mô tả sản phẩm
STYLE: 074892-01,

COLORWAY: BLACK





Chiếc túi thể thao đa chức năng này là người bạn đồng hành đáng tin cậy cho những đêm ở phòng tập thể dục hoặc những ngày trên đường đua.

CHI TIẾT Mở zip hai chiều lớn vào ngăn chính 

Tay cầm bằng vải 

Dây đeo vai có thể điều chỉnh và có đệm 

Logo PUMA ở mặt trước 100% 

Polyester 61 x 31 x 29 cm', 4, 8)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (17, N'GIÀY ADIDAS SUPER STAR 2', N'images/Anh17.jpeg', 231.0000,N'Adidas Super Star với thiết kế ban đầu dành cho sân bóng rổ vào thập niên 70. Được các ngôi sao hip hop tôn sùng vào thập niên 80. Đôi giày adidas Superstar giờ đây đã trở thành biểu tượng của các tín đồ thời trang đường phố. Thiết kế mũi giày vỏ sò nổi tiếng thế giới mang đến phong cách chất lừ và khả năng bảo vệ. Giống như những gì đôi giày này đã thể hiện trên sân bóng rổ trong quá khứ. Giờ đây, bạn có thể tự tin tham gia lễ hội âm nhạc hay dạo phố mà không sợ bị dẫm lên chân. Chi tiết 3 Sọc viền răng cưa và logo adidas Superstar đóng khung mang đậm phong cách nguyên bản chính hiệu
', N'+ Thân giày bằng da
+ Biểu tượng giày da
+ Đế ngoài bằng cao su', 2, 7)
