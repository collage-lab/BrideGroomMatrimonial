/****** Object:  Table [dbo].[IndexSequrity]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexSequrity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexSequrity](
	[SequrityQuestion] [varchar](150) NOT NULL,
	[Value] [tinyint] NOT NULL,
 CONSTRAINT [PK_IndexSequrity] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonials_DataBaseDetails]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonials_DataBaseDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Matrimonials_DataBaseDetails]
AS /*   Function to get the details of data base */

-- doese the temp table exists
-- ---------------------------------------------------------------------------------------
    IF EXISTS ( SELECT  *
                FROM    sys.objects
                WHERE   object_id = OBJECT_ID(N''[dbo].[temp]'')
                        AND type IN ( N''U'' ) )
-- ---------------------------------------------------------------------------------------
        BEGIN
-- ---------------------------------------------------------------------------------------
-- If So Drop that table
            DROP TABLE [dbo].[temp]
-- ---------------------------------------------------------------------------------------
-- Creat a Fresh one
            CREATE TABLE [dbo].[temp]
                (
                  Table_Name SYSNAME,
                  Row_Count INT,
                  reserved_size VARCHAR(50),
                  Data_Size VARCHAR(50),
                  index_size VARCHAR(50),
                  unused_size VARCHAR(50)
                )
            SET NOCOUNT ON
-- ---------------------------------------------------------------------------------------
-- Insert Details into temp data base
            INSERT  [dbo].[temp]
-- ---------------------------------------------------------------------------------------
                    EXEC sp_msforeachtable ''sp_spaceused ''''?''''''
-- Select Infomation from the table
            SELECT  a.Table_Name,
                    a.Row_Count,
                    COUNT(*) AS Col_Count,
                    a.Data_Size
            FROM    [dbo].[temp] a
                    INNER JOIN information_schema.columns b ON a.Table_Name COLLATE database_default = b.Table_Name COLLATE database_default
            GROUP BY a.Table_Name,
                    a.Row_Count,
                    a.Data_Size
            ORDER BY CAST(REPLACE(a.Data_Size, '' KB'', '''') AS integer) DESC
-- ---------------------------------------------------------------------------------------
-- delete the temp table from the data base
            DROP TABLE [dbo].[temp]
-- ---------------------------------------------------------------------------------------
        END -- IF
-- ---------------------------------------------------------------------------------------
    ELSE -- No there is no temp table in the database
-- ---------------------------------------------------------------------------------------
        BEGIN
-- ---------------------------------------------------------------------------------------
-- Create a Fresh one
            CREATE TABLE [dbo].[temp]
                (
                  Table_Name SYSNAME,
                  Row_Count INT,
                  reserved_size VARCHAR(50),
                  Data_Size VARCHAR(50),
                  index_size VARCHAR(50),
                  unused_size VARCHAR(50)
                )
            SET NOCOUNT ON
-- ---------------------------------------------------------------------------------------
-- Insert Details into temp data base
            INSERT  [dbo].[temp]
-- ---------------------------------------------------------------------------------------
                    EXEC sp_msforeachtable ''sp_spaceused ''''?''''''
-- ---------------------------------------------------------------------------------------
-- Select Infomation from the table
            SELECT  a.Table_Name,
                    a.Row_Count,
                    COUNT(*) AS Col_Count,
                    a.Data_Size
            FROM    [dbo].[temp] a
                    INNER JOIN information_schema.columns b ON a.Table_Name COLLATE database_default = b.Table_Name COLLATE database_default
            GROUP BY a.Table_Name,
                    a.Row_Count,
                    a.Data_Size
            ORDER BY CAST(REPLACE(a.Data_Size, '' KB'', '''') AS integer) DESC
-- ---------------------------------------------------------------------------------------
-- delete the temp table from the data base
            DROP TABLE [dbo].[temp]
-- ---------------------------------------------------------------------------------------
        END -- ELSE
-- ---------------------------------------------------------------------------------------
    RETURN

' 
END
GO
/****** Object:  Table [dbo].[UserAuthentication]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAuthentication](
	[ApplicationID] [varchar](25) NOT NULL,
	[UserID] [varchar](124) NOT NULL,
	[Password] [varchar](124) NOT NULL,
	[Clicks] [smallint] NOT NULL,
	[CreatedIN] [smalldatetime] NOT NULL,
	[LastLogIN] [smalldatetime] NOT NULL,
	[MatrimonialID] [varchar](15) NOT NULL,
	[Membership] [smallint] NOT NULL CONSTRAINT [DF_UserAuthentication_Membersship]  DEFAULT ((0)),
	[Hidden] [bit] NULL,
	[SequrityQuestion] [tinyint] NOT NULL,
	[Answer] [varchar](64) NOT NULL,
 CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_UserAuthentication] UNIQUE NONCLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexHobbies]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexHobbies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexHobbies](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserFamilyDetails]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserFamilyDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserFamilyDetails](
	[ApplicationID] [varchar](25) NOT NULL,
	[FamilyDetails] [varchar](200) NULL,
	[FamilyValues] [smallint] NULL,
	[FamilyType] [smallint] NULL,
	[FamilyStatus] [smallint] NULL,
	[FamilyOrigin] [varchar](50) NULL,
	[NoOfBrothers] [smallint] NOT NULL,
	[NoOfSisters] [smallint] NOT NULL,
	[BrothersMarried] [smallint] NOT NULL,
	[SistersMarried] [smallint] NOT NULL,
	[FathersName] [varchar](50) NOT NULL,
	[MothersName] [varchar](50) NOT NULL,
	[FatherAlive] [bit] NOT NULL,
	[MotherAlive] [bit] NOT NULL,
	[FatherOccupation] [varchar](50) NULL,
	[MotherOccupation] [varchar](50) NULL,
 CONSTRAINT [PK_UserFamilyDetails] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexInterests]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexInterests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexInterests](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserPhotoHoroPasswordRequest]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPhotoHoroPasswordRequest](
	[RequestFrom] [varchar](15) NOT NULL,
	[RequestTo] [varchar](15) NOT NULL,
	[IsPhoto] [bit] NOT NULL CONSTRAINT [DF_UserPhotoHoroPasswordRequest_IsPhoto]  DEFAULT ((1)),
 CONSTRAINT [PK_UserPhotoHoroPasswordRequest] PRIMARY KEY CLUSTERED 
(
	[RequestFrom] ASC,
	[RequestTo] ASC,
	[IsPhoto] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationDataBaseTest]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationDataBaseTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationDataBaseTest](
	[test] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserPhotoHoroPasswordGrand]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordGrand]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPhotoHoroPasswordGrand](
	[GrandFrom] [varchar](15) NOT NULL,
	[GrandTo] [varchar](15) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[IsPhoto] [bit] NOT NULL,
 CONSTRAINT [PK_UserPhotoHoroPasswordGrand] PRIMARY KEY CLUSTERED 
(
	[GrandFrom] ASC,
	[GrandTo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserSuccessStory]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSuccessStory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSuccessStory](
	[SStoryID] [varchar](15) NOT NULL,
	[MatrimonialID] [varchar](10) NOT NULL,
	[Bride] [varchar](50) NOT NULL,
	[Groom] [varchar](50) NOT NULL,
	[WeddingDate] [smalldatetime] NOT NULL,
	[Photo] [image] NOT NULL,
	[SucessStory] [varchar](1010) NOT NULL,
 CONSTRAINT [PK_UserSuccessStory_1] PRIMARY KEY CLUSTERED 
(
	[SStoryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_UserSuccessStory_1] UNIQUE NONCLUSTERED 
(
	[MatrimonialID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_MaxMatrimonialID]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_MaxMatrimonialID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UserAuthentication_MaxMatrimonialID]

AS
	 SET NOCOUNT ON 
	 
    SELECT MAX(MatrimonialID) 
      FROM UserAuthentication 
      
	RETURN ' 
END
GO
/****** Object:  Table [dbo].[IndexCast]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexCast]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexCast](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](30) NOT NULL,
 CONSTRAINT [PK_IndexCaste] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdminAuthentication]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdminAuthentication](
	[ApplicationID] [varchar](25) NOT NULL,
	[UserID] [varchar](124) NOT NULL,
	[UserName] [varchar](124) NOT NULL,
	[Password] [varchar](124) NOT NULL,
	[MailID] [varchar](80) NOT NULL,
	[CreatedIN] [smalldatetime] NOT NULL,
	[LastLogIn] [smalldatetime] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_AdminAuthentication_1] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_AdminAuthentication_UniqueKey] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[MailID] ASC,
	[UserName] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserPhysicalAttributes]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhysicalAttributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPhysicalAttributes](
	[ApplicationID] [varchar](25) NOT NULL,
	[Height] [smallint] NOT NULL,
	[Weight] [smallint] NOT NULL,
	[BloodGroup] [smallint] NULL,
	[BodyType] [smallint] NULL,
	[Smoke] [smallint] NULL,
	[Drink] [smallint] NULL,
	[Complexion] [smallint] NOT NULL,
	[Diet] [smallint] NULL,
 CONSTRAINT [PK_UserPhysicalAttributes] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MatrimonialSailsDetails]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialSailsDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatrimonialSailsDetails](
	[BillingDate] [smalldatetime] NOT NULL,
	[MatrimonialID] [varchar](15) NOT NULL,
	[UserName] [varchar](124) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [varchar](300) NOT NULL,
	[PlanID] [smallint] NOT NULL,
	[AmountPaid] [smallint] NULL,
 CONSTRAINT [PK_MatrimonialSailsDetails] PRIMARY KEY CLUSTERED 
(
	[BillingDate] ASC,
	[MatrimonialID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserfavoriteList]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserfavoriteList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserfavoriteList](
	[ApplicationID] [varchar](25) NOT NULL,
	[favorite] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserfavoriteList] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC,
	[favorite] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserAlbum]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAlbum](
	[ApplicationID] [varchar](25) NOT NULL,
	[Photo1] [image] NULL,
	[Album1] [image] NULL,
	[Album2] [image] NULL,
	[Album3] [image] NULL,
	[Horoscope] [image] NULL,
	[PhotoPassword] [varchar](25) NULL,
	[HoroPassword] [varchar](25) NULL,
	[isPhoto] [bit] NULL,
 CONSTRAINT [PK_UserAlbum] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AbuseSuccessStorys]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseSuccessStorys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbuseSuccessStorys](
	[SStoryID] [varchar](15) NOT NULL,
	[Message] [varchar](200) NULL,
 CONSTRAINT [PK_AbuseSuccessStorys] PRIMARY KEY CLUSTERED 
(
	[SStoryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexHoroManglic]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexHoroManglic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexHoroManglic](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndexHoroManglic] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexMaritalStatus]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexMaritalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexMaritalStatus](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndexMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserHobiesAndIntrests]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserHobiesAndIntrests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserHobiesAndIntrests](
	[ApplicationID] [varchar](25) NOT NULL,
	[Hobies] [varchar](64) NULL,
	[OtherHobies] [varchar](64) NULL,
	[Interests] [varchar](64) NULL,
	[OtherInterests] [varchar](64) NULL,
 CONSTRAINT [PK_UserHobiesAndIntrests] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexMoonSign]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexMoonSign]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexMoonSign](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndexMoonSign] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[AbuseSuccessStorys_DropReport]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseSuccessStorys_DropReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AbuseSuccessStorys_DropReport] ( @SStoryID varchar(15) )
AS 
    SET NOCOUNT ON 
	
    DELETE  AbuseSuccessStorys.SStoryID
    FROM    dbo.AbuseSuccessStorys
    WHERE   AbuseSuccessStorys.SStoryID = @SStoryID

    RETURN
' 
END
GO
/****** Object:  Table [dbo].[IndexProfileCreatedBy]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexProfileCreatedBy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexProfileCreatedBy](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndexProfileCreatedBy] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[UserPartnerPreference_DataHandler]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPartnerPreference_DataHandler]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserPartnerPreference_DataHandler] 
-- =============================================
			@ApplicationID varchar(25)
           ,@LookingFor varchar(10)= NULL
           ,@AgeMin  smallint = NULL
           ,@AgeMax  smallint = NULL
           ,@Complexion varchar(30)= NULL
           ,@HaveChildren  smallint = NULL
           ,@HeightMin  smallint = NULL
           ,@HeightMax  smallint = NULL
           ,@PhysicalStatus  smallint = NULL
           ,@MotherTongue varchar(150)= NULL
           ,@Religion varchar(25)= NULL
           ,@Caste varchar(650)= NULL
           ,@Manglik  smallint = NULL
           ,@Dite  smallint = NULL
           ,@Education varchar(25)= NULL
           ,@EducationDetails varchar(64)= NULL
           ,@AnnualIncome  smallint = NULL
           ,@Occupation varchar(280)= NULL
           ,@Citizenship varchar(800)= NULL
           ,@LivingIn varchar(800)= NULL
           ,@ResidingState varchar(100)= NULL
           ,@ResStatus varchar(20)= NULL
-- =============================================
AS
BEGIN
-- =============================================
	SET NOCOUNT ON;
-- =============================================================================================================================================

	IF NOT EXISTS (SELECT [ApplicationID] FROM  [dbo].[UserPartnerPreference] WHERE  [ApplicationID] =@ApplicationID )
		BEGIN
		-- =============================================================================================================================================
			INSERT INTO [dbo].[UserPartnerPreference]
			   ([ApplicationID]
			   ,[LookingFor]
			   ,[AgeMin]
			   ,[AgeMax]
			   ,[Complexion]
			   ,[HaveChildren]
			   ,[HeightMin]
			   ,[HeightMax]
			   ,[PhysicalStatus]
			   ,[MotherTongue]
			   ,[Religion]
			   ,[Cast]
			   ,[Manglik]
			   ,[Dite]
			   ,[Education]
			   ,[EducationDetails]
			   ,[AnnualIncome]
			   ,[Occupation]
			   ,[Citizenship]
			   ,[LivingIn]
			   ,[ResidingState]
			   ,[ResStatus])
		 VALUES
			   (
				@ApplicationID
			   ,@LookingFor
			   ,@AgeMin
			   ,@AgeMax
			   ,@Complexion
			   ,@HaveChildren
			   ,@HeightMin 
			   ,@HeightMax
			   ,@PhysicalStatus 
			   ,@MotherTongue
			   ,@Religion
			   ,@Caste
			   ,@Manglik
			   ,@Dite
			   ,@Education 
			   ,@EducationDetails
			   ,@AnnualIncome 
			   ,@Occupation 
			   ,@Citizenship 
			   ,@LivingIn 
			   ,@ResidingState 
			   ,@ResStatus 
			  )
		-- =============================================================================================================================================
		END
-- =============================================================================================================================================
--	ELSE
-- =============================================================================================================================================
		BEGIN
		-- =============================================================================================================================================
			UPDATE [dbo].[UserPartnerPreference]
			   SET [ApplicationID] = @ApplicationID
				  ,[LookingFor] = @LookingFor
				  ,[AgeMin] = @AgeMin
				  ,[AgeMax] = @AgeMax
				  ,[Complexion] = @Complexion
				  ,[HaveChildren] = @HaveChildren
				  ,[HeightMin] = @HeightMin
				  ,[HeightMax] = @HeightMax
				  ,[PhysicalStatus] = @PhysicalStatus
				  ,[MotherTongue] = @MotherTongue
				  ,[Religion] = @Religion
				  ,[Cast] = @Caste
				  ,[Manglik] = @Manglik
				  ,[Dite] = @Dite
				  ,[Education] = @Education
				  ,[EducationDetails] = @EducationDetails
				  ,[AnnualIncome] = @AnnualIncome
				  ,[Occupation] = @Occupation
				  ,[Citizenship] = @Citizenship
				  ,[LivingIn] = @LivingIn
				  ,[ResidingState] = @ResidingState
				  ,[ResStatus] = @ResStatus
			 WHERE [ApplicationID] = @ApplicationID
		-- =============================================================================================================================================
		END
-- =============================================================================================================================================

END
' 
END
GO
/****** Object:  Table [dbo].[IndexBloodGroup]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexBloodGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexBloodGroup](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](13) NULL,
 CONSTRAINT [PK_IndexBloodGroup] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexReferenceBy]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexReferenceBy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexReferenceBy](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL,
 CONSTRAINT [PK_IndexReferenceBy] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserPartnerPreference]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPartnerPreference]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPartnerPreference](
	[ApplicationID] [varchar](25) NOT NULL,
	[LookingFor] [varchar](10) NULL,
	[AgeMin] [smallint] NULL,
	[AgeMax] [smallint] NULL,
	[Complexion] [varchar](30) NULL,
	[HaveChildren] [smallint] NULL,
	[HeightMin] [smallint] NULL,
	[HeightMax] [smallint] NULL,
	[PhysicalStatus] [smallint] NULL,
	[MotherTongue] [varchar](150) NULL,
	[Religion] [varchar](25) NULL,
	[Cast] [varchar](650) NULL,
	[Manglik] [smallint] NULL,
	[Dite] [smallint] NULL,
	[Education] [varchar](25) NULL,
	[EducationDetails] [varchar](64) NULL,
	[AnnualIncome] [smallint] NULL,
	[Occupation] [varchar](280) NULL,
	[Citizenship] [varchar](800) NULL,
	[LivingIn] [varchar](800) NULL,
	[ResidingState] [varchar](100) NULL,
	[ResStatus] [varchar](20) NULL,
 CONSTRAINT [PK_UserPartnerPreference] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexReligion]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexReligion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexReligion](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
	[OfSet] [smallint] NOT NULL,
 CONSTRAINT [PK_IndexReligion] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexStar]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexStar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexStar](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](35) NOT NULL,
 CONSTRAINT [PK_IndexStar] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexAnnualIncomeRange]    Script Date: 06/14/2007 13:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexAnnualIncomeRange]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexAnnualIncomeRange](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexComplexion]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexComplexion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexComplexion](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](40) NOT NULL,
 CONSTRAINT [PK_IndexComplexion] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserIntrests]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIntrests]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserIntrests](
	[IntrestFrom] [varchar](15) NOT NULL,
	[IntrestTo] [varchar](15) NOT NULL,
	[IntrestsCode] [smallint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UserIntrests_1] PRIMARY KEY CLUSTERED 
(
	[IntrestFrom] ASC,
	[IntrestTo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_UserIntrests] UNIQUE NONCLUSTERED 
(
	[IntrestFrom] ASC,
	[IntrestTo] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MatrimonialMembershipPlan]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMembershipPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatrimonialMembershipPlan](
	[PlanName] [varchar](50) NOT NULL,
	[PlanDuration] [smallint] NOT NULL,
	[PlanAmount] [smallint] NOT NULL,
	[PlanID] [smallint] NOT NULL,
 CONSTRAINT [PK_MatrimonialMembershipPlan] PRIMARY KEY CLUSTERED 
(
	[PlanName] ASC,
	[PlanID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexCountry]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexCountry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexCountry](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](40) NOT NULL,
 CONSTRAINT [PK_IndexCountry] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexCurrency]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexCurrency]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexCurrency](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](45) NOT NULL,
 CONSTRAINT [PK_IndexCurrency] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexDiet]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexDiet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexDiet](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
 CONSTRAINT [PK_IndexDiet] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexEduDetails]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexEduDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexEduDetails](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IndexEduDetails] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexEducation]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexEducation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexEducation](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](48) NOT NULL,
 CONSTRAINT [PK_IndexEducation] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AbuseProfileList]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseProfileList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AbuseProfileList](
	[MatrimonialID] [varchar](15) NOT NULL,
	[Message] [varchar](200) NULL,
 CONSTRAINT [PK_AbuseProfileList] PRIMARY KEY CLUSTERED 
(
	[MatrimonialID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MatrimonialMailList]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatrimonialMailList](
	[MailAddress] [varchar](50) NOT NULL,
	[PromotionalMails] [bit] NOT NULL,
	[NewFeatures] [bit] NOT NULL,
	[PartnerMails] [bit] NOT NULL,
	[DailyMatch] [bit] NOT NULL,
 CONSTRAINT [PK_MatrimonialMailList] PRIMARY KEY CLUSTERED 
(
	[MailAddress] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexEmployedIn]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexEmployedIn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexEmployedIn](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](40) NOT NULL,
 CONSTRAINT [PK_IndexEmployedIn] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexResidenceStatus]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexResidenceStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexResidenceStatus](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](35) NOT NULL,
 CONSTRAINT [PK_IndexResidenceStatus] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MatrimonialFeedBack]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBack]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatrimonialFeedBack](
	[Name] [varchar](50) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Message] [varchar](300) NOT NULL,
	[Email] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MatrimonialFeedBack] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Date] ASC,
	[Message] ASC,
	[Email] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[AbuseProfileList_DropReport]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseProfileList_DropReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AbuseProfileList_DropReport]
    (
      @MatrimonialID varchar(15)
    )
AS 
    SET NOCOUNT ON 
	
    DELETE  AbuseProfileList.MatrimonialID
    FROM    dbo.AbuseProfileList
    WHERE   AbuseProfileList.MatrimonialID = @MatrimonialID

    RETURN
' 
END
GO
/****** Object:  Table [dbo].[IndexOccupation]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexOccupation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexOccupation](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](55) NOT NULL,
 CONSTRAINT [PK_IndexOccupation] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexSmokeNDrink]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexSmokeNDrink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexSmokeNDrink](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
 CONSTRAINT [PK_IndexSmokeNDrink] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexFamilytype]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexFamilytype]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexFamilytype](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
 CONSTRAINT [PK_IndexFamilytype] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserContactInformations]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserContactInformations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserContactInformations](
	[ApplicationID] [varchar](25) NOT NULL,
	[Address] [varchar](350) NOT NULL,
	[Country] [smallint] NOT NULL,
	[State] [smallint] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[PhoneNo] [int] NULL,
	[AreaCode] [smallint] NULL,
	[ISDCode] [smallint] NULL,
	[Mobile] [bigint] NULL,
	[Residence] [smallint] NULL,
	[ResidenceType] [smallint] NULL,
	[ResidenceCity] [varchar](50) NULL,
 CONSTRAINT [PK_UserContactInformations] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexFamilyValue]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexFamilyValue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexFamilyValue](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
 CONSTRAINT [PK_IndexFamilyValue] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MatrimonialFeedBackFilter]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBackFilter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatrimonialFeedBackFilter](
	[FilterON] [bit] NOT NULL,
	[LifeTime] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexFamilyStatus]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexFamilyStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexFamilyStatus](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](25) NOT NULL,
 CONSTRAINT [PK_IndexFamilyStatus] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PaidMemberDetails]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaidMemberDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaidMemberDetails](
	[ApplicationID] [varchar](25) NOT NULL,
	[PlanID] [smallint] NOT NULL,
	[MemberFrom] [smalldatetime] NOT NULL,
	[MemberTo] [smalldatetime] NOT NULL,
	[DateOfParches] [smalldatetime] NOT NULL,
	[MatrimonialID] [varchar](15) NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PaidMemberDetails] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserVisiters]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserVisiters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserVisiters](
	[MartimonialID] [varchar](15) NOT NULL,
	[visitor1] [varchar](15) NULL,
	[visitor2] [varchar](15) NULL,
	[visitor3] [varchar](15) NULL,
	[visitor4] [varchar](15) NULL,
	[visitor5] [varchar](15) NULL,
	[visitor6] [varchar](15) NULL,
	[visitor7] [varchar](15) NULL,
	[Pointer] [smallint] NULL,
 CONSTRAINT [PK_UserVisiters] PRIMARY KEY CLUSTERED 
(
	[MartimonialID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserSocioReligionAttributes]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSocioReligionAttributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSocioReligionAttributes](
	[ApplicationID] [varchar](25) NOT NULL,
	[Star] [smallint] NULL,
	[MoonSign] [smallint] NULL,
	[HoroscopeMatch] [smallint] NULL,
	[PlaceOfBirth] [varchar](64) NULL,
	[TimeOfBirth] [datetime] NULL,
	[Manglik] [smallint] NULL,
 CONSTRAINT [PK_UserSocioReligionAttributes] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserBookMark]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBookMark]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserBookMark](
	[MatrimonialID] [varchar](15) NOT NULL,
	[Link] [varchar](15) NOT NULL,
 CONSTRAINT [PK_UserBookMark] PRIMARY KEY CLUSTERED 
(
	[MatrimonialID] ASC,
	[Link] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexState]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexState](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](45) NOT NULL,
 CONSTRAINT [PK_IndexState] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IndexMotherTongue]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndexMotherTongue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IndexMotherTongue](
	[Value] [smallint] NOT NULL,
	[Item] [varchar](45) NOT NULL,
 CONSTRAINT [PK_IndexMotherTongue] PRIMARY KEY CLUSTERED 
(
	[Value] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserMessages]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserMessages](
	[MessageFrom] [varchar](15) NOT NULL,
	[MessageTo] [varchar](15) NOT NULL,
	[DateSend] [smalldatetime] NOT NULL,
	[Message] [varchar](200) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_UserMessages_Status]  DEFAULT ((0)),
	[MessageID] [smallint] NOT NULL,
 CONSTRAINT [PK_UserMessages] PRIMARY KEY CLUSTERED 
(
	[MessageTo] ASC,
	[MessageID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserEducationAndOccupation]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEducationAndOccupation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserEducationAndOccupation](
	[ApplicationID] [varchar](25) NOT NULL,
	[Education] [smallint] NOT NULL,
	[EduDetails] [smallint] NOT NULL,
	[AnualIncome] [smallint] NULL,
	[IncomeIn] [smallint] NULL,
	[Occupation] [smallint] NOT NULL,
	[EmployedIn] [smallint] NOT NULL,
 CONSTRAINT [PK_UserEducationAndOccupation] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserBasicInformation]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBasicInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserBasicInformation](
	[ApplicationID] [varchar](25) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DOB] [smalldatetime] NOT NULL,
	[MotherTongue] [smallint] NOT NULL,
	[MaritalStatus] [smallint] NOT NULL,
	[NoOfChildren] [smallint] NULL,
	[PhysicalStatus] [bit] NULL,
	[ChildrenLivingWith] [bit] NULL,
	[Religion] [smallint] NOT NULL,
	[Cast] [smallint] NULL,
	[SubCast] [varchar](50) NULL,
	[CreatedBy] [smallint] NOT NULL,
 CONSTRAINT [PK_UserBasicInformation] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserAboutAndExpectation]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAboutAndExpectation](
	[ApplicationID] [varchar](25) NOT NULL,
	[AboutMe] [varchar](1010) NULL,
	[MyExpectations] [varchar](1010) NULL,
 CONSTRAINT [PK_UserAboutAndExpectation] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetSequrityQuestion]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetSequrityQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserAuthentication_GetSequrityQuestion]
	-- Add the parameters for the stored procedure here
    @UserID VARCHAR(128)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;
        SELECT  IndexSequrity.SequrityQuestion
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.IndexSequrity ON UserAuthentication.SequrityQuestion = IndexSequrity.[Value]
        WHERE   ( UserAuthentication.UserID = @UserID )
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Educational]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Search_Educational]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Search_Educational] 
		-- ----------------
    @Education SMALLINT, 
		-- ----------------
    @Religion SMALLINT,
    @Caste SMALLINT,
		-- ----------------
    @Gender BIT,
    @isPhoto BIT,
    @AgeMin INT,
    @AgeMax INT
		-- ----------------
AS 
    BEGIN
        SET NOCOUNT ON ;
-- =====================================================================================================================================
        IF ( @Education <> 0 )
-- =====================================================================================================================================
            BEGIN
	-- =====================================================================================================================================
                IF ( @Religion <> 0 )
		-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
                        IF ( @Caste <> 0 )
				-- =====================================================================================================================================
                            BEGIN
				-- =====================================================================================================================================
				-- We Need A 
				-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserEducationAndOccupation.Education = @Education )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto = 1 )
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserEducationAndOccupation.Education = @Education )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto <> 1 )
						-- =====================================================================================================================================
                            END -- Caste <> 0
				-- =====================================================================================================================================
                        ELSE 
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
					-- We Need A 
					-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserEducationAndOccupation.Education = @Education )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserEducationAndOccupation.Education = @Education )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
                            END -- Caste = 0
			-- =====================================================================================================================================
                    END
			-- =====================================================================================================================================
                ELSE -- Religion  = 0
			-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
			-- We Need A 
			-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                        INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( UserEducationAndOccupation.Education = @Education )
                                        AND ( UserAuthentication.Hidden IS NULL )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
				-- There is no entry in album so we never need to have photopassword
				-- =====================================================================================================================================
                        ELSE
					-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserEducationAndOccupation.Education = @Education )
                                        AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
                    END
		-- =====================================================================================================================================
            END
-- =====================================================================================================================================
        ELSE
-- =====================================================================================================================================
            BEGIN
	-- =====================================================================================================================================
                IF ( @Religion <> 0 )
		-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
                        IF ( @Caste <> 0 )
				-- =====================================================================================================================================
                            BEGIN
				-- =====================================================================================================================================
				-- We Need A 
				-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto = 1 )
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto <> 1 )
						-- =====================================================================================================================================
                            END -- Caste <> 0
				-- =====================================================================================================================================
                        ELSE 
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
					-- We Need A 
					-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
                            END -- Caste = 0
			-- =====================================================================================================================================
                    END
			-- =====================================================================================================================================
                ELSE -- Religion  = 0
			-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
			-- We Need A 
			-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( UserAuthentication.Hidden IS NULL )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
				-- There is no entry in album so we never need to have photopassword
				-- =====================================================================================================================================
                        ELSE
					-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAuthentication.Hidden IS NULL )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax ) 
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
                    END
		-- =====================================================================================================================================
	-- =====================================================================================================================================
            END
-- =====================================================================================================================================

    END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_CheckUserExsists]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_CheckUserExsists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserAuthentication_CheckUserExsists] 
	-- Add the parameters for the stored procedure here
    @UserID VARCHAR(128)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

        DECLARE @Flag BIT
        IF (
             SELECT UserAuthentication.UserID
             FROM   dbo.UserAuthentication
             WHERE  UserAuthentication.UserID = @UserID
           ) IS NOT NULL 
            BEGIN
                SET @Flag = 1
            END
        ELSE 
            BEGIN
                SET @Flag = 0
            END

        SELECT  @Flag AS Status
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Simple]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Search_Simple]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Search_Simple] 
-- ----------------
    @Religion SMALLINT,
    @Caste SMALLINT,
-- ----------------
    @Gender BIT,
    @isPhoto BIT,
    @AgeMin INT,
    @AgeMax INT
-- ----------------
AS 
    BEGIN


        SET NOCOUNT ON ;

        IF ( @Religion <> 0 )
		-- =====================================================================================================================================
            BEGIN
			-- =====================================================================================================================================
                IF ( @Caste <> 0 )
				-- =====================================================================================================================================
                    BEGIN
				-- =====================================================================================================================================
				-- We Need A 
				-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                            BEGIN
							-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserBasicInformation.Religion = @Religion )
                                        AND ( UserBasicInformation.[Cast] = @Caste )
                                        AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                            END -- (@isPhoto = 1 )
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                        ELSE
							-- =====================================================================================================================================
                            BEGIN
							-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserBasicInformation.Religion = @Religion )
                                        AND ( UserBasicInformation.[Cast] = @Caste )
                                        AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                            END -- (@isPhoto <> 1 )
						-- =====================================================================================================================================
                    END -- Caste <> 0
				-- =====================================================================================================================================
                ELSE 
				-- =====================================================================================================================================
                    BEGIN
					-- =====================================================================================================================================
					-- We Need A 
					-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                            BEGIN
							-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( UserBasicInformation.Religion = @Religion )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                            END
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                        ELSE
							-- =====================================================================================================================================
                            BEGIN
							-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserBasicInformation.Religion = @Religion )
                                        AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                            END
						-- =====================================================================================================================================
                    END -- Caste = 0
			-- =====================================================================================================================================
            END
			-- =====================================================================================================================================
        ELSE -- Religion  = 0
			-- =====================================================================================================================================
            BEGIN
			-- =====================================================================================================================================
			-- We Need A 
			-- =====================================================================================================================================
                IF ( @isPhoto = 1 )
				-- =====================================================================================================================================
                    BEGIN
					-- =====================================================================================================================================
                        SELECT  UserAuthentication.MatrimonialID
					-- =====================================================================================================================================
                        FROM    dbo.UserAuthentication
                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
					-- =====================================================================================================================================
                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                AND ( UserAlbum.isPhoto = @isPhoto )
                                AND ( UserAuthentication.Hidden IS NULL )
                                AND ( DATEDIFF(year, UserBasicInformation.DOB,
                                               GETDATE()) BETWEEN @AgeMin
                                                          AND     @AgeMax )
					-- =====================================================================================================================================
                        ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                    END
				-- =====================================================================================================================================
				-- There is no entry in album so we never need to have photopassword
				-- =====================================================================================================================================
                ELSE
					-- =====================================================================================================================================
                    BEGIN
					-- =====================================================================================================================================
                        SELECT  UserAuthentication.MatrimonialID 
					-- =====================================================================================================================================
                        FROM    dbo.UserAuthentication
                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
					-- =====================================================================================================================================
                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                AND ( DATEDIFF(year, UserBasicInformation.DOB,
                                               GETDATE()) BETWEEN @AgeMin
                                                          AND     @AgeMax )
                                AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                        ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                    END
				-- =====================================================================================================================================
            END
		-- =====================================================================================================================================
    END







' 
END
GO
/****** Object:  StoredProcedure [dbo].[User_ProfileCount]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_ProfileCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[User_ProfileCount] 
	-- Add the parameters for the stored procedure here
    @MatrimonialID VARCHAR(15) = NULL
AS 
    BEGIN
-- ==================================================================================================================================================================================================
        SET NOCOUNT ON ;
-- ==================================================================================================================================================================================================
        DECLARE @IsPhoto BIT 
        DECLARE @IsPhotoProtected BIT 
        DECLARE @IsHoroScope BIT 
        DECLARE @IsHoroProtected BIT 
        DECLARE @LastLogInDate SMALLDATETIME 
        DECLARE @CreatedON SMALLDATETIME 
        DECLARE @Cliks SMALLINT 
        DECLARE @Name VARCHAR(64)

-- ==================================================================================================================================================================================================================================
        SELECT  @LastLogInDate = UserAuthentication.LastLogIN,
                @CreatedON = UserAuthentication.CreatedIN,
                @Cliks = UserAuthentication.Clicks,
                @Name = UserBasicInformation.Name
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
        WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )

-- ==================================================================================================================================================================================================
-- =================================================================================================================================================================================================================================
-- =================================================         Photo        ==========================================================================================================================================================
        IF ( ( (
                 SELECT UserAlbum.Photo1
                 FROM   dbo.UserAuthentication
                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                 WHERE  ( UserAuthentication.MatrimonialID = @MatrimonialID )
               ) IS NOT NULL )
             OR ( (
                    SELECT  UserAlbum.Album1
                    FROM    dbo.UserAuthentication
                            INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                    WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
                  ) IS NOT NULL )
             OR ( (
                    SELECT  UserAlbum.Album2
                    FROM    dbo.UserAuthentication
                            INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                    WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
                  ) IS NOT NULL )
             OR ( (
                    SELECT  UserAlbum.Album3
                    FROM    dbo.UserAuthentication
                            INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                    WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
                  ) IS NOT NULL )
           ) 
            BEGIN 
                SET @IsPhoto = 1
		-- ===================================================    Photo Password   =========================================================================================================================================================
                IF ( (
                       SELECT   UserAlbum.PhotoPassword
                       FROM     dbo.UserAuthentication
                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                       WHERE    ( UserAuthentication.MatrimonialID = @MatrimonialID )
                     ) IS NOT NULL ) 
                    BEGIN 
                        SET @IsPhotoProtected = 1
                    END
                ELSE 
                    BEGIN 
                        SET @IsPhotoProtected = 0
                    END
		-- =================================================================================================================================================================================================================================
            END
        ELSE 
            BEGIN 
                SET @IsPhoto = 0
                SET @IsPhotoProtected = 0
            END
-- =================================================================================================================================================================================================================================
-- ====================================================    Horoscope   ===============================================================================================================================================================
        IF ( (
               SELECT   UserAlbum.Horoscope
               FROM     dbo.UserAuthentication
                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
               WHERE    ( UserAuthentication.MatrimonialID = @MatrimonialID )
             ) IS NOT NULL ) 
            BEGIN 
                SET @IsHoroScope = 1
		-- =======================================================   HoroPassword  ==============================================================================================================================================================
                IF ( (
                       SELECT   UserAlbum.HoroPassword
                       FROM     dbo.UserAuthentication
                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                       WHERE    ( UserAuthentication.MatrimonialID = @MatrimonialID )
                     ) IS NOT NULL ) 
                    BEGIN 
                        SET @IsHoroProtected = 1
                    END
                ELSE 
                    BEGIN 
                        SET @IsHoroProtected = 0
                    END
		-- ==================================================================================================================================================================================================================================
            END
        ELSE 
            BEGIN 
                SET @IsHoroScope = 0
                SET @IsHoroProtected = 0
            END
-- ==================================================================================================================================================================================================================================
-- ==================================================================================================================================================================================================
        SELECT 
			-- Album settings 
                @IsPhoto AS IsPhoto,
                @IsPhotoProtected AS IsPhotoProtected,
                @IsHoroScope AS IsHoroscope,
                @IsHoroProtected AS IsHoroProtected,
                @LastLogInDate AS LastLogIn,
                @CreatedON AS CreatedOn,
                @Cliks AS Cliks,
                @Name AS Name,

			-- Intrest (OUTBOX)
                (
                  SELECT    COUNT(UserIntrests.IntrestFrom)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestFrom = @MatrimonialID )
                              AND ( UserIntrests.Status = 1 )
                            )
                ) AS IntrestSenPending,
                (
                  SELECT    COUNT(UserIntrests.IntrestFrom)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestFrom = @MatrimonialID )
                              AND ( UserIntrests.Status = 2 )
                            )
                ) AS IntrestSenAccepted,
                (
                  SELECT    COUNT(UserIntrests.IntrestFrom)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestFrom = @MatrimonialID )
                              AND ( UserIntrests.Status = 3 )
                            )
                ) AS IntrestSenDeclined,
			-- Intrest (INbox)
                (
                  SELECT    COUNT(UserIntrests.IntrestTo)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestTo = @MatrimonialID )
                              AND ( UserIntrests.Status = 1 )
                            )
                ) AS IntrestResPending,
                (
                  SELECT    COUNT(UserIntrests.IntrestTo)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestTo = @MatrimonialID )
                              AND ( UserIntrests.Status = 2 )
                            )
                ) AS IntrestResAccepted,
                (
                  SELECT    COUNT(UserIntrests.IntrestTo)
                  FROM      dbo.UserIntrests
                  WHERE     ( ( UserIntrests.IntrestTo = @MatrimonialID )
                              AND ( UserIntrests.Status = 3 )
                            )
                ) AS IntrestResDeclined,
			-- Messages OutBox
                (
                  SELECT    COUNT(UserMessages.Status)
                  FROM      dbo.UserMessages
                  WHERE     ( UserMessages.MessageFrom = @MatrimonialID )
                ) AS MessageOutBox,
			-- Messages Inbox
                (
                  SELECT    COUNT(UserMessages.Status)
                  FROM      dbo.UserMessages
                  WHERE     ( UserMessages.MessageTo = @MatrimonialID )
                ) AS MessageInBox,
			-- Passwords
                (
                  SELECT    COUNT(UserPhotoHoroPasswordGrand.GrandTo)
                  FROM      dbo.UserPhotoHoroPasswordGrand
                  WHERE     ( UserPhotoHoroPasswordGrand.GrandTo = @MatrimonialID )
                ) AS PhotoPasswordGrnCount,
                (
                  SELECT    COUNT(UserPhotoHoroPasswordRequest.RequestTo)
                  FROM      dbo.UserPhotoHoroPasswordRequest
                  WHERE     ( UserPhotoHoroPasswordRequest.RequestTo = @MatrimonialID )
                ) AS PhotoPasswordReqCount,
			-- UserBookMark
                (
                  SELECT    COUNT(UserBookMark.MatrimonialID)
                  FROM      dbo.UserBookMark
                  WHERE     ( UserBookMark.MatrimonialID = @MatrimonialID )
                ) AS BookMarkCount
-- ==================================================================================================================================================================================================
    END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Occupational]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Search_Occupational]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		Prasanth Thampi
-- Create date: 
-- Description:	Occupational Search
-- =============================================
CREATE PROCEDURE [dbo].[Search_Occupational] 
		-- ----------------
    @Occupation SMALLINT, 
		-- ----------------
    @Religion SMALLINT,
    @Caste SMALLINT,
		-- ----------------
    @Gender BIT,
    @isPhoto BIT,
    @AgeMin INT,
    @AgeMax INT
		-- ----------------
AS 
    BEGIN
        SET NOCOUNT ON ;
-- =====================================================================================================================================
        IF ( @Occupation <> 0 )
-- =====================================================================================================================================
            BEGIN
	-- =====================================================================================================================================
                IF ( @Religion <> 0 )
		-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
                        IF ( @Caste <> 0 )
				-- =====================================================================================================================================
                            BEGIN
				-- =====================================================================================================================================
				-- We Need A 
				-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto = 1 )
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto <> 1 )
						-- =====================================================================================================================================
                            END -- Caste <> 0
				-- =====================================================================================================================================
                        ELSE 
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
					-- We Need A 
					-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                                AND ( UserAuthentication.Hidden IS NULL ) 
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
                            END -- Caste = 0
			-- =====================================================================================================================================
                    END
			-- =====================================================================================================================================
                ELSE -- Religion  = 0
			-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
			-- We Need A 
			-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                        INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
				-- There is no entry in album so we never need to have photopassword
				-- =====================================================================================================================================
                        ELSE
					-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserEducationAndOccupation.Occupation = @Occupation )
                                        AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
                    END
		-- =====================================================================================================================================
            END
-- =====================================================================================================================================
        ELSE
-- =====================================================================================================================================
            BEGIN
	-- =====================================================================================================================================
                IF ( @Religion <> 0 )
		-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
                        IF ( @Caste <> 0 )
				-- =====================================================================================================================================
                            BEGIN
				-- =====================================================================================================================================
				-- We Need A 
				-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto = 1 )
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserBasicInformation.[Cast] = @Caste )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END -- (@isPhoto <> 1 )
						-- =====================================================================================================================================
                            END -- Caste <> 0
				-- =====================================================================================================================================
                        ELSE 
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
					-- We Need A 
					-- =====================================================================================================================================
                                IF ( @isPhoto = 1 )
						-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( UserAlbum.isPhoto = @isPhoto )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
						-- There is no entry in album 
						-- =====================================================================================================================================
                                ELSE
							-- =====================================================================================================================================
                                    BEGIN
							-- =====================================================================================================================================
                                        SELECT  UserAuthentication.MatrimonialID 
							-- =====================================================================================================================================
                                        FROM    dbo.UserAuthentication
                                                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
							-- =====================================================================================================================================
                                        WHERE   ( UserBasicInformation.Gender = @Gender )
                                                AND ( DATEDIFF(year, UserBasicInformation.DOB, GETDATE()) BETWEEN @AgeMin
                                                                                                          AND     @AgeMax )
                                                AND ( UserBasicInformation.Religion = @Religion )
                                                AND ( UserAuthentication.Hidden IS NULL )
							-- =====================================================================================================================================
                                        ORDER BY UserBasicInformation.DOB DESC
							-- =====================================================================================================================================
                                    END
						-- =====================================================================================================================================
                            END -- Caste = 0
			-- =====================================================================================================================================
                    END
			-- =====================================================================================================================================
                ELSE -- Religion  = 0
			-- =====================================================================================================================================
                    BEGIN
			-- =====================================================================================================================================
			-- We Need A 
			-- =====================================================================================================================================
                        IF ( @isPhoto = 1 )
				-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( UserAlbum.isPhoto = @isPhoto )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
				-- There is no entry in album so we never need to have photopassword
				-- =====================================================================================================================================
                        ELSE
					-- =====================================================================================================================================
                            BEGIN
					-- =====================================================================================================================================
                                SELECT  UserAuthentication.MatrimonialID 
					-- =====================================================================================================================================
                                FROM    dbo.UserAuthentication
                                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
					-- =====================================================================================================================================
                                WHERE   ( UserBasicInformation.Gender = @Gender )
                                        AND ( DATEDIFF(year,
                                                       UserBasicInformation.DOB,
                                                       GETDATE()) BETWEEN @AgeMin
                                                                  AND     @AgeMax )
                                        AND ( UserAuthentication.Hidden IS NULL )
					-- =====================================================================================================================================
                                ORDER BY UserBasicInformation.DOB DESC
					-- =====================================================================================================================================
                            END
				-- =====================================================================================================================================
                    END
		-- =====================================================================================================================================
            END
-- =====================================================================================================================================

    END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_CheckQuestion]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_CheckQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserAuthentication_CheckQuestion]
	-- Add the parameters for the stored procedure here
    @UserID VARCHAR(128),
    @Answer VARCHAR(64)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;
        DECLARE @Flag BIT
        IF (
             SELECT UserAuthentication.UserID
             FROM   dbo.UserAuthentication
             WHERE  ( UserAuthentication.UserID = @UserID )
                    AND UserAuthentication.Answer = @Answer
           ) IS NOT NULL 
            BEGIN
                SET @Flag = 1
            END
        ELSE 
            BEGIN
                SET @Flag = 0
            END

        SELECT  @Flag AS Status
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMailList_GetList]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialMailList_GetList] 
	-- Add the parameters for the stored procedure here
    @Flag TINYINT = 1
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;
-- =============================================  News Letter =============================================
        IF @Flag = 1 
            BEGIN
                SELECT  MatrimonialMailList.MailAddress
                FROM    dbo.MatrimonialMailList
                WHERE   MatrimonialMailList.PromotionalMails = 1
            END
-- ============================================= New prodects =============================================
        ELSE 
            IF @Flag = 2 
                BEGIN
                    SELECT  MatrimonialMailList.MailAddress
                    FROM    dbo.MatrimonialMailList
                    WHERE   MatrimonialMailList.NewFeatures = 1
                END
-- ============================================= TO ALL =============================================
            ELSE 
                IF @Flag = 3 
                    BEGIN
                        SELECT  MatrimonialMailList.MailAddress
                        FROM    dbo.MatrimonialMailList
                    END
-- ============================================= Paid Memberd =============================================
                ELSE 
                    IF @Flag = 4 
                        BEGIN
                            SELECT  UserAuthentication.UserID AS MailAddress
                            FROM    dbo.UserAuthentication
                            WHERE   ( UserAuthentication.Membership = 6 )
                        END
-- ============================================= Active  Memberd =============================================
                    ELSE 
                        IF @Flag = 5 
                            BEGIN
                                SELECT  UserAuthentication.UserID AS MailAddress
                                FROM    dbo.UserAuthentication
                                WHERE   ( DATEDIFF(YY,
                                                   UserAuthentication.LastLogIN,
                                                   GETDATE()) <= 1 )
                            END
-- ============================================= Inactive Memberd =============================================
                        ELSE 
                            IF @Flag = 6 
                                BEGIN
                                    SELECT  UserAuthentication.UserID AS MailAddress
                                    FROM    dbo.UserAuthentication
                                    WHERE   ( DATEDIFF(YY,
                                                       UserAuthentication.LastLogIN,
                                                       GETDATE()) >= 1 )
                                END
-- ==========================================================================================================

    END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonials_MemberStatis]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonials_MemberStatis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[Matrimonials_MemberStatis] @Flag TINYINT = 0
AS 
    SET NOCOUNT ON

    BEGIN

		/*   Function to get the details of data base */

		-- doese the temp table exists
		-- ---------------------------------------------------------------------------------------
        IF EXISTS ( SELECT  *
                    FROM    sys.objects
                    WHERE   object_id = OBJECT_ID(N''[dbo].[temp]'')
                            AND type IN ( N''U'' ) )
		-- ---------------------------------------------------------------------------------------
            BEGIN
		-- ---------------------------------------------------------------------------------------
		-- If So Drop that table
                DROP TABLE [dbo].[temp]
		-- ---------------------------------------------------------------------------------------
            END
		-- ---------------------------------------------------------------------------------------
		-- Creat a Fresh one
        CREATE TABLE [dbo].[temp]
            (
              Index_Name VARCHAR(25),
              Member_Count INT
            )
        SET NOCOUNT ON
		-- ---------------------------------------------------------------------------------------
        DECLARE @Increminent INT
        DECLARE @TempCount INT
		-- ---------------------------------------------------------------------------------------
        SET @Increminent = 0
		-- ---------------------------------------------------------------------------------------
		-- ---------------------------------------------------------------------------------------
        IF ( @Flag = 0 )
			-- ---------------------------------------------------------------------------------------
            BEGIN
			-- ---------------------------------------------------------------------------------------
                WHILE ( @Increminent < 12 )
					-- ---------------------------------------------------------------------------------------
                    BEGIN
					-- ---------------------------------------------------------------------------------------
                        SELECT  @TempCount = COUNT(UserAuthentication.ApplicationID)
                        FROM    dbo.UserAuthentication
                        WHERE   ( DATEDIFF(mm,
                                           UserAuthentication.CreatedIN,
                                           GETDATE()) BETWEEN @Increminent
                                                      AND     ( @Increminent + 1 ) )
						-- ---------------------------------------------------------------------------------------
                        INSERT  INTO [dbo].[temp]
                                (
                                  Index_Name,
                                  Member_Count  
									
                                )
                        VALUES  (
                                  DATENAME(month,
                                           DATEADD(month, -@Increminent,
                                                   GETDATE())),
                                  @TempCount
								  
                                )
						-- ---------------------------------------------------------------------------------------
                        SET @Increminent = ( @Increminent + 1 )
					-- ---------------------------------------------------------------------------------------
                    END
				-- ---------------------------------------------------------------------------------------
            END
			-- ---------------------------------------------------------------------------------------
        ELSE 
            IF ( @Flag = 1 )
			-- ---------------------------------------------------------------------------------------
                BEGIN
			-- ---------------------------------------------------------------------------------------
                    WHILE ( @Increminent < 12 )
					-- ---------------------------------------------------------------------------------------
                        BEGIN
					-- ---------------------------------------------------------------------------------------
                            SELECT  @TempCount = COUNT(PaidMemberDetails.MatrimonialID)
                            FROM    dbo.PaidMemberDetails
                            WHERE   ( DATEDIFF(mm,
                                               PaidMemberDetails.DateOfParches,
                                               GETDATE()) BETWEEN @Increminent
                                                          AND     ( @Increminent + 1 ) )
						-- ---------------------------------------------------------------------------------------
                            INSERT  INTO [dbo].[temp]
                                    (
                                      Index_Name,
                                      Member_Count  
									
                                    )
                            VALUES  (
                                      DATENAME(month,
                                               DATEADD(month, -@Increminent,
                                                       GETDATE())),
                                      @TempCount
								  
                                    )
						-- ---------------------------------------------------------------------------------------
                            SET @Increminent = ( @Increminent + 1 )
					-- ---------------------------------------------------------------------------------------
                        END
			-- ---------------------------------------------------------------------------------------
                END
			-- ---------------------------------------------------------------------------------------
            ELSE 
                IF ( @Flag = 2 )
			-- ---------------------------------------------------------------------------------------
                    BEGIN
			-- ---------------------------------------------------------------------------------------
                        WHILE ( @Increminent < 12 )
					-- ---------------------------------------------------------------------------------------
                            BEGIN
					-- ---------------------------------------------------------------------------------------
                                SET @TempCount = (
                                                   SELECT   SUM(MatrimonialSailsDetails.AmountPaid)
                                                   FROM     dbo.MatrimonialSailsDetails
                                                   WHERE    ( (DATEDIFF(Month, MatrimonialSailsDetails.BillingDate, GETDATE()) BETWEEN @Increminent
                                                                                                                                   AND     ( @Increminent + 1 )) )
                                                 )
						-- ---------------------------------------------------------------------------------------
                                IF @TempCount IS NULL 
                                    SET @TempCount = 0
						-- ---------------------------------------------------------------------------------------
                                INSERT  INTO [dbo].[temp]
                                        (
                                          Index_Name,
                                          Member_Count  
									
                                        )
                                VALUES  (
                                          DATENAME(month,
                                                   DATEADD(month,
                                                           -@Increminent,
                                                           GETDATE())),
                                          @TempCount
								  
                                        )
						-- ---------------------------------------------------------------------------------------
                                SET @Increminent = ( @Increminent + 1 )
					-- ---------------------------------------------------------------------------------------
                            END
				-- ---------------------------------------------------------------------------------------
                    END
	-- ---------------------------------------------------------------------------------------
        SELECT  *
        FROM    [dbo].[temp]
	-- ---------------------------------------------------------------------------------------
        DROP TABLE [dbo].[temp]
	-- ---------------------------------------------------------------------------------------

    END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonial_MembershipDetails]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonial_MembershipDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Matrimonial_MembershipDetails] 
	-- Add the parameters for the stored procedure here
    @MatrimonialID VARCHAR(64)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

    -- Insert statements for procedure here


        IF (
             SELECT UserAuthentication.MatrimonialID
             FROM   dbo.UserAuthentication
             WHERE  ( UserAuthentication.MatrimonialID = @MatrimonialID )
                    AND ( UserAuthentication.Membership = 6 )
           ) IS NOT NULL 
            BEGIN
                SELECT  1 AS ISPaidMember,
                        MatrimonialMembershipPlan.PlanName AS PLANNAME,
                        PaidMemberDetails.MemberFrom AS MEMBERFROM,
                        PaidMemberDetails.MemberTo AS MEMBERTO,
                        UserBasicInformation.Name AS NAME,
                        UserAuthentication.Clicks AS CLICKS,
                        UserAuthentication.CreatedIN AS CREATEDIN
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                        INNER JOIN dbo.PaidMemberDetails ON UserAuthentication.ApplicationID = PaidMemberDetails.ApplicationID
                        INNER JOIN dbo.MatrimonialMembershipPlan ON PaidMemberDetails.PlanID = MatrimonialMembershipPlan.PlanID
                WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
            END

        ELSE 
            BEGIN
                SELECT  0 AS ISPaidMember,
                        UserBasicInformation.Name AS NAME,
                        UserAuthentication.Clicks AS CLICKS,
                        UserAuthentication.CreatedIN AS CREATEDIN
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
            END
 
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_ApplicationIDExist]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_ApplicationIDExist]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_ApplicationIDExist]
    (
      @ApplicationID VARCHAR(25) = NULL
	
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.ApplicationID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.ApplicationID = @ApplicationID

    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPasswordGrand_GrandPassword]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordGrand_GrandPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserPhotoHoroPasswordGrand_GrandPassword]
    (
      @GrandedBy VARCHAR(15),
      @GrandedTo VARCHAR(15),
      @IsPhoto BIT 
	
    )
AS 
    SET NOCOUNT ON

	
	-- Getting Password --

    DECLARE @Password VARCHAR(25)
	-- Photo
    IF @IsPhoto = 1 
        BEGIN
            SELECT  @Password = [UserAlbum].[PhotoPassword]
            FROM    [UserAuthentication]
                    INNER JOIN [UserAlbum] ON [UserAuthentication].[ApplicationID] = [UserAlbum].[ApplicationID]
            WHERE   ( [UserAuthentication].[MatrimonialID] = @GrandedBy )
        END
	-- Horo
    ELSE 
        BEGIN
            SELECT  @Password = [UserAlbum].[HoroPassword]
            FROM    [UserAuthentication]
                    INNER JOIN [UserAlbum] ON [UserAuthentication].[ApplicationID] = [UserAlbum].[ApplicationID]
            WHERE   ( [UserAuthentication].[MatrimonialID] = @GrandedBy )
        END

	-- Inserting Password In Grand --

    INSERT  INTO [UserPhotoHoroPasswordGrand]
            (
              [GrandFrom],
              [GrandTo],
              [IsPhoto],
              [Password]
            )
    VALUES  (
              @GrandedBy,
              @GrandedTo,
              @IsPhoto,
              @Password
            )

	-- Deleting From Request Table
    DELETE  FROM [UserPhotoHoroPasswordRequest]
    WHERE   ( [RequestTo] = @GrandedBy )
            AND ( [RequestFrom] = @GrandedTo )
            AND ( [IsPhoto] = @IsPhoto )



    RETURN
--UserPhotoHoroPasswordRequest


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonial_AccountDrop]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonial_AccountDrop]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[Matrimonial_AccountDrop]
	(
		@ApplicationID varchar(25),
		@MatrimonialID varchar(15)

	)
AS

	------------------------------------------------------------------------------------------------------------------
	-- Deletion Starts------------------------------------------------------------------------------

	-- UserAuthentication ------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserAuthentication WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserAuthentication WHERE ApplicationID =@ApplicationID 
    
    --UserBasicInformation------------------------------------------------------------------------------
   
	IF EXISTS (SELECT * FROM UserBasicInformation WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserBasicInformation WHERE ApplicationID = @ApplicationID 
    
    --UserSocioReligionAttributes------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserSocioReligionAttributes WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserSocioReligionAttributes WHERE ApplicationID = @ApplicationID 
   
    --UserContactInformations------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserBasicInformation WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserContactInformations WHERE ApplicationID =@ApplicationID 
    
    --UserEducationAndOccupation------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserEducationAndOccupation WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserEducationAndOccupation WHERE ApplicationID =@ApplicationID 
    
    --UserFamilyDetails------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserFamilyDetails WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserFamilyDetails WHERE ApplicationID =@ApplicationID 

    --UserfavoriteList------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserfavoriteList WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserfavoriteList WHERE ApplicationID =@ApplicationID 
    
    --UserHobiesAndIntrests------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserHobiesAndIntrests WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserHobiesAndIntrests WHERE ApplicationID =@ApplicationID 
    
    --UserIntrests------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserIntrests WHERE (IntrestFrom = @MatrimonialID )OR(IntrestTo = @MatrimonialID) )
		DELETE FROM UserIntrests WHERE (IntrestFrom = @MatrimonialID )OR(IntrestTo = @MatrimonialID)

    
    --UserMessages--
--    	BEGIN TRY
--    DELETE FROM UserMessages
--    
--    WHERE ApplicationID =@ApplicationID 
--    END TRY
--    BEGIN CATCH
--    END CATCH;
    
    --UserPartnerPreference------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserPartnerPreference WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserPartnerPreference WHERE ApplicationID =@ApplicationID 
    
    
    --UserAlbum------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserAlbum WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserAlbum WHERE ApplicationID =@ApplicationID 
        
    --UserAboutAndExpectation------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserAboutAndExpectation WHERE ApplicationID = @ApplicationID )
    DELETE FROM UserAboutAndExpectation WHERE ApplicationID =@ApplicationID 
    
        
    --UserPhysicalAttributes------------------------------------------------------------------------------
	IF EXISTS (SELECT * FROM UserPhysicalAttributes WHERE ApplicationID = @ApplicationID )
		DELETE FROM UserPhysicalAttributes WHERE ApplicationID =@ApplicationID 

   ----------------------------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------------------------
	
	
	RETURN 
	
	

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetMatrimonailID]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetMatrimonailID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_GetMatrimonailID]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.MatrimonialID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.ApplicationID = @ApplicationID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetApplicationID]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetApplicationID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_GetApplicationID]
    (
      @MatrimonialID VARCHAR(15)
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.ApplicationID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.MatrimonialID = @MatrimonialID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetLastLogin]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetLastLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_GetLastLogin]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON
	
    SELECT  UserAuthentication.LastLogIN,
            UserAuthentication.CreatedIN,
            UserAuthentication.Clicks
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.ApplicationID = @ApplicationID

    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetUserName]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetUserName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_GetUserName]
    (
      @MatrimonialID VARCHAR(15)
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.UserID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.MatrimonialID = @MatrimonialID

    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_UpdateIndex]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_UpdateIndex]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_UpdateIndex]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Membership SMALLINT = 1
	
    )
AS 
    SET NOCOUNT ON
	
	-- Getting Membership Form data base---
	
    SELECT  @Membership = UserAuthentication.Membership
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.ApplicationID = @ApplicationID

	-- Updating Membership to data base---
	
    UPDATE  dbo.UserAuthentication
    SET     UserAuthentication.Membership = @Membership + 1
    WHERE   UserAuthentication.ApplicationID = @ApplicationID
	
    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PaidMemberDetails_AddMember]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaidMemberDetails_AddMember]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Prasanth
-- =============================================
CREATE PROCEDURE [dbo].[PaidMemberDetails_AddMember] 
	-- =============================================
    @MatrimonialID VARCHAR(25),
    @PlanID SMALLINT
	-- =============================================
AS 
    BEGIN
	-- =============================================
        SET NOCOUNT ON ;
	-- =============================================
        DECLARE @PlanDuration SMALLINT 
        DECLARE @PlanAmount SMALLINT 
        DECLARE @ExpDate SMALLDATETIME 
        DECLARE @ApplicationID VARCHAR(25)
		-- =============================================
		--	Getting ApplicationID
			-- =============================================
        SELECT  @ApplicationID = UserAuthentication.ApplicationID
        FROM    dbo.UserAuthentication
        WHERE   UserAuthentication.MatrimonialID = @MatrimonialID
		-- =============================================

        IF EXISTS ( SELECT  PaidMemberDetails.PlanID
                    FROM    dbo.PaidMemberDetails
                    WHERE   PaidMemberDetails.ApplicationID = @ApplicationID ) 
            BEGIN
                SELECT  0 AS Result
            END
        ELSE 
            BEGIN
		-- =============================================
		--	Getting Plan Duration
			-- =============================================
                SELECT  @PlanDuration = MatrimonialMembershipPlan.PlanDuration,
                        @PlanAmount = MatrimonialMembershipPlan.PlanAmount
                FROM    dbo.MatrimonialMembershipPlan
                WHERE   MatrimonialMembershipPlan.PlanID = @PlanID
		-- =============================================
		-- Calculating Expairing date 
		-- =============================================
                SELECT  @ExpDate = DATEADD(day, @PlanDuration, GETDATE())
		-- =============================================
		-- Inserting Information Into Paid Member list
		-- =============================================
                INSERT  INTO dbo.PaidMemberDetails
                        (
                          [ApplicationID],
                          [PlanID],
                          [MemberFrom],
                          [MemberTo],
                          [DateOfParches],
                          [MatrimonialID]
                        )
                VALUES  (
                          @ApplicationID,
                          @PlanID,
                          GETDATE(),
                          @ExpDate,
                          GETDATE(),
                          @MatrimonialID
                        )
		-- =============================================
		-- Inserting Information Into Sailes Report
		-- =============================================
                DECLARE @Address VARCHAR(300)
                DECLARE @Gender BIT 
                DECLARE @Name VARCHAR(50)
                DECLARE @UserID VARCHAR(124)
		-- =============================================
                SELECT  @Name = UserBasicInformation.Name,
                        @Address = UserContactInformations.Address,
                        @Gender = UserBasicInformation.Gender,
                        @UserID = UserAuthentication.UserID
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                        INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                WHERE   UserAuthentication.MatrimonialID = @MatrimonialID
		-- =============================================
                SET @Address = @Name + '' '' + @Address
		-- =============================================
		-- Inserting Information Into Sailes Report
		-- =============================================
                INSERT  INTO dbo.MatrimonialSailsDetails
                        (
                          [BillingDate],
                          [MatrimonialID],
                          [UserName],
                          [Gender],
                          [Address],
                          [PlanID],
                          [AmountPaid]
							
                        )
                VALUES  (
                          GETDATE(),
                          @MatrimonialID,
                          @UserID,
                          @Gender,
                          @Address,
                          @PlanID,
                          @PlanAmount
							
                        )

		-- =============================================
		-- Updating User info
		-- =============================================
                UPDATE  dbo.UserAuthentication
                SET     UserAuthentication.Membership = 6
                WHERE   UserAuthentication.ApplicationID = @ApplicationID
		-- =============================================
                SELECT  1 AS Result
            END
    END







' 
END
GO
/****** Object:  StoredProcedure [dbo].[PaidMemberDetails_RenewMember]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaidMemberDetails_RenewMember]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =======================================================
-- Author:		Prasanth  ===============
-- =======================================================
CREATE PROCEDURE [dbo].[PaidMemberDetails_RenewMember] 
	-- ===================================================
    @MatrimonialID VARCHAR(15),
    @PlanID SMALLINT
	-- =============================================
AS 
    BEGIN
	-- =============================================
        SET NOCOUNT ON ;
	-- =============================================
        DECLARE @PlanDuration SMALLINT 
        DECLARE @PlanAmount SMALLINT 
        DECLARE @ExpDate SMALLDATETIME 
        DECLARE @RemDate SMALLDATETIME
        DECLARE @ApplicationID VARCHAR(25)
	-- =============================================
		--	Getting ApplicationID
			-- =============================================
        SELECT  @ApplicationID = UserAuthentication.ApplicationID
        FROM    dbo.UserAuthentication
        WHERE   UserAuthentication.MatrimonialID = @MatrimonialID
		-- =============================================

        IF @PlanID = 0 -- Delete From Paid Member List
            BEGIN
				-- =============================================
                DELETE  FROM dbo.PaidMemberDetails
                WHERE   PaidMemberDetails.ApplicationID = @ApplicationID
				-- =============================================
					-- Updating User info
				-- =============================================
                UPDATE  dbo.UserAuthentication
                SET     UserAuthentication.Membership = 5
                WHERE   UserAuthentication.ApplicationID = @ApplicationID
				-- =============================================
            END
        ELSE	-- Renew Membership
            BEGIN
				-- =============================================
					--	Getting Plan Duration
				-- ========================================= 
                SELECT  @PlanDuration = MatrimonialMembershipPlan.PlanDuration,
                        @PlanAmount = MatrimonialMembershipPlan.PlanAmount
                FROM    dbo.MatrimonialMembershipPlan
                WHERE   MatrimonialMembershipPlan.PlanID = @PlanID
				-- =============================================
					-- get date remaining
				-- =============================================
                SELECT  @RemDate = PaidMemberDetails.MemberTo
                FROM    dbo.PaidMemberDetails
                WHERE   PaidMemberDetails.ApplicationID = @ApplicationID
				-- =============================================
					-- Calculating Expairing date 
				-- ============================================================
                IF ( @RemDate > GETDATE() ) 
                    BEGIN
                        SET @ExpDate = DATEADD(day, @PlanDuration, @RemDate)
                    END
                ELSE 
                    BEGIN
                        SET @ExpDate = DATEADD(day, @PlanDuration, GETDATE())
                    END
				-- ============================================================
					-- Updating  Information Into Paid Member list
				-- ============================================================
                UPDATE  dbo.PaidMemberDetails
                SET     PaidMemberDetails.PlanID = @PlanID,
                        PaidMemberDetails.MemberTo = @ExpDate,
                        PaidMemberDetails.DateOfParches = GETDATE()
                WHERE   PaidMemberDetails.ApplicationID = @ApplicationID
				-- =============================================
				-- Inserting Information Into Sailes Report
				-- =============================================
                DECLARE @Address VARCHAR(300)
                DECLARE @Gender BIT 
                DECLARE @Name VARCHAR(50)
                DECLARE @UserID VARCHAR(124)
				-- =============================================
                SELECT  @Name = UserBasicInformation.Name,
                        @Address = UserContactInformations.Address,
                        @Gender = UserBasicInformation.Gender,
                        @UserID = UserAuthentication.UserID
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                        INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                WHERE   UserAuthentication.MatrimonialID = @MatrimonialID
				-- =============================================
                SET @Address = @Name + '' '' + @Address
				-- =============================================
				-- Inserting Information Into Sailes Report
				-- =============================================
                INSERT  INTO dbo.MatrimonialSailsDetails
                        (
                          [BillingDate],
                          [MatrimonialID],
                          [UserName],
                          [Gender],
                          [Address],
                          [PlanID],
                          [AmountPaid]
									
                        )
                VALUES  (
                          GETDATE(),
                          @MatrimonialID,
                          @UserID,
                          @Gender,
                          @Address,
                          @PlanID,
                          @PlanAmount
									
                        )
				-- =============================================================
					-- Updating User info
				-- =============================================================
                UPDATE  dbo.UserAuthentication
                SET     UserAuthentication.Membership = 6
                WHERE   UserAuthentication.ApplicationID = @ApplicationID
				-- =============================================================
            END
	-- =============================================
    END








' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_IsPasswordTrue]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_IsPasswordTrue]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_IsPasswordTrue]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Password VARCHAR(124) = NULL
	
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.MatrimonialID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.ApplicationID = @ApplicationID
            AND UserAuthentication.Password = @Password 

    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_GetProtectedImage]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_GetProtectedImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAlbum_GetProtectedImage]
    (
      @FromID VARCHAR(15),
      @ToID VARCHAR(15),
      @Type TINYINT
		
	
    )
AS 
    SET NOCOUNT ON
		
-- ======================================================== ======================================================== ========================================================
    IF @Type = 1 
        BEGIN
            SELECT  UserAlbum.photo1 AS IMAGE
            FROM    dbo.UserAuthentication
                    INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                    INNER JOIN dbo.UserPhotoHoroPasswordGrand ON UserAuthentication.MatrimonialID = UserPhotoHoroPasswordGrand.GrandFrom
                                                                 AND UserAlbum.PhotoPassword = UserPhotoHoroPasswordGrand.Password
                                                                 AND UserAlbum.isPhoto = UserPhotoHoroPasswordGrand.IsPhoto
            WHERE   ( UserPhotoHoroPasswordGrand.GrandFrom = @FromID )
                    AND ( UserPhotoHoroPasswordGrand.GrandTo = @ToID )
                    AND ( UserPhotoHoroPasswordGrand.IsPhoto = 1 )
        END
-- ======================================================== ======================================================== ========================================================
    ELSE 
        IF @Type = 2 
            BEGIN
                SELECT  UserAlbum.Album1 AS IMAGE
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                        INNER JOIN dbo.UserPhotoHoroPasswordGrand ON UserAuthentication.MatrimonialID = UserPhotoHoroPasswordGrand.GrandFrom
                                                                     AND UserAlbum.PhotoPassword = UserPhotoHoroPasswordGrand.Password
                                                                     AND UserAlbum.isPhoto = UserPhotoHoroPasswordGrand.IsPhoto
                WHERE   ( UserPhotoHoroPasswordGrand.GrandFrom = @FromID )
                        AND ( UserPhotoHoroPasswordGrand.GrandTo = @ToID )
                        AND ( UserPhotoHoroPasswordGrand.IsPhoto = 1 )
            END
-- ======================================================== ======================================================== ========================================================
        ELSE 
            IF @Type = 3 
                BEGIN
                    SELECT  UserAlbum.Album2 AS IMAGE
                    FROM    dbo.UserAuthentication
                            INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                            INNER JOIN dbo.UserPhotoHoroPasswordGrand ON UserAuthentication.MatrimonialID = UserPhotoHoroPasswordGrand.GrandFrom
                                                                         AND UserAlbum.PhotoPassword = UserPhotoHoroPasswordGrand.Password
                                                                         AND UserAlbum.isPhoto = UserPhotoHoroPasswordGrand.IsPhoto
                    WHERE   ( UserPhotoHoroPasswordGrand.GrandFrom = @FromID )
                            AND ( UserPhotoHoroPasswordGrand.GrandTo = @ToID )
                            AND ( UserPhotoHoroPasswordGrand.IsPhoto = 1 )
                END
-- ======================================================== ======================================================== ========================================================
            ELSE 
                IF @Type = 4 
                    BEGIN
                        SELECT  UserAlbum.Album3 AS IMAGE
                        FROM    dbo.UserAuthentication
                                INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                INNER JOIN dbo.UserPhotoHoroPasswordGrand ON UserAuthentication.MatrimonialID = UserPhotoHoroPasswordGrand.GrandFrom
                                                                             AND UserAlbum.PhotoPassword = UserPhotoHoroPasswordGrand.Password
                                                                             AND UserAlbum.isPhoto = UserPhotoHoroPasswordGrand.IsPhoto
                        WHERE   ( UserPhotoHoroPasswordGrand.GrandFrom = @FromID )
                                AND ( UserPhotoHoroPasswordGrand.GrandTo = @ToID )
                                AND ( UserPhotoHoroPasswordGrand.IsPhoto = 1 )
                    END
-- ======================================================== ======================================================== ========================================================
                ELSE 
                    IF @Type = 5 
                        BEGIN
                            SELECT  UserAlbum.Horoscope AS IMAGE
                            FROM    dbo.UserAuthentication
                                    INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                                    INNER JOIN dbo.UserPhotoHoroPasswordGrand ON UserAuthentication.MatrimonialID = UserPhotoHoroPasswordGrand.GrandFrom
                                                                                 AND UserAlbum.HoroPassword = UserPhotoHoroPasswordGrand.Password
                                                                                 AND UserAlbum.isPhoto = UserPhotoHoroPasswordGrand.IsPhoto
                            WHERE   ( UserPhotoHoroPasswordGrand.GrandFrom = @FromID )
                                    AND ( UserPhotoHoroPasswordGrand.GrandTo = @ToID )
                                    AND ( UserPhotoHoroPasswordGrand.IsPhoto = 0 )
                        END

-- ======================================================== ======================================================== ========================================================
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_UserLogIN]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_UserLogIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAuthentication_UserLogIN]
    (
      @UserID VARCHAR(124) = NULL,
      @Password VARCHAR(124) = NULL
	
    )
AS 
    SET NOCOUNT ON


-- Updating Last Login Date ========================================

    UPDATE  BnGMatrimonials.dbo.UserAuthentication
    SET     UserAuthentication.LastLogIN = GETDATE()
    WHERE   ( UserAuthentication.UserID = @UserID )

--  Login ========================================================== 
    SELECT  UserAuthentication.ApplicationID,
            UserAuthentication.Membership,
            UserAuthentication.MatrimonialID
    FROM    dbo.UserAuthentication
    WHERE   ( UserAuthentication.UserID = @UserID )
            AND ( UserAuthentication.Password = @Password ) 
-- =================================================================
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_ChangePassword]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_ChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_ChangePassword]
    (
      @ApplicationID VARCHAR(25),
      @NewPassword VARCHAR(124),
      @OldPassword VARCHAR(124) = NULL,
      @Flag SMALLINT = 0

	
    )
AS 
    SET NOCOUNT ON
	
    IF @Flag = 0 
        BEGIN
            UPDATE  dbo.UserAuthentication
            SET     UserAuthentication.Password = @NewPassword
            WHERE   UserAuthentication.ApplicationID = @ApplicationID
                    AND UserAuthentication.Password = @OldPassword
        END
    ELSE 
        IF @Flag = 1 
            BEGIN
                UPDATE  dbo.UserAuthentication
                SET     UserAuthentication.Password = @NewPassword
                WHERE   UserAuthentication.ApplicationID = @ApplicationID
            END
	
    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[PaidMemberDetails_GetDetails]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaidMemberDetails_GetDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





-- =======================================================
-- Author:		Prasanth  ===============
-- =======================================================
CREATE PROCEDURE [dbo].[PaidMemberDetails_GetDetails] 
	-- ===================================================
    @MatrimonialID VARCHAR(25) 
	-- =============================================
AS 
    BEGIN
	-- =============================================
        SET NOCOUNT ON ;
	-- =============================================
        SELECT  PaidMemberDetails.PlanID
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.PaidMemberDetails ON UserAuthentication.ApplicationID = PaidMemberDetails.ApplicationID
        WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )
	-- =============================================
    END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_UpdateClick]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_UpdateClick]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_UpdateClick]
    (
      @MatrimonialID VARCHAR(15) = NULL,
      @Clicks SMALLINT = 1
	
    )
AS 
    SET NOCOUNT ON
	
	-- Getting Clicks Form data base---
	
    SELECT  @Clicks = UserAuthentication.Clicks
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.MatrimonialID = @MatrimonialID

	-- Updating Clicks to data base---
	
    UPDATE  dbo.UserAuthentication
    SET     UserAuthentication.Clicks = @Clicks + 1
    WHERE   UserAuthentication.MatrimonialID = @MatrimonialID
	
    RETURN 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_GetApplicationID_UID]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_GetApplicationID_UID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAuthentication_GetApplicationID_UID] ( @UserID VARCHAR(124) )
AS 
    SET NOCOUNT ON

    SELECT  UserAuthentication.ApplicationID
    FROM    dbo.UserAuthentication
    WHERE   UserAuthentication.UserID = @UserID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Search_KeyWord]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Search_KeyWord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Search_KeyWord] 
-- =============================================
    @SearchWord VARCHAR(200),
    @Gender BIT = 0
-- =============================================
AS 
    BEGIN
        SET NOCOUNT ON ;
-- =======================================================================================================================================
        SELECT  UserAuthentication.MatrimonialID
-- =======================================================================================================================================
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserAboutAndExpectation ON UserAuthentication.ApplicationID = UserAboutAndExpectation.ApplicationID
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                INNER JOIN dbo.UserFamilyDetails ON UserAuthentication.ApplicationID = UserFamilyDetails.ApplicationID
                INNER JOIN dbo.UserSocioReligionAttributes ON UserAuthentication.ApplicationID = UserSocioReligionAttributes.ApplicationID
-- =======================================================================================================================================
        WHERE   ( FREETEXT ( UserAuthentication.MatrimonialID, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.MotherOccupation, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.FatherOccupation, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.MothersName, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.FathersName, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.FamilyOrigin, @SearchWord )
                  OR FREETEXT ( UserFamilyDetails.FamilyDetails, @SearchWord )
                  OR FREETEXT ( UserContactInformations.Address, @SearchWord )
                  OR FREETEXT ( UserContactInformations.City, @SearchWord )
                  OR FREETEXT ( UserContactInformations.ResidenceCity, @SearchWord )
                  OR FREETEXT ( UserSocioReligionAttributes.PlaceOfBirth, @SearchWord )
                  OR FREETEXT ( UserBasicInformation.SubCast, @SearchWord )
                )
                AND ( UserBasicInformation.Gender = @Gender )
                AND UserAuthentication.Hidden IS NULL
-- =======================================================================================================================================

    END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserVisiters_AddList]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserVisiters_AddList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserVisiters_AddList] 
-- =============================================
    @MartimonialID VARCHAR(15),
    @visitor VARCHAR(15)
-- ============================================
AS 
    BEGIN
-- ==============================================================================================================================
        SET NOCOUNT ON ;
-- ==============================================================================================================================
        IF NOT EXISTS ( SELECT  *
                        FROM    dbo.UserVisiters
                        WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID ) 
            BEGIN
		-- INserting New Coloum
                INSERT  INTO dbo.UserVisiters
                        (
                          MartimonialID,
                          Pointer,
                          visitor1
                        )
                VALUES  (
                          @MartimonialID,
                          1,
                          @visitor
                        )
            END
-- ==============================================================================================================================
        ELSE
	-- UPDATING THE TABLE
            BEGIN
		-- Does The Link Previously In the List
                IF NOT EXISTS ( SELECT  UserVisiters.Pointer
                                FROM    dbo.UserVisiters
                                WHERE   ( ( dbo.UserVisiters.MartimonialID = @MartimonialID )
                                          AND ( ( dbo.UserVisiters.visitor1 = @visitor )
                                                OR ( dbo.UserVisiters.visitor2 = @visitor )
                                                OR ( dbo.UserVisiters.visitor3 = @visitor )
                                                OR ( dbo.UserVisiters.visitor4 = @visitor )
                                                OR ( dbo.UserVisiters.visitor5 = @visitor )
                                                OR ( dbo.UserVisiters.visitor6 = @visitor )
                                                OR ( dbo.UserVisiters.visitor7 = @visitor )
                                              )
                                        ) )-- IF
				-- =================================================================================================================
                    BEGIN -- IF
					  -- Get The pointer 
                        DECLARE @Temp SMALLINT
				-- ========================================================================================================================
                        SELECT  @Temp = UserVisiters.Pointer
                        FROM    dbo.UserVisiters
                        WHERE   ( dbo.UserVisiters.MartimonialID = @MartimonialID )
				-- ========================================================================================================================
					  -- Start Updating List
				-- =================================================================================================================
					  -- Pointer is At 1
                        IF @Temp = 1 
                            BEGIN
                                UPDATE  dbo.UserVisiters
                                SET     dbo.UserVisiters.visitor2 = @visitor,
                                        UserVisiters.Pointer = 2
                                WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                            END
				-- =================================================================================================================
					  -- Pointer is At 2
                        ELSE 
                            IF @Temp = 2 
                                BEGIN
                                    UPDATE  dbo.UserVisiters
                                    SET     UserVisiters.visitor3 = @visitor,
                                            UserVisiters.Pointer = 3
                                    WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                                END
				-- =================================================================================================================
					  -- Pointer is At 3
                            ELSE 
                                IF @Temp = 3 
                                    BEGIN
                                        UPDATE  dbo.UserVisiters
                                        SET     dbo.UserVisiters.visitor4 = @visitor,
                                                UserVisiters.Pointer = 4
                                        WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                                    END
				-- =================================================================================================================
					  -- Pointer is At 4
                                ELSE 
                                    IF @Temp = 4 
                                        BEGIN
                                            UPDATE  dbo.UserVisiters
                                            SET     dbo.UserVisiters.visitor5 = @visitor,
                                                    UserVisiters.Pointer = 5
                                            WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                                        END
				-- =================================================================================================================
					  -- Pointer is At 5
                                    ELSE 
                                        IF @Temp = 5 
                                            BEGIN
                                                UPDATE  dbo.UserVisiters
                                                SET     dbo.UserVisiters.visitor5 = @visitor,
                                                        UserVisiters.Pointer = 6
                                                WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                                            END
				-- =================================================================================================================
					  -- Pointer is At 6
                                        ELSE 
                                            IF @Temp = 6 
                                                BEGIN
                                                    UPDATE  dbo.UserVisiters
                                                    SET     dbo.UserVisiters.visitor7 = @visitor,
                                                            UserVisiters.Pointer = 7
                                                    WHERE   UserVisiters.MartimonialID = @MartimonialID
                                                END
				-- =================================================================================================================
					  -- Pointer is At 7
                                            ELSE 
                                                IF @Temp = 7 
                                                    BEGIN
                                                        UPDATE  dbo.UserVisiters
                                                        SET     dbo.UserVisiters.visitor1 = @visitor,
                                                                UserVisiters.Pointer = 1
                                                        WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID
                                                    END
				-- =================================================================================================================
                    END-- Checking
		-- =========================================================================================================================
            END-- Updating List
		-- =========================================================================================================================
		-- Updating Cliks
		-- =========================================================================================================================
        UPDATE  dbo.UserAuthentication
        SET     UserAuthentication.Clicks = ( SELECT UserAuthentication.Clicks
                             FROM   dbo.UserAuthentication
                             WHERE  UserAuthentication.MatrimonialID = @MartimonialID
                           ) + 1
        WHERE   UserAuthentication.MatrimonialID = @MartimonialID
		-- =========================================================================================================================

    END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Member_GetInfo]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member_GetInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Member_GetInfo] 
	-- Add the parameters for the stored procedure here
    @MatrimonialID VARCHAR(25)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

    -- Insert statements for procedure here

        DECLARE @ApplID VARCHAR(25)

		-- =======================================================
		-- Getting ApplicationID

        SELECT  @ApplID = UserAuthentication.ApplicationID
        FROM    dbo.UserAuthentication
        WHERE   UserAuthentication.MatrimonialID = @MatrimonialID

		---- =======================================================
		-- Getting Delails From DataBase

		-- If there is an entry in UserAlbum get Photo PAssword too
        IF EXISTS ( SELECT  *
                    FROM    dbo.UserAlbum
                    WHERE   UserAlbum.ApplicationID = @ApplID ) 
            BEGIN
                SELECT  UserAuthentication.LastLogIN,
                        UserBasicInformation.Name,
                        UserBasicInformation.MaritalStatus,
                        UserBasicInformation.Religion,
                        UserBasicInformation.[Cast],
                        UserContactInformations.Country,
                        UserContactInformations.City,
                        UserBasicInformation.DOB,
                        UserAlbum.PhotoPassword
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                        INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                        INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                WHERE   UserAuthentication.ApplicationID = @ApplID 
            END
		-- There is No  entry in UserAlbum so no need of having a photo password
        ELSE 
            BEGIN
                SELECT  UserAuthentication.LastLogIN,
                        UserBasicInformation.Name,
                        UserBasicInformation.MaritalStatus,
                        UserBasicInformation.Religion,
                        UserBasicInformation.[Cast],
                        UserContactInformations.Country,
                        UserContactInformations.City,
                        UserBasicInformation.DOB
                FROM    dbo.UserAuthentication
                        INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                        INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                WHERE   UserAuthentication.ApplicationID = @ApplID 
            END



		-- =======================================================
    END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuthentication_CreatUser]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication_CreatUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[UserAuthentication_CreatUser]
    (
      @ApplicationID VARCHAR(25),
      @UserID VARCHAR(124),
      @PassWord VARCHAR(124),
      @EmailID VARCHAR(124),
      @MatrimonialID VARCHAR(15),
      @SequrityQuestion SMALLINT,
      @SeqtAnser VARCHAR(64),
      @Membership SMALLINT = 1,
      @Clicks SMALLINT = 0
    )
AS 
    SET NOCOUNT ON

    INSERT  INTO dbo.UserAuthentication
            (
              [ApplicationID],
              [UserID],
              [PassWord],
              [CreatedIn],
              [MatrimonialID],
              [Membership],
              [Clicks],
              [LastLogIN],
              [SequrityQuestion],
              [Answer]
		   
            )
    VALUES  (
              @ApplicationID,
              @UserID,
              @PassWord,
              GETDATE(),
              @MatrimonialID,
              1,
              0,
              GETDATE(),
              @SequrityQuestion,
              @SeqtAnser
			
            )

    INSERT  INTO dbo.MatrimonialMailList
            (
              [MailAddress],
              [PromotionalMails],
              [NewFeatures],
              [PartnerMails],
              [DailyMatch]
            )
    VALUES  ( @EmailID, 1, 1, 1, 1 )
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonial_Statics]    Script Date: 06/14/2007 13:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonial_Statics]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Matrimonial_Statics]
AS 
    BEGIN
        SET NOCOUNT ON ;
	-- =======================================================================================================================================
        DECLARE @Total INT 
        DECLARE @Male INT
        DECLARE @Inactive INT 
        DECLARE @Paidmember INT
        DECLARE @LoginedLastWeek INT 
	-- =======================================================================================================================================
        SELECT  @Total = COUNT(UserAuthentication.Membership)
        FROM    dbo.UserAuthentication 
	-- =======================================================================================================================================
        SELECT  @Male = COUNT(UserBasicInformation.Gender)
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
        WHERE   ( UserBasicInformation.Gender = 1 )
	-- =======================================================================================================================================
        SELECT  @Inactive = COUNT(UserAuthentication.ApplicationID)
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
        WHERE   ( DATEDIFF(YY, UserAuthentication.LastLogIN, GETDATE()) >= 1 )
	-- =======================================================================================================================================
        SELECT  @Paidmember = COUNT(UserAuthentication.ApplicationID)
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
        WHERE   ( UserAuthentication.Membership = 6 )
	-- =======================================================================================================================================
        SELECT  @LoginedLastWeek = COUNT(UserAuthentication.ApplicationID)
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
        WHERE   ( DATEDIFF(dd, UserAuthentication.LastLogIN, GETDATE()) <= 7 )
	-- =======================================================================================================================================
        SELECT  @Total AS TOTAL,
                @Male AS MALE,
                ( @Total - @Male ) AS FEMALE,
                @Inactive AS INACTIVE,
                ( @Total - @Inactive ) AS ACTIVE,
                @Paidmember AS PAIDMEMBERS,
                @LoginedLastWeek AS LOGINCOUNT
	-- =======================================================================================================================================

    END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[SmallMember_GetInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SmallMember_GetInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SmallMember_GetInfo] 
	-- Add the parameters for the stored procedure here
    @MatrimonialID VARCHAR(25)
AS 
    BEGIN
		-- =======================================================
        SET NOCOUNT ON ;

		-- =======================================================

        DECLARE @ISPhoto SMALLINT 
		-- =======================================================
		-- =======================================================
		-- Getting Delails From DataBase
		-- ===========================================================================================================================================================================================================================
		-- Is Photo Protected

        IF (
             SELECT UserAlbum.PhotoPassword
             FROM   dbo.UserAuthentication
                    INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
             WHERE  ( UserAuthentication.MatrimonialID = @MatrimonialID )
           ) IS NULL
				-- ====================================================================================================================================================================================================================
            BEGIN	-- photo?
					-- ================================================================================================================================================================================================================
                IF (
                     SELECT UserAlbum.Photo1
                     FROM   dbo.UserAuthentication
                            INNER JOIN dbo.UserAlbum ON UserAuthentication.ApplicationID = UserAlbum.ApplicationID
                     WHERE  ( UserAuthentication.MatrimonialID = @MatrimonialID )
                   ) IS NOT NULL
					-- ================================================================================================================================================================================================================
                    BEGIN
                        PRINT ''1''
                    END
					-- =====================================================================================================================================================================
                ELSE -- No Photo Indatabase
					-- =====================================================================================================================================================================
                    BEGIN
                        PRINT ''2''
                    END
					-- =====================================================================================================================================================================
            END
				-- =========================================================================================================================================================================
        ELSE -- Yes Photo Protected
				-- =========================================================================================================================================================================
            BEGIN
                PRINT ''3''
            END
		-- ==============================================================================================================================================================================================
		--  Getting Member Information From database
		-- ==============================================================================================================================================================================================
        SELECT  UserAuthentication.LastLogIN,
                UserEducationAndOccupation.Education,
                UserEducationAndOccupation.EduDetails,
                UserEducationAndOccupation.Occupation,
                UserContactInformations.Country,
                UserContactInformations.ResidenceCity AS City,
                UserBasicInformation.DOB,
                UserBasicInformation.Gender,
                UserBasicInformation.MaritalStatus,
                UserBasicInformation.Religion,
                UserBasicInformation.[Cast],
                UserBasicInformation.SubCast,
                UserPhysicalAttributes.Height,
                UserBasicInformation.Name,
                @ISPhoto AS PhotoState,
                UserSocioReligionAttributes.Star
        FROM    dbo.UserAuthentication
                INNER JOIN dbo.UserBasicInformation ON UserAuthentication.ApplicationID = UserBasicInformation.ApplicationID
                INNER JOIN dbo.UserContactInformations ON UserAuthentication.ApplicationID = UserContactInformations.ApplicationID
                INNER JOIN dbo.UserEducationAndOccupation ON UserAuthentication.ApplicationID = UserEducationAndOccupation.ApplicationID
                INNER JOIN dbo.UserPhysicalAttributes ON UserAuthentication.ApplicationID = UserPhysicalAttributes.ApplicationID
                INNER JOIN dbo.UserSocioReligionAttributes ON UserAuthentication.ApplicationID = UserSocioReligionAttributes.ApplicationID
        WHERE   ( UserAuthentication.MatrimonialID = @MatrimonialID )

		-- ===============================================================================================================================================================================================
		-- ===============================================================================================================================================================================================
    END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserFamilyDetails_UpdateInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserFamilyDetails_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserFamilyDetails_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @BrothersMarried SMALLINT,
      @SistersMarried SMALLINT,
      @FatherAlive BIT,
      @MotherAlive BIT,
      @FamilyDetails VARCHAR(200) = NULL,
      @FamilyValues SMALLINT = NULL,
      @FamilyType SMALLINT = NULL,
      @FamilyStatus SMALLINT = NULL,
      @FamilyOrigin VARCHAR(50) = NULL,
      @FatherOccupation VARCHAR(50) = NULL,
      @MotherOccupation VARCHAR(50) = NULL
	
    )
AS 
    SET NOCOUNT ON  

    UPDATE  dbo.UserFamilyDetails
    SET     UserFamilyDetails.BrothersMarried = @BrothersMarried,
            UserFamilyDetails.SistersMarried = @SistersMarried,
            UserFamilyDetails.FatherAlive = @FatherAlive,
            UserFamilyDetails.MotherAlive = @MotherAlive,
            UserFamilyDetails.FamilyDetails = @FamilyDetails,
            UserFamilyDetails.FamilyValues = @FamilyValues,
            UserFamilyDetails.FamilyType = @FamilyType,
            UserFamilyDetails.FamilyStatus = @FamilyStatus,
            UserFamilyDetails.FamilyOrigin = @FamilyOrigin,
            UserFamilyDetails.FatherOccupation = @FatherOccupation,
            UserFamilyDetails.MotherOccupation = @MotherOccupation
    WHERE   UserFamilyDetails.ApplicationID = @ApplicationID


    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserFamilyDetails_GetInformation]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserFamilyDetails_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserFamilyDetails_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserFamilyDetails
    WHERE   UserFamilyDetails.ApplicationID = @ApplicationID

    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserFamilyDetails_InsertInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserFamilyDetails_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserFamilyDetails_InsertInfo]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @FamilyDetails VARCHAR(200) = NULL,
      @FamilyValues SMALLINT = NULL,
      @FamilyType SMALLINT = NULL,
      @FamilyStatus SMALLINT = NULL,
      @FamilyOrigin VARCHAR(50) = NULL,
      @NoOfBrothers SMALLINT = NULL,
      @NoOfSisters SMALLINT = NULL,
      @BrothersMarried SMALLINT = NULL,
      @SistersMarried SMALLINT = NULL,
      @FathersName VARCHAR(50) = NULL,
      @MothersName VARCHAR(50) = NULL,
      @FatherAlive BIT = NULL,
      @MotherAlive BIT = NULL,
      @FatherOccupation VARCHAR(50) = NULL,
      @MotherOccupation VARCHAR(50) = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserFamilyDetails
            (
              ApplicationID,
              FamilyDetails,
              FamilyValues,
              FamilyType,
              FamilyStatus,
              FamilyOrigin,
              NoOfBrothers,
              NoOfSisters,
              BrothersMarried,
              SistersMarried,
              FathersName,
              MothersName,
              FatherAlive,
              MotherAlive,
              FatherOccupation,
              MotherOccupation
            )
    VALUES  (
              @ApplicationID,
              @FamilyDetails,
              @FamilyValues,
              @FamilyType,
              @FamilyStatus,
              @FamilyOrigin,
              @NoOfBrothers,
              @NoOfSisters,
              @BrothersMarried,
              @SistersMarried,
              @FathersName,
              @MothersName,
              @FatherAlive,
              @MotherAlive,
              @FatherOccupation,
              @MotherOccupation
            )
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPassword_GetList]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPassword_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[UserPhotoHoroPassword_GetList]
    (
      @ID VARCHAR(15),
      @Flag SMALLINT = 0 
	
    )
AS 
    SET NOCOUNT ON
	-- Grant
    IF @Flag = 1 
        BEGIN
            SELECT  UserPhotoHoroPasswordGrand.Password,
                    UserPhotoHoroPasswordGrand.GrandFrom,
                    UserPhotoHoroPasswordGrand.IsPhoto
            FROM    dbo.UserPhotoHoroPasswordGrand
            WHERE   UserPhotoHoroPasswordGrand.GrandTo = @ID
            ORDER BY UserPhotoHoroPasswordGrand.GrandFrom
        END
	-- Request
    ELSE 
        BEGIN
            SELECT  UserPhotoHoroPasswordRequest.RequestFrom,
                    UserPhotoHoroPasswordRequest.IsPhoto
            FROM    dbo.UserPhotoHoroPasswordRequest
            WHERE   UserPhotoHoroPasswordRequest.RequestTo = @ID
            ORDER BY UserPhotoHoroPasswordRequest.RequestFrom
        END

    RETURN





' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPasswordRequest_DropRequest]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordRequest_DropRequest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserPhotoHoroPasswordRequest_DropRequest]
    (
      @FromID VARCHAR(15),
      @ToID VARCHAR(15),
      @IsPhoto BIT = 1
	
    )
AS 
    SET NOCOUNT ON
	
    DELETE  FROM [UserPhotoHoroPasswordRequest]
    WHERE   ( [RequestTo] = @FromID )
            AND ( [RequestFrom] = @FromID )
            AND ( [IsPhoto] = @IsPhoto )

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPasswordRequest_SendRequest]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordRequest_SendRequest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserPhotoHoroPasswordRequest_SendRequest]
    (
      @RequestFrom VARCHAR(15),
      @RequestTo VARCHAR(15),
      @IsPhoto BIT = 1
	
    )
AS 
    SET NOCOUNT ON
	
    INSERT  INTO [dbo].[UserPhotoHoroPasswordRequest]
            (
              [RequestFrom],
              [RequestTo],
              [IsPhoto]
            )
    VALUES  (
              @RequestFrom,
              @RequestTo,
              @IsPhoto
            )

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPassword_GetCount]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPassword_GetCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserPhotoHoroPassword_GetCount]
    (
      @ID VARCHAR(15),
      @Flag SMALLINT = 0
	
    )
AS 
    SET NOCOUNT ON
	-- Grant
    IF @Flag = 1 
        BEGIN
            SELECT  COUNT(GrandTo)
            FROM    [dbo].[UserPhotoHoroPasswordGrand]
            WHERE   [GrandTo] = @ID
        END
	-- Request
    ELSE 
        BEGIN
            SELECT  COUNT(RequestTo)
            FROM    [dbo].[UserPhotoHoroPasswordRequest]
            WHERE   [RequestTo] = @ID
        END

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPasswordGrand_GetDetails]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordGrand_GetDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserPhotoHoroPasswordGrand_GetDetails] ( @GrandedTo VARCHAR(15) )
AS 
    SET NOCOUNT ON
	
    SELECT  [Password],
            [GrandFrom],
            [IsPhoto]
    FROM    [dbo].[UserPhotoHoroPasswordGrand]
    WHERE   [GrandTo] = @GrandedTo

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhotoHoroPasswordGrand_PasswordMatch]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhotoHoroPasswordGrand_PasswordMatch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserPhotoHoroPasswordGrand_PasswordMatch]
    (
      @GrandedBy varchar(15),
      @GrandedTo varchar(15),
      @Password varchar(25),
      @IsPhoto bit = 1
	
    )
AS 
    SET NOCOUNT ON
	
    DECLARE @return_value bit 


    IF EXISTS ( SELECT  *
                FROM    UserPhotoHoroPasswordGrand
                WHERE   ( GrandFrom = @GrandedBy )
                        AND ( GrandTo = @GrandedTo )
                        AND ( IsPhoto = @IsPhoto )
                        AND ( Password = @Password ) ) 
        BEGIN
            SELECT  @return_value = 1 
        END
    ELSE 
        BEGIN
            SELECT  @return_value = 0 
        END

    SELECT  ''Return Value'' = @return_value

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSuccessStory_InsertStory]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSuccessStory_InsertStory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserSuccessStory_InsertStory]
    (
      @SStoryID VARCHAR(15),
      @MatrimonialID VARCHAR(10) = NULL,
      @Bride VARCHAR(50) = NULL,
      @Groom VARCHAR(50) = NULL,
      @WeddingDate SMALLDATETIME = NULL,
      @Photo IMAGE = NULL,
      @SucessStory VARCHAR(1000) = NULL
    )
AS 
    SET NOCOUNT ON

    INSERT  INTO UserSuccessStory
            (
              SStoryID,
              MatrimonialID,
              Bride,
              Groom,
              WeddingDate,
              SucessStory,
              Photo
            )
    VALUES  (
              @SStoryID,
              @MatrimonialID,
              @Bride,
              @Groom,
              @WeddingDate,
              @SucessStory,
              @Photo
            )

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_DropAlbum]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_DropAlbum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[UserAlbum_DropAlbum]
    (
      @ID VARCHAR(25),
      @Flag TINYINT = 0
	
    )
AS 
    SET NOCOUNT ON
-- ----------------------------------------------------------
    IF @Flag = 0 
        BEGIN
            UPDATE  dbo.UserAlbum
            SET     UserAlbum.Photo1 = NULL
            WHERE   UserAlbum.ApplicationID = @ID 
        END
-- ----------------------------------------------------------
    ELSE 
        IF @Flag = 1 
            BEGIN
                UPDATE  dbo.UserAlbum
                SET     UserAlbum.Album1 = NULL
                WHERE   UserAlbum.ApplicationID = @ID 
            END
-- ----------------------------------------------------------
        ELSE 
            IF @Flag = 2 
                BEGIN
                    UPDATE  dbo.UserAlbum
                    SET     UserAlbum.Album2 = NULL
                    WHERE   UserAlbum.ApplicationID = @ID 
                END
-- ----------------------------------------------------------
            ELSE 
                IF @Flag = 3 
                    BEGIN
                        UPDATE  dbo.UserAlbum
                        SET     UserAlbum.Album3 = NULL
                        WHERE   UserAlbum.ApplicationID = @ID 
                    END
-- ----------------------------------------------------------
                ELSE 
                    IF @Flag = 4 
                        BEGIN
                            UPDATE  dbo.UserAlbum
                            SET     UserAlbum.Horoscope = NULL
                            WHERE   UserAlbum.ApplicationID = @ID 
                        END
-- ----------------------------------------------------------
                    ELSE 
                        IF @Flag = 5 
                            BEGIN
                                UPDATE  dbo.UserSuccessStory
                                SET     UserSuccessStory.Photo = NULL
                                WHERE   UserSuccessStory.SStoryID = @ID
                            END
-- ----------------------------------------------------------
-- Deleting Album if no photo is Present in the Album
-- ----------------------------------------------------------


    IF ( @Flag <> 5 )
        AND ( ( (
                  SELECT    UserAlbum.Photo1
                  FROM      dbo.UserAlbum
                  WHERE     UserAlbum.ApplicationID = @ID
                ) IS NULL )
              AND ( (
                      SELECT    UserAlbum.Album1
                      FROM      dbo.UserAlbum
                      WHERE     UserAlbum.ApplicationID = @ID
                    ) IS NULL )
              AND ( (
                      SELECT    UserAlbum.Album2
                      FROM      dbo.UserAlbum
                      WHERE     UserAlbum.ApplicationID = @ID
                    ) IS NULL )
              AND ( (
                      SELECT    UserAlbum.Album3
                      FROM      dbo.UserAlbum
                      WHERE     UserAlbum.ApplicationID = @ID
                    ) IS NULL )
              AND ( (
                      SELECT    UserAlbum.Horoscope
                      FROM      dbo.UserAlbum
                      WHERE     UserAlbum.ApplicationID = @ID
                    ) IS NULL )
            ) 
        BEGIN
            DELETE  FROM dbo.UserAlbum
            WHERE   UserAlbum.ApplicationID = @ID 
        END

-- ----------------------------------------------------------




    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_GetAlbum]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_GetAlbum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserAlbum_GetAlbum]
    (
      @ID VARCHAR(25),
      @Flag TINYINT = 0
	
    )
AS 
    SET NOCOUNT ON
-- ----------------------------------------------------------
    IF @Flag = 0 
        BEGIN
            SELECT  UserAlbum.Photo1 AS AlumImage
            FROM    dbo.UserAlbum
            WHERE   UserAlbum.ApplicationID = @ID
        END
-- ----------------------------------------------------------
    ELSE 
        IF @Flag = 1 
            BEGIN
                SELECT  UserAlbum.Album1 AS AlumImage
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
            END
-- ----------------------------------------------------------
        ELSE 
            IF @Flag = 2 
                BEGIN
                    SELECT  UserAlbum.Album2 AS AlumImage
                    FROM    dbo.UserAlbum
                    WHERE   UserAlbum.ApplicationID = @ID
                END
-- ----------------------------------------------------------
            ELSE 
                IF @Flag = 3 
                    BEGIN
                        SELECT  UserAlbum.Album3 AS AlumImage
                        FROM    dbo.UserAlbum
                        WHERE   UserAlbum.ApplicationID = @ID
                    END
-- ----------------------------------------------------------
                ELSE 
                    IF @Flag = 4 
                        BEGIN
                            SELECT  UserAlbum.Horoscope AS AlumImage
                            FROM    dbo.UserAlbum
                            WHERE   UserAlbum.ApplicationID = @ID
                        END
-- ----------------------------------------------------------
                    ELSE 
                        IF @Flag = 5 
                            BEGIN
                                SELECT  UserSuccessStory.Photo AS AlumImage
                                FROM    dbo.UserSuccessStory
                                WHERE   UserSuccessStory.SStoryID = @ID
                            END
-- ----------------------------------------------------------
    RETURN




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSuccessStory_DropStory]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSuccessStory_DropStory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserSuccessStory_DropStory]
    (
      @SStoryID VARCHAR(15) = NULL
    )
AS 
    SET NOCOUNT ON
--Deleting Sucess story from data base --

    DELETE  FROM UserSuccessStory
    WHERE   [SStoryID] = @SStoryID 
	
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSuccessStory_StoryCount]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSuccessStory_StoryCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserSuccessStory_StoryCount] 
	-- Add the parameters for the stored procedure here
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

    -- Insert statements for procedure here
        SELECT  COUNT(SStoryID)
        FROM    [dbo].[UserSuccessStory]
    END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSuccessStory_GetList]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSuccessStory_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserSuccessStory_GetList]

-- Getting List Of Success storys in the site

AS
	SET NOCOUNT ON 
	
	SELECT [SStoryID] FROM [dbo].[UserSuccessStory]
	
	ORDER BY [dbo].[UserSuccessStory].[WeddingDate] DESC
	RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSucessStory_GetStory]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSucessStory_GetStory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserSucessStory_GetStory]
    (
      @SStoryID VARCHAR(25) = NULL,
      @MatrimonialID VARCHAR(25) = NULL,
      @Flag SMALLINT = 0
    )
AS 
    SET NOCOUNT ON

	-- SStoryID IS Known --

    IF @Flag = 0 
        BEGIN 
            SELECT  UserSuccessStory.SStoryID,
                    UserSuccessStory.MatrimonialID,
                    UserSuccessStory.Bride,
                    UserSuccessStory.Groom,
                    UserSuccessStory.WeddingDate,
                    UserSuccessStory.SucessStory
            FROM    dbo.UserSuccessStory
            WHERE   UserSuccessStory.SStoryID = @SStoryID
        END

	-- MatrimonialID IS Known --

    ELSE 
        IF @Flag = 1 
            BEGIN 
                SELECT  UserSuccessStory.SStoryID,
                        UserSuccessStory.MatrimonialID,
                        UserSuccessStory.Bride,
                        UserSuccessStory.Groom,
                        UserSuccessStory.WeddingDate,
                        UserSuccessStory.SucessStory
                FROM    dbo.UserSuccessStory
                WHERE   UserSuccessStory.MatrimonialID = @MatrimonialID
            END
	
	-- MatrimonialID IS Known --

        ELSE 
            IF @Flag = 2 
                BEGIN 
                    SELECT  UserSuccessStory.SStoryID
                    FROM    dbo.UserSuccessStory
                    WHERE   UserSuccessStory.MatrimonialID = @MatrimonialID
                END


    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSucessStory_GetPhoto]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSucessStory_GetPhoto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UserSucessStory_GetPhoto]
(
		@SStoryID varchar(25)
	)
AS
	SET NOCOUNT ON

    SELECT Photo
      FROM UserSuccessStory
     WHERE SStoryID=@SStoryID

	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAboutAndExpectation_GetAboutME]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation_GetAboutME]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAboutAndExpectation_GetAboutME]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAboutAndExpectation.AboutMe,
            UserAboutAndExpectation.MyExpectations
    FROM    dbo.UserAboutAndExpectation
    WHERE   UserAboutAndExpectation.ApplicationID = @ApplicationID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAboutAndExpectation_MyExpectations]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation_MyExpectations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAboutAndExpectation_MyExpectations]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  UserAboutAndExpectation.MyExpectations
    FROM    dbo.UserAboutAndExpectation
    WHERE   UserAboutAndExpectation.ApplicationID = @ApplicationID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAboutAndExpectation_UpdateAboutME]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation_UpdateAboutME]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAboutAndExpectation_UpdateAboutME]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @AboutMe VARCHAR(1000) = NULL
	
    )
AS 
    SET NOCOUNT ON
	
    UPDATE  dbo.UserAboutAndExpectation
    SET     UserAboutAndExpectation.AboutMe = @AboutMe
    WHERE   UserAboutAndExpectation.ApplicationID = @ApplicationID
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAboutAndExpectation_UpdateExpectation]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation_UpdateExpectation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAboutAndExpectation_UpdateExpectation]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @MyExpectations VARCHAR(1000) = NULL
	
    )
AS 
    SET NOCOUNT ON
	
    UPDATE  dbo.UserAboutAndExpectation
    SET     UserAboutAndExpectation.MyExpectations = @MyExpectations
    WHERE   UserAboutAndExpectation.ApplicationID = @ApplicationID
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAboutAndExpectation_InsertAboutMe]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation_InsertAboutMe]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAboutAndExpectation_InsertAboutMe]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @AboutMe VARCHAR(1000) = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserAboutAndExpectation
            (
              ApplicationID,
              AboutMe
            )
    VALUES  (
              @ApplicationID,
              @AboutMe
            )
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_GetAccount]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_GetAccount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AdminAuthentication_GetAccount]
AS 
    SET NOCOUNT ON

    SELECT  AdminAuthentication.UserID,
            AdminAuthentication.CreatedIn,
            AdminAuthentication.UserName,
            AdminAuthentication.IsAdmin,
            AdminAuthentication.LastLogIN,
            AdminAuthentication.MailID
    FROM    dbo.AdminAuthentication 

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_CreatUser]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_CreatUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[AdminAuthentication_CreatUser]
    (
      @ApplicationID VARCHAR(25),
      @UserID VARCHAR(124),
      @PassWord VARCHAR(124),
      @CreatedIn SMALLDATETIME,
      @UserName VARCHAR(124),
      @IsAdmin BIT = 0,
      @LastLogIN SMALLDATETIME = NULL,
      @Email VARCHAR(80)
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.AdminAuthentication
            (
              ApplicationID,
              UserID,
              PassWord,
              CreatedIn,
              UserName,
              IsAdmin,
              LastLogIN,
              MailID
            )
    VALUES  (
              @ApplicationID,
              @UserID,
              @PassWord,
              @CreatedIn,
              @UserName,
              @IsAdmin,
              @CreatedIn,
              @Email
            )
    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_AccountInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_AccountInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[AdminAuthentication_AccountInfo] ( @UserID VARCHAR(124) )
AS 
    SET NOCOUNT ON  
	
    SELECT  AdminAuthentication.UserName,
            AdminAuthentication.IsAdmin,
            AdminAuthentication.MailID
    FROM    dbo.AdminAuthentication
    WHERE   ( AdminAuthentication.UserID = @UserID )
	
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_ChangeAccount]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_ChangeAccount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AdminAuthentication_ChangeAccount]
    (
      @UserID VARCHAR(124) = NULL,
      @EmailID VARCHAR(80) = NULL,
      @IsAdmin BIT 
	
    )
AS 
    SET NOCOUNT ON
	
    UPDATE  dbo.AdminAuthentication
    SET     AdminAuthentication.MailID = @EmailID,
            AdminAuthentication.IsAdmin = @IsAdmin
    WHERE   ( AdminAuthentication.UserID = @UserID )

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_UserLogIN]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_UserLogIN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AdminAuthentication_UserLogIN]
	(
	@UserID varchar(124),
	@Password varchar(124)
	)
AS
	SET NOCOUNT ON  
	
	SELECT [ApplicationID],[UserName],[IsAdmin]
	FROM [dbo].[AdminAuthentication]
	WHERE ([UserID] = @UserID ) AND ([Password] = @Password )
	
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_DropUser]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_DropUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AdminAuthentication_DropUser] ( @UserID VARCHAR(124) )
AS 
    SET NOCOUNT ON  
	
    DELETE  FROM dbo.AdminAuthentication
    WHERE   AdminAuthentication.UserID = @UserID 
	
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[AdminAuthentication_ChangePassword]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminAuthentication_ChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[AdminAuthentication_ChangePassword]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @NewPassword VARCHAR(124) = NULL,
      @OldPassword VARCHAR(124) = NULL
		
	
    )
AS 
    SET NOCOUNT ON
	
    UPDATE  dbo.AdminAuthentication
    SET     AdminAuthentication.Password = @NewPassword
    WHERE   ( AdminAuthentication.ApplicationID = @ApplicationID )
            AND ( AdminAuthentication.Password = @OldPassword )

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhysicalAttributes_GetInformation]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhysicalAttributes_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserPhysicalAttributes_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserPhysicalAttributes
    WHERE   UserPhysicalAttributes.ApplicationID = @ApplicationID

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhysicalAttributes_InsertInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhysicalAttributes_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserPhysicalAttributes_InsertInfo]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Height SMALLINT = NULL,
      @Weight SMALLINT = NULL,
      @BloodGroup SMALLINT = NULL,
      @BodyType SMALLINT = NULL,
      @Smoke SMALLINT = NULL,
      @Drink SMALLINT = NULL,
      @Complexion SMALLINT = NULL,
      @Diet SMALLINT = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserPhysicalAttributes
            (
              ApplicationID,
              Height,
              Weight,
              BloodGroup,
              BodyType,
              Smoke,
              Drink,
              Complexion,
              Diet
            )
    VALUES  (
              @ApplicationID,
              @Height,
              @Weight,
              @BloodGroup,
              @BodyType,
              @Smoke,
              @Drink,
              @Complexion,
              @Diet
            )
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPhysicalAttributes_UpdateInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPhysicalAttributes_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserPhysicalAttributes_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @Weight SMALLINT,
      @BloodGroup SMALLINT,
      @BodyType SMALLINT = NULL,
      @Smoke SMALLINT = NULL,
      @Drink SMALLINT = NULL,
      @Diet SMALLINT = NULL


	
    )
AS 
    UPDATE  UserPhysicalAttributes
    SET     Weight = @Weight,
            BloodGroup = @BloodGroup,
            BodyType = @BodyType,
            Smoke = @Smoke,
            Drink = @Drink,
            Diet = @Diet
    WHERE   ApplicationID = @ApplicationID
	
	
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserfavoriteList_GetInformation]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserfavoriteList_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserfavoriteList_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserfavoriteList
    WHERE   UserfavoriteList.ApplicationID = @ApplicationID

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_UpdateAlbum]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_UpdateAlbum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[UserAlbum_UpdateAlbum]
    (
      @AlbumImage IMAGE = NULL,
      @ID VARCHAR(25),
      @Flag TINYINT = 0
	
    )
AS 
    SET NOCOUNT ON
-- ----------------------------------------------------------
    IF @Flag = 0 
        BEGIN
            UPDATE  dbo.UserAlbum
            SET     UserAlbum.Photo1 = @AlbumImage
            WHERE   UserAlbum.ApplicationID = @ID
        END
-- ----------------------------------------------------------
    ELSE 
        IF @Flag = 1 
            BEGIN
                UPDATE  dbo.UserAlbum
                SET     UserAlbum.Album1 = @AlbumImage
                WHERE   UserAlbum.ApplicationID = @ID 
            END
-- ----------------------------------------------------------
        ELSE 
            IF @Flag = 2 
                BEGIN
                    UPDATE  dbo.UserAlbum
                    SET     UserAlbum.Album2 = @AlbumImage
                    WHERE   UserAlbum.ApplicationID = @ID 
                END
-- ----------------------------------------------------------
            ELSE 
                IF @Flag = 3 
                    BEGIN
                        UPDATE  dbo.UserAlbum
                        SET     UserAlbum.Album3 = @AlbumImage
                        WHERE   UserAlbum.ApplicationID = @ID 
                    END
-- ----------------------------------------------------------
                ELSE 
                    IF @Flag = 4 
                        BEGIN
                            UPDATE  dbo.UserAlbum
                            SET     UserAlbum.Horoscope = @AlbumImage
                            WHERE   UserAlbum.ApplicationID = @ID 
                        END
-- ----------------------------------------------------------
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_InsertImage]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_InsertImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAlbum_InsertImage]
    (
      @ApplicationID VARCHAR(25),
      @Photo1 IMAGE = NULL,
      @Album1 IMAGE = NULL,
      @Album2 IMAGE = NULL,
      @Album3 IMAGE = NULL,
      @Horoscope IMAGE = NULL,
      @HoroPassword VARCHAR(25) = NULL,
      @isPhoto BIT = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserAlbum
            (
              dbo.UserAlbum.ApplicationID,
              dbo.UserAlbum.Photo1,
              dbo.UserAlbum.Album1,
              dbo.UserAlbum.Album2,
              dbo.UserAlbum.Album3,
              dbo.UserAlbum.Horoscope,
              dbo.UserAlbum.HoroPassword,
              dbo.UserAlbum.isPhoto
            )
    VALUES  (
              @ApplicationID,
              @Photo1,
              @Album1,
              @Album2,
              @Album3,
              @Horoscope,
              @HoroPassword,
              @isPhoto
            )
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_IsAlbum]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_IsAlbum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserAlbum_IsAlbum] ( @ID VARCHAR(25) )
AS 
    SET NOCOUNT ON
-- ----------------------------------------------------------------------------------------
    IF ( ( (
             SELECT UserAlbum.Photo1
             FROM   dbo.UserAlbum
             WHERE  UserAlbum.ApplicationID = @ID
           ) IS NOT NULL )
         OR ( (
                SELECT  UserAlbum.Album1
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
              ) IS NOT NULL )
         OR ( (
                SELECT  UserAlbum.Album2
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
              ) IS NOT NULL )
         OR ( (
                SELECT  UserAlbum.Album3
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
              ) IS NOT NULL )
         OR ( (
                SELECT  UserAlbum.Horoscope
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
              ) IS NOT NULL )
       ) 
		-- --------------------------------------------------------------------------------
        BEGIN
            SELECT  1 AS Flag
        END
-- ----------------------------------------------------------------------------------------
    ELSE
		-- --------------------------------------------------------------------------------
        BEGIN
            SELECT  0 AS Flag
        END
-- ----------------------------------------------------------------------------------------
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_IsImageExists]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_IsImageExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[UserAlbum_IsImageExists]
    (
      @ID VARCHAR(25),
      @Flag TINYINT = 0
	
    )
AS 
    SET NOCOUNT ON
-- ----------------------------------------------------------
    IF ( @Flag = 0 )
        AND ( (
                SELECT  UserAlbum.Photo1
                FROM    dbo.UserAlbum
                WHERE   UserAlbum.ApplicationID = @ID
              ) IS NOT NULL ) 
        BEGIN
            SELECT  1 AS Flag
        END
 ----------------------------------------------------------
    ELSE 
        IF ( @Flag = 1 )
            AND ( (
                    SELECT  UserAlbum.Album1
                    FROM    dbo.UserAlbum
                    WHERE   UserAlbum.ApplicationID = @ID
                  ) IS NOT NULL ) 
            BEGIN
                SELECT  1 AS Flag
            END
-- ----------------------------------------------------------
        ELSE 
            IF ( @Flag = 2 )
                AND ( (
                        SELECT  UserAlbum.Album2
                        FROM    dbo.UserAlbum
                        WHERE   UserAlbum.ApplicationID = @ID
                      ) IS NOT NULL ) 
                BEGIN
                    SELECT  1 AS Flag
                END
-- ----------------------------------------------------------
            ELSE 
                IF ( @Flag = 3 )
                    AND ( (
                            SELECT  UserAlbum.Album3
                            FROM    dbo.UserAlbum
                            WHERE   UserAlbum.ApplicationID = @ID
                          ) IS NOT NULL ) 
                    BEGIN
                        SELECT  1 AS Flag
                    END
-- ----------------------------------------------------------
                ELSE 
                    IF ( @Flag = 4 )
                        AND ( (
                                SELECT  UserAlbum.Horoscope
                                FROM    dbo.UserAlbum
                                WHERE   UserAlbum.ApplicationID = @ID
                              ) IS NOT NULL ) 
                        BEGIN
                            SELECT  1 AS Flag
                        END
-- ----------------------------------------------------------
                    ELSE 
                        BEGIN
                            SELECT  0 AS Flag
                        END
-- ----------------------------------------------------------

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_SetPhotoPassword]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_SetPhotoPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAlbum_SetPhotoPassword]
    (
      @ApplicationID VARCHAR(25),
      @Password VARCHAR(25) = NULL
    )
AS 
    SET NOCOUNT ON


    UPDATE  dbo.UserAlbum
    SET     UserAlbum.PhotoPassword = @Password
    WHERE   UserAlbum.ApplicationID = @ApplicationID 
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_SetHoroscopePassword]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_SetHoroscopePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserAlbum_SetHoroscopePassword]
    (
      @ApplicationID VARCHAR(25),
      @Password VARCHAR(25) = NULL
    )
AS 
    SET NOCOUNT ON


    UPDATE  dbo.UserAlbum
    SET     UserAlbum.HoroPassword = @Password
    WHERE   UserAlbum.ApplicationID = @ApplicationID 
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserAlbum_IsPasswordProtected]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAlbum_IsPasswordProtected]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserAlbum_IsPasswordProtected]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    DECLARE @Photo BIT 
    DECLARE @Horo BIT   
  
    IF (
         SELECT UserAlbum.PhotoPassword
         FROM   dbo.UserAlbum
         WHERE  UserAlbum.ApplicationID = @ApplicationID
       ) IS NOT NULL 
        BEGIN
            SET @Photo = 1
        END
    ELSE 
        BEGIN
            SET @Photo = 0
        END
    IF (
         SELECT UserAlbum.HoroPassword
         FROM   dbo.UserAlbum
         WHERE  UserAlbum.ApplicationID = @ApplicationID
       ) IS NOT NULL 
        BEGIN
            SET @Horo = 1
        END
    ELSE 
        BEGIN
            SET @Horo = 0
        END

    SELECT  @Horo AS HoroPassword,
            @Photo AS PhotoPassword


    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserHobiesAndIntrests_DataHandler]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserHobiesAndIntrests_DataHandler]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserHobiesAndIntrests_DataHandler]
-- =============================================
    @ApplicationID VARCHAR(64),
    @HobbiesList VARCHAR(64) = NULL,
    @OtherHobbies VARCHAR(64) = NULL,
    @IntrestList VARCHAR(64) = NULL,
    @OtherIntrests VARCHAR(64) = NULL
-- =============================================
AS 
    BEGIN
-- =====================================================================================================
        SET NOCOUNT ON ;
	-- =================================================================================================

        IF EXISTS ( SELECT  *
                    FROM    dbo.UserHobiesAndIntrests
                    WHERE   UserHobiesAndIntrests.ApplicationID = @ApplicationID ) 
            BEGIN
			-- =========================================================================================
                UPDATE  dbo.UserHobiesAndIntrests
                SET     UserHobiesAndIntrests.Hobies = @HobbiesList,
                        UserHobiesAndIntrests.OtherHobies = @OtherHobbies,
                        UserHobiesAndIntrests.Interests = @IntrestList,
                        UserHobiesAndIntrests.OtherInterests = @OtherIntrests
                WHERE   UserHobiesAndIntrests.ApplicationID = @ApplicationID
			-- =========================================================================================
            END
        ELSE 
            BEGIN
			-- =========================================================================================
                INSERT  INTO dbo.UserHobiesAndIntrests
                        (
                          [ApplicationID],
                          [Hobies],
                          [OtherHobies],
                          [Interests],
                          [OtherInterests]
                        )
                VALUES  (
                          @ApplicationID,
                          @HobbiesList,
                          @OtherHobbies,
                          @IntrestList,
                          @OtherIntrests
                        )
			-- =========================================================================================
            END
-- =====================================================================================================

    END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserHobiesAndIntrests_GetInformation]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserHobiesAndIntrests_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserHobiesAndIntrests_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON
    SELECT  UserHobiesAndIntrests.Hobies,
            UserHobiesAndIntrests.OtherHobies,
            UserHobiesAndIntrests.Interests,
            UserHobiesAndIntrests.OtherInterests
    FROM    dbo.UserHobiesAndIntrests
    WHERE   UserHobiesAndIntrests.ApplicationID = @ApplicationID 
    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[AbuseSuccessStorys_GetReport]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseSuccessStorys_GetReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[AbuseSuccessStorys_GetReport]
AS 
    SET NOCOUNT ON 
	
    SELECT  *
    FROM    dbo.AbuseSuccessStorys

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonial_ReportAbuse]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonial_ReportAbuse]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[Matrimonial_ReportAbuse]
    (
      @ID VARCHAR(15),
      @Message VARCHAR(200),
      @Flag SMALLINT = 0
	
    )
AS 
    SET NOCOUNT ON 
	
    IF @Flag = 1 
        BEGIN
            INSERT  INTO dbo.AbuseProfileList
                    (
                      MatrimonialID,
                      Message
                    )
            VALUES  ( @ID, @Message )
        END 
    ELSE 
        BEGIN
            INSERT  INTO dbo.AbuseSuccessStorys 
            ( 
				[SStoryID],
				[Message] 
			)
            VALUES  
            ( 
				@ID, 
				@Message 
			)
        END 
  
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserPartnerPreference_GetData]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPartnerPreference_GetData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserPartnerPreference_GetData] 
-- =============================================
    @ApplicationID VARCHAR(25)
-- =============================================
AS 
    BEGIN
-- =============================================
        SET NOCOUNT ON ;
-- =============================================================================================================================================
        SELECT  UserPartnerPreference.LookingFor,
                UserPartnerPreference.AgeMin,
                UserPartnerPreference.AgeMax,
                UserPartnerPreference.Complexion,
                UserPartnerPreference.HaveChildren,
                UserPartnerPreference.HeightMin,
                UserPartnerPreference.HeightMax,
                UserPartnerPreference.PhysicalStatus,
                UserPartnerPreference.MotherTongue,
                UserPartnerPreference.Religion,
                UserPartnerPreference.[Cast],
                UserPartnerPreference.Manglik,
                UserPartnerPreference.Dite,
                UserPartnerPreference.Education,
                UserPartnerPreference.EducationDetails,
                UserPartnerPreference.AnnualIncome,
                UserPartnerPreference.Occupation,
                UserPartnerPreference.Citizenship,
                UserPartnerPreference.LivingIn,
                UserPartnerPreference.ResidingState,
                UserPartnerPreference.ResStatus
        FROM    dbo.UserPartnerPreference
        WHERE   UserPartnerPreference.ApplicationID = @ApplicationID
-- =============================================================================================================================================

    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBasicInformation_InsertInfo]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBasicInformation_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserBasicInformation_InsertInfo]
    (
      @ApplicationID VARCHAR(25),
      @Name VARCHAR(50),
      @Gender BIT,
      @DOB SMALLDATETIME,
      @MotherTongue SMALLINT,
      @MaritalStatus SMALLINT,
      @NoOfChildren SMALLINT = NULL,
      @PhysicalStatus BIT = NULL,
      @ChildrenLivingWith BIT = NULL,
      @Religion SMALLINT = 1,
      @Cast SMALLINT = 178,
      @SubCast VARCHAR(50) = NULL,
      @CreatedBy SMALLINT = 1



    )
AS 
    SET NOCOUNT ON

-- ==========================================================================================================================================================================
    DECLARE @Caste SMALLINT 
-- ==========================================================================================================================================================================
    SET @Caste = (
                   SELECT   IndexReligion.OfSet
                   FROM     dbo.IndexReligion
                   WHERE    IndexReligion.[Value] = @Religion
                 ) + @Cast
    
-- ==========================================================================================================================================================================
    INSERT  INTO dbo.UserBasicInformation
            (
              [ApplicationID],
              [Name],
              [Gender],
              [DOB],
              [MotherTongue],
              [MaritalStatus],
              [NoOfChildren],
              [PhysicalStatus],
              [ChildrenLivingWith],
              [Religion],
              [Cast],
              [SubCast],
              [CreatedBy]
            )
    VALUES  (
              @ApplicationID,
              @Name,
              @Gender,
              @DOB,
              @MotherTongue,
              @MaritalStatus,
              @NoOfChildren,
              @PhysicalStatus,
              @ChildrenLivingWith,
              @Religion,
              @Caste,
              @SubCast,
              @CreatedBy
            )
-- ==========================================================================================================================================================================
    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserIntrests_ExpressIntrest]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIntrests_ExpressIntrest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserIntrests_ExpressIntrest]
    (
      @IntrestFrom VARCHAR(15),
      @IntrestTo VARCHAR(15),
      @Status SMALLINT = 1,
      @IntrestsCode SMALLINT,
      @date SMALLDATETIME 
	
    )
AS 
    SET NOCOUNT ON
	
    INSERT  INTO dbo.UserIntrests
            (
              IntrestFrom,
              IntrestTo,
              Status,
              IntrestsCode,
              Date
            )
    VALUES  (
              @IntrestFrom,
              @IntrestTo,
              @Status,
              @IntrestsCode,
              GETDATE()
            )

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserIntrests_Fill]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIntrests_Fill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[UserIntrests_Fill]
    (
      -- ==========================================================================
      @MatrimonialID VARCHAR(25),
      @IntrestFrom VARCHAR(25) = NULL,
      @Status SMALLINT = NULL,
      @Flag SMALLINT = 0 	
-- ==========================================================================
    )
AS 
    SET NOCOUNT ON

	-- ==========================================================================
    IF @Flag = 0
	-- ==========================================================================
        BEGIN
	-- ==========================================================================
            SELECT  UserIntrests.IntrestsCode,
                    UserIntrests.Status,
                    UserIntrests.[Date],
                    UserIntrests.IntrestFrom AS ID
            FROM    dbo.UserIntrests
            WHERE   ( UserIntrests.IntrestTo = @MatrimonialID )
                    AND ( UserIntrests.Status = @Status )
            ORDER BY UserIntrests.[Date] DESC
	-- ==========================================================================
        END
	-- ==========================================================================
    ELSE 
        IF @Flag = 1
	-- ==========================================================================
            BEGIN
	-- ==========================================================================
                SELECT  UserIntrests.IntrestsCode,
                        UserIntrests.Status,
                        UserIntrests.[Date],
                        UserIntrests.IntrestTo AS ID
                FROM    dbo.UserIntrests
                WHERE   ( UserIntrests.IntrestFrom = @MatrimonialID )
                        AND ( UserIntrests.Status = @Status )
                ORDER BY UserIntrests.[Date] DESC
	-- ==========================================================================
            END
	-- ==========================================================================
        ELSE 
            IF @Flag = 2
	-- ==========================================================================
                BEGIN
	-- ==========================================================================
                    SELECT  UserIntrests.Status
                    FROM    dbo.UserIntrests
                    WHERE   ( UserIntrests.IntrestFrom = @IntrestFrom )
                            AND ( UserIntrests.IntrestTo = @MatrimonialID )
                    ORDER BY UserIntrests.[Date] DESC
	-- ==========================================================================
                END
	-- ==========================================================================

    RETURN




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserIntrests_Count]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIntrests_Count]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE PROCEDURE [dbo].[UserIntrests_Count]
    (
      -- ==========================================================================
      @MatrimonialID VARCHAR(25),
      @Status SMALLINT,
      @Flag SMALLINT = 0 	
-- ==========================================================================
    )
AS 
    SET NOCOUNT ON
	-- ==========================================================================
	-- INBOX
	-- ==========================================================================
    IF @Flag = 0 
        BEGIN
	-- ==========================================================================
            SELECT  COUNT(UserIntrests.IntrestTo) AS Count
            FROM    dbo.UserIntrests
            WHERE   ( UserIntrests.IntrestTo = @MatrimonialID )
                    AND ( UserIntrests.Status = @Status )
	-- ==========================================================================
        END
	-- ==========================================================================
	-- OUTBOX
	-- ==========================================================================
    ELSE 
        IF @Flag = 1 
            BEGIN
	-- ==========================================================================
                SELECT  COUNT(UserIntrests.IntrestTo) AS Count
                FROM    dbo.UserIntrests
                WHERE   ( UserIntrests.IntrestFrom = @MatrimonialID )
                        AND ( UserIntrests.Status = @Status )
	-- ==========================================================================
            END


    RETURN






' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserIntrests_ApproveIntrest]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserIntrests_ApproveIntrest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[UserIntrests_ApproveIntrest]
    (
      @IntrestFrom VARCHAR(15),
      @IntrestTo VARCHAR(15),
      @Status SMALLINT 
	
    )
AS 
    SET NOCOUNT ON
-- =============================================================================
    UPDATE  dbo.UserIntrests
    SET     UserIntrests.Status = @Status,
            UserIntrests.[Date] = GETDATE()
    WHERE   ( UserIntrests.IntrestFrom = @IntrestFrom )
            AND ( UserIntrests.IntrestTo = @IntrestTo )
-- =============================================================================
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Matrimonial_SailesDetails]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matrimonial_SailesDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Prasanth
-- Create date: 1 Apr
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Matrimonial_SailesDetails] 
( 
	@Flag bit = 1 ,
	@MatrimonialID  varchar(15) = null
)
AS
BEGIN
			-- =================================================================================================================================================================================================================================
	SET NOCOUNT ON;

		IF @Flag = 1
			BEGIN
				-- =================================================================================================================================================================================================================================
				SELECT     MatrimonialMembershipPlan.PlanAmount AS Amount, PaidMemberDetails.DateOfParches, UserBasicInformation.Gender, UserBasicInformation.Name, 
									  UserContactInformations.Address,PaidMemberDetails.MatrimonialID
				-- =================================================================================================================================================================================================================================
				FROM         MatrimonialMembershipPlan INNER JOIN
									  PaidMemberDetails ON MatrimonialMembershipPlan.PlanID = PaidMemberDetails.PlanID INNER JOIN
									  UserBasicInformation ON PaidMemberDetails.ApplicationID = UserBasicInformation.ApplicationID INNER JOIN
									  UserContactInformations ON PaidMemberDetails.ApplicationID = UserContactInformations.ApplicationID
				-- =================================================================================================================================================================================================================================
				WHERE    ( (MatrimonialMembershipPlan.PlanID = 1) OR(MatrimonialMembershipPlan.PlanID  = 2) OR(MatrimonialMembershipPlan.PlanID  = 3) )AND (DATEDIFF(dd, PaidMemberDetails.DateOfParches, GETDATE()) <= 30)
				-- =================================================================================================================================================================================================================================
				ORDER BY PaidMemberDetails.DateOfParches DESC
				-- =================================================================================================================================================================================================================================
		   END
				-- =================================================================================================================================================================================================================================
	  ELSE IF @FLag = 0
				-- =================================================================================================================================================================================================================================
		   BEGIN
				-- =================================================================================================================================================================================================================================
				SELECT     MatrimonialMembershipPlan.PlanAmount AS Amount, PaidMemberDetails.DateOfParches, UserBasicInformation.Gender, UserBasicInformation.Name, 
									  UserContactInformations.Address,PaidMemberDetails.MatrimonialID,MatrimonialMembershipPlan.PlanDuration AS Duration, MatrimonialMembershipPlan.PlanName,PaidMemberDetails.SerialNo
				-- =================================================================================================================================================================================================================================
				FROM	   MatrimonialMembershipPlan INNER JOIN
									  PaidMemberDetails ON MatrimonialMembershipPlan.PlanID = PaidMemberDetails.PlanID INNER JOIN
									  UserBasicInformation ON PaidMemberDetails.ApplicationID = UserBasicInformation.ApplicationID INNER JOIN
									  UserContactInformations ON PaidMemberDetails.ApplicationID = UserContactInformations.ApplicationID INNER JOIN
									  UserAuthentication ON UserBasicInformation.ApplicationID = UserAuthentication.ApplicationID
				-- =================================================================================================================================================================================================================================
				WHERE     (UserAuthentication.MatrimonialID = @MatrimonialID)
				-- =================================================================================================================================================================================================================================
		   END
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMembershipPlan_Fill]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMembershipPlan_Fill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialMembershipPlan_Fill] 
	-- Add the parameters for the stored procedure here
    @PlanID SMALLINT,
    @PlanAmount SMALLINT,
    @PlanDuration SMALLINT,
    @PlanName VARCHAR(50)
AS 
    BEGIN

        SET NOCOUNT ON ;
-- ===========================================================================================
        IF NOT EXISTS ( SELECT  *
                        FROM    dbo.MatrimonialMembershipPlan
                        WHERE   MatrimonialMembershipPlan.PlanID = @PlanID )
		-- INSERTING VALUES INTO DATABASE
            BEGIN
			-- >
                INSERT  INTO dbo.MatrimonialMembershipPlan
                        (
                          [PlanID],
                          [PlanAmount],
                          [PlanDuration],
                          [PlanName]
                        )
                VALUES  (
                          @PlanID,
                          @PlanAmount,
                          @PlanDuration,
                          @PlanName
                        )
			-->
            END

        ELSE
		-- UPDATING VALUES IN DATA BASE 
            BEGIN
			-- >
                UPDATE  dbo.MatrimonialMembershipPlan
                SET     MatrimonialMembershipPlan.PlanAmount = @PlanAmount,
                        MatrimonialMembershipPlan.PlanDuration = @PlanDuration,
                        MatrimonialMembershipPlan.PlanName = @PlanName
                WHERE   MatrimonialMembershipPlan.PlanID = @PlanID
			-- >
            END

-- ==============================================================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMembershipPlan_GetPlan]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMembershipPlan_GetPlan]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Prasanth
-- ==============================================================
CREATE PROCEDURE [dbo].[MatrimonialMembershipPlan_GetPlan] 
-- ==============================================================
    @PlanID SMALLINT = NULL	
-- =============================================
AS 
    BEGIN
-- =============================================
        SET NOCOUNT ON ;
        IF @PlanID IS NOT NULL 
            BEGIN
	-- =============================================
                DECLARE @Count INT 
	-- =============================================
		-- Get The count of Paid member in Plan#
	-- =============================================
                SELECT  @Count = COUNT(PaidMemberDetails.PlanID)
                FROM    dbo.PaidMemberDetails
                WHERE   PaidMemberDetails.PlanID = @PlanID
	-- =============================================
		-- Select the other details
	-- ==========================================================================
                SELECT  MatrimonialMembershipPlan.PlanName,
                        MatrimonialMembershipPlan.PlanDuration,
                        MatrimonialMembershipPlan.PlanAmount,
                        @Count AS Count
                FROM    dbo.MatrimonialMembershipPlan
                WHERE   MatrimonialMembershipPlan.PlanID = @PlanID
	-- ==========================================================================
            END
        ELSE 
            BEGIN
	-- ==========================================================================
                SELECT  MatrimonialMembershipPlan.PlanName,
                        MatrimonialMembershipPlan.PlanDuration,
                        MatrimonialMembershipPlan.PlanAmount
                FROM    dbo.MatrimonialMembershipPlan
	-- ==========================================================================
            END

    END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[AbuseProfileList_GetReport]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbuseProfileList_GetReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[AbuseProfileList_GetReport]
AS 
    SET NOCOUNT ON 
	
    SELECT  *
    FROM    dbo.AbuseProfileList

    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMailList_GetMailAddress]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList_GetMailAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[MatrimonialMailList_GetMailAddress]
    (
      @EmailAddress VARCHAR(25),
      @PromotionalMails BIT = NULL,
      @NewFeatures BIT = NULL,
      @PartnerMails BIT = NULL,
      @DailyMatch BIT = NULL
    )
AS 
    SET NOCOUNT ON

    SELECT  MatrimonialMailList.MailAddress
    FROM    dbo.MatrimonialMailList
    WHERE   ( MatrimonialMailList.PromotionalMails = @PromotionalMails )
            OR ( MatrimonialMailList.NewFeatures = @NewFeatures )
            OR ( MatrimonialMailList.PartnerMails = @PartnerMails )
            OR ( MatrimonialMailList.DailyMatch = @DailyMatch )
		

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMailList_AddList]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList_AddList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[MatrimonialMailList_AddList]
    (
      @EmailAddress VARCHAR(25),
      @PromotionalMails BIT = 1,
      @NewFeatures BIT = 1,
      @PartnerMails BIT = 1,
      @DailyMatch BIT = 1
    )
AS 
    SET NOCOUNT ON


    INSERT  INTO dbo.MatrimonialMailList
            (
              MailAddress,
              PromotionalMails,
              NewFeatures,
              PartnerMails,
              DailyMatch
            )
    VALUES  (
              @EmailAddress,
              @PromotionalMails,
              @NewFeatures,
              @PartnerMails,
              @DailyMatch
            )
    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMailList_UpdateList]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList_UpdateList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[MatrimonialMailList_UpdateList]
    (
      @EmailAddress VARCHAR(25),
      @PromotionalMails BIT = 1,
      @NewFeatures BIT = 1,
      @PartnerMails BIT = 1,
      @DailyMatch BIT = 1
    )
AS 
    SET NOCOUNT ON


    UPDATE  dbo.MatrimonialMailList
    SET     MatrimonialMailList.PromotionalMails = @PromotionalMails,
            MatrimonialMailList.NewFeatures = @NewFeatures,
            MatrimonialMailList.PartnerMails = @PartnerMails,
            MatrimonialMailList.DailyMatch = @DailyMatch
    WHERE   MatrimonialMailList.MailAddress = @EmailAddress 

    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialMailList_GetSettings]    Script Date: 06/14/2007 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialMailList_GetSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[MatrimonialMailList_GetSettings]
    (
      @EmailAddress VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  MatrimonialMailList.PromotionalMails,
            MatrimonialMailList.NewFeatures,
            MatrimonialMailList.PartnerMails,
            MatrimonialMailList.DailyMatch
    FROM    dbo.MatrimonialMailList
    WHERE   MatrimonialMailList.MailAddress = @EmailAddress 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialFeedBack_AddFeedBack]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBack_AddFeedBack]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialFeedBack_AddFeedBack] 
-- =====================================================================
    @EmailID VARCHAR(64),
    @Name VARCHAR(50),
    @Message VARCHAR(300)
-- =====================================================================
AS 
    BEGIN
        SET NOCOUNT ON ;
-- =====================================================================
        INSERT  INTO dbo.MatrimonialFeedBack
                (
                  [Name],
                  [Date],
                  [Message],
                  [Email]
                )
        VALUES  (
                  @Name,
                  GETDATE(),
                  @Message,
                  @EmailID
                )
-- =====================================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialFeedBack_ReadFeedBack]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBack_ReadFeedBack]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialFeedBack_ReadFeedBack]
AS 
    BEGIN
        SET NOCOUNT ON ;
-- =====================================================================
        SELECT  MatrimonialFeedBack.Name,
                MatrimonialFeedBack.[Date],
                MatrimonialFeedBack.Message,
                MatrimonialFeedBack.Email
        FROM    dbo.MatrimonialFeedBack
-- =====================================================================
	-- DELETE OUT DATED FEEDBACKS
-- ================================================================================================================================
        IF (
             SELECT MatrimonialFeedBackFilter.FilterON
             FROM   dbo.MatrimonialFeedBackFilter
           ) = 1 
            BEGIN 
                DELETE  FROM dbo.MatrimonialFeedBack
                WHERE   DATEDIFF(day, dbo.MatrimonialFeedBack.[Date],
                                 GETDATE()) >= (
                                                 SELECT MatrimonialFeedBackFilter.LifeTime
                                                 FROM   dbo.MatrimonialFeedBackFilter
                                               )
            END
-- ================================================================================================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserContactInformations_UpdateInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserContactInformations_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserContactInformations_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @Address VARCHAR(350),
      @Country SMALLINT,
      @State SMALLINT,
      @City VARCHAR(50),
      @ResidenceCity VARCHAR(50) = NULL,
      @PhoneNo INT = NULL,
      @AreaCode SMALLINT = NULL,
      @ISDCode SMALLINT = NULL,
      @Mobile BIGINT = NULL,
      @Residence SMALLINT = NULL,
      @ResidenceType SMALLINT = NULL

    )
AS 
    SET NOCOUNT ON

    UPDATE  dbo.UserContactInformations
    SET     UserContactInformations.Address = @Address,
            UserContactInformations.Country = @Country,
            UserContactInformations.[State] = @State,
            UserContactInformations.City = @City,
            UserContactInformations.ResidenceCity = @ResidenceCity,
            UserContactInformations.PhoneNo = @PhoneNo,
            UserContactInformations.AreaCode = @AreaCode,
            UserContactInformations.ISDCode = @ISDCode,
            UserContactInformations.Mobile = @Mobile,
            UserContactInformations.Residence = @Residence,
            UserContactInformations.ResidenceType = @ResidenceType
    WHERE   UserContactInformations.ApplicationID = @ApplicationID
    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserContactInformations_InsertInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserContactInformations_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserContactInformations_InsertInfo]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Address VARCHAR(350) = NULL,
      @Country SMALLINT = NULL,
      @State SMALLINT = NULL,
      @City VARCHAR(50) = NULL,
      @PhoneNo INT = NULL,
      @AreaCode SMALLINT = NULL,
      @ISDCode SMALLINT = NULL,
      @Mobile INT = NULL,
      @Residence SMALLINT = NULL,
      @ResidenceType SMALLINT = NULL,
      @ResidenceCity VARCHAR(25) = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserContactInformations
            (
              ApplicationID,
              Address,
              Country,
              State,
              City,
              PhoneNo,
              AreaCode,
              ISDCode,
              Mobile,
              Residence,
              ResidenceType,
              ResidenceCity
            )
    VALUES  (
              @ApplicationID,
              @Address,
              @Country,
              @State,
              @City,
              @PhoneNo,
              @AreaCode,
              @ISDCode,
              @Mobile,
              @Residence,
              @ResidenceType,
              @ResidenceCity
            )
    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserContactInformations_GetInformation]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserContactInformations_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserContactInformations_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserContactInformations
    WHERE   UserContactInformations.ApplicationID = @ApplicationID

    RETURN 



' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialFeedBackFilter_GetFilter]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBackFilter_GetFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialFeedBackFilter_GetFilter]
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

-- ===================================================================================
        IF EXISTS ( SELECT  MatrimonialFeedBackFilter.FilterON
                    FROM    dbo.MatrimonialFeedBackFilter )
-- ===================================================================================
            BEGIN
-- ===================================================================================
                SELECT  MatrimonialFeedBackFilter.FilterON AS Filter,
                        MatrimonialFeedBackFilter.LifeTime AS LifeTime
                FROM    dbo.MatrimonialFeedBackFilter
-- ===================================================================================
            END
-- ===================================================================================
        ELSE
-- ===================================================================================
            BEGIN
                SELECT  0 AS Filter
            END
-- ===================================================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[MatrimonialFeedBackFilter_SetFilter]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatrimonialFeedBackFilter_SetFilter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[MatrimonialFeedBackFilter_SetFilter] 
-- ===================================================================================
    @FilterON BIT,
    @LifeTime SMALLINT 
-- ===================================================================================
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

-- ===================================================================================
        IF NOT EXISTS ( SELECT  *
                        FROM    dbo.MatrimonialFeedBackFilter )
-- ===================================================================================
            BEGIN
-- ===================================================================================
                INSERT  INTO dbo.MatrimonialFeedBackFilter
                        (
                          [FilterON],
                          [LifeTime]
                        )
                VALUES  ( @FilterON, @LifeTime )
-- ===================================================================================
            END
-- ===================================================================================
        ELSE
-- ===================================================================================
            BEGIN
                UPDATE  dbo.MatrimonialFeedBackFilter
                SET     MatrimonialFeedBackFilter.FilterON = @FilterON,
                        MatrimonialFeedBackFilter.LifeTime = @LifeTime
            END
-- ===================================================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBasicInformation_UpdateInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBasicInformation_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserBasicInformation_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @NoOfChildren SMALLINT = NULL,
      @ChildrenLivingWith BIT = NULL,
      @SubCast VARCHAR(50) = NULL
	
    )
AS 
    UPDATE  dbo.UserBasicInformation
    SET     UserBasicInformation.NoOfChildren = @NoOfChildren,
            UserBasicInformation.ChildrenLivingWith = @ChildrenLivingWith,
            UserBasicInformation.SubCast = @SubCast
    WHERE   UserBasicInformation.ApplicationID = @ApplicationID
    RETURN


' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBasicInformation_GetInformation]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBasicInformation_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserBasicInformation_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserBasicInformation
    WHERE   UserBasicInformation.ApplicationID = @ApplicationID

    RETURN 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserVisiters_GetList]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserVisiters_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserVisiters_GetList] 
	-- Add the parameters for the stored procedure here
    @MartimonialID VARCHAR(15)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;
-- ==============================================================================================================================
        SELECT  dbo.UserVisiters.visitor1,
                dbo.UserVisiters.visitor2,
                dbo.UserVisiters.visitor3,
                dbo.UserVisiters.visitor4,
                dbo.UserVisiters.visitor5,
                dbo.UserVisiters.visitor6,
                dbo.UserVisiters.visitor7
        FROM    dbo.UserVisiters
        WHERE   dbo.UserVisiters.MartimonialID = @MartimonialID

    END





' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSocioReligionAttributes_InsertInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSocioReligionAttributes_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/* Procedure for inserting data in UserSocioReligionAttributes   */

CREATE PROCEDURE [dbo].[UserSocioReligionAttributes_InsertInfo]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Star SMALLINT = NULL,
      @MoonSign SMALLINT = NULL,
      @HoroscopeMatch SMALLINT = NULL,
      @PlaceOfBirth VARCHAR(50) = NULL,
      @TimeOfBirth DATETIME = NULL,
      @Manglik SMALLINT = NULL
	
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO UserSocioReligionAttributes
            (
              ApplicationID,
              Star,
              MoonSign,
              HoroscopeMatch,
              PlaceOfBirth,
              TimeOfBirth,
              Manglik
            )
    VALUES  (
              @ApplicationID,
              @Star,
              @MoonSign,
              @HoroscopeMatch,
              @PlaceOfBirth,
              @TimeOfBirth,
              @Manglik
            )
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSocioReligionAttributes_UpdateInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSocioReligionAttributes_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserSocioReligionAttributes_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @Star SMALLINT = NULL,
      @MoonSign SMALLINT = NULL,
      @HoroscopeMatch SMALLINT = NULL,
      @PlaceOfBirth VARCHAR(50) = NULL,
      @TimeOfBirth DATETIME = NULL,
      @Manglik SMALLINT = NULL
    )
AS 
    UPDATE  UserSocioReligionAttributes
    SET     Star = @Star,
            MoonSign = @MoonSign,
            HoroscopeMatch = @HoroscopeMatch,
            PlaceOfBirth = @PlaceOfBirth,
            TimeOfBirth = @TimeOfBirth,
            Manglik = @Manglik
    WHERE   ApplicationID = @ApplicationID
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserSocioReligionAttributes_GetInformation]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSocioReligionAttributes_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserSocioReligionAttributes_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    UserSocioReligionAttributes
    WHERE   ApplicationID = @ApplicationID

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBookMark_Mark]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBookMark_Mark]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserBookMark_Mark] 
	-- Add the parameters for the stored procedure here
    @MatrimonialID VARCHAR(15),
    @LinkID VARCHAR(15),
    @Falg SMALLINT = 0
AS 
    BEGIN
        SET NOCOUNT ON ;
-- Add Bookmark
        IF @Falg = 0 
            BEGIN
                INSERT  INTO dbo.UserBookMark
                        (
                          [MatrimonialID],
                          [Link]
                        )
                VALUES  (
                          @MatrimonialID,
                          @LinkID
                        )
            END 
-- Remove Book Mark		
        ELSE 
            IF @Falg = 1 
                BEGIN
                    DELETE  FROM dbo.UserBookMark
                    WHERE   ( UserBookMark.MatrimonialID = @MatrimonialID )
                            AND ( UserBookMark.Link = @LinkID )

                END
		
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBookMark_ListCount]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBookMark_ListCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Prasanth
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UserBookMark_ListCount]
    @MatrimonialID VARCHAR(15)
AS 
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON ;

    -- Insert statements for procedure here
        SELECT  COUNT(UserBookMark.MatrimonialID)
        FROM    dbo.UserBookMark
        WHERE   UserBookMark.MatrimonialID = @MatrimonialID
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBookMark_GetList]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBookMark_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserBookMark_GetList]
    @MatrimonialID VARCHAR(15)
AS 
    SET NOCOUNT ON 
	
    SELECT  UserBookMark.Link
    FROM    dbo.UserBookMark
    WHERE   dbo.UserBookMark.MatrimonialID = @MatrimonialID

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserBookMark_Links]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserBookMark_Links]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserBookMark_Links]
    (
      @MatrimonialID VARCHAR(15)
    )
AS -- SELECTING THE LINKS SET BY THE USER --
    SELECT  UserBookMark.Link
    FROM    dbo.UserBookMark
    WHERE   UserBookMark.MatrimonialID = @MatrimonialID 

    RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserMessages_MaiBox]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages_MaiBox]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- ============================================
CREATE PROCEDURE [dbo].[UserMessages_MaiBox]
    (
      @MatrimonialID VARCHAR(15),
      @Flage SMALLINT = 0,
      @MessageID SMALLINT
	
    )
AS -- ============================================
    IF ( @Flage = 1 )
-- ============================================
        BEGIN
	-- SELECTING THE MESSAGES SEND BY THE USER --
            SELECT  *
            FROM    dbo.UserMessages
            WHERE   ( UserMessages.MessageFrom = @MatrimonialID )
                    AND ( UserMessages.MessageID = @MessageID )
        END
-- ============================================
    ELSE 
-- ============================================
-- SELECTING THE MESSAGES SEND TO THE USER --
        BEGIN
            SELECT  *
            FROM    dbo.UserMessages
            WHERE   ( UserMessages.MessageTo = @MatrimonialID )
                    AND ( UserMessages.MessageID = @MessageID )
        END
-- ============================================
-- ============================================

    RETURN




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserMessages_TrashMessage]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages_TrashMessage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserMessages_TrashMessage] @MessageID INT
AS 
    BEGIN
        SET NOCOUNT ON ;

-- ======================================================
        DELETE  FROM dbo.UserMessages
        WHERE   dbo.UserMessages.MessageID = @MessageID
-- ======================================================
    END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserMessages_MaiList]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages_MaiList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- ============================================
CREATE PROCEDURE [dbo].[UserMessages_MaiList]
    (
      @MatrimonialID VARCHAR(15),
      @Flage SMALLINT = 0
	
    )
AS -- ============================================
    IF ( @Flage = 1 )
-- ============================================
        BEGIN
	-- SELECTING THE MESSAGES SEND BY THE USER --
            SELECT  UserMessages.MessageID
            FROM    dbo.UserMessages
            WHERE   UserMessages.MessageFrom = @MatrimonialID
            ORDER BY UserMessages.DateSend DESC
        END
-- ============================================
    ELSE 
-- ============================================
-- SELECTING THE MESSAGES SEND TO THE USER --
        BEGIN
            SELECT  UserMessages.MessageID
            FROM    dbo.UserMessages
            WHERE   UserMessages.MessageTo = @MatrimonialID
            ORDER BY UserMessages.DateSend DESC
        END
-- ============================================
-- ============================================

    RETURN



' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserMessages_Count]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages_Count]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- ============================================
CREATE PROCEDURE [dbo].[UserMessages_Count]
    (
      @MatrimonialID VARCHAR(15),
      @Flage SMALLINT = 0
	
    )
AS -- ============================================
    IF ( @Flage = 1 )
-- ============================================
        BEGIN
	-- SELECTING THE MESSAGES SEND BY THE USER --
            SELECT  COUNT(UserMessages.MessageFrom)
            FROM    dbo.UserMessages
            WHERE   UserMessages.MessageFrom = @MatrimonialID 
        END
-- ============================================
    ELSE 
-- ============================================
-- SELECTING THE MESSAGES SEND TO THE USER --
        BEGIN
            SELECT  COUNT(UserMessages.MessageTo)
            FROM    dbo.UserMessages
            WHERE   UserMessages.MessageTo = @MatrimonialID
        END
-- ============================================
-- ============================================

    RETURN




' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserMessages_SendMessage]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMessages_SendMessage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserMessages_SendMessage]
    (
      @MessageFrom VARCHAR(15),
      @MessageTo VARCHAR(15),
      @Message VARCHAR(200),
      @DateSend SMALLDATETIME
	
    )
AS 
    SET NOCOUNT ON
-- =========================================================================
    DECLARE @Temp SMALLINT
	-- =========================================================================
    IF EXISTS ( SELECT  UserMessages.MessageID
                FROM    dbo.UserMessages
                WHERE   UserMessages.MessageTo = @MessageTo ) 
        BEGIN
			-- =========================================================================
            SELECT  @Temp = MAX(UserMessages.MessageID)
            FROM    dbo.UserMessages
            WHERE   UserMessages.MessageTo = @MessageTo
			-- =========================================================================
            INSERT  INTO dbo.UserMessages
                    (
                      [MessageFrom],
                      [MessageTo],
                      [Message],
                      [DateSend],
                      MessageID
                    )
            VALUES  (
                      @MessageFrom,
                      @MessageTo,
                      @Message,
                      @DateSend,
                      ( @Temp + 1 )
                    )
			-- =========================================================================
        END
    ELSE 
        BEGIN
			-- =========================================================================
            INSERT  INTO dbo.UserMessages
                    (
                      [MessageFrom],
                      [MessageTo],
                      [Message],
                      [DateSend],
                      MessageID
                    )
            VALUES  (
                      @MessageFrom,
                      @MessageTo,
                      @Message,
                      @DateSend,
                      1
                    )
			-- =========================================================================
        END

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserEducationAndOccupation_GetInformation]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEducationAndOccupation_GetInformation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserEducationAndOccupation_GetInformation]
    (
      @ApplicationID VARCHAR(25)
    )
AS 
    SET NOCOUNT ON

    SELECT  *
    FROM    dbo.UserEducationAndOccupation
    WHERE   UserEducationAndOccupation.ApplicationID = @ApplicationID

    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserEducationAndOccupation_InsertInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEducationAndOccupation_InsertInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UserEducationAndOccupation_InsertInfo]
    (
      @ApplicationID VARCHAR(25) = NULL,
      @Education SMALLINT = NULL,
      @EduDetails SMALLINT = NULL,
      @AnualIncome SMALLINT = NULL,
      @IncomeIn SMALLINT = NULL,
      @Occupation SMALLINT = NULL,
      @EmployedIn SMALLINT = NULL
    )
AS 
    SET NOCOUNT ON
    INSERT  INTO dbo.UserEducationAndOccupation
            (
              ApplicationID,
              Education,
              EduDetails,
              AnualIncome,
              IncomeIn,
              Occupation,
              EmployedIn
            )
    VALUES  (
              @ApplicationID,
              @Education,
              @EduDetails,
              @AnualIncome,
              @IncomeIn,
              @Occupation,
              @EmployedIn
            )
    RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UserEducationAndOccupation_UpdateInfo]    Script Date: 06/14/2007 13:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEducationAndOccupation_UpdateInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UserEducationAndOccupation_UpdateInfo]
    (
      @ApplicationID VARCHAR(25),
      @Education SMALLINT,
      @EduDetails SMALLINT,
      @Occupation SMALLINT,
      @EmployedIn SMALLINT,
      @AnualIncome SMALLINT = NULL,
      @IncomeIn SMALLINT = NULL
	
    )
AS 
    SET NOCOUNT ON 

    UPDATE  dbo.UserEducationAndOccupation
    SET     UserEducationAndOccupation.Education = @Education,
            UserEducationAndOccupation.EduDetails = @EduDetails,
            UserEducationAndOccupation.Occupation = @Occupation,
            UserEducationAndOccupation.EmployedIn = @EmployedIn,
            UserEducationAndOccupation.AnualIncome = @AnualIncome,
            UserEducationAndOccupation.IncomeIn = @IncomeIn
    WHERE   UserEducationAndOccupation.ApplicationID = @ApplicationID
    RETURN

	
    RETURN

' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdminAuthentication_AdminAuthentication]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdminAuthentication]'))
ALTER TABLE [dbo].[AdminAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_AdminAuthentication_AdminAuthentication] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[AdminAuthentication] ([ApplicationID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserBasicInformation_UserAuthentication]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserBasicInformation]'))
ALTER TABLE [dbo].[UserBasicInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserBasicInformation_UserAuthentication] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[UserAuthentication] ([ApplicationID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAboutAndExpectation_UserAuthentication]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAboutAndExpectation]'))
ALTER TABLE [dbo].[UserAboutAndExpectation]  WITH CHECK ADD  CONSTRAINT [FK_UserAboutAndExpectation_UserAuthentication] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[UserAuthentication] ([ApplicationID])
