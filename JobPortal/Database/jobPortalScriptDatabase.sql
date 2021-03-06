USE [master]
GO
/****** Object:  Database [jobPortal]    Script Date: 11/24/2019 8:19:48 PM ******/
CREATE DATABASE [jobPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jobPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VIKRAMSQL\MSSQL\DATA\jobPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jobPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VIKRAMSQL\MSSQL\DATA\jobPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [jobPortal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jobPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jobPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jobPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jobPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jobPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jobPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [jobPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jobPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jobPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jobPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jobPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jobPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jobPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jobPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jobPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jobPortal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [jobPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jobPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jobPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jobPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jobPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jobPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jobPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jobPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [jobPortal] SET  MULTI_USER 
GO
ALTER DATABASE [jobPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jobPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jobPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jobPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jobPortal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'jobPortal', N'ON'
GO
ALTER DATABASE [jobPortal] SET QUERY_STORE = OFF
GO
USE [jobPortal]
GO
/****** Object:  Table [dbo].[ApplyedJobs]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplyedJobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[jobID] [int] NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cName] [varchar](50) NULL,
	[url] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[hrName] [varchar](50) NULL,
	[hrcontact] [bigint] NULL,
	[email] [varchar](50) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [varchar](100) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobProfile]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobProfile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jobProfileName] [varchar](100) NOT NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__jobProfi__3213E83FFE35A1EB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[jobProfileID] [int] NULL,
	[companyID] [int] NULL,
	[NoOfVacancy] [int] NULL,
	[minExp] [int] NULL,
	[maxExp] [int] NULL,
	[minOfferedSal] [bigint] NULL,
	[maxOfferedSal] [bigint] NULL,
	[comments] [varchar](1000) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualification]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Qname] [varchar](100) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationDetails]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](50) NULL,
	[lName] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[cuntryID] [int] NULL,
	[QualId] [int] NULL,
	[jobprofID] [int] NULL,
	[secQID] [int] NULL,
	[secQAns] [varchar](100) NULL,
	[gender] [int] NULL,
	[skils] [varchar](100) NULL,
	[stateID] [int] NULL,
	[photo] [varchar](100) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[securityQuestion]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[securityQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secQue] [varchar](200) NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sName] [varchar](50) NULL,
	[cid] [int] NULL,
	[dt_created] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplyedJobs] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[company] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[country] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[jobProfile] ADD  CONSTRAINT [DF__jobProfil__statu__71D1E811]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[jobs] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Qualification] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[RegistrationDetails] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[securityQuestion] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[state] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  StoredProcedure [dbo].[usp_ApplyedJobs]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_ApplyedJobs]
@userID int,
@jobID int
as
begin
insert into ApplyedJobs(userid,jobID,dt_created) values(@userID,@jobID,getdate())
end






GO
/****** Object:  StoredProcedure [dbo].[usp_Applyedjobs_get]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Applyedjobs_get]
as
begin
select AJ.id,AJ.userid,RD.fName,RD.lName,RD.email,C.countryName,Q.Qname,JF.jobProfileName,RD.gender,
RD.skils,S.sName,RD.photo,CO.cName,J.NoOfVacancy,J.JobID,J.maxExp,J.minExp,J.minOfferedSal,J.maxOfferedSal,J.comments,
CO.hrcontact,CO.email ComEmail,CO.address ComAddress,CO.url,CO.hrName
from ApplyedJobs  AJ
left join RegistrationDetails RD
on AJ.userid=RD.id 
left join jobs J
on AJ.jobID=J.JobID 
left join Qualification Q
on RD.QualId=Q.id left join jobProfile JF
on J.jobProfileID=JF.id left join state S
on RD.stateID=S.id left join country C
on RD.cuntryID=C.id  left join company CO
on J.companyID=CO.id 
where AJ.status=0
end


GO
/****** Object:  StoredProcedure [dbo].[usp_change_password]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_change_password]
@id int,
@oldpass varchar(50),
@newPass varchar(50)
as 
begin
update RegistrationDetails set password=@newPass where id=@id and password=@oldpass and status=0
end 
GO
/****** Object:  StoredProcedure [dbo].[usp_company_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_company_Delete]
@id int
as 
begin
update company set status=1 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_company_insert_update]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_company_insert_update]
@id int,
@cName varchar(50),
@url varchar(20),
@email varchar(30),
@address varchar(100),
@hrName varchar(50),
@hrcontact bigint
as 
begin
	if(@id=0)
		begin 
			insert into company([cName], [url], [address], [hrName], [hrcontact], [email],dt_created,status) 
			values(@cName,@url,@address,@hrName,@hrcontact, @email,GETDATE(),0)
		end
	else
		begin
			update company set cName=@cName,url=@url,address=@address,
			hrName=@hrName,hrcontact=@hrcontact,email=@email,dt_created=GETDATE(),status=0 
			where id=@id
		end

end
GO
/****** Object:  StoredProcedure [dbo].[usp_company_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_company_recover]  
@id int  
as  
begin   
update company set status=0 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_company_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_company_select]
@id int=0,
@command varchar(50)=null
as
begin
	if(@id=0)
		begin
			select * from company where status=0
		end
	else 
		begin
			select * from company where id=@id and status=0
		end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_company_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_company_select_deleted]  
as    
begin    
select * from company where status=1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_country_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_country_Delete]  
@id int  
as  
begin  
update country set status=1 where id=@id  
update state set status=1 where cid=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_country_insert]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_country_insert]
@countryName varchar(100)
as
begin
insert into country(countryName,dt_created,status) values(@countryName,GETDATE(),0)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_country_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_country_recover]  
@id int  
as  
begin  
update country set status=0 where id=@id  
update state set status=0 where cid=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_country_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_country_select]
as
begin
select * from country where status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_country_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_country_select_deleted]  
as  
begin  
select * from country where status=1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_jobProfile_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_jobProfile_Delete]  
@id int  
as  
begin  
update jobProfile set status=1 where id=@id  
end
GO
/****** Object:  StoredProcedure [dbo].[usp_jobProfile_insert]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_jobProfile_insert]
@JobProfile varchar(50)
as
begin
insert into jobProfile(jobProfileName,dt_created,status) 
values(@JobProfile,getdate(),0)
end

GO
/****** Object:  StoredProcedure [dbo].[usp_JobProfile_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_JobProfile_recover]  
@id int  
as  
begin   
update jobProfile set status=0 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_jobProfile_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_jobProfile_select]
as
begin
select * from jobProfile where status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_jobprofile_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_jobprofile_select_deleted]  
as    
begin    
select * from jobProfile where status=1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_jobs]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_jobs] 
@command varchar(50),
@JobID int=0,
@jobProfileID int=0,
@companyID int=0,
@NoOfVacancy int=0,
@minExp int=0,
@maxExp int=0, 
@minOfferedSal bigint=0,
@maxOfferedSal bigint=0,
@comments varchar(1000)=null
as
begin
	if(@command='insert')
	begin
		insert into jobs([jobProfileID], [companyID], [NoOfVacancy], [minExp], [maxExp], [minOfferedSal], [maxOfferedSal], [comments], [dt_created])
		values(@jobProfileID, @companyID, @NoOfVacancy, @minExp, @maxExp, @minOfferedSal, @maxOfferedSal, @comments, getdate())
	end
	else if(@command='update')
	begin
		update jobs set [jobProfileID]=@jobProfileID, [companyID]=@companyID, 
		[NoOfVacancy]=@NoOfVacancy, [minExp]=@minExp, [maxExp]=@maxExp, [minOfferedSal]=@minOfferedSal,
		[maxOfferedSal]=@maxOfferedSal, [comments]=@comments, [dt_created]=getdate()
		where JobID=@JobID and status=0
	end
	else if(@command='delete')
	begin
		update jobs set status=1 where JobID=@JobID
	end
	else if(@command='get')
	begin
		select * from jobs inner join jobProfile
		on jobs.jobProfileID=jobProfile.id inner join company
		on jobs.companyID=company.id
		where jobs.status=0
	end
	else if(@command='getbyid')
	begin
		select * from jobs where JobID=@JobID and status=0
	end
	else if(@command='getDeleted')
	begin
		select * from jobs inner join jobProfile
		on jobs.jobProfileID=jobProfile.id inner join company
		on jobs.companyID=company.id
		where jobs.status=1
	end
	else if(@command='recover')
	begin
		update jobs set status=0 where JobID=@JobID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Login]
@email varchar(50),
@pass varchar(50)
as
begin
select * from RegistrationDetails 
where email=@email and password=@pass and status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Qualification_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_Qualification_Delete]
@id int
as
begin
update Qualification set status=1 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Qualification_insert]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Qualification_insert]
@Qname varchar(50)
as
begin
insert into Qualification(Qname,dt_created,status) 
values(@Qname,GETDATE(),0)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Qualification_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_Qualification_recover]  
@id int  
as  
begin   
update Qualification set status=0 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Qualification_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Qualification_select]
as
begin
select * from Qualification where status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_qualification_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_qualification_select_deleted]  
as    
begin    
select * from Qualification where status=1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_registration_changestatus]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_registration_changestatus]
@id int
as
begin
declare @a int
select @a=status from RegistrationDetails where id=@id
if(@a=0)
	begin
	update RegistrationDetails set status=1 where id=@id
	end
else
	begin
	update RegistrationDetails set status=0 where id=@id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrationDetails_insert_update]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_RegistrationDetails_insert_update]
@id int,
@fName varchar(50),  
@lName varchar(50), 
@email varchar(50),  
@pass varchar(50),  
@cuntryID int,
@stateID int,
@QualId int,
@jobprofID int,
@secQID int,
@secQAns varchar(100),
@gender int, 
@skils varchar(100),
@photo varchar(100)=null
as   
begin
	if(@id=0)
		begin
			insert into RegistrationDetails(fName,lName,email,password,cuntryID,QualId,jobprofID,secQID,secQAns,gender,skils,stateID,photo,dt_created,status,role) 
			values(@fname,@lName,@email,@pass,@cuntryID,@QualId,@jobprofID,@secQID,@secQAns,@gender,@skils,@stateID,@photo,GETDATE(),0,0)  
		end
	else
		begin
			update RegistrationDetails set fName=@fName, lName=@lname, email=@email,cuntryID=@cuntryID,QualId=@QualId,
			jobprofID=@jobprofID,secQID=@secQID,secQAns=@secQAns,gender=@gender,skils=@skils,stateID=@stateID
			,dt_created=GETDATE(),status=0
			where id=@id
		end
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrationDetails_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_RegistrationDetails_select]
@id int
as
begin
	if(@id=0)
		begin
select * from RegistrationDetails inner join country
on RegistrationDetails.cuntryID=country.id inner join Qualification
on RegistrationDetails.QualId=Qualification.id inner join jobProfile
on RegistrationDetails.jobprofID=jobProfile.id inner join securityQuestion
on RegistrationDetails.secQID=securityQuestion.id inner join state
on RegistrationDetails.stateID=state.id
		end
	else 
		begin
			select * from RegistrationDetails inner join country
on RegistrationDetails.cuntryID=country.id inner join Qualification
on RegistrationDetails.QualId=Qualification.id inner join jobProfile
on RegistrationDetails.jobprofID=jobProfile.id inner join securityQuestion
on RegistrationDetails.secQID=securityQuestion.id inner join state
on RegistrationDetails.stateID=state.id
			where RegistrationDetails.id=@id and RegistrationDetails.status=0
		end
end

GO
/****** Object:  StoredProcedure [dbo].[usp_SecurityQuestion_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SecurityQuestion_Delete]  
@id int  
as  
begin  
update securityQuestion set status=1 where id=@id  
end
GO
/****** Object:  StoredProcedure [dbo].[usp_securityQuestion_insert]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_securityQuestion_insert]
@secQue varchar(200)
as
begin
insert into securityQuestion(secQue,dt_created,status) 
values(@secQue,getdate(),0)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_SecurityQuestion_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_SecurityQuestion_recover]  
@id int  
as  
begin   
update securityQuestion set status=0 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_securityQuestion_select]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_securityQuestion_select]
as
begin
select * from securityQuestion where status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_securityQuestion_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_securityQuestion_select_deleted]  
as    
begin    
select * from securityQuestion where status=1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_state_Delete]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_state_Delete]  
@id int  
as  
begin  
update state set status=1 where id=@id  
end
GO
/****** Object:  StoredProcedure [dbo].[usp_state_get]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_state_get]  
@cid int  
as  
begin  
select * from state where cid=@cid  and status=0
end
GO
/****** Object:  StoredProcedure [dbo].[usp_state_insert]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_state_insert]
@cid int,
@sName varchar(50)
as 
begin
insert into state(sName,cid,dt_created,status) 
values(@sName,@cid,GETDATE(),0) 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_state_recover]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_state_recover]  
@id int  
as  
begin   
update state set status=0 where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_state_select_deleted]    Script Date: 11/24/2019 8:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_state_select_deleted]  
@id int
as    
begin    
select * from state where cid=@id  and status=1
end
GO
USE [master]
GO
ALTER DATABASE [jobPortal] SET  READ_WRITE 
GO
