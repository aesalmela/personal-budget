USE [master]
GO
/****** Object:  Database [Budget]    Script Date: 11/27/2019 12:20:35 PM ******/
CREATE DATABASE [Budget]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Budget', FILENAME = N'C:\Users\aesalmela\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Budget.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Budget_log', FILENAME = N'C:\Users\aesalmela\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Budget_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Budget] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Budget].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Budget] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Budget] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Budget] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Budget] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Budget] SET ARITHABORT OFF 
GO
ALTER DATABASE [Budget] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Budget] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Budget] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Budget] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Budget] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Budget] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Budget] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Budget] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Budget] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Budget] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Budget] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Budget] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Budget] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Budget] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Budget] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Budget] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Budget] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Budget] SET RECOVERY FULL 
GO
ALTER DATABASE [Budget] SET  MULTI_USER 
GO
ALTER DATABASE [Budget] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Budget] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Budget] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Budget] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Budget]
GO
/****** Object:  User [aesalmela]    Script Date: 11/27/2019 12:20:35 PM ******/
CREATE USER [aesalmela] FOR LOGIN [aesalmela] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aesalmela]
GO
/****** Object:  Table [dbo].[expenses]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expenses](
	[expense_pk] [int] IDENTITY(1,1) NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[gas_amount] [decimal](10, 2) NULL,
	[gas_dueDate] [date] NULL,
	[electric_amount] [decimal](10, 2) NULL,
	[electric_dueDate] [date] NULL,
	[water_amount] [decimal](10, 2) NULL,
	[water_dueDate] [date] NULL,
	[garbage_amount] [decimal](10, 2) NULL,
	[garbage_dueDate] [date] NULL,
	[gym_amount] [decimal](10, 2) NULL,
	[gym_dueDate] [date] NULL,
	[healthcare_amount] [decimal](10, 2) NULL,
	[healthcare_dueDate] [date] NULL,
	[household_goods_amount] [decimal](10, 2) NULL,
	[groceries_amount] [decimal](10, 2) NULL,
	[target_amount] [decimal](10, 2) NULL,
	[walmart_amount] [decimal](10, 2) NULL,
	[sams_club_amount] [decimal](10, 2) NULL,
	[costco_amount] [decimal](10, 2) NULL,
	[home_improvements_amount] [decimal](10, 2) NULL,
	[menards_amount] [decimal](10, 2) NULL,
	[home_depot_amount] [decimal](10, 2) NULL,
	[ace_hardware_amount] [decimal](10, 2) NULL,
	[fleet_farm_amount] [decimal](10, 2) NULL,
	[daycare_amount] [decimal](10, 2) NULL,
	[gasoline_amount] [decimal](10, 2) NULL,
	[cell_phone_amount] [decimal](10, 2) NULL,
	[cell_phone_dueDate] [date] NULL,
	[phone_amount] [decimal](10, 2) NULL,
	[phone_dueDate] [date] NULL,
	[cable_amount] [decimal](10, 2) NULL,
	[cable_dueDate] [date] NULL,
	[internet_amount] [decimal](10, 2) NULL,
	[internet_dueDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[expense_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[family_members]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[family_members](
	[family_member_pk] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NULL,
	[middle_name] [varchar](20) NULL,
	[last_name] [varchar](20) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[family_member_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income](
	[income_pk] [int] IDENTITY(1,1) NOT NULL,
	[income_source_id] [int] NOT NULL,
	[family_member_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[income_amount] [decimal](10, 2) NOT NULL,
	[income_recdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[income_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income_sources]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income_sources](
	[income_source_pk] [int] IDENTITY(1,1) NOT NULL,
	[income_source_acro] [varchar](5) NULL,
	[income_source_name] [varchar](100) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[income_source_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[institutions]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institutions](
	[institution_pk] [int] IDENTITY(1,1) NOT NULL,
	[institution_name] [varchar](20) NULL,
	[institution_address1] [varchar](100) NULL,
	[institution_address2] [varchar](100) NULL,
	[institution_city] [varchar](100) NULL,
	[institution_state] [varchar](2) NULL,
	[institution_zip] [varchar](10) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[institution_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insur_payments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insur_payments](
	[insur_payment_pk] [int] IDENTITY(1,1) NOT NULL,
	[insur_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[duedate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[insur_payment_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance](
	[insur_pk] [int] IDENTITY(1,1) NOT NULL,
	[insur_type_id] [int] NOT NULL,
	[insur_alias] [varchar](50) NOT NULL,
	[property_id] [int] NULL,
	[vehicle_id] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[insur_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_types]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_types](
	[insur_type_pk] [int] IDENTITY(1,1) NOT NULL,
	[insur_type_name] [varchar](20) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[insur_type_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[join_insur_family_member]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_insur_family_member](
	[join_pk] [int] IDENTITY(1,1) NOT NULL,
	[insur_id] [int] NOT NULL,
	[family_member_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[join_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[join_loan_family_member]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_loan_family_member](
	[join_pk] [int] IDENTITY(1,1) NOT NULL,
	[loan_id] [int] NOT NULL,
	[family_member_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[join_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[join_tag_tag_types]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_tag_tag_types](
	[join_pk] [int] IDENTITY(1,1) NOT NULL,
	[tag_id] [int] NOT NULL,
	[tag_type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[join_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[join_vehicle_expense_tag]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_vehicle_expense_tag](
	[join_pk] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_expense_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[join_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loan]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan](
	[loan_pk] [int] IDENTITY(1,1) NOT NULL,
	[loan_type_id] [int] NOT NULL,
	[loan_alias] [varchar](50) NOT NULL,
	[property_id] [int] NULL,
	[vehicle_id] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[loan_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loan_payments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan_payments](
	[loan_payment_pk] [int] IDENTITY(1,1) NOT NULL,
	[loan_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[duedate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[loan_payment_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loan_types]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan_types](
	[loan_type_pk] [int] IDENTITY(1,1) NOT NULL,
	[loan_type_name] [varchar](20) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[loan_type_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[months]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[months](
	[month_pk] [int] NOT NULL,
	[month_abbr] [varchar](3) NULL,
	[month_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[month_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[properties]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[properties](
	[property_pk] [int] IDENTITY(1,1) NOT NULL,
	[property_name] [varchar](20) NULL,
	[property_address1] [varchar](100) NULL,
	[property_address2] [varchar](100) NULL,
	[property_city] [varchar](100) NULL,
	[property_state] [varchar](2) NULL,
	[property_zip] [varchar](10) NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[property_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag_types]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag_types](
	[tag_type_pk] [int] IDENTITY(1,1) NOT NULL,
	[tag_type_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_type_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[tag_pk] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tuition]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tuition](
	[tuition_pk] [int] IDENTITY(1,1) NOT NULL,
	[tuition_alias] [varchar](50) NULL,
	[institution_id] [int] NOT NULL,
	[family_member_id] [int] NOT NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[tuition_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tuition_payments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tuition_payments](
	[tuition_payment_pk] [int] IDENTITY(1,1) NOT NULL,
	[tuition_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[duedate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[tuition_payment_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_expenses]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_expenses](
	[vehicle_expense_pk] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_id] [int] NOT NULL,
	[month_id] [int] NOT NULL,
	[year_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[duedate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_expense_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicles]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicles](
	[vehicle_pk] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_name] [varchar](20) NULL,
	[vehicle_model] [varchar](20) NULL,
	[vehicle_make] [varchar](20) NULL,
	[vehicle_year_id] [int] NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[years]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[years](
	[year_pk] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[year_pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_ExpenseTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExpenseTotals]
AS
SELECT        year_id, SUM(ISNULL(gas_amount, 0)) AS gas_total, SUM(ISNULL(electric_amount, 0)) AS electric_total, SUM(ISNULL(water_amount, 0)) AS water_total, 
                         SUM(ISNULL(garbage_amount, 0)) AS garbage_total, SUM(ISNULL(gym_amount, 0)) AS gym_total, SUM(ISNULL(healthcare_amount, 0)) AS healthcare_total, 
                         SUM(ISNULL(household_goods_amount, 0)) AS household_goods_total, SUM(ISNULL(groceries_amount, 0)) AS groceries_total, SUM(ISNULL(target_amount, 0)) 
                         AS target_total, SUM(ISNULL(walmart_amount, 0)) AS walmart_total, SUM(ISNULL(sams_club_amount, 0)) AS sams_club_total, SUM(ISNULL(costco_amount, 0)) 
                         AS costco_total, SUM(ISNULL(home_improvements_amount, 0)) AS home_improvements_total, SUM(ISNULL(menards_amount, 0)) AS menards_total, 
                         SUM(ISNULL(home_depot_amount, 0)) AS home_depot_total, SUM(ISNULL(ace_hardware_amount, 0)) AS ace_hardware_total, SUM(ISNULL(fleet_farm_amount, 0)) 
                         AS fleet_farm_total, SUM(ISNULL(daycare_amount, 0)) AS daycare_total, SUM(ISNULL(gasoline_amount, 0)) AS gasoline_total, SUM(ISNULL(cell_phone_amount, 0)) 
                         AS cell_phone_total, SUM(ISNULL(phone_amount, 0)) AS phone_total, SUM(ISNULL(internet_amount, 0)) AS internet_total, SUM(ISNULL(cable_amount, 0)) 
                         AS cable_total
FROM            dbo.expenses
GROUP BY year_id
GO
/****** Object:  View [dbo].[View_IncomeTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_IncomeTotals]
AS
SELECT        dbo.income.year_id, SUM(ISNULL(dbo.income.income_amount, 0)) AS income_total, dbo.family_members.first_name, 
                         dbo.income_sources.income_source_acro
FROM            dbo.income LEFT OUTER JOIN
                         dbo.income_sources ON dbo.income.income_source_id = dbo.income_sources.income_source_pk LEFT OUTER JOIN
                         dbo.family_members ON dbo.income.family_member_id = dbo.family_members.family_member_pk
GROUP BY dbo.income.year_id, dbo.family_members.first_name, dbo.income_sources.income_source_acro
GO
/****** Object:  View [dbo].[View_InsuranceTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_InsuranceTotals]
AS
SELECT        dbo.insur_payments.year_id, SUM(ISNULL(dbo.insur_payments.amount, 0)) AS insur_total, dbo.insurance.insur_alias, dbo.insurance.insur_pk
FROM            dbo.insur_payments LEFT OUTER JOIN
                         dbo.insurance ON dbo.insur_payments.insur_id = dbo.insurance.insur_pk
GROUP BY dbo.insur_payments.year_id, dbo.insurance.insur_alias, dbo.insurance.insur_pk
GO
/****** Object:  View [dbo].[View_LoanTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LoanTotals]
AS
SELECT        dbo.loan_payments.year_id, SUM(ISNULL(dbo.loan_payments.amount, 0)) AS loan_total, dbo.loan.loan_alias
FROM            dbo.loan_payments LEFT OUTER JOIN
                         dbo.loan ON dbo.loan_payments.loan_id = dbo.loan.loan_pk
GROUP BY dbo.loan_payments.year_id, dbo.loan.loan_alias
GO
/****** Object:  View [dbo].[View_TuitionTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_TuitionTotals]
AS
SELECT        dbo.tuition_payments.year_id, SUM(ISNULL(dbo.tuition_payments.amount,0)) AS tuition_total, dbo.tuition.tuition_alias
FROM            dbo.tuition_payments LEFT OUTER JOIN
                         dbo.tuition ON dbo.tuition_payments.tuition_id = dbo.tuition.tuition_pk
GROUP BY dbo.tuition_payments.year_id, dbo.tuition.tuition_alias

GO
/****** Object:  View [dbo].[View_VehicleExpenseTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_VehicleExpenseTotals]
AS
SELECT        dbo.vehicle_expenses.year_id, SUM(ISNULL(dbo.vehicle_expenses.amount, 0)) AS vehicle_expense_total, dbo.vehicles.vehicle_name
FROM            dbo.vehicle_expenses LEFT OUTER JOIN
                         dbo.vehicles ON dbo.vehicle_expenses.vehicle_id = dbo.vehicles.vehicle_pk
GROUP BY dbo.vehicle_expenses.year_id, dbo.vehicles.vehicle_name
GO
/****** Object:  View [dbo].[View_AnnualTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AnnualTotals]
AS
SELECT        dbo.years.year_pk,
                             (SELECT        SUM(ISNULL(insur_total, 0)) AS Expr1
                               FROM            dbo.View_InsuranceTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS insur_year_total,
                             (SELECT        SUM(ISNULL(loan_total, 0)) AS Expr1
                               FROM            dbo.View_LoanTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS loan_year_total,
                             (SELECT        SUM(ISNULL(tuition_total, 0)) AS Expr1
                               FROM            dbo.View_TuitionTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS tuition_year_total,
                             (SELECT        SUM(ISNULL(vehicle_expense_total, 0)) AS Expr1
                               FROM            dbo.View_VehicleExpenseTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS vehicle_expense_year_total,
                             (SELECT        SUM(ISNULL(gas_total, 0)) + SUM(ISNULL(electric_total, 0)) + SUM(ISNULL(water_total, 0)) + SUM(ISNULL(garbage_total, 0)) + SUM(ISNULL(gym_total, 
                                                         0)) + SUM(ISNULL(healthcare_total, 0)) + SUM(ISNULL(household_goods_total, 0)) + SUM(ISNULL(groceries_total, 0)) + SUM(ISNULL(target_total, 0)) 
                                                         + SUM(ISNULL(walmart_total, 0)) + SUM(ISNULL(sams_club_total, 0)) + SUM(ISNULL(costco_total, 0)) + SUM(ISNULL(home_improvements_total, 0)) 
                                                         + SUM(ISNULL(menards_total, 0)) + SUM(ISNULL(home_depot_total, 0)) + SUM(ISNULL(ace_hardware_total, 0)) + SUM(ISNULL(fleet_farm_total, 0)) 
                                                         + SUM(ISNULL(daycare_total, 0)) + SUM(ISNULL(gasoline_total, 0)) + SUM(ISNULL(cell_phone_total, 0)) + SUM(ISNULL(phone_total, 0)) 
                                                         + SUM(ISNULL(internet_total, 0)) + SUM(ISNULL(cable_total, 0)) AS Expr1
                               FROM            dbo.View_ExpenseTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS expense_year_total,
                             (SELECT        SUM(ISNULL(income_total, 0)) AS Expr1
                               FROM            dbo.View_IncomeTotals
                               WHERE        (year_id = dbo.years.year_pk)) AS income_year_total
FROM            dbo.View_IncomeTotals AS View_IncomeTotals_1 RIGHT OUTER JOIN
                         dbo.years ON View_IncomeTotals_1.year_id = dbo.years.year_pk LEFT OUTER JOIN
                         dbo.View_ExpenseTotals AS View_ExpenseTotals_1 ON dbo.years.year_pk = View_ExpenseTotals_1.year_id LEFT OUTER JOIN
                         dbo.View_LoanTotals AS View_LoanTotals_1 ON dbo.years.year_pk = View_LoanTotals_1.year_id LEFT OUTER JOIN
                         dbo.View_VehicleExpenseTotals AS View_VehicleExpenseTotals_1 ON dbo.years.year_pk = View_VehicleExpenseTotals_1.year_id LEFT OUTER JOIN
                         dbo.View_TuitionTotals AS View_TuitionTotals_1 ON dbo.years.year_pk = View_TuitionTotals_1.year_id LEFT OUTER JOIN
                         dbo.View_InsuranceTotals AS View_InsuranceTotals_1 ON dbo.years.year_pk = View_InsuranceTotals_1.year_id
WHERE        (dbo.years.year_pk >= 2005)
GROUP BY dbo.years.year_pk
GO
/****** Object:  View [dbo].[View_AnnualSummary]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_AnnualSummary]
AS
SELECT        income_year_total,
                             (SELECT        SUM(ISNULL(dbo.View_AnnualTotals.insur_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.loan_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.tuition_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.vehicle_expense_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.expense_year_total, 0)) AS Expr1) AS all_expense_year_total, income_year_total -
                             (SELECT        SUM(ISNULL(dbo.View_AnnualTotals.insur_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.loan_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.tuition_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.vehicle_expense_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.expense_year_total, 0)) AS Expr1) AS savings, FORMAT(ROUND((income_year_total -
                             (SELECT        SUM(ISNULL(dbo.View_AnnualTotals.insur_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.loan_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.tuition_year_total, 0)) + SUM(ISNULL(dbo.View_AnnualTotals.vehicle_expense_year_total, 0)) 
                                                         + SUM(ISNULL(dbo.View_AnnualTotals.expense_year_total, 0)) AS Expr1)) / income_year_total * 100, 2), 'N2') AS percent_saved, year_pk
FROM            dbo.View_AnnualTotals
GROUP BY year_pk, income_year_total

GO
/****** Object:  View [dbo].[View_InsurPayments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_InsurPayments]
AS
SELECT        dbo.insur_payments.insur_payment_pk, dbo.insur_payments.insur_id, dbo.insur_payments.month_id, dbo.insur_payments.year_id, dbo.insur_payments.amount, 
                         dbo.insur_payments.duedate, dbo.insurance.insur_alias
FROM            dbo.insurance INNER JOIN
                         dbo.insur_payments ON dbo.insurance.insur_pk = dbo.insur_payments.insur_id

GO
/****** Object:  View [dbo].[View_InsuranceMonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_InsuranceMonthlyTotals]
AS
SELECT        dbo.years.year_pk, dbo.months.month_pk,
                             (SELECT        SUM(ISNULL(amount, 0)) AS Expr1
                               FROM            dbo.View_InsurPayments
                               WHERE        (year_id = dbo.years.year_pk) AND (month_id = dbo.months.month_pk)) AS insur_month_total
FROM            dbo.insur_payments INNER JOIN
                         dbo.years ON dbo.insur_payments.year_id = dbo.years.year_pk INNER JOIN
                         dbo.months ON dbo.insur_payments.month_id = dbo.months.month_pk
GROUP BY dbo.years.year_pk, dbo.months.month_pk
GO
/****** Object:  View [dbo].[View_LoanPayments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LoanPayments]
AS
SELECT        dbo.loan_payments.loan_payment_pk, dbo.loan_payments.loan_id, dbo.loan_payments.month_id, dbo.loan_payments.year_id, dbo.loan_payments.amount, 
                         dbo.loan_payments.duedate, dbo.loan.loan_alias
FROM            dbo.loan INNER JOIN
                         dbo.loan_payments ON dbo.loan.loan_pk = dbo.loan_payments.loan_id

GO
/****** Object:  View [dbo].[View_LoanMonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LoanMonthlyTotals]
AS
SELECT        dbo.years.year_pk, dbo.months.month_pk,
                             (SELECT        SUM(ISNULL(amount, 0)) AS Expr1
                               FROM            dbo.View_LoanPayments
                               WHERE        (year_id = dbo.years.year_pk) AND (month_id = dbo.months.month_pk)) AS loan_month_total
FROM            dbo.loan_payments INNER JOIN
                         dbo.years ON dbo.loan_payments.year_id = dbo.years.year_pk INNER JOIN
                         dbo.months ON dbo.loan_payments.month_id = dbo.months.month_pk
GROUP BY dbo.years.year_pk, dbo.months.month_pk
GO
/****** Object:  View [dbo].[View_TuitionPayments]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_TuitionPayments]
AS
SELECT        dbo.tuition_payments.tuition_payment_pk, dbo.tuition_payments.tuition_id, dbo.tuition_payments.month_id, dbo.tuition_payments.year_id, 
                         dbo.tuition_payments.amount, dbo.tuition_payments.duedate, dbo.tuition.tuition_alias
FROM            dbo.tuition INNER JOIN
                         dbo.tuition_payments ON dbo.tuition.tuition_pk = dbo.tuition_payments.tuition_id

GO
/****** Object:  View [dbo].[View_TuitionMonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_TuitionMonthlyTotals]
AS
SELECT        dbo.years.year_pk, dbo.months.month_pk,
                             (SELECT        SUM(ISNULL(amount, 0)) AS Expr1
                               FROM            dbo.View_TuitionPayments
                               WHERE        (year_id = dbo.years.year_pk) AND (month_id = dbo.months.month_pk)) AS tuition_month_total
FROM            dbo.tuition_payments INNER JOIN
                         dbo.years ON dbo.tuition_payments.year_id = dbo.years.year_pk INNER JOIN
                         dbo.months ON dbo.tuition_payments.month_id = dbo.months.month_pk
GROUP BY dbo.years.year_pk, dbo.months.month_pk
GO
/****** Object:  View [dbo].[View_VehicleExpenses]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_VehicleExpenses]
AS
SELECT        TOP (100) PERCENT join_vehicle_expense_tag_1.join_pk, dbo.vehicle_expenses.vehicle_expense_pk, dbo.vehicle_expenses.vehicle_id, 
                         dbo.vehicles.vehicle_name, dbo.vehicle_expenses.month_id, dbo.vehicle_expenses.year_id, dbo.vehicle_expenses.amount, dbo.vehicle_expenses.duedate, 
                         join_vehicle_expense_tag_1.tag_id, dbo.tags.tag_name
FROM            dbo.join_vehicle_expense_tag AS join_vehicle_expense_tag_1 INNER JOIN
                         dbo.tags ON join_vehicle_expense_tag_1.tag_id = dbo.tags.tag_pk RIGHT OUTER JOIN
                         dbo.vehicles INNER JOIN
                         dbo.vehicle_expenses ON dbo.vehicles.vehicle_pk = dbo.vehicle_expenses.vehicle_id ON 
                         join_vehicle_expense_tag_1.vehicle_expense_id = dbo.vehicle_expenses.vehicle_expense_pk

GO
/****** Object:  View [dbo].[View_VehicleExpenseMonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_VehicleExpenseMonthlyTotals]
AS
SELECT        dbo.years.year_pk, dbo.months.month_pk,
                             (SELECT        SUM(ISNULL(amount, 0)) AS Expr1
                               FROM            dbo.View_VehicleExpenses
                               WHERE        (year_id = dbo.years.year_pk) AND (month_id = dbo.months.month_pk)) AS vehicle_expense_month_total
FROM            dbo.vehicle_expenses INNER JOIN
                         dbo.years ON dbo.vehicle_expenses.year_id = dbo.years.year_pk INNER JOIN
                         dbo.months ON dbo.vehicle_expenses.month_id = dbo.months.month_pk
GROUP BY dbo.years.year_pk, dbo.months.month_pk

GO
/****** Object:  View [dbo].[View_IncomeMonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_IncomeMonthlyTotals]
AS
SELECT        dbo.income.year_id, dbo.income.month_id, SUM(ISNULL(dbo.income.income_amount, 0)) AS income_total, dbo.family_members.first_name, 
                         dbo.income_sources.income_source_acro
FROM            dbo.income LEFT OUTER JOIN
                         dbo.income_sources ON dbo.income.income_source_id = dbo.income_sources.income_source_pk LEFT OUTER JOIN
                         dbo.family_members ON dbo.income.family_member_id = dbo.family_members.family_member_pk
GROUP BY dbo.income.year_id, dbo.income.month_id, dbo.family_members.first_name, dbo.income_sources.income_source_acro

GO
/****** Object:  View [dbo].[View_Months]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Months]
AS
SELECT        dbo.years.year_pk, dbo.months.month_pk, CONVERT(date, CONVERT(varchar(4), dbo.years.year_pk) + RIGHT('0' + CONVERT(varchar(2), dbo.months.month_pk), 2) 
                         + '01', 112) AS DerivedDate
FROM            dbo.years CROSS JOIN
                         dbo.months
WHERE        (dbo.years.year_pk <= YEAR(GETDATE()))
GO
/****** Object:  View [dbo].[View_MonthlyTotals]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MonthlyTotals]
AS
SELECT DISTINCT 
                         dbo.View_Months.DerivedDate, dbo.View_InsuranceMonthlyTotals.insur_month_total, dbo.View_TuitionMonthlyTotals.tuition_month_total, 
                         dbo.View_LoanMonthlyTotals.loan_month_total,
                             (SELECT        SUM(ISNULL(income_total, 0)) AS Expr1
                               FROM            dbo.View_IncomeMonthlyTotals
                               WHERE        (year_id = dbo.View_Months.year_pk) AND (month_id = dbo.View_Months.month_pk)) AS income_month_total, 
                         dbo.View_VehicleExpenseMonthlyTotals.vehicle_expense_month_total,
                             (SELECT        SUM(ISNULL(gas_amount, 0)) + SUM(ISNULL(electric_amount, 0)) + SUM(ISNULL(water_amount, 0)) + SUM(ISNULL(garbage_amount, 0)) 
                                                         + SUM(ISNULL(gym_amount, 0)) + SUM(ISNULL(healthcare_amount, 0)) + SUM(ISNULL(household_goods_amount, 0)) 
                                                         + SUM(ISNULL(groceries_amount, 0)) + SUM(ISNULL(target_amount, 0)) + SUM(ISNULL(walmart_amount, 0)) + SUM(ISNULL(sams_club_amount, 0)) 
                                                         + SUM(ISNULL(costco_amount, 0)) + SUM(ISNULL(home_improvements_amount, 0)) + SUM(ISNULL(menards_amount, 0)) 
                                                         + SUM(ISNULL(home_depot_amount, 0)) + SUM(ISNULL(ace_hardware_amount, 0)) + SUM(ISNULL(fleet_farm_amount, 0)) 
                                                         + SUM(ISNULL(daycare_amount, 0)) + SUM(ISNULL(gasoline_amount, 0)) + SUM(ISNULL(cell_phone_amount, 0)) + SUM(ISNULL(phone_amount, 0)) 
                                                         + SUM(ISNULL(internet_amount, 0)) + SUM(ISNULL(cable_amount, 0)) AS Expr1
                               FROM            dbo.expenses
                               WHERE        (year_id = dbo.View_Months.year_pk) AND (month_id = dbo.View_Months.month_pk)) AS expense_month_total
FROM            dbo.expenses AS expenses_1 RIGHT OUTER JOIN
                         dbo.View_Months ON expenses_1.month_id = dbo.View_Months.month_pk AND expenses_1.year_id = dbo.View_Months.year_pk LEFT OUTER JOIN
                         dbo.View_VehicleExpenseMonthlyTotals ON dbo.View_Months.year_pk = dbo.View_VehicleExpenseMonthlyTotals.year_pk AND 
                         dbo.View_Months.month_pk = dbo.View_VehicleExpenseMonthlyTotals.month_pk LEFT OUTER JOIN
                         dbo.View_IncomeMonthlyTotals AS View_IncomeMonthlyTotals_1 ON dbo.View_Months.year_pk = View_IncomeMonthlyTotals_1.year_id AND 
                         dbo.View_Months.month_pk = View_IncomeMonthlyTotals_1.month_id LEFT OUTER JOIN
                         dbo.View_LoanMonthlyTotals ON dbo.View_Months.year_pk = dbo.View_LoanMonthlyTotals.year_pk AND 
                         dbo.View_Months.month_pk = dbo.View_LoanMonthlyTotals.month_pk LEFT OUTER JOIN
                         dbo.View_TuitionMonthlyTotals ON dbo.View_Months.year_pk = dbo.View_TuitionMonthlyTotals.year_pk AND 
                         dbo.View_Months.month_pk = dbo.View_TuitionMonthlyTotals.month_pk LEFT OUTER JOIN
                         dbo.View_InsuranceMonthlyTotals ON dbo.View_Months.year_pk = dbo.View_InsuranceMonthlyTotals.year_pk AND 
                         dbo.View_Months.month_pk = dbo.View_InsuranceMonthlyTotals.month_pk
WHERE        (dbo.View_Months.year_pk >= 2005)
GO
/****** Object:  View [dbo].[View_MonthlySummary]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_MonthlySummary]
AS
SELECT      DerivedDate,income_month_total,
            (SELECT        SUM(ISNULL(dbo.View_MonthlyTotals.insur_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.loan_month_total, 0)) 
                                        + SUM(ISNULL(dbo.View_MonthlyTotals.tuition_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.vehicle_expense_month_total, 0)) 
											+ SUM(ISNULL(dbo.View_MonthlyTotals.expense_month_total, 0)) AS Expr1) AS all_expense_month_total,
			dbo.View_MonthlyTotals.income_month_total - (SELECT        SUM(ISNULL(dbo.View_MonthlyTotals.insur_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.loan_month_total, 0)) 
											+ SUM(ISNULL(dbo.View_MonthlyTotals.tuition_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.vehicle_expense_month_total, 0)) 
											+ SUM(ISNULL(dbo.View_MonthlyTotals.expense_month_total, 0)) AS Expr1) AS savings,
														 
			FORMAT(ROUND((dbo.View_MonthlyTotals.income_month_total - (SELECT        SUM(ISNULL(dbo.View_MonthlyTotals.insur_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.loan_month_total, 0)) 
											+ SUM(ISNULL(dbo.View_MonthlyTotals.tuition_month_total, 0)) + SUM(ISNULL(dbo.View_MonthlyTotals.vehicle_expense_month_total, 0)) 
											+ SUM(ISNULL(dbo.View_MonthlyTotals.expense_month_total, 0)) AS Expr1)) / dbo.View_MonthlyTotals.income_month_total * 100, 2), 'N2') AS percent_saved
FROM            dbo.View_MonthlyTotals
GROUP BY DerivedDate,income_month_total

GO
/****** Object:  View [dbo].[View_Income]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Income]
AS
SELECT        dbo.income.income_pk, dbo.income.income_source_id, dbo.income.family_member_id, dbo.income.month_id, dbo.income.year_id, dbo.income.income_amount, 
                         dbo.income.income_recdate, dbo.income_sources.income_source_acro, dbo.family_members.first_name
FROM            dbo.income INNER JOIN
                         dbo.family_members ON dbo.income.family_member_id = dbo.family_members.family_member_pk INNER JOIN
                         dbo.income_sources ON dbo.income.income_source_id = dbo.income_sources.income_source_pk

GO
/****** Object:  View [dbo].[View_Tags]    Script Date: 11/27/2019 12:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Tags]
AS
SELECT        dbo.join_tag_tag_types.join_pk, dbo.tag_types.tag_type_name, dbo.tags.tag_name, dbo.tag_types.tag_type_pk, dbo.tags.tag_pk
FROM            dbo.tag_types INNER JOIN
                         dbo.join_tag_tag_types ON dbo.tag_types.tag_type_pk = dbo.join_tag_tag_types.tag_type_id INNER JOIN
                         dbo.tags ON dbo.join_tag_tag_types.tag_id = dbo.tags.tag_pk

GO
SET IDENTITY_INSERT [dbo].[expenses] ON 

INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (1, 1, 2005, CAST(118.72 AS Decimal(10, 2)), CAST(N'2005-01-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(23.40 AS Decimal(10, 2)), CAST(N'2005-01-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-01-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(321.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(158.40 AS Decimal(10, 2)), CAST(71.08 AS Decimal(10, 2)), CAST(N'2005-01-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(36.95 AS Decimal(10, 2)), CAST(N'2005-02-01' AS Date), CAST(89.90 AS Decimal(10, 2)), CAST(N'2005-02-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (2, 2, 2005, CAST(121.20 AS Decimal(10, 2)), CAST(N'2005-02-28' AS Date), CAST(6.65 AS Decimal(10, 2)), CAST(N'2005-02-10' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2005-02-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-02-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(239.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(137.29 AS Decimal(10, 2)), CAST(71.27 AS Decimal(10, 2)), CAST(N'2005-02-16' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(36.95 AS Decimal(10, 2)), CAST(N'2005-03-01' AS Date), CAST(16.38 AS Decimal(10, 2)), CAST(N'2005-03-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (3, 3, 2005, CAST(88.65 AS Decimal(10, 2)), CAST(N'2005-03-20' AS Date), CAST(48.53 AS Decimal(10, 2)), CAST(N'2005-03-20' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2005-03-20' AS Date), CAST(62.18 AS Decimal(10, 2)), CAST(N'2005-03-30' AS Date), CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-03-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(254.35 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(149.10 AS Decimal(10, 2)), CAST(71.71 AS Decimal(10, 2)), CAST(N'2005-03-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-04-01' AS Date), CAST(32.61 AS Decimal(10, 2)), CAST(N'2005-04-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (4, 4, 2005, CAST(71.38 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date), CAST(39.72 AS Decimal(10, 2)), CAST(N'2005-04-18' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-04-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(199.87 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(277.09 AS Decimal(10, 2)), CAST(79.62 AS Decimal(10, 2)), CAST(N'2005-04-17' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-05-01' AS Date), CAST(32.61 AS Decimal(10, 2)), CAST(N'2005-05-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (5, 5, 2005, CAST(42.06 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date), CAST(31.07 AS Decimal(10, 2)), CAST(N'2005-05-14' AS Date), CAST(26.80 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-05-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(136.08 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(144.43 AS Decimal(10, 2)), CAST(71.30 AS Decimal(10, 2)), CAST(N'2005-05-22' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-06-01' AS Date), CAST(32.61 AS Decimal(10, 2)), CAST(N'2005-06-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (6, 6, 2005, CAST(28.15 AS Decimal(10, 2)), CAST(N'2005-06-16' AS Date), CAST(30.82 AS Decimal(10, 2)), CAST(N'2005-06-08' AS Date), CAST(16.30 AS Decimal(10, 2)), CAST(N'2005-06-16' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-06-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(271.99 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(279.10 AS Decimal(10, 2)), CAST(71.57 AS Decimal(10, 2)), CAST(N'2005-06-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-06-22' AS Date), CAST(32.61 AS Decimal(10, 2)), CAST(N'2005-06-22' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (7, 7, 2005, CAST(17.32 AS Decimal(10, 2)), CAST(N'2005-07-28' AS Date), CAST(46.50 AS Decimal(10, 2)), CAST(N'2005-07-18' AS Date), CAST(17.80 AS Decimal(10, 2)), CAST(N'2005-07-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-07-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(149.94 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(171.85 AS Decimal(10, 2)), CAST(75.52 AS Decimal(10, 2)), CAST(N'2005-07-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-08-01' AS Date), CAST(32.61 AS Decimal(10, 2)), CAST(N'2005-08-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (8, 8, 2005, CAST(16.39 AS Decimal(10, 2)), CAST(N'2005-08-26' AS Date), CAST(65.60 AS Decimal(10, 2)), CAST(N'2005-08-17' AS Date), CAST(31.30 AS Decimal(10, 2)), CAST(N'2005-08-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-08-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(311.16 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(154.75 AS Decimal(10, 2)), CAST(71.20 AS Decimal(10, 2)), CAST(N'2005-08-17' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-09-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2005-09-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (9, 9, 2005, CAST(17.24 AS Decimal(10, 2)), CAST(N'2005-09-27' AS Date), CAST(50.57 AS Decimal(10, 2)), CAST(N'2005-09-19' AS Date), CAST(20.80 AS Decimal(10, 2)), CAST(N'2005-09-28' AS Date), CAST(64.56 AS Decimal(10, 2)), CAST(N'2005-09-30' AS Date), CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-09-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(172.88 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(189.90 AS Decimal(10, 2)), CAST(90.08 AS Decimal(10, 2)), CAST(N'2005-09-16' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-10-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2005-10-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (10, 10, 2005, CAST(21.92 AS Decimal(10, 2)), CAST(N'2005-10-26' AS Date), CAST(52.18 AS Decimal(10, 2)), CAST(N'2005-10-17' AS Date), CAST(17.80 AS Decimal(10, 2)), CAST(N'2005-10-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-10-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(233.03 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(195.36 AS Decimal(10, 2)), CAST(71.20 AS Decimal(10, 2)), CAST(N'2005-10-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.56 AS Decimal(10, 2)), CAST(N'2005-11-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2005-11-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (11, 11, 2005, CAST(30.51 AS Decimal(10, 2)), CAST(N'2005-11-28' AS Date), CAST(31.33 AS Decimal(10, 2)), CAST(N'2005-11-17' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2005-11-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-11-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(268.24 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(209.96 AS Decimal(10, 2)), CAST(72.11 AS Decimal(10, 2)), CAST(N'2005-11-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2005-12-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2005-12-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (12, 12, 2005, CAST(95.02 AS Decimal(10, 2)), CAST(N'2005-12-28' AS Date), CAST(33.79 AS Decimal(10, 2)), CAST(N'2005-12-19' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2005-12-27' AS Date), CAST(65.90 AS Decimal(10, 2)), CAST(N'2005-12-30' AS Date), CAST(41.70 AS Decimal(10, 2)), CAST(N'2005-12-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(310.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(205.37 AS Decimal(10, 2)), CAST(72.11 AS Decimal(10, 2)), CAST(N'2005-12-19' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2006-01-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-01-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (13, 1, 2006, CAST(108.48 AS Decimal(10, 2)), CAST(N'2006-01-31' AS Date), CAST(42.09 AS Decimal(10, 2)), CAST(N'2006-01-22' AS Date), CAST(13.40 AS Decimal(10, 2)), CAST(N'2006-01-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2006-01-04' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(311.60 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(226.45 AS Decimal(10, 2)), CAST(70.76 AS Decimal(10, 2)), CAST(N'2006-01-23' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2006-02-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-02-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14, 2, 2006, CAST(101.26 AS Decimal(10, 2)), CAST(N'2006-03-02' AS Date), CAST(37.17 AS Decimal(10, 2)), CAST(N'2006-02-17' AS Date), CAST(10.70 AS Decimal(10, 2)), CAST(N'2006-02-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2006-02-04' AS Date), CAST(53.68 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(256.69 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(167.00 AS Decimal(10, 2)), CAST(61.09 AS Decimal(10, 2)), CAST(N'2006-02-14' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2006-03-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-03-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15, 3, 2006, CAST(103.09 AS Decimal(10, 2)), CAST(N'2006-03-28' AS Date), CAST(36.42 AS Decimal(10, 2)), CAST(N'2006-03-18' AS Date), CAST(13.40 AS Decimal(10, 2)), CAST(N'2006-03-18' AS Date), CAST(66.51 AS Decimal(10, 2)), CAST(N'2006-03-30' AS Date), CAST(41.70 AS Decimal(10, 2)), CAST(N'2006-03-06' AS Date), CAST(30.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(230.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(226.79 AS Decimal(10, 2)), CAST(62.97 AS Decimal(10, 2)), CAST(N'2006-03-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2006-04-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-04-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16, 4, 2006, CAST(65.00 AS Decimal(10, 2)), CAST(N'2006-04-20' AS Date), CAST(32.35 AS Decimal(10, 2)), CAST(N'2006-04-17' AS Date), CAST(13.40 AS Decimal(10, 2)), CAST(N'2006-04-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2006-04-06' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(388.21 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(248.89 AS Decimal(10, 2)), CAST(62.97 AS Decimal(10, 2)), CAST(N'2006-04-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.52 AS Decimal(10, 2)), CAST(N'2006-05-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-05-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (17, 5, 2006, CAST(26.32 AS Decimal(10, 2)), CAST(N'2006-05-30' AS Date), CAST(30.82 AS Decimal(10, 2)), CAST(N'2006-05-17' AS Date), CAST(14.08 AS Decimal(10, 2)), CAST(N'2006-05-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.70 AS Decimal(10, 2)), CAST(N'2006-05-04' AS Date), CAST(294.53 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(263.30 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(177.50 AS Decimal(10, 2)), CAST(63.02 AS Decimal(10, 2)), CAST(N'2006-05-16' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(39.53 AS Decimal(10, 2)), CAST(N'2006-06-01' AS Date), CAST(36.92 AS Decimal(10, 2)), CAST(N'2006-06-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (18, 6, 2006, CAST(19.18 AS Decimal(10, 2)), CAST(N'2006-06-27' AS Date), CAST(33.45 AS Decimal(10, 2)), CAST(N'2006-06-19' AS Date), CAST(22.00 AS Decimal(10, 2)), CAST(N'2006-06-28' AS Date), CAST(67.87 AS Decimal(10, 2)), CAST(N'2006-07-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1257.37 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(352.20 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(150.80 AS Decimal(10, 2)), CAST(63.21 AS Decimal(10, 2)), CAST(N'2006-06-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.22 AS Decimal(10, 2)), CAST(N'2006-07-01' AS Date), CAST(36.22 AS Decimal(10, 2)), CAST(N'2006-07-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (19, 7, 2006, CAST(17.69 AS Decimal(10, 2)), CAST(N'2006-07-28' AS Date), CAST(61.60 AS Decimal(10, 2)), CAST(N'2006-07-17' AS Date), CAST(30.25 AS Decimal(10, 2)), CAST(N'2006-07-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(43.86 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(228.18 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(193.50 AS Decimal(10, 2)), CAST(63.97 AS Decimal(10, 2)), CAST(N'2006-07-17' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.27 AS Decimal(10, 2)), CAST(N'2006-08-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2006-08-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (20, 8, 2006, CAST(14.61 AS Decimal(10, 2)), CAST(N'2006-08-25' AS Date), CAST(76.27 AS Decimal(10, 2)), CAST(N'2006-08-17' AS Date), CAST(43.45 AS Decimal(10, 2)), CAST(N'2006-08-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(205.38 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(399.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(390.00 AS Decimal(10, 2)), CAST(249.21 AS Decimal(10, 2)), CAST(89.48 AS Decimal(10, 2)), CAST(N'2006-08-25' AS Date), CAST(82.21 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date), CAST(41.27 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (21, 9, 2006, CAST(17.66 AS Decimal(10, 2)), CAST(N'2006-09-26' AS Date), CAST(69.87 AS Decimal(10, 2)), CAST(N'2006-09-18' AS Date), CAST(15.62 AS Decimal(10, 2)), CAST(N'2006-09-28' AS Date), CAST(72.70 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(139.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(387.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(494.00 AS Decimal(10, 2)), CAST(190.61 AS Decimal(10, 2)), CAST(66.08 AS Decimal(10, 2)), CAST(N'2006-09-14' AS Date), CAST(27.66 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date), CAST(41.27 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (22, 10, 2006, CAST(20.30 AS Decimal(10, 2)), CAST(N'2006-10-27' AS Date), CAST(51.41 AS Decimal(10, 2)), CAST(N'2006-10-17' AS Date), CAST(15.62 AS Decimal(10, 2)), CAST(N'2006-10-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(40.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(324.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(650.00 AS Decimal(10, 2)), CAST(205.75 AS Decimal(10, 2)), CAST(61.80 AS Decimal(10, 2)), CAST(N'2006-10-10' AS Date), CAST(27.66 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date), CAST(41.27 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (23, 11, 2006, CAST(32.28 AS Decimal(10, 2)), CAST(N'2006-11-27' AS Date), CAST(42.09 AS Decimal(10, 2)), CAST(N'2006-11-17' AS Date), CAST(14.08 AS Decimal(10, 2)), CAST(N'2006-11-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(210.44 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(265.35 AS Decimal(10, 2)), CAST(61.28 AS Decimal(10, 2)), CAST(N'2006-11-15' AS Date), CAST(27.66 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date), CAST(41.27 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (24, 12, 2006, CAST(71.70 AS Decimal(10, 2)), CAST(N'2006-12-28' AS Date), CAST(44.80 AS Decimal(10, 2)), CAST(N'2006-12-18' AS Date), CAST(14.08 AS Decimal(10, 2)), CAST(N'2006-12-27' AS Date), CAST(71.18 AS Decimal(10, 2)), CAST(N'2006-01-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(432.40 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(229.22 AS Decimal(10, 2)), CAST(62.11 AS Decimal(10, 2)), CAST(N'2006-12-15' AS Date), CAST(27.66 AS Decimal(10, 2)), CAST(N'2007-01-01' AS Date), CAST(41.27 AS Decimal(10, 2)), CAST(N'2007-01-01' AS Date), CAST(36.27 AS Decimal(10, 2)), CAST(N'2007-01-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (25, 1, 2007, CAST(86.61 AS Decimal(10, 2)), CAST(N'2007-01-29' AS Date), CAST(50.57 AS Decimal(10, 2)), CAST(N'2007-01-17' AS Date), CAST(15.14 AS Decimal(10, 2)), CAST(N'2007-01-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(53.67 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(519.68 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(203.58 AS Decimal(10, 2)), CAST(62.50 AS Decimal(10, 2)), CAST(N'2007-01-15' AS Date), CAST(27.71 AS Decimal(10, 2)), CAST(N'2007-02-01' AS Date), CAST(41.30 AS Decimal(10, 2)), CAST(N'2007-02-01' AS Date), CAST(36.30 AS Decimal(10, 2)), CAST(N'2007-02-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (26, 2, 2007, CAST(128.55 AS Decimal(10, 2)), CAST(N'2007-02-28' AS Date), CAST(50.84 AS Decimal(10, 2)), CAST(N'2007-02-20' AS Date), CAST(19.25 AS Decimal(10, 2)), CAST(N'2007-02-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.67 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(404.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(207.82 AS Decimal(10, 2)), CAST(73.26 AS Decimal(10, 2)), CAST(N'2007-02-15' AS Date), CAST(27.71 AS Decimal(10, 2)), CAST(N'2007-03-01' AS Date), CAST(41.31 AS Decimal(10, 2)), CAST(N'2007-03-01' AS Date), CAST(36.31 AS Decimal(10, 2)), CAST(N'2007-03-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (27, 3, 2007, CAST(112.09 AS Decimal(10, 2)), CAST(N'2007-03-28' AS Date), CAST(39.89 AS Decimal(10, 2)), CAST(N'2007-03-19' AS Date), CAST(16.02 AS Decimal(10, 2)), CAST(N'2007-03-28' AS Date), CAST(71.15 AS Decimal(10, 2)), CAST(N'2007-04-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(55.27 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(448.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(494.00 AS Decimal(10, 2)), CAST(187.95 AS Decimal(10, 2)), CAST(67.04 AS Decimal(10, 2)), CAST(N'2007-03-15' AS Date), CAST(27.71 AS Decimal(10, 2)), CAST(N'2007-04-01' AS Date), CAST(41.31 AS Decimal(10, 2)), CAST(N'2007-04-01' AS Date), CAST(36.31 AS Decimal(10, 2)), CAST(N'2007-04-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (28, 4, 2007, CAST(60.02 AS Decimal(10, 2)), CAST(N'2007-04-27' AS Date), CAST(36.84 AS Decimal(10, 2)), CAST(N'2007-04-17' AS Date), CAST(16.02 AS Decimal(10, 2)), CAST(N'2007-04-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.67 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(235.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(449.57 AS Decimal(10, 2)), CAST(67.57 AS Decimal(10, 2)), CAST(N'2007-04-15' AS Date), CAST(27.71 AS Decimal(10, 2)), CAST(N'2007-05-01' AS Date), CAST(41.31 AS Decimal(10, 2)), CAST(N'2007-05-01' AS Date), CAST(36.31 AS Decimal(10, 2)), CAST(N'2007-05-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (29, 5, 2007, CAST(44.03 AS Decimal(10, 2)), CAST(N'2007-05-29' AS Date), CAST(36.25 AS Decimal(10, 2)), CAST(N'2007-05-17' AS Date), CAST(16.02 AS Decimal(10, 2)), CAST(N'2007-05-29' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(125.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(219.18 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(520.00 AS Decimal(10, 2)), CAST(461.74 AS Decimal(10, 2)), CAST(70.86 AS Decimal(10, 2)), CAST(N'2007-05-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(28.53 AS Decimal(10, 2)), CAST(N'2007-06-01' AS Date), CAST(28.53 AS Decimal(10, 2)), CAST(N'2007-06-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (30, 6, 2007, CAST(18.72 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date), CAST(47.34 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date), CAST(12.79 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date), CAST(42.12 AS Decimal(10, 2)), CAST(N'2007-07-02' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(235.89 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(348.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(318.70 AS Decimal(10, 2)), CAST(69.38 AS Decimal(10, 2)), CAST(N'2007-06-18' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(45.00 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (31, 7, 2007, CAST(32.61 AS Decimal(10, 2)), CAST(N'2007-08-13' AS Date), CAST(89.77 AS Decimal(10, 2)), CAST(N'2007-08-01' AS Date), CAST(20.23 AS Decimal(10, 2)), CAST(N'2007-08-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(334.56 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(298.23 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(230.68 AS Decimal(10, 2)), CAST(65.92 AS Decimal(10, 2)), CAST(N'2007-07-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(36.00 AS Decimal(10, 2)), CAST(N'2007-07-18' AS Date), CAST(35.00 AS Decimal(10, 2)), CAST(N'2007-07-18' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (32, 8, 2007, CAST(24.89 AS Decimal(10, 2)), CAST(N'2007-09-11' AS Date), CAST(101.14 AS Decimal(10, 2)), CAST(N'2007-09-08' AS Date), CAST(39.89 AS Decimal(10, 2)), CAST(N'2007-08-31' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(125.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(292.36 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(181.06 AS Decimal(10, 2)), CAST(66.28 AS Decimal(10, 2)), CAST(N'2007-08-17' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(48.58 AS Decimal(10, 2)), CAST(N'2007-08-24' AS Date), CAST(20.58 AS Decimal(10, 2)), CAST(N'2007-08-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (33, 9, 2007, CAST(25.94 AS Decimal(10, 2)), CAST(N'2007-10-11' AS Date), CAST(143.57 AS Decimal(10, 2)), CAST(N'2007-10-11' AS Date), CAST(61.00 AS Decimal(10, 2)), CAST(N'2007-10-05' AS Date), CAST(42.12 AS Decimal(10, 2)), CAST(N'2007-10-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(173.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(303.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(92.85 AS Decimal(10, 2)), CAST(66.12 AS Decimal(10, 2)), CAST(N'2007-09-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(52.31 AS Decimal(10, 2)), CAST(N'2007-09-24' AS Date), CAST(22.32 AS Decimal(10, 2)), CAST(N'2007-09-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (34, 10, 2007, CAST(28.18 AS Decimal(10, 2)), CAST(N'2007-11-09' AS Date), CAST(82.98 AS Decimal(10, 2)), CAST(N'2007-11-11' AS Date), CAST(39.89 AS Decimal(10, 2)), CAST(N'2007-11-05' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1941.68 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(224.99 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(134.03 AS Decimal(10, 2)), CAST(65.16 AS Decimal(10, 2)), CAST(N'2007-10-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(52.31 AS Decimal(10, 2)), CAST(N'2007-11-24' AS Date), CAST(22.32 AS Decimal(10, 2)), CAST(N'2004-11-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (35, 11, 2007, CAST(54.12 AS Decimal(10, 2)), CAST(N'2007-12-09' AS Date), CAST(68.83 AS Decimal(10, 2)), CAST(N'2007-12-12' AS Date), CAST(34.33 AS Decimal(10, 2)), CAST(N'2007-12-05' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(566.06 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(69.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(223.99 AS Decimal(10, 2)), CAST(63.79 AS Decimal(10, 2)), CAST(N'2007-11-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(4.37 AS Decimal(10, 2)), CAST(N'2007-12-24' AS Date), CAST(4.37 AS Decimal(10, 2)), CAST(N'2007-12-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (36, 12, 2007, CAST(118.78 AS Decimal(10, 2)), CAST(N'2008-01-10' AS Date), CAST(59.03 AS Decimal(10, 2)), CAST(N'2008-01-12' AS Date), CAST(28.77 AS Decimal(10, 2)), CAST(N'2008-01-05' AS Date), CAST(42.12 AS Decimal(10, 2)), CAST(N'2007-12-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(588.23 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), CAST(139.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(224.85 AS Decimal(10, 2)), CAST(64.18 AS Decimal(10, 2)), CAST(N'2007-12-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(15.61 AS Decimal(10, 2)), CAST(N'2007-12-24' AS Date), CAST(45.19 AS Decimal(10, 2)), CAST(N'2007-12-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (37, 1, 2008, CAST(158.01 AS Decimal(10, 2)), CAST(N'2008-01-31' AS Date), CAST(67.41 AS Decimal(10, 2)), CAST(N'2008-01-31' AS Date), CAST(31.11 AS Decimal(10, 2)), CAST(N'2008-02-01' AS Date), CAST(43.36 AS Decimal(10, 2)), CAST(N'2008-02-01' AS Date), CAST(122.94 AS Decimal(10, 2)), NULL, CAST(150.96 AS Decimal(10, 2)), NULL, CAST(841.26 AS Decimal(10, 2)), CAST(300.38 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(283.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(248.02 AS Decimal(10, 2)), CAST(66.16 AS Decimal(10, 2)), CAST(N'2008-01-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(15.61 AS Decimal(10, 2)), CAST(N'2008-01-25' AS Date), CAST(45.19 AS Decimal(10, 2)), CAST(N'2008-01-25' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (38, 2, 2008, CAST(153.07 AS Decimal(10, 2)), CAST(N'2008-03-10' AS Date), CAST(69.99 AS Decimal(10, 2)), CAST(N'2008-03-12' AS Date), CAST(29.46 AS Decimal(10, 2)), CAST(N'2008-03-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-02-22' AS Date), CAST(89.08 AS Decimal(10, 2)), NULL, CAST(464.22 AS Decimal(10, 2)), CAST(515.41 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(164.14 AS Decimal(10, 2)), CAST(64.11 AS Decimal(10, 2)), CAST(N'2008-02-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(15.60 AS Decimal(10, 2)), CAST(N'2008-02-26' AS Date), CAST(46.20 AS Decimal(10, 2)), CAST(N'2008-02-26' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (39, 3, 2008, CAST(183.30 AS Decimal(10, 2)), CAST(N'2008-04-12' AS Date), CAST(73.53 AS Decimal(10, 2)), CAST(N'2008-04-15' AS Date), CAST(35.28 AS Decimal(10, 2)), CAST(N'2008-03-28' AS Date), CAST(43.56 AS Decimal(10, 2)), CAST(N'2008-04-01' AS Date), CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-03-17' AS Date), CAST(260.23 AS Decimal(10, 2)), NULL, CAST(987.30 AS Decimal(10, 2)), CAST(99.01 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(255.02 AS Decimal(10, 2)), CAST(64.91 AS Decimal(10, 2)), CAST(N'2008-03-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.04 AS Decimal(10, 2)), CAST(N'2008-03-24' AS Date), CAST(46.22 AS Decimal(10, 2)), CAST(N'2008-03-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (40, 4, 2008, CAST(113.51 AS Decimal(10, 2)), CAST(N'2008-04-25' AS Date), CAST(56.27 AS Decimal(10, 2)), CAST(N'2008-04-25' AS Date), CAST(32.37 AS Decimal(10, 2)), CAST(N'2008-04-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-04-17' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(696.34 AS Decimal(10, 2)), CAST(18.21 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(608.14 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(281.35 AS Decimal(10, 2)), CAST(67.51 AS Decimal(10, 2)), CAST(N'2008-04-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.04 AS Decimal(10, 2)), CAST(N'2008-04-24' AS Date), CAST(46.22 AS Decimal(10, 2)), CAST(N'2008-04-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (41, 5, 2008, CAST(73.24 AS Decimal(10, 2)), CAST(N'2008-05-22' AS Date), CAST(59.21 AS Decimal(10, 2)), CAST(N'2008-05-24' AS Date), CAST(33.38 AS Decimal(10, 2)), CAST(N'2008-05-12' AS Date), CAST(44.07 AS Decimal(10, 2)), CAST(N'2008-05-31' AS Date), CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-05-17' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(1042.35 AS Decimal(10, 2)), CAST(159.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(398.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(282.98 AS Decimal(10, 2)), CAST(66.13 AS Decimal(10, 2)), CAST(N'2008-05-13' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (42, 6, 2008, CAST(43.42 AS Decimal(10, 2)), CAST(N'2008-06-25' AS Date), CAST(39.15 AS Decimal(10, 2)), CAST(N'2008-06-24' AS Date), CAST(32.37 AS Decimal(10, 2)), CAST(N'2008-06-30' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2008-06-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(721.44 AS Decimal(10, 2)), CAST(89.46 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(245.52 AS Decimal(10, 2)), CAST(71.04 AS Decimal(10, 2)), CAST(N'2008-07-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-06-24' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-06-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (43, 7, 2008, CAST(33.26 AS Decimal(10, 2)), CAST(N'2008-07-28' AS Date), CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-07-27' AS Date), CAST(34.39 AS Decimal(10, 2)), CAST(N'2008-07-15' AS Date), CAST(45.88 AS Decimal(10, 2)), CAST(N'2008-08-01' AS Date), CAST(10.00 AS Decimal(10, 2)), CAST(N'2008-07-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(874.12 AS Decimal(10, 2)), CAST(258.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(21.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(303.32 AS Decimal(10, 2)), CAST(143.23 AS Decimal(10, 2)), CAST(N'2008-08-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-07-24' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-07-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (44, 8, 2008, CAST(30.32 AS Decimal(10, 2)), CAST(N'2008-09-24' AS Date), CAST(118.06 AS Decimal(10, 2)), CAST(N'2008-09-25' AS Date), CAST(36.41 AS Decimal(10, 2)), CAST(N'2008-09-22' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2008-09-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(403.03 AS Decimal(10, 2)), CAST(337.15 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(79.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(205.00 AS Decimal(10, 2)), CAST(69.62 AS Decimal(10, 2)), CAST(N'2008-09-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-09-08' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-09-08' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (45, 9, 2008, CAST(23.07 AS Decimal(10, 2)), CAST(N'2008-10-24' AS Date), CAST(101.33 AS Decimal(10, 2)), CAST(N'2008-10-25' AS Date), CAST(35.40 AS Decimal(10, 2)), CAST(N'2008-10-21' AS Date), CAST(45.88 AS Decimal(10, 2)), CAST(N'2008-10-01' AS Date), CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-10-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(759.62 AS Decimal(10, 2)), CAST(25.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(31.94 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(220.80 AS Decimal(10, 2)), CAST(76.13 AS Decimal(10, 2)), CAST(N'2008-10-08' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-10-09' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-10-09' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (46, 10, 2008, CAST(23.56 AS Decimal(10, 2)), CAST(N'2008-11-12' AS Date), CAST(60.09 AS Decimal(10, 2)), CAST(N'2008-11-12' AS Date), CAST(42.34 AS Decimal(10, 2)), CAST(N'2008-11-05' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-10-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(550.76 AS Decimal(10, 2)), CAST(244.65 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(3.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(180.99 AS Decimal(10, 2)), CAST(168.48 AS Decimal(10, 2)), CAST(N'2008-11-07' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-11-05' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-11-05' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (47, 11, 2008, CAST(40.56 AS Decimal(10, 2)), CAST(N'2008-11-24' AS Date), CAST(56.97 AS Decimal(10, 2)), CAST(N'2008-11-26' AS Date), CAST(29.46 AS Decimal(10, 2)), CAST(N'2008-12-01' AS Date), CAST(45.35 AS Decimal(10, 2)), CAST(N'2008-12-01' AS Date), CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-11-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(785.92 AS Decimal(10, 2)), CAST(57.58 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(66.79 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(30.00 AS Decimal(10, 2)), CAST(111.10 AS Decimal(10, 2)), CAST(71.57 AS Decimal(10, 2)), CAST(N'2008-12-08' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-11-24' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-11-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (48, 12, 2008, CAST(98.17 AS Decimal(10, 2)), CAST(N'2008-12-28' AS Date), CAST(69.68 AS Decimal(10, 2)), CAST(N'2008-12-27' AS Date), CAST(33.38 AS Decimal(10, 2)), CAST(N'2008-12-29' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(103.00 AS Decimal(10, 2)), CAST(N'2008-12-15' AS Date), CAST(83.34 AS Decimal(10, 2)), NULL, CAST(1136.42 AS Decimal(10, 2)), CAST(17.16 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(43.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(166.56 AS Decimal(10, 2)), CAST(71.31 AS Decimal(10, 2)), CAST(N'2008-12-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.55 AS Decimal(10, 2)), CAST(N'2008-12-16' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2008-12-16' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (49, 1, 2009, CAST(138.52 AS Decimal(10, 2)), CAST(N'2009-01-27' AS Date), CAST(79.96 AS Decimal(10, 2)), CAST(N'2009-01-25' AS Date), CAST(33.38 AS Decimal(10, 2)), CAST(N'2009-01-30' AS Date), CAST(42.50 AS Decimal(10, 2)), CAST(N'2009-02-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-01-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(770.27 AS Decimal(10, 2)), CAST(126.61 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(685.23 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(151.04 AS Decimal(10, 2)), CAST(71.12 AS Decimal(10, 2)), CAST(N'2009-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-01-12' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2009-01-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (50, 2, 2009, CAST(138.86 AS Decimal(10, 2)), CAST(N'2009-02-24' AS Date), CAST(81.95 AS Decimal(10, 2)), CAST(N'2009-02-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-02-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(760.04 AS Decimal(10, 2)), CAST(14.93 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(149.43 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(200.39 AS Decimal(10, 2)), CAST(71.64 AS Decimal(10, 2)), CAST(N'2009-03-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-02-15' AS Date), CAST(46.55 AS Decimal(10, 2)), CAST(N'2009-02-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (51, 3, 2009, CAST(95.66 AS Decimal(10, 2)), CAST(N'2009-03-27' AS Date), CAST(64.07 AS Decimal(10, 2)), CAST(N'2009-03-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(52.92 AS Decimal(10, 2)), CAST(N'2009-04-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-03-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(759.41 AS Decimal(10, 2)), CAST(36.66 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(4061.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(98.89 AS Decimal(10, 2)), CAST(70.84 AS Decimal(10, 2)), CAST(N'2009-03-30' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-03-30' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-03-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (52, 4, 2009, CAST(69.32 AS Decimal(10, 2)), CAST(N'2009-04-25' AS Date), CAST(66.89 AS Decimal(10, 2)), CAST(N'2009-04-25' AS Date), CAST(100.77 AS Decimal(10, 2)), CAST(N'2009-04-30' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-04-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(637.85 AS Decimal(10, 2)), CAST(137.67 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(539.14 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(124.63 AS Decimal(10, 2)), CAST(71.56 AS Decimal(10, 2)), CAST(N'2009-04-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-04-28' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-04-28' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (53, 5, 2009, CAST(41.97 AS Decimal(10, 2)), CAST(N'2009-05-24' AS Date), CAST(56.85 AS Decimal(10, 2)), CAST(N'2009-05-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(41.76 AS Decimal(10, 2)), CAST(N'2009-06-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-05-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(750.58 AS Decimal(10, 2)), CAST(355.05 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(108.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(79.55 AS Decimal(10, 2)), CAST(71.56 AS Decimal(10, 2)), CAST(N'2009-05-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-05-28' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-05-28' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (54, 6, 2009, CAST(22.72 AS Decimal(10, 2)), CAST(N'2009-06-24' AS Date), CAST(44.61 AS Decimal(10, 2)), CAST(N'2009-06-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-06-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(504.58 AS Decimal(10, 2)), CAST(304.24 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(64.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(267.45 AS Decimal(10, 2)), CAST(47.93 AS Decimal(10, 2)), CAST(N'2009-06-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.56 AS Decimal(10, 2)), CAST(N'2009-06-25' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-06-25' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (55, 7, 2009, CAST(15.66 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date), CAST(64.10 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date), CAST(100.82 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date), CAST(42.48 AS Decimal(10, 2)), CAST(N'2009-07-30' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-07-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(642.61 AS Decimal(10, 2)), CAST(199.65 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(220.33 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(264.24 AS Decimal(10, 2)), CAST(72.13 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.64 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (56, 8, 2009, CAST(15.52 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date), CAST(87.88 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-08-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(552.42 AS Decimal(10, 2)), CAST(468.87 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(125.08 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(165.99 AS Decimal(10, 2)), CAST(81.98 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.64 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (57, 9, 2009, CAST(15.16 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date), CAST(103.67 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(42.86 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-09-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(553.22 AS Decimal(10, 2)), CAST(171.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(18.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(131.31 AS Decimal(10, 2)), CAST(71.86 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.64 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (58, 10, 2009, CAST(17.74 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date), CAST(75.64 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date), CAST(106.46 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-10-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(730.47 AS Decimal(10, 2)), CAST(52.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(54.97 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(129.30 AS Decimal(10, 2)), CAST(71.75 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.64 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date), CAST(46.59 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (59, 11, 2009, CAST(43.20 AS Decimal(10, 2)), CAST(N'2009-12-09' AS Date), CAST(72.75 AS Decimal(10, 2)), CAST(N'2009-12-05' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(48.40 AS Decimal(10, 2)), CAST(N'2009-12-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-11-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(762.45 AS Decimal(10, 2)), CAST(162.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(37.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(71.75 AS Decimal(10, 2)), CAST(N'2009-12-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (60, 12, 2009, CAST(66.52 AS Decimal(10, 2)), CAST(N'2009-12-31' AS Date), CAST(78.32 AS Decimal(10, 2)), CAST(N'2009-12-31' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(61.82 AS Decimal(10, 2)), CAST(N'2009-01-01' AS Date), CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-12-15' AS Date), CAST(166.66 AS Decimal(10, 2)), NULL, CAST(448.37 AS Decimal(10, 2)), CAST(284.53 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(147.28 AS Decimal(10, 2)), CAST(72.55 AS Decimal(10, 2)), CAST(N'2009-01-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(149.57 AS Decimal(10, 2)), CAST(N'2009-12-24' AS Date), CAST(119.56 AS Decimal(10, 2)), CAST(N'2009-12-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (61, 1, 2010, CAST(123.69 AS Decimal(10, 2)), CAST(N'2010-02-12' AS Date), CAST(108.67 AS Decimal(10, 2)), CAST(N'2010-02-06' AS Date), CAST(100.28 AS Decimal(10, 2)), CAST(N'2010-02-01' AS Date), CAST(5.00 AS Decimal(10, 2)), CAST(N'2010-02-01' AS Date), CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-01-15' AS Date), CAST(200.00 AS Decimal(10, 2)), NULL, CAST(595.72 AS Decimal(10, 2)), CAST(161.85 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(111.69 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(223.20 AS Decimal(10, 2)), CAST(184.23 AS Decimal(10, 2)), CAST(N'2010-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(64.22 AS Decimal(10, 2)), CAST(N'2010-01-24' AS Date), CAST(49.22 AS Decimal(10, 2)), CAST(N'2010-01-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (62, 2, 2010, CAST(109.50 AS Decimal(10, 2)), CAST(N'2010-03-12' AS Date), CAST(71.54 AS Decimal(10, 2)), CAST(N'2010-03-06' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-02-15' AS Date), CAST(200.00 AS Decimal(10, 2)), NULL, CAST(616.28 AS Decimal(10, 2)), CAST(175.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(46.05 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(224.33 AS Decimal(10, 2)), CAST(43.88 AS Decimal(10, 2)), CAST(N'2010-03-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(64.22 AS Decimal(10, 2)), CAST(N'2010-02-28' AS Date), CAST(49.22 AS Decimal(10, 2)), CAST(N'2010-02-28' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (63, 3, 2010, CAST(91.33 AS Decimal(10, 2)), CAST(N'2010-03-25' AS Date), CAST(83.94 AS Decimal(10, 2)), CAST(N'2010-03-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(61.59 AS Decimal(10, 2)), CAST(N'2010-03-15' AS Date), CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-03-15' AS Date), CAST(200.00 AS Decimal(10, 2)), NULL, CAST(743.83 AS Decimal(10, 2)), CAST(216.55 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(87.24 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(142.08 AS Decimal(10, 2)), CAST(101.88 AS Decimal(10, 2)), CAST(N'2010-03-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(38.08 AS Decimal(10, 2)), CAST(N'2010-03-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (64, 4, 2010, CAST(49.16 AS Decimal(10, 2)), CAST(N'2010-04-27' AS Date), CAST(77.37 AS Decimal(10, 2)), CAST(N'2010-04-27' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-04-15' AS Date), CAST(2155.65 AS Decimal(10, 2)), NULL, CAST(906.11 AS Decimal(10, 2)), CAST(148.48 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(124.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(95.34 AS Decimal(10, 2)), CAST(99.91 AS Decimal(10, 2)), CAST(N'2010-04-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-04-28' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (65, 5, 2010, CAST(35.93 AS Decimal(10, 2)), CAST(N'2010-05-25' AS Date), CAST(68.10 AS Decimal(10, 2)), CAST(N'2010-05-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-05-15' AS Date), CAST(307.10 AS Decimal(10, 2)), NULL, CAST(650.21 AS Decimal(10, 2)), CAST(217.37 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(67.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(157.64 AS Decimal(10, 2)), CAST(99.91 AS Decimal(10, 2)), CAST(N'2010-05-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-05-25' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (66, 6, 2010, CAST(20.85 AS Decimal(10, 2)), CAST(N'2010-06-25' AS Date), CAST(71.93 AS Decimal(10, 2)), CAST(N'2010-06-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(62.58 AS Decimal(10, 2)), CAST(N'2010-07-01' AS Date), CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-06-15' AS Date), CAST(200.00 AS Decimal(10, 2)), NULL, CAST(619.19 AS Decimal(10, 2)), CAST(255.94 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(75.74 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(60.00 AS Decimal(10, 2)), CAST(174.92 AS Decimal(10, 2)), CAST(102.06 AS Decimal(10, 2)), CAST(N'2010-06-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-06-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (67, 7, 2010, CAST(1.46 AS Decimal(10, 2)), CAST(N'2010-08-24' AS Date), CAST(113.64 AS Decimal(10, 2)), CAST(N'2010-08-25' AS Date), CAST(106.54 AS Decimal(10, 2)), CAST(N'2010-08-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-07-15' AS Date), CAST(310.72 AS Decimal(10, 2)), NULL, CAST(539.01 AS Decimal(10, 2)), CAST(277.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(129.58 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(105.00 AS Decimal(10, 2)), CAST(235.36 AS Decimal(10, 2)), CAST(99.65 AS Decimal(10, 2)), CAST(N'2010-07-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-07-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (68, 8, 2010, CAST(16.70 AS Decimal(10, 2)), CAST(N'2010-08-25' AS Date), CAST(164.42 AS Decimal(10, 2)), CAST(N'2010-08-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-08-15' AS Date), CAST(1063.80 AS Decimal(10, 2)), NULL, CAST(758.74 AS Decimal(10, 2)), CAST(167.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(55.40 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(259.83 AS Decimal(10, 2)), CAST(99.83 AS Decimal(10, 2)), CAST(N'2010-09-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-08-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (69, 9, 2010, CAST(15.66 AS Decimal(10, 2)), CAST(N'2010-09-30' AS Date), CAST(206.50 AS Decimal(10, 2)), CAST(N'2010-09-30' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(66.83 AS Decimal(10, 2)), CAST(N'2010-09-30' AS Date), CAST(10.00 AS Decimal(10, 2)), CAST(N'2010-09-15' AS Date), CAST(239.03 AS Decimal(10, 2)), NULL, CAST(667.71 AS Decimal(10, 2)), CAST(92.76 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(23.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(137.73 AS Decimal(10, 2)), CAST(99.83 AS Decimal(10, 2)), CAST(N'2010-09-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-09-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (70, 10, 2010, CAST(17.80 AS Decimal(10, 2)), CAST(N'2010-10-30' AS Date), CAST(97.60 AS Decimal(10, 2)), CAST(N'2010-10-30' AS Date), CAST(109.72 AS Decimal(10, 2)), CAST(N'2010-11-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-10-15' AS Date), CAST(785.19 AS Decimal(10, 2)), NULL, CAST(650.16 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(37.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(139.73 AS Decimal(10, 2)), CAST(99.71 AS Decimal(10, 2)), CAST(N'2010-10-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-10-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (71, 11, 2010, CAST(34.13 AS Decimal(10, 2)), CAST(N'2010-11-25' AS Date), CAST(86.82 AS Decimal(10, 2)), CAST(N'2010-11-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-11-15' AS Date), CAST(407.11 AS Decimal(10, 2)), NULL, CAST(875.08 AS Decimal(10, 2)), CAST(133.94 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(17.28 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(205.14 AS Decimal(10, 2)), CAST(99.71 AS Decimal(10, 2)), CAST(N'2010-11-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-11-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (72, 12, 2010, CAST(61.98 AS Decimal(10, 2)), CAST(N'2010-12-25' AS Date), CAST(106.73 AS Decimal(10, 2)), CAST(N'2010-12-26' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(87.93 AS Decimal(10, 2)), CAST(N'2011-01-01' AS Date), CAST(110.00 AS Decimal(10, 2)), CAST(N'2010-12-15' AS Date), CAST(319.35 AS Decimal(10, 2)), NULL, CAST(1038.15 AS Decimal(10, 2)), CAST(57.10 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(63.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(298.60 AS Decimal(10, 2)), CAST(101.71 AS Decimal(10, 2)), CAST(N'2010-12-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2010-12-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (73, 1, 2011, CAST(107.15 AS Decimal(10, 2)), CAST(N'2011-01-25' AS Date), CAST(114.62 AS Decimal(10, 2)), CAST(N'2011-01-25' AS Date), CAST(107.60 AS Decimal(10, 2)), CAST(N'2011-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(112.00 AS Decimal(10, 2)), CAST(N'2011-01-15' AS Date), CAST(287.81 AS Decimal(10, 2)), NULL, CAST(882.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(17.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(221.10 AS Decimal(10, 2)), CAST(108.08 AS Decimal(10, 2)), CAST(N'2011-01-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-01-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (74, 2, 2011, CAST(88.30 AS Decimal(10, 2)), CAST(N'2011-02-24' AS Date), CAST(113.92 AS Decimal(10, 2)), CAST(N'2011-02-23' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(64.77 AS Decimal(10, 2)), CAST(N'2011-03-01' AS Date), CAST(112.00 AS Decimal(10, 2)), CAST(N'2011-02-20' AS Date), CAST(382.00 AS Decimal(10, 2)), NULL, CAST(887.50 AS Decimal(10, 2)), CAST(119.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(21.37 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(127.88 AS Decimal(10, 2)), CAST(101.28 AS Decimal(10, 2)), CAST(N'2011-02-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-02-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (75, 3, 2011, CAST(91.55 AS Decimal(10, 2)), CAST(N'2011-04-01' AS Date), CAST(89.65 AS Decimal(10, 2)), CAST(N'2011-04-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(112.00 AS Decimal(10, 2)), CAST(N'2011-03-15' AS Date), CAST(550.86 AS Decimal(10, 2)), NULL, CAST(805.78 AS Decimal(10, 2)), CAST(58.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(57.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(129.48 AS Decimal(10, 2)), CAST(99.28 AS Decimal(10, 2)), CAST(N'2011-04-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-04-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (76, 4, 2011, CAST(61.84 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date), CAST(90.11 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date), CAST(114.83 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(112.00 AS Decimal(10, 2)), CAST(N'2011-04-15' AS Date), CAST(287.81 AS Decimal(10, 2)), NULL, CAST(880.35 AS Decimal(10, 2)), CAST(132.11 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(151.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(254.53 AS Decimal(10, 2)), CAST(99.15 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (77, 5, 2011, CAST(44.74 AS Decimal(10, 2)), CAST(N'2011-06-01' AS Date), CAST(86.29 AS Decimal(10, 2)), CAST(N'2011-06-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(808.18 AS Decimal(10, 2)), CAST(184.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(165.80 AS Decimal(10, 2)), CAST(99.15 AS Decimal(10, 2)), CAST(N'2011-06-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-06-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (78, 6, 2011, CAST(22.68 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date), CAST(69.34 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(66.24 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(665.85 AS Decimal(10, 2)), CAST(214.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(200.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(229.56 AS Decimal(10, 2)), CAST(103.29 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (79, 7, 2011, CAST(18.14 AS Decimal(10, 2)), CAST(N'2011-07-25' AS Date), CAST(97.84 AS Decimal(10, 2)), CAST(N'2011-07-24' AS Date), CAST(118.13 AS Decimal(10, 2)), CAST(N'2011-08-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(948.89 AS Decimal(10, 2)), CAST(165.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(9.57 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(200.85 AS Decimal(10, 2)), CAST(101.21 AS Decimal(10, 2)), CAST(N'2011-07-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-07-11' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (80, 8, 2011, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(144.75 AS Decimal(10, 2)), CAST(N'2011-08-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(700.10 AS Decimal(10, 2)), CAST(84.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(76.68 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(165.00 AS Decimal(10, 2)), CAST(103.13 AS Decimal(10, 2)), CAST(N'2011-08-22' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-08-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (81, 9, 2011, CAST(100.57 AS Decimal(10, 2)), CAST(N'2011-09-24' AS Date), CAST(190.57 AS Decimal(10, 2)), CAST(N'2011-09-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(143.70 AS Decimal(10, 2)), CAST(N'2011-10-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(1044.74 AS Decimal(10, 2)), CAST(165.02 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(41.27 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-09-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (82, 10, 2011, CAST(38.68 AS Decimal(10, 2)), CAST(N'2011-10-24' AS Date), CAST(106.72 AS Decimal(10, 2)), CAST(N'2011-10-25' AS Date), CAST(120.33 AS Decimal(10, 2)), CAST(N'2011-11-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(21.43 AS Decimal(10, 2)), CAST(N'2011-10-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(1000.89 AS Decimal(10, 2)), CAST(215.78 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(114.02 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(231.27 AS Decimal(10, 2)), CAST(99.96 AS Decimal(10, 2)), CAST(N'2011-10-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-11-01' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (83, 11, 2011, CAST(35.90 AS Decimal(10, 2)), CAST(N'2011-11-23' AS Date), CAST(107.87 AS Decimal(10, 2)), CAST(N'2011-11-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2011-11-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(752.73 AS Decimal(10, 2)), CAST(89.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(271.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(197.88 AS Decimal(10, 2)), CAST(101.96 AS Decimal(10, 2)), CAST(N'2011-11-20' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-11-20' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (84, 12, 2011, CAST(60.70 AS Decimal(10, 2)), CAST(N'2011-12-30' AS Date), CAST(92.22 AS Decimal(10, 2)), CAST(N'2011-12-31' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(66.21 AS Decimal(10, 2)), CAST(N'2012-01-02' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2011-12-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(680.43 AS Decimal(10, 2)), CAST(12.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(60.57 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(166.47 AS Decimal(10, 2)), CAST(101.96 AS Decimal(10, 2)), CAST(N'2011-12-20' AS Date), CAST(41.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2011-12-19' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (85, 1, 2012, CAST(68.59 AS Decimal(10, 2)), CAST(N'2012-01-25' AS Date), CAST(97.67 AS Decimal(10, 2)), CAST(N'2012-01-24' AS Date), CAST(119.23 AS Decimal(10, 2)), CAST(N'2012-01-30' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(921.17 AS Decimal(10, 2)), CAST(21.03 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(14.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(202.64 AS Decimal(10, 2)), CAST(359.01 AS Decimal(10, 2)), CAST(N'2012-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-01-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (86, 2, 2012, CAST(84.64 AS Decimal(10, 2)), CAST(N'2012-02-22' AS Date), CAST(99.28 AS Decimal(10, 2)), CAST(N'2012-02-23' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-02-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(1071.63 AS Decimal(10, 2)), CAST(35.81 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(215.34 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(182.05 AS Decimal(10, 2)), CAST(165.45 AS Decimal(10, 2)), CAST(N'2012-03-10' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(109.98 AS Decimal(10, 2)), CAST(N'2012-02-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (87, 3, 2012, CAST(63.04 AS Decimal(10, 2)), CAST(N'2012-03-25' AS Date), CAST(95.47 AS Decimal(10, 2)), CAST(N'2012-03-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(145.78 AS Decimal(10, 2)), CAST(N'2012-04-01' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-03-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(965.25 AS Decimal(10, 2)), CAST(49.55 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(170.87 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(217.53 AS Decimal(10, 2)), CAST(165.45 AS Decimal(10, 2)), CAST(N'2012-03-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(15.04 AS Decimal(10, 2)), CAST(N'2012-03-24' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (88, 4, 2012, CAST(28.43 AS Decimal(10, 2)), CAST(N'2012-04-25' AS Date), CAST(94.53 AS Decimal(10, 2)), CAST(N'2012-04-26' AS Date), CAST(121.18 AS Decimal(10, 2)), CAST(N'2012-05-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-04-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(981.57 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(272.83 AS Decimal(10, 2)), CAST(165.36 AS Decimal(10, 2)), CAST(N'2012-04-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(46.49 AS Decimal(10, 2)), CAST(N'2012-04-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (89, 5, 2012, CAST(25.71 AS Decimal(10, 2)), CAST(N'2012-05-22' AS Date), CAST(79.67 AS Decimal(10, 2)), CAST(N'2012-05-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-05-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(937.99 AS Decimal(10, 2)), CAST(169.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(63.94 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(194.74 AS Decimal(10, 2)), CAST(165.36 AS Decimal(10, 2)), CAST(N'2012-05-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-05-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (90, 6, 2012, CAST(17.07 AS Decimal(10, 2)), CAST(N'2012-06-24' AS Date), CAST(77.81 AS Decimal(10, 2)), CAST(N'2012-06-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(65.81 AS Decimal(10, 2)), CAST(N'2012-07-02' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-06-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(568.39 AS Decimal(10, 2)), CAST(95.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(146.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(170.09 AS Decimal(10, 2)), CAST(165.36 AS Decimal(10, 2)), CAST(N'2012-06-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-06-09' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (91, 7, 2012, CAST(16.56 AS Decimal(10, 2)), CAST(N'2012-07-25' AS Date), CAST(114.58 AS Decimal(10, 2)), CAST(N'2012-07-24' AS Date), CAST(123.44 AS Decimal(10, 2)), CAST(N'2012-08-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-07-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(1644.15 AS Decimal(10, 2)), CAST(88.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(245.86 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(411.76 AS Decimal(10, 2)), CAST(141.48 AS Decimal(10, 2)), CAST(N'2012-07-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-07-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (92, 8, 2012, CAST(15.12 AS Decimal(10, 2)), CAST(N'2012-08-22' AS Date), CAST(121.90 AS Decimal(10, 2)), CAST(N'2012-08-24' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-08-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(705.63 AS Decimal(10, 2)), CAST(155.34 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(100.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(318.58 AS Decimal(10, 2)), CAST(141.48 AS Decimal(10, 2)), CAST(N'2012-08-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-08-15' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (93, 9, 2012, CAST(16.46 AS Decimal(10, 2)), CAST(N'2012-09-25' AS Date), CAST(122.35 AS Decimal(10, 2)), CAST(N'2012-09-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-09-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(966.91 AS Decimal(10, 2)), CAST(95.65 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(59.56 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(202.86 AS Decimal(10, 2)), CAST(141.48 AS Decimal(10, 2)), CAST(N'2012-09-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-09-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (94, 10, 2012, CAST(18.79 AS Decimal(10, 2)), CAST(N'2012-10-24' AS Date), CAST(117.47 AS Decimal(10, 2)), CAST(N'2012-10-24' AS Date), CAST(134.98 AS Decimal(10, 2)), CAST(N'2012-11-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-10-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(928.36 AS Decimal(10, 2)), CAST(41.60 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(41.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(259.89 AS Decimal(10, 2)), CAST(141.76 AS Decimal(10, 2)), CAST(N'2012-10-12' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-10-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (95, 11, 2012, CAST(30.99 AS Decimal(10, 2)), CAST(N'2012-11-21' AS Date), CAST(86.18 AS Decimal(10, 2)), CAST(N'2012-11-22' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-11-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(515.57 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(63.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(246.72 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-11-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (96, 12, 2012, CAST(53.56 AS Decimal(10, 2)), CAST(N'2012-12-27' AS Date), CAST(111.44 AS Decimal(10, 2)), CAST(N'2012-12-28' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2012-12-01' AS Date), CAST(290.00 AS Decimal(10, 2)), NULL, CAST(849.55 AS Decimal(10, 2)), CAST(33.17 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(124.86 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(211.43 AS Decimal(10, 2)), CAST(141.76 AS Decimal(10, 2)), CAST(N'2012-12-12' AS Date), CAST(104.54 AS Decimal(10, 2)), CAST(N'2013-01-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2012-12-13' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (97, 1, 2013, CAST(80.74 AS Decimal(10, 2)), CAST(N'2013-01-25' AS Date), CAST(108.14 AS Decimal(10, 2)), CAST(N'2013-01-26' AS Date), CAST(122.31 AS Decimal(10, 2)), CAST(N'2013-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(724.90 AS Decimal(10, 2)), CAST(60.15 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(56.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(161.94 AS Decimal(10, 2)), CAST(141.58 AS Decimal(10, 2)), CAST(N'2013-01-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-01-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (98, 2, 2013, CAST(94.11 AS Decimal(10, 2)), CAST(N'2013-02-24' AS Date), CAST(92.07 AS Decimal(10, 2)), CAST(N'2013-02-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(68.07 AS Decimal(10, 2)), CAST(N'2013-02-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(250.00 AS Decimal(10, 2)), NULL, CAST(953.72 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(189.94 AS Decimal(10, 2)), CAST(141.58 AS Decimal(10, 2)), CAST(N'2013-02-14' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-02-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (99, 3, 2013, CAST(78.99 AS Decimal(10, 2)), CAST(N'2013-03-27' AS Date), CAST(99.10 AS Decimal(10, 2)), CAST(N'2013-03-25' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-03-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(847.74 AS Decimal(10, 2)), CAST(18.11 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(72.92 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(320.80 AS Decimal(10, 2)), CAST(141.58 AS Decimal(10, 2)), CAST(N'2013-03-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-03-12' AS Date))
GO
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (100, 4, 2013, CAST(73.57 AS Decimal(10, 2)), CAST(N'2013-04-25' AS Date), CAST(84.78 AS Decimal(10, 2)), CAST(N'2013-04-26' AS Date), CAST(134.56 AS Decimal(10, 2)), CAST(N'2013-05-01' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-04-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(830.02 AS Decimal(10, 2)), CAST(26.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(71.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(128.51 AS Decimal(10, 2)), CAST(141.51 AS Decimal(10, 2)), CAST(N'2013-04-15' AS Date), CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-04-12' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (101, 5, 2013, CAST(49.47 AS Decimal(10, 2)), CAST(N'2013-06-15' AS Date), CAST(86.00 AS Decimal(10, 2)), CAST(N'2013-06-15' AS Date), NULL, NULL, NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-05-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(773.95 AS Decimal(10, 2)), CAST(208.19 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(109.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(222.58 AS Decimal(10, 2)), CAST(141.51 AS Decimal(10, 2)), CAST(N'2013-06-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-05-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (102, 6, 2013, CAST(29.52 AS Decimal(10, 2)), CAST(N'2013-07-15' AS Date), CAST(60.04 AS Decimal(10, 2)), CAST(N'2013-07-15' AS Date), NULL, NULL, CAST(74.81 AS Decimal(10, 2)), CAST(N'2013-07-15' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-06-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(942.11 AS Decimal(10, 2)), CAST(6.43 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(151.46 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(453.77 AS Decimal(10, 2)), CAST(141.51 AS Decimal(10, 2)), CAST(N'2013-07-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-06-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (103, 7, 2013, CAST(20.43 AS Decimal(10, 2)), CAST(N'2013-08-15' AS Date), CAST(112.18 AS Decimal(10, 2)), CAST(N'2013-08-16' AS Date), CAST(138.04 AS Decimal(10, 2)), CAST(N'2013-08-15' AS Date), NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-07-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(889.37 AS Decimal(10, 2)), CAST(62.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(74.65 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(179.26 AS Decimal(10, 2)), CAST(141.51 AS Decimal(10, 2)), CAST(N'2013-08-16' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-07-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (104, 8, 2013, CAST(17.65 AS Decimal(10, 2)), CAST(N'2013-09-15' AS Date), CAST(105.51 AS Decimal(10, 2)), CAST(N'2013-09-15' AS Date), NULL, NULL, NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-08-01' AS Date), CAST(285.00 AS Decimal(10, 2)), NULL, CAST(827.00 AS Decimal(10, 2)), CAST(33.08 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(48.17 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(308.36 AS Decimal(10, 2)), CAST(141.51 AS Decimal(10, 2)), CAST(N'2013-09-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-08-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (105, 9, 2013, CAST(16.74 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date), CAST(102.23 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date), NULL, NULL, CAST(75.55 AS Decimal(10, 2)), CAST(N'2013-10-01' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-09-01' AS Date), CAST(250.00 AS Decimal(10, 2)), NULL, CAST(374.45 AS Decimal(10, 2)), CAST(38.07 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(446.37 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(725.00 AS Decimal(10, 2)), CAST(176.32 AS Decimal(10, 2)), CAST(142.57 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-09-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (106, 10, 2013, CAST(17.65 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date), CAST(128.67 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date), CAST(155.12 AS Decimal(10, 2)), CAST(N'2013-11-01' AS Date), NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-10-01' AS Date), NULL, NULL, CAST(1461.32 AS Decimal(10, 2)), CAST(38.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(64.22 AS Decimal(10, 2)), CAST(142.67 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-10-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (107, 11, 2013, CAST(45.52 AS Decimal(10, 2)), CAST(N'2013-12-15' AS Date), CAST(93.67 AS Decimal(10, 2)), CAST(N'2013-12-15' AS Date), NULL, NULL, NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-11-01' AS Date), NULL, NULL, CAST(830.28 AS Decimal(10, 2)), CAST(11.16 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(78.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(175.62 AS Decimal(10, 2)), CAST(142.67 AS Decimal(10, 2)), CAST(N'2013-12-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-11-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (108, 12, 2013, CAST(70.34 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date), CAST(93.55 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date), NULL, NULL, CAST(75.29 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date), CAST(37.44 AS Decimal(10, 2)), CAST(N'2013-12-01' AS Date), NULL, NULL, CAST(1097.15 AS Decimal(10, 2)), CAST(103.33 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(172.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(725.00 AS Decimal(10, 2)), CAST(234.18 AS Decimal(10, 2)), CAST(142.67 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2013-12-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (109, 1, 2014, CAST(112.78 AS Decimal(10, 2)), CAST(N'2014-02-15' AS Date), CAST(108.08 AS Decimal(10, 2)), CAST(N'2014-02-15' AS Date), CAST(135.72 AS Decimal(10, 2)), CAST(N'2014-02-01' AS Date), NULL, NULL, CAST(37.44 AS Decimal(10, 2)), CAST(N'2014-01-01' AS Date), NULL, NULL, CAST(727.46 AS Decimal(10, 2)), CAST(40.57 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(131.29 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(160.23 AS Decimal(10, 2)), CAST(142.50 AS Decimal(10, 2)), CAST(N'2014-02-15' AS Date), NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), CAST(N'2014-01-30' AS Date))
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (110, 2, 2014, CAST(118.61 AS Decimal(10, 2)), NULL, CAST(103.93 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(908.83 AS Decimal(10, 2)), CAST(46.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(98.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(162.94 AS Decimal(10, 2)), CAST(142.82 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (1101, 3, 2014, CAST(125.34 AS Decimal(10, 2)), NULL, CAST(102.32 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(859.76 AS Decimal(10, 2)), CAST(146.03 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(99.28 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(184.91 AS Decimal(10, 2)), CAST(142.82 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (1102, 4, 2014, CAST(100.83 AS Decimal(10, 2)), NULL, CAST(86.16 AS Decimal(10, 2)), NULL, CAST(138.47 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(37.44 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(873.37 AS Decimal(10, 2)), CAST(69.69 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(725.00 AS Decimal(10, 2)), CAST(260.33 AS Decimal(10, 2)), CAST(142.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (2102, 5, 2014, CAST(58.62 AS Decimal(10, 2)), NULL, CAST(82.89 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(6.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1144.90 AS Decimal(10, 2)), CAST(101.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(15.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(580.00 AS Decimal(10, 2)), CAST(251.71 AS Decimal(10, 2)), CAST(142.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (3102, 6, 2014, CAST(30.39 AS Decimal(10, 2)), NULL, CAST(74.71 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(80.44 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(863.31 AS Decimal(10, 2)), CAST(42.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(45.40 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(50.00 AS Decimal(10, 2)), CAST(313.49 AS Decimal(10, 2)), CAST(137.70 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(44.08 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (4102, 7, 2014, CAST(21.10 AS Decimal(10, 2)), NULL, CAST(151.00 AS Decimal(10, 2)), NULL, CAST(27.72 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(118.60 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(850.60 AS Decimal(10, 2)), CAST(65.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(148.29 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(209.22 AS Decimal(10, 2)), CAST(142.55 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.08 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (5102, 8, 2014, CAST(20.76 AS Decimal(10, 2)), NULL, CAST(122.00 AS Decimal(10, 2)), NULL, CAST(41.79 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(800.92 AS Decimal(10, 2)), CAST(215.32 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(426.10 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(369.86 AS Decimal(10, 2)), CAST(142.55 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (6102, 9, 2014, CAST(24.51 AS Decimal(10, 2)), NULL, CAST(137.00 AS Decimal(10, 2)), NULL, CAST(75.69 AS Decimal(10, 2)), NULL, CAST(80.09 AS Decimal(10, 2)), NULL, CAST(211.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1143.74 AS Decimal(10, 2)), CAST(155.36 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(601.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(201.12 AS Decimal(10, 2)), CAST(142.55 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (6103, 10, 2014, CAST(34.30 AS Decimal(10, 2)), NULL, CAST(110.00 AS Decimal(10, 2)), NULL, CAST(108.17 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(835.93 AS Decimal(10, 2)), CAST(156.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(101.07 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(720.00 AS Decimal(10, 2)), CAST(192.14 AS Decimal(10, 2)), CAST(142.67 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (7103, 11, 2014, CAST(70.06 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(72.67 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(888.60 AS Decimal(10, 2)), CAST(255.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(158.34 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(720.00 AS Decimal(10, 2)), CAST(112.50 AS Decimal(10, 2)), CAST(142.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (8103, 12, 2014, CAST(171.76 AS Decimal(10, 2)), NULL, CAST(232.00 AS Decimal(10, 2)), NULL, CAST(72.67 AS Decimal(10, 2)), NULL, CAST(80.06 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(952.54 AS Decimal(10, 2)), CAST(294.03 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(67.17 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(900.00 AS Decimal(10, 2)), CAST(170.39 AS Decimal(10, 2)), CAST(142.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (9103, 1, 2015, CAST(165.93 AS Decimal(10, 2)), NULL, CAST(124.00 AS Decimal(10, 2)), NULL, CAST(61.98 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(614.87 AS Decimal(10, 2)), CAST(109.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(720.00 AS Decimal(10, 2)), CAST(113.62 AS Decimal(10, 2)), CAST(142.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (10103, 2, 2015, CAST(160.88 AS Decimal(10, 2)), NULL, CAST(116.00 AS Decimal(10, 2)), NULL, CAST(61.98 AS Decimal(10, 2)), NULL, CAST(85.00 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1290.22 AS Decimal(10, 2)), CAST(266.44 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(232.60 AS Decimal(10, 2)), CAST(138.15 AS Decimal(10, 2)), CAST(142.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (10104, 3, 2015, CAST(173.74 AS Decimal(10, 2)), NULL, CAST(108.00 AS Decimal(10, 2)), NULL, CAST(62.93 AS Decimal(10, 2)), NULL, CAST(77.14 AS Decimal(10, 2)), NULL, CAST(136.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(582.66 AS Decimal(10, 2)), CAST(214.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(60.86 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(422.40 AS Decimal(10, 2)), CAST(263.66 AS Decimal(10, 2)), CAST(142.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (11104, 4, 2015, CAST(83.56 AS Decimal(10, 2)), NULL, CAST(97.00 AS Decimal(10, 2)), NULL, CAST(62.93 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(616.98 AS Decimal(10, 2)), CAST(96.61 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(636.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(316.80 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), CAST(142.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (11105, 5, 2015, CAST(41.68 AS Decimal(10, 2)), NULL, CAST(89.00 AS Decimal(10, 2)), NULL, CAST(69.77 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(853.73 AS Decimal(10, 2)), CAST(55.06 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(116.99 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(522.40 AS Decimal(10, 2)), CAST(255.69 AS Decimal(10, 2)), CAST(142.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(34.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (12104, 6, 2015, CAST(31.84 AS Decimal(10, 2)), NULL, CAST(108.00 AS Decimal(10, 2)), NULL, CAST(76.61 AS Decimal(10, 2)), NULL, CAST(77.04 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(905.68 AS Decimal(10, 2)), CAST(125.36 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(127.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(284.20 AS Decimal(10, 2)), CAST(211.21 AS Decimal(10, 2)), CAST(142.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (12105, 7, 2015, CAST(25.13 AS Decimal(10, 2)), NULL, CAST(152.00 AS Decimal(10, 2)), NULL, CAST(69.77 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(994.18 AS Decimal(10, 2)), CAST(127.17 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(43.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(205.55 AS Decimal(10, 2)), CAST(143.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(89.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (13105, 8, 2015, CAST(23.77 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(69.77 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(446.84 AS Decimal(10, 2)), CAST(185.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(218.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(337.67 AS Decimal(10, 2)), CAST(143.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (13106, 9, 2015, CAST(22.89 AS Decimal(10, 2)), NULL, CAST(174.00 AS Decimal(10, 2)), NULL, CAST(86.55 AS Decimal(10, 2)), NULL, CAST(81.21 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1163.16 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(172.24 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(106.61 AS Decimal(10, 2)), CAST(143.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14105, 10, 2015, CAST(26.23 AS Decimal(10, 2)), NULL, CAST(136.00 AS Decimal(10, 2)), NULL, CAST(83.45 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(156.04 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(718.93 AS Decimal(10, 2)), CAST(138.69 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(307.95 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(175.01 AS Decimal(10, 2)), CAST(143.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14106, 11, 2015, CAST(47.93 AS Decimal(10, 2)), NULL, CAST(106.00 AS Decimal(10, 2)), NULL, CAST(76.61 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(139.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(997.58 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(227.61 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(107.71 AS Decimal(10, 2)), CAST(143.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14107, 12, 2015, CAST(84.03 AS Decimal(10, 2)), NULL, CAST(94.00 AS Decimal(10, 2)), NULL, CAST(76.61 AS Decimal(10, 2)), NULL, CAST(81.06 AS Decimal(10, 2)), NULL, CAST(159.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1428.19 AS Decimal(10, 2)), CAST(121.54 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(495.92 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(113.86 AS Decimal(10, 2)), CAST(143.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14108, 1, 2016, CAST(132.01 AS Decimal(10, 2)), NULL, CAST(98.00 AS Decimal(10, 2)), NULL, CAST(56.09 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(139.99 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(1606.41 AS Decimal(10, 2)), CAST(56.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(291.86 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(123.87 AS Decimal(10, 2)), CAST(143.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14109, 2, 2016, CAST(132.69 AS Decimal(10, 2)), NULL, CAST(112.00 AS Decimal(10, 2)), NULL, CAST(69.77 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(139.99 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(799.96 AS Decimal(10, 2)), CAST(147.02 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(4.09 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(77.50 AS Decimal(10, 2)), CAST(182.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14110, 3, 2016, CAST(108.76 AS Decimal(10, 2)), NULL, CAST(96.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(169.27 AS Decimal(10, 2)), NULL, CAST(139.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(883.52 AS Decimal(10, 2)), CAST(6.79 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(63.89 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(147.74 AS Decimal(10, 2)), CAST(287.92 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14111, 4, 2016, CAST(72.61 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(139.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1136.81 AS Decimal(10, 2)), CAST(11.11 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(176.86 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(129.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14112, 5, 2016, CAST(45.26 AS Decimal(10, 2)), NULL, CAST(93.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(159.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1128.92 AS Decimal(10, 2)), CAST(147.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(253.79 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(154.85 AS Decimal(10, 2)), CAST(287.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(44.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (14113, 6, 2016, CAST(29.86 AS Decimal(10, 2)), NULL, CAST(206.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(80.66 AS Decimal(10, 2)), NULL, CAST(139.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1385.17 AS Decimal(10, 2)), CAST(412.98 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(188.58 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(178.29 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15113, 7, 2016, CAST(21.56 AS Decimal(10, 2)), NULL, CAST(145.00 AS Decimal(10, 2)), NULL, CAST(84.74 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(139.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(706.10 AS Decimal(10, 2)), CAST(129.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(32.05 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(149.05 AS Decimal(10, 2)), CAST(143.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15114, 8, 2016, CAST(23.88 AS Decimal(10, 2)), NULL, CAST(181.00 AS Decimal(10, 2)), NULL, CAST(104.70 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(170.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1225.21 AS Decimal(10, 2)), CAST(238.24 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(369.02 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(208.29 AS Decimal(10, 2)), CAST(143.91 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15115, 9, 2016, CAST(23.89 AS Decimal(10, 2)), NULL, CAST(150.00 AS Decimal(10, 2)), NULL, CAST(104.70 AS Decimal(10, 2)), NULL, CAST(80.87 AS Decimal(10, 2)), NULL, CAST(126.43 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(802.39 AS Decimal(10, 2)), CAST(37.69 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(29.97 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(198.67 AS Decimal(10, 2)), CAST(143.87 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15116, 11, 2016, CAST(52.91 AS Decimal(10, 2)), NULL, CAST(108.00 AS Decimal(10, 2)), NULL, CAST(70.84 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(646.71 AS Decimal(10, 2)), CAST(18.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(7.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(130.66 AS Decimal(10, 2)), CAST(143.81 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15117, 10, 2016, CAST(25.93 AS Decimal(10, 2)), NULL, CAST(94.00 AS Decimal(10, 2)), NULL, CAST(91.10 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(993.97 AS Decimal(10, 2)), CAST(244.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(168.31 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(124.13 AS Decimal(10, 2)), CAST(143.87 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15118, 12, 2016, CAST(64.32 AS Decimal(10, 2)), NULL, CAST(103.00 AS Decimal(10, 2)), NULL, CAST(77.79 AS Decimal(10, 2)), NULL, CAST(86.23 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(868.11 AS Decimal(10, 2)), CAST(7.36 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(20.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(144.53 AS Decimal(10, 2)), CAST(143.81 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15119, 1, 2017, CAST(176.81 AS Decimal(10, 2)), NULL, CAST(130.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1324.78 AS Decimal(10, 2)), CAST(40.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(46.82 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(193.78 AS Decimal(10, 2)), CAST(287.46 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15120, 2, 2017, CAST(137.94 AS Decimal(10, 2)), NULL, CAST(113.00 AS Decimal(10, 2)), NULL, CAST(63.89 AS Decimal(10, 2)), NULL, CAST(90.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1060.61 AS Decimal(10, 2)), CAST(249.62 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(101.36 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(195.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15121, 3, 2017, CAST(103.25 AS Decimal(10, 2)), NULL, CAST(113.00 AS Decimal(10, 2)), NULL, CAST(73.03 AS Decimal(10, 2)), NULL, CAST(86.75 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(800.67 AS Decimal(10, 2)), CAST(34.38 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(30.52 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(156.30 AS Decimal(10, 2)), CAST(287.30 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15122, 4, 2017, CAST(83.39 AS Decimal(10, 2)), NULL, CAST(111.00 AS Decimal(10, 2)), NULL, CAST(65.82 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(874.89 AS Decimal(10, 2)), CAST(138.18 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(158.59 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(181.27 AS Decimal(10, 2)), CAST(143.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (15123, 5, 2017, CAST(53.11 AS Decimal(10, 2)), NULL, CAST(184.00 AS Decimal(10, 2)), NULL, CAST(58.61 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1062.44 AS Decimal(10, 2)), CAST(318.54 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(292.39 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(188.33 AS Decimal(10, 2)), CAST(143.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(54.95 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16123, 6, 2017, CAST(31.26 AS Decimal(10, 2)), NULL, CAST(138.00 AS Decimal(10, 2)), NULL, CAST(65.82 AS Decimal(10, 2)), NULL, CAST(87.51 AS Decimal(10, 2)), NULL, CAST(64.07 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1078.48 AS Decimal(10, 2)), CAST(296.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(59.29 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(221.50 AS Decimal(10, 2)), CAST(137.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16124, 7, 2017, CAST(24.62 AS Decimal(10, 2)), NULL, CAST(136.00 AS Decimal(10, 2)), NULL, CAST(87.45 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(159.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(577.58 AS Decimal(10, 2)), CAST(324.30 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(122.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(330.11 AS Decimal(10, 2)), CAST(137.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16125, 8, 2017, CAST(24.30 AS Decimal(10, 2)), NULL, CAST(177.00 AS Decimal(10, 2)), NULL, CAST(104.34 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(159.99 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(2851.83 AS Decimal(10, 2)), CAST(134.05 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(452.68 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(256.91 AS Decimal(10, 2)), CAST(137.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16126, 9, 2017, CAST(23.58 AS Decimal(10, 2)), NULL, CAST(139.00 AS Decimal(10, 2)), NULL, CAST(104.34 AS Decimal(10, 2)), NULL, CAST(87.74 AS Decimal(10, 2)), NULL, CAST(170.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(787.23 AS Decimal(10, 2)), CAST(117.48 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(97.14 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(267.59 AS Decimal(10, 2)), CAST(137.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16127, 10, 2017, CAST(26.76 AS Decimal(10, 2)), NULL, CAST(114.00 AS Decimal(10, 2)), NULL, CAST(90.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(118.22 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1072.91 AS Decimal(10, 2)), CAST(202.14 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(60.10 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(132.47 AS Decimal(10, 2)), CAST(137.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16128, 11, 2017, CAST(74.49 AS Decimal(10, 2)), NULL, CAST(104.00 AS Decimal(10, 2)), NULL, CAST(90.02 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(915.23 AS Decimal(10, 2)), CAST(89.44 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(70.93 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(261.63 AS Decimal(10, 2)), CAST(137.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16129, 12, 2017, CAST(106.13 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), NULL, CAST(81.77 AS Decimal(10, 2)), NULL, CAST(95.26 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1335.38 AS Decimal(10, 2)), CAST(59.52 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(236.47 AS Decimal(10, 2)), CAST(137.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16130, 1, 2018, CAST(179.19 AS Decimal(10, 2)), NULL, CAST(105.00 AS Decimal(10, 2)), NULL, CAST(60.70 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(490.26 AS Decimal(10, 2)), CAST(65.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(253.05 AS Decimal(10, 2)), CAST(251.26 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16131, 2, 2018, CAST(168.03 AS Decimal(10, 2)), NULL, CAST(228.00 AS Decimal(10, 2)), NULL, CAST(72.12 AS Decimal(10, 2)), NULL, CAST(90.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1020.59 AS Decimal(10, 2)), CAST(150.93 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(18.21 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(221.85 AS Decimal(10, 2)), CAST(153.30 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16132, 3, 2018, CAST(166.90 AS Decimal(10, 2)), NULL, CAST(102.00 AS Decimal(10, 2)), NULL, CAST(80.12 AS Decimal(10, 2)), NULL, CAST(95.54 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1263.00 AS Decimal(10, 2)), CAST(188.19 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(298.42 AS Decimal(10, 2)), CAST(153.30 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16133, 4, 2018, CAST(109.08 AS Decimal(10, 2)), NULL, CAST(101.00 AS Decimal(10, 2)), NULL, CAST(68.65 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1483.72 AS Decimal(10, 2)), CAST(37.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(71.95 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(175.59 AS Decimal(10, 2)), CAST(154.92 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(64.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16134, 5, 2018, CAST(70.02 AS Decimal(10, 2)), NULL, CAST(110.00 AS Decimal(10, 2)), NULL, CAST(74.95 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(16.11 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(889.87 AS Decimal(10, 2)), CAST(257.58 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(205.96 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(374.24 AS Decimal(10, 2)), CAST(313.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(95.76 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16135, 6, 2018, CAST(29.28 AS Decimal(10, 2)), NULL, CAST(145.00 AS Decimal(10, 2)), NULL, CAST(67.70 AS Decimal(10, 2)), NULL, CAST(96.64 AS Decimal(10, 2)), NULL, CAST(149.26 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(766.29 AS Decimal(10, 2)), CAST(85.08 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(71.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(376.28 AS Decimal(10, 2)), CAST(157.15 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16136, 7, 2018, CAST(28.00 AS Decimal(10, 2)), NULL, CAST(183.00 AS Decimal(10, 2)), NULL, CAST(97.39 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(174.67 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(836.16 AS Decimal(10, 2)), CAST(93.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(121.07 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(497.81 AS Decimal(10, 2)), CAST(157.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16137, 8, 2018, CAST(26.87 AS Decimal(10, 2)), NULL, CAST(159.00 AS Decimal(10, 2)), NULL, CAST(108.34 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(78.98 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1172.31 AS Decimal(10, 2)), CAST(91.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(153.97 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(366.66 AS Decimal(10, 2)), CAST(157.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16138, 9, 2018, CAST(23.29 AS Decimal(10, 2)), NULL, CAST(147.00 AS Decimal(10, 2)), NULL, CAST(109.50 AS Decimal(10, 2)), NULL, CAST(96.32 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(958.31 AS Decimal(10, 2)), CAST(190.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(33.32 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(213.12 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16139, 10, 2018, CAST(39.46 AS Decimal(10, 2)), NULL, CAST(262.00 AS Decimal(10, 2)), NULL, CAST(99.70 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(940.15 AS Decimal(10, 2)), CAST(50.18 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(72.74 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(255.35 AS Decimal(10, 2)), CAST(314.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16140, 11, 2018, CAST(71.55 AS Decimal(10, 2)), NULL, CAST(89.00 AS Decimal(10, 2)), NULL, CAST(90.12 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(503.11 AS Decimal(10, 2)), CAST(31.23 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(168.78 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(285.67 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16141, 12, 2018, CAST(84.73 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(69.01 AS Decimal(10, 2)), NULL, CAST(102.16 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1116.46 AS Decimal(10, 2)), CAST(300.48 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(34.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(187.30 AS Decimal(10, 2)), CAST(314.58 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16142, 1, 2019, CAST(159.27 AS Decimal(10, 2)), NULL, CAST(219.00 AS Decimal(10, 2)), NULL, CAST(83.38 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(773.06 AS Decimal(10, 2)), CAST(66.02 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(115.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(171.66 AS Decimal(10, 2)), CAST(157.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16143, 2, 2019, CAST(180.16 AS Decimal(10, 2)), NULL, CAST(108.00 AS Decimal(10, 2)), NULL, CAST(79.96 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(884.58 AS Decimal(10, 2)), CAST(91.56 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(4.46 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(202.33 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16144, 3, 2019, CAST(161.08 AS Decimal(10, 2)), NULL, CAST(107.00 AS Decimal(10, 2)), NULL, CAST(81.56 AS Decimal(10, 2)), NULL, CAST(202.08 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(927.51 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(152.51 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(376.70 AS Decimal(10, 2)), CAST(157.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16145, 4, 2019, CAST(95.27 AS Decimal(10, 2)), NULL, CAST(115.00 AS Decimal(10, 2)), NULL, CAST(79.48 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1249.41 AS Decimal(10, 2)), CAST(57.63 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(170.71 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(222.97 AS Decimal(10, 2)), CAST(157.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16146, 5, 2019, CAST(55.53 AS Decimal(10, 2)), NULL, CAST(122.00 AS Decimal(10, 2)), NULL, CAST(78.97 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1094.44 AS Decimal(10, 2)), CAST(73.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(513.32 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(376.70 AS Decimal(10, 2)), CAST(314.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16147, 6, 2019, CAST(36.57 AS Decimal(10, 2)), NULL, CAST(161.00 AS Decimal(10, 2)), NULL, CAST(81.62 AS Decimal(10, 2)), NULL, CAST(102.42 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(1081.80 AS Decimal(10, 2)), CAST(170.89 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(100.26 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(274.63 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16148, 7, 2019, CAST(22.57 AS Decimal(10, 2)), NULL, CAST(199.00 AS Decimal(10, 2)), NULL, CAST(102.07 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(536.38 AS Decimal(10, 2)), CAST(10.42 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(142.20 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(357.27 AS Decimal(10, 2)), CAST(157.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16149, 8, 2019, CAST(21.14 AS Decimal(10, 2)), NULL, CAST(200.00 AS Decimal(10, 2)), NULL, CAST(140.95 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(817.36 AS Decimal(10, 2)), CAST(5.88 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(121.29 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(221.19 AS Decimal(10, 2)), CAST(157.41 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16150, 9, 2019, CAST(22.84 AS Decimal(10, 2)), NULL, CAST(168.00 AS Decimal(10, 2)), NULL, CAST(116.01 AS Decimal(10, 2)), NULL, CAST(104.79 AS Decimal(10, 2)), NULL, NULL, NULL, CAST(40.56 AS Decimal(10, 2)), NULL, CAST(1751.88 AS Decimal(10, 2)), CAST(53.89 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(163.93 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(114.72 AS Decimal(10, 2)), CAST(158.01 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16151, 10, 2019, CAST(24.88 AS Decimal(10, 2)), NULL, CAST(127.00 AS Decimal(10, 2)), NULL, CAST(108.31 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(0.00 AS Decimal(10, 2)), NULL, CAST(40.56 AS Decimal(10, 2)), NULL, CAST(801.86 AS Decimal(10, 2)), CAST(107.28 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(116.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(159.13 AS Decimal(10, 2)), CAST(157.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(79.99 AS Decimal(10, 2)), NULL)
INSERT [dbo].[expenses] ([expense_pk], [month_id], [year_id], [gas_amount], [gas_dueDate], [electric_amount], [electric_dueDate], [water_amount], [water_dueDate], [garbage_amount], [garbage_dueDate], [gym_amount], [gym_dueDate], [healthcare_amount], [healthcare_dueDate], [household_goods_amount], [groceries_amount], [target_amount], [walmart_amount], [sams_club_amount], [costco_amount], [home_improvements_amount], [menards_amount], [home_depot_amount], [ace_hardware_amount], [fleet_farm_amount], [daycare_amount], [gasoline_amount], [cell_phone_amount], [cell_phone_dueDate], [phone_amount], [phone_dueDate], [cable_amount], [cable_dueDate], [internet_amount], [internet_dueDate]) VALUES (16152, 11, 2019, NULL, NULL, NULL, NULL, CAST(99.53 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, CAST(40.56 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[expenses] OFF
SET IDENTITY_INSERT [dbo].[family_members] ON 

INSERT [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (1, N'Andrew', N'Ernest', N'Salmela', 1)
INSERT [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (2, N'Kathryn', N'Anne', N'Salmela', 1)
INSERT [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (3, N'Karlee', N'Elizabeth', N'Salmela', 1)
INSERT [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (4, N'Camden', N'Andrew', N'Salmela', 1)
INSERT [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (5, N'Margaret', N'Kathryn', N'Salmela', 1)
SET IDENTITY_INSERT [dbo].[family_members] OFF
SET IDENTITY_INSERT [dbo].[income] ON 

INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1, 2, 1, 1, 2005, CAST(1326.23 AS Decimal(10, 2)), CAST(N'2005-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (2, 2, 1, 1, 2005, CAST(1135.85 AS Decimal(10, 2)), CAST(N'2005-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (3, 3, 2, 1, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-01-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (4, 1, 2, 1, 2005, CAST(200.15 AS Decimal(10, 2)), CAST(N'2005-01-07' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (5, 2, 1, 2, 2005, CAST(1297.65 AS Decimal(10, 2)), CAST(N'2005-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6, 2, 1, 2, 2005, CAST(890.40 AS Decimal(10, 2)), CAST(N'2005-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (7, 3, 2, 2, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-02-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (8, 2, 1, 3, 2005, CAST(946.81 AS Decimal(10, 2)), CAST(N'2005-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (9, 2, 1, 3, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10, 3, 2, 3, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-03-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11, 1, 2, 3, 2005, CAST(68.68 AS Decimal(10, 2)), CAST(N'2005-03-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12, 2, 1, 4, 2005, CAST(948.20 AS Decimal(10, 2)), CAST(N'2005-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (13, 2, 1, 4, 2005, CAST(927.18 AS Decimal(10, 2)), CAST(N'2005-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14, 3, 2, 4, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15, 1, 2, 4, 2005, CAST(344.57 AS Decimal(10, 2)), CAST(N'2005-04-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16, 4, 2, 4, 2005, CAST(344.57 AS Decimal(10, 2)), CAST(N'2005-04-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (17, 2, 1, 5, 2005, CAST(931.62 AS Decimal(10, 2)), CAST(N'2005-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (18, 2, 1, 5, 2005, CAST(1006.17 AS Decimal(10, 2)), CAST(N'2005-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (19, 3, 2, 5, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (20, 1, 2, 5, 2005, CAST(560.09 AS Decimal(10, 2)), NULL)
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (21, 2, 1, 6, 2005, CAST(927.49 AS Decimal(10, 2)), CAST(N'2005-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (22, 2, 1, 6, 2005, CAST(932.94 AS Decimal(10, 2)), CAST(N'2005-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (23, 3, 2, 6, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-06-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (24, 1, 2, 6, 2005, CAST(1153.52 AS Decimal(10, 2)), CAST(N'2005-06-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (25, 2, 1, 7, 2005, CAST(938.53 AS Decimal(10, 2)), CAST(N'2005-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (26, 2, 1, 7, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (27, 3, 2, 7, 2005, CAST(1805.14 AS Decimal(10, 2)), CAST(N'2005-07-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (28, 1, 2, 7, 2005, CAST(651.14 AS Decimal(10, 2)), CAST(N'2005-07-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (29, 2, 1, 8, 2005, CAST(935.76 AS Decimal(10, 2)), CAST(N'2005-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (30, 2, 1, 8, 2005, CAST(927.49 AS Decimal(10, 2)), CAST(N'2005-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (31, 3, 2, 8, 2005, CAST(1805.19 AS Decimal(10, 2)), CAST(N'2005-08-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (32, 1, 2, 8, 2005, CAST(657.55 AS Decimal(10, 2)), CAST(N'2005-08-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (33, 2, 1, 9, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (34, 2, 1, 9, 2005, CAST(933.00 AS Decimal(10, 2)), CAST(N'2005-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (35, 3, 2, 9, 2005, CAST(1815.80 AS Decimal(10, 2)), CAST(N'2005-09-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (36, 1, 2, 9, 2005, CAST(211.48 AS Decimal(10, 2)), CAST(N'2005-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (37, 2, 1, 10, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (38, 2, 1, 10, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (39, 3, 2, 10, 2005, CAST(1815.80 AS Decimal(10, 2)), CAST(N'2005-10-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (40, 1, 2, 10, 2005, CAST(316.74 AS Decimal(10, 2)), CAST(N'2005-10-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (41, 4, 2, 10, 2005, CAST(316.74 AS Decimal(10, 2)), CAST(N'2005-10-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (42, 2, 1, 11, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (43, 2, 1, 11, 2005, CAST(927.48 AS Decimal(10, 2)), CAST(N'2005-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (44, 3, 2, 11, 2005, CAST(1815.80 AS Decimal(10, 2)), CAST(N'2005-11-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (45, 1, 2, 11, 2005, CAST(367.50 AS Decimal(10, 2)), CAST(N'2005-11-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (46, 4, 2, 11, 2005, CAST(367.50 AS Decimal(10, 2)), CAST(N'2005-11-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (47, 2, 1, 12, 2005, CAST(927.49 AS Decimal(10, 2)), CAST(N'2005-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (48, 2, 1, 12, 2005, CAST(931.62 AS Decimal(10, 2)), CAST(N'2005-12-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (49, 3, 2, 12, 2005, CAST(1830.25 AS Decimal(10, 2)), CAST(N'2005-12-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (50, 1, 2, 12, 2005, CAST(97.29 AS Decimal(10, 2)), CAST(N'2005-12-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (51, 2, 1, 1, 2006, CAST(373.71 AS Decimal(10, 2)), CAST(N'2006-01-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (52, 2, 1, 1, 2006, CAST(835.79 AS Decimal(10, 2)), CAST(N'2006-01-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (53, 3, 2, 1, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-01-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (54, 1, 2, 1, 2006, CAST(177.64 AS Decimal(10, 2)), CAST(N'2006-01-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (55, 2, 1, 2, 2006, CAST(835.80 AS Decimal(10, 2)), CAST(N'2006-02-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (56, 2, 1, 2, 2006, CAST(785.79 AS Decimal(10, 2)), CAST(N'2006-02-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (57, 3, 2, 2, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-02-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (58, 2, 1, 3, 2006, CAST(782.46 AS Decimal(10, 2)), CAST(N'2006-03-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (59, 2, 1, 3, 2006, CAST(1060.01 AS Decimal(10, 2)), CAST(N'2006-03-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (60, 3, 2, 3, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-03-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (61, 2, 1, 4, 2006, CAST(1060.01 AS Decimal(10, 2)), CAST(N'2006-04-07' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (62, 2, 1, 4, 2006, CAST(1060.01 AS Decimal(10, 2)), CAST(N'2006-04-21' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (63, 3, 2, 4, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (64, 2, 1, 5, 2006, CAST(1060.01 AS Decimal(10, 2)), CAST(N'2006-05-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (65, 2, 1, 5, 2006, CAST(1110.00 AS Decimal(10, 2)), CAST(N'2006-05-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (66, 3, 2, 5, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-05-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (67, 2, 1, 6, 2006, CAST(1055.76 AS Decimal(10, 2)), CAST(N'2006-06-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (68, 2, 1, 6, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-06-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (69, 2, 1, 6, 2006, CAST(1082.18 AS Decimal(10, 2)), CAST(N'2006-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (70, 3, 2, 6, 2006, CAST(1805.25 AS Decimal(10, 2)), CAST(N'2006-06-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (71, 2, 1, 7, 2006, CAST(1082.20 AS Decimal(10, 2)), CAST(N'2006-07-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (72, 2, 1, 7, 2006, CAST(1082.18 AS Decimal(10, 2)), CAST(N'2006-07-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (73, 3, 2, 7, 2006, CAST(1877.50 AS Decimal(10, 2)), CAST(N'2006-07-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (74, 2, 1, 8, 2006, CAST(1082.20 AS Decimal(10, 2)), CAST(N'2006-08-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (75, 2, 1, 8, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-08-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (76, 3, 2, 8, 2006, CAST(1805.34 AS Decimal(10, 2)), CAST(N'2005-08-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (77, 2, 1, 9, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-09-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (78, 2, 1, 9, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-09-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (79, 3, 2, 9, 2006, CAST(1940.66 AS Decimal(10, 2)), CAST(N'2006-09-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (80, 2, 1, 10, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-10-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (81, 2, 1, 10, 2006, CAST(1082.19 AS Decimal(10, 2)), CAST(N'2006-10-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (82, 3, 2, 10, 2006, CAST(1932.36 AS Decimal(10, 2)), CAST(N'2006-10-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (83, 2, 1, 11, 2006, CAST(1082.20 AS Decimal(10, 2)), CAST(N'2006-11-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (84, 2, 1, 11, 2006, CAST(2162.88 AS Decimal(10, 2)), CAST(N'2006-11-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (85, 3, 2, 11, 2006, CAST(1932.36 AS Decimal(10, 2)), CAST(N'2006-11-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (86, 2, 1, 12, 2006, CAST(1447.42 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (87, 2, 1, 12, 2006, CAST(1447.42 AS Decimal(10, 2)), CAST(N'2006-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (88, 2, 1, 12, 2006, CAST(1447.42 AS Decimal(10, 2)), CAST(N'2006-12-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (89, 3, 2, 12, 2006, CAST(1993.77 AS Decimal(10, 2)), CAST(N'2006-12-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (90, 2, 1, 1, 2007, CAST(1449.63 AS Decimal(10, 2)), CAST(N'2007-01-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (91, 2, 1, 1, 2007, CAST(1449.65 AS Decimal(10, 2)), CAST(N'2007-01-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (92, 3, 2, 1, 2007, CAST(1655.77 AS Decimal(10, 2)), CAST(N'2007-01-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (93, 2, 1, 2, 2007, CAST(1449.63 AS Decimal(10, 2)), CAST(N'2007-02-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (94, 2, 1, 2, 2007, CAST(1449.64 AS Decimal(10, 2)), CAST(N'2007-02-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (95, 3, 2, 2, 2007, CAST(1591.78 AS Decimal(10, 2)), CAST(N'2007-02-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (96, 2, 1, 3, 2007, CAST(1449.63 AS Decimal(10, 2)), CAST(N'2007-03-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (97, 2, 1, 3, 2007, CAST(1496.69 AS Decimal(10, 2)), CAST(N'2007-02-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (98, 3, 2, 3, 2007, CAST(1591.78 AS Decimal(10, 2)), CAST(N'2007-03-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (99, 2, 1, 4, 2007, CAST(1496.67 AS Decimal(10, 2)), CAST(N'2007-04-06' AS Date))
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (100, 2, 1, 4, 2007, CAST(2756.35 AS Decimal(10, 2)), CAST(N'2007-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (101, 5, 1, 4, 2007, CAST(2175.98 AS Decimal(10, 2)), CAST(N'2007-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (102, 3, 2, 4, 2007, CAST(1591.78 AS Decimal(10, 2)), CAST(N'2007-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (103, 5, 1, 5, 2007, CAST(5069.02 AS Decimal(10, 2)), CAST(N'2007-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (104, 5, 1, 5, 2007, CAST(2072.98 AS Decimal(10, 2)), CAST(N'2007-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (105, 3, 2, 5, 2007, CAST(1620.20 AS Decimal(10, 2)), CAST(N'2007-05-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (106, 5, 1, 6, 2007, CAST(1991.32 AS Decimal(10, 2)), CAST(N'2007-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (107, 5, 1, 6, 2007, CAST(2072.90 AS Decimal(10, 2)), CAST(N'2007-06-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (108, 3, 2, 6, 2007, CAST(1870.48 AS Decimal(10, 2)), CAST(N'2007-06-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (109, 5, 1, 7, 2007, CAST(2069.10 AS Decimal(10, 2)), CAST(N'2007-07-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (110, 5, 1, 7, 2007, CAST(2069.09 AS Decimal(10, 2)), CAST(N'2007-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (111, 3, 2, 7, 2007, CAST(1870.48 AS Decimal(10, 2)), CAST(N'2007-07-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (112, 5, 1, 8, 2007, CAST(2069.09 AS Decimal(10, 2)), CAST(N'2007-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (113, 5, 1, 8, 2007, CAST(2069.09 AS Decimal(10, 2)), CAST(N'2007-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (114, 3, 2, 8, 2007, CAST(1870.53 AS Decimal(10, 2)), CAST(N'2007-08-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (115, 5, 1, 9, 2007, CAST(2069.10 AS Decimal(10, 2)), CAST(N'2007-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (116, 5, 1, 9, 2007, CAST(2069.09 AS Decimal(10, 2)), CAST(N'2007-09-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (117, 5, 1, 10, 2007, CAST(1966.04 AS Decimal(10, 2)), CAST(N'2007-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (118, 5, 1, 10, 2007, CAST(2026.43 AS Decimal(10, 2)), CAST(N'2007-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (119, 5, 1, 11, 2007, CAST(2021.46 AS Decimal(10, 2)), CAST(N'2007-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (120, 5, 1, 11, 2007, CAST(2021.47 AS Decimal(10, 2)), CAST(N'2007-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (121, 5, 1, 12, 2007, CAST(2021.46 AS Decimal(10, 2)), CAST(N'2007-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (122, 5, 1, 12, 2007, CAST(2021.46 AS Decimal(10, 2)), CAST(N'2007-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (123, 5, 1, 1, 2008, CAST(1973.32 AS Decimal(10, 2)), CAST(N'2008-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (124, 5, 1, 1, 2008, CAST(1973.32 AS Decimal(10, 2)), CAST(N'2008-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (125, 6, 2, 1, 2008, CAST(155.14 AS Decimal(10, 2)), CAST(N'2008-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (126, 5, 1, 2, 2008, CAST(1973.31 AS Decimal(10, 2)), CAST(N'2008-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (127, 5, 1, 2, 2008, CAST(6315.36 AS Decimal(10, 2)), CAST(N'2008-02-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (128, 6, 2, 2, 2008, CAST(121.91 AS Decimal(10, 2)), CAST(N'2008-02-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (129, 6, 2, 2, 2008, CAST(276.23 AS Decimal(10, 2)), CAST(N'2008-02-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (130, 5, 1, 3, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-03-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (131, 5, 1, 3, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (132, 6, 2, 3, 2008, CAST(113.59 AS Decimal(10, 2)), CAST(N'2008-03-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (133, 6, 2, 3, 2008, CAST(297.78 AS Decimal(10, 2)), CAST(N'2008-03-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (134, 5, 1, 4, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (135, 5, 1, 4, 2008, CAST(2074.51 AS Decimal(10, 2)), CAST(N'2008-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (136, 6, 2, 4, 2008, CAST(243.80 AS Decimal(10, 2)), CAST(N'2008-04-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (137, 6, 2, 4, 2008, CAST(144.08 AS Decimal(10, 2)), CAST(N'2008-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (138, 5, 1, 5, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (139, 5, 1, 5, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (140, 6, 2, 5, 2008, CAST(226.85 AS Decimal(10, 2)), CAST(N'2008-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (141, 6, 2, 5, 2008, CAST(223.04 AS Decimal(10, 2)), CAST(N'2008-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (142, 5, 1, 6, 2008, CAST(2074.49 AS Decimal(10, 2)), CAST(N'2008-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (143, 5, 1, 6, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (144, 6, 2, 6, 2008, CAST(229.02 AS Decimal(10, 2)), CAST(N'2008-06-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (145, 5, 1, 7, 2008, CAST(2074.51 AS Decimal(10, 2)), CAST(N'2008-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (146, 5, 1, 7, 2008, CAST(2074.51 AS Decimal(10, 2)), CAST(N'2008-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (147, 6, 2, 7, 2008, CAST(180.20 AS Decimal(10, 2)), CAST(N'2008-07-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (148, 6, 2, 7, 2008, CAST(79.89 AS Decimal(10, 2)), CAST(N'2008-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (149, 5, 1, 8, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (150, 5, 1, 8, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-08-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (151, 6, 2, 8, 2008, CAST(226.25 AS Decimal(10, 2)), CAST(N'2008-08-21' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (152, 5, 1, 9, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (153, 5, 1, 9, 2008, CAST(2074.49 AS Decimal(10, 2)), CAST(N'2008-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (154, 6, 2, 9, 2008, CAST(177.32 AS Decimal(10, 2)), CAST(N'2008-09-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (155, 6, 2, 9, 2008, CAST(262.25 AS Decimal(10, 2)), CAST(N'2008-09-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (156, 5, 1, 10, 2008, CAST(2074.51 AS Decimal(10, 2)), CAST(N'2008-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (157, 5, 1, 10, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (158, 6, 2, 10, 2008, CAST(320.88 AS Decimal(10, 2)), CAST(N'2008-10-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (159, 5, 1, 11, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-11-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (160, 5, 1, 11, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-11-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (161, 6, 2, 11, 2008, CAST(141.46 AS Decimal(10, 2)), CAST(N'2008-11-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (162, 6, 2, 11, 2008, CAST(217.95 AS Decimal(10, 2)), CAST(N'2008-11-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (163, 5, 1, 12, 2008, CAST(2074.50 AS Decimal(10, 2)), CAST(N'2008-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (164, 5, 1, 12, 2008, CAST(2368.83 AS Decimal(10, 2)), CAST(N'2008-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (165, 6, 2, 12, 2008, CAST(177.32 AS Decimal(10, 2)), CAST(N'2008-12-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (166, 7, 2, 12, 2008, CAST(289.40 AS Decimal(10, 2)), CAST(N'2008-12-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (167, 6, 2, 12, 2008, CAST(130.12 AS Decimal(10, 2)), CAST(N'2008-12-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (168, 5, 1, 1, 2009, CAST(2612.82 AS Decimal(10, 2)), CAST(N'2009-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (169, 5, 1, 1, 2009, CAST(2133.70 AS Decimal(10, 2)), CAST(N'2009-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (170, 6, 2, 1, 2009, CAST(203.17 AS Decimal(10, 2)), CAST(N'2009-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (171, 5, 1, 2, 2009, CAST(2597.42 AS Decimal(10, 2)), CAST(N'2009-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (172, 5, 1, 2, 2009, CAST(6858.27 AS Decimal(10, 2)), CAST(N'2009-02-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (173, 6, 2, 2, 2009, CAST(343.54 AS Decimal(10, 2)), CAST(N'2009-02-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (174, 7, 2, 2, 2009, CAST(362.68 AS Decimal(10, 2)), CAST(N'2009-02-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (175, 5, 1, 3, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (176, 5, 1, 3, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (177, 6, 2, 3, 2009, CAST(464.00 AS Decimal(10, 2)), CAST(N'2009-03-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (178, 6, 2, 3, 2009, CAST(213.33 AS Decimal(10, 2)), CAST(N'2009-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (179, 5, 1, 4, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (180, 5, 1, 4, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (181, 6, 2, 4, 2009, CAST(179.15 AS Decimal(10, 2)), CAST(N'2009-04-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (182, 6, 2, 4, 2009, CAST(145.45 AS Decimal(10, 2)), CAST(N'2009-04-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (183, 8, 2, 4, 2009, CAST(251.25 AS Decimal(10, 2)), CAST(N'2009-04-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (184, 5, 1, 5, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (185, 5, 1, 5, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-05-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (186, 8, 2, 5, 2009, CAST(125.00 AS Decimal(10, 2)), CAST(N'2009-05-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (187, 6, 2, 5, 2009, CAST(204.56 AS Decimal(10, 2)), CAST(N'2009-05-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (188, 6, 2, 5, 2009, CAST(152.38 AS Decimal(10, 2)), CAST(N'2009-05-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (189, 5, 1, 6, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (190, 5, 1, 6, 2009, CAST(2112.26 AS Decimal(10, 2)), CAST(N'2009-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (191, 6, 2, 6, 2009, CAST(79.42 AS Decimal(10, 2)), CAST(N'2009-06-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (192, 6, 2, 6, 2009, CAST(209.64 AS Decimal(10, 2)), CAST(N'2009-06-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (193, 7, 2, 6, 2009, CAST(360.00 AS Decimal(10, 2)), CAST(N'2009-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (194, 8, 2, 6, 2009, CAST(72.13 AS Decimal(10, 2)), CAST(N'2009-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (195, 5, 1, 7, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (196, 5, 1, 7, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (197, 6, 2, 7, 2009, CAST(187.46 AS Decimal(10, 2)), NULL)
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (198, 8, 2, 7, 2009, CAST(170.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (199, 6, 2, 7, 2009, CAST(116.36 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (200, 5, 1, 8, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-08-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (201, 5, 1, 8, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (202, 6, 2, 8, 2009, CAST(329.45 AS Decimal(10, 2)), CAST(N'2009-08-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (203, 8, 2, 8, 2009, CAST(142.50 AS Decimal(10, 2)), CAST(N'2009-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (204, 7, 2, 8, 2009, CAST(363.29 AS Decimal(10, 2)), CAST(N'2009-08-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (205, 5, 1, 9, 2009, CAST(2112.27 AS Decimal(10, 2)), CAST(N'2009-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (206, 5, 1, 9, 2009, CAST(2112.28 AS Decimal(10, 2)), CAST(N'2009-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (207, 6, 2, 9, 2009, CAST(133.92 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (208, 5, 1, 10, 2009, CAST(2206.21 AS Decimal(10, 2)), CAST(N'2009-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (209, 5, 1, 10, 2009, CAST(2206.21 AS Decimal(10, 2)), CAST(N'2009-10-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (210, 8, 2, 10, 2009, CAST(281.25 AS Decimal(10, 2)), CAST(N'2009-10-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (211, 5, 1, 11, 2009, CAST(2206.21 AS Decimal(10, 2)), CAST(N'2009-11-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (212, 5, 1, 11, 2009, CAST(2206.22 AS Decimal(10, 2)), CAST(N'2009-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (213, 8, 2, 11, 2009, CAST(133.50 AS Decimal(10, 2)), CAST(N'2009-11-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (214, 5, 1, 12, 2009, CAST(2182.60 AS Decimal(10, 2)), CAST(N'2009-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (215, 5, 1, 12, 2009, CAST(2182.65 AS Decimal(10, 2)), CAST(N'2009-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (216, 8, 2, 12, 2009, CAST(180.00 AS Decimal(10, 2)), CAST(N'2009-12-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (217, 5, 1, 1, 2010, CAST(2135.11 AS Decimal(10, 2)), CAST(N'2010-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (218, 5, 1, 1, 2010, CAST(2135.11 AS Decimal(10, 2)), CAST(N'2010-01-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (219, 5, 1, 2, 2010, CAST(2909.83 AS Decimal(10, 2)), CAST(N'2010-02-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (220, 5, 1, 2, 2010, CAST(4465.62 AS Decimal(10, 2)), CAST(N'2010-02-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (221, 8, 2, 2, 2010, CAST(150.00 AS Decimal(10, 2)), CAST(N'2010-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (222, 5, 1, 3, 2010, CAST(2332.57 AS Decimal(10, 2)), CAST(N'2010-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (223, 5, 1, 3, 2010, CAST(2332.56 AS Decimal(10, 2)), CAST(N'2010-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (224, 5, 1, 4, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (225, 5, 1, 4, 2010, CAST(2523.18 AS Decimal(10, 2)), CAST(N'2010-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (226, 5, 1, 5, 2010, CAST(2523.18 AS Decimal(10, 2)), CAST(N'2010-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (227, 5, 1, 5, 2010, CAST(2523.18 AS Decimal(10, 2)), CAST(N'2010-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (228, 5, 1, 6, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (229, 5, 1, 6, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (230, 5, 1, 7, 2010, CAST(2523.17 AS Decimal(10, 2)), CAST(N'2010-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (231, 5, 1, 7, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-07-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (232, 5, 1, 8, 2010, CAST(2325.18 AS Decimal(10, 2)), CAST(N'2010-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (233, 5, 1, 8, 2010, CAST(2325.19 AS Decimal(10, 2)), CAST(N'2010-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (234, 8, 2, 8, 2010, CAST(131.50 AS Decimal(10, 2)), CAST(N'2010-08-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (235, 5, 1, 9, 2010, CAST(2523.17 AS Decimal(10, 2)), CAST(N'2010-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (236, 5, 1, 9, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (237, 5, 1, 10, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (238, 5, 1, 10, 2010, CAST(2523.18 AS Decimal(10, 2)), CAST(N'2010-10-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (239, 8, 2, 10, 2010, CAST(125.01 AS Decimal(10, 2)), CAST(N'2010-10-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (240, 5, 1, 11, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (241, 5, 1, 11, 2010, CAST(2523.17 AS Decimal(10, 2)), CAST(N'2010-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (242, 5, 1, 12, 2010, CAST(2523.19 AS Decimal(10, 2)), CAST(N'2010-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (243, 5, 1, 12, 2010, CAST(2523.18 AS Decimal(10, 2)), CAST(N'2010-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (244, 8, 2, 12, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-12-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (245, 5, 1, 1, 2011, CAST(2598.34 AS Decimal(10, 2)), CAST(N'2011-01-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (246, 5, 1, 1, 2011, CAST(2598.34 AS Decimal(10, 2)), CAST(N'2011-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (247, 5, 1, 2, 2011, CAST(3956.53 AS Decimal(10, 2)), CAST(N'2011-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (248, 5, 1, 2, 2011, CAST(12464.36 AS Decimal(10, 2)), CAST(N'2011-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (249, 5, 1, 3, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (250, 5, 1, 3, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-03-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (251, 5, 1, 4, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (252, 5, 1, 4, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (253, 5, 1, 5, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (254, 5, 1, 5, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (255, 5, 1, 6, 2011, CAST(2742.88 AS Decimal(10, 2)), CAST(N'2011-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (256, 5, 1, 6, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (257, 5, 1, 7, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (258, 5, 1, 7, 2011, CAST(2742.88 AS Decimal(10, 2)), CAST(N'2011-07-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (259, 5, 1, 8, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (260, 5, 1, 8, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (261, 5, 1, 9, 2011, CAST(2742.88 AS Decimal(10, 2)), CAST(N'2011-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (262, 5, 1, 9, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (263, 5, 1, 10, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-10-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (264, 5, 1, 10, 2011, CAST(2742.88 AS Decimal(10, 2)), CAST(N'2011-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (265, 5, 1, 11, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (266, 5, 1, 11, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (267, 5, 1, 12, 2011, CAST(2742.88 AS Decimal(10, 2)), CAST(N'2011-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (268, 5, 1, 12, 2011, CAST(2742.89 AS Decimal(10, 2)), CAST(N'2011-12-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (269, 5, 1, 1, 2012, CAST(2748.19 AS Decimal(10, 2)), CAST(N'2012-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (270, 5, 1, 1, 2012, CAST(2748.19 AS Decimal(10, 2)), CAST(N'2012-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (271, 5, 1, 2, 2012, CAST(4662.38 AS Decimal(10, 2)), CAST(N'2012-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (272, 5, 1, 2, 2012, CAST(11589.23 AS Decimal(10, 2)), CAST(N'2012-02-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (273, 5, 1, 3, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (274, 5, 1, 3, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-03-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (275, 5, 1, 4, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (276, 5, 1, 4, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (277, 5, 1, 5, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (278, 5, 1, 5, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (279, 5, 1, 6, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (280, 5, 1, 6, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (281, 5, 1, 7, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (282, 5, 1, 7, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (283, 5, 1, 8, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (284, 5, 1, 8, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-08-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (285, 5, 1, 9, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (286, 5, 1, 9, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (287, 5, 1, 10, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (288, 5, 1, 10, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (289, 5, 1, 11, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (290, 5, 1, 11, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (291, 5, 1, 12, 2012, CAST(2814.90 AS Decimal(10, 2)), CAST(N'2012-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (292, 5, 1, 12, 2012, CAST(2814.89 AS Decimal(10, 2)), CAST(N'2012-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (293, 5, 1, 1, 2013, CAST(2753.64 AS Decimal(10, 2)), CAST(N'2013-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (294, 5, 1, 1, 2013, CAST(2756.63 AS Decimal(10, 2)), CAST(N'2013-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (295, 5, 1, 2, 2013, CAST(4840.63 AS Decimal(10, 2)), CAST(N'2013-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (296, 5, 1, 2, 2013, CAST(13317.35 AS Decimal(10, 2)), CAST(N'2013-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (297, 5, 1, 3, 2013, CAST(2830.49 AS Decimal(10, 2)), CAST(N'2013-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (298, 5, 1, 3, 2013, CAST(2830.50 AS Decimal(10, 2)), CAST(N'2013-03-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (299, 5, 1, 4, 2013, CAST(2779.46 AS Decimal(10, 2)), CAST(N'2013-04-15' AS Date))
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (300, 5, 1, 4, 2013, CAST(2779.45 AS Decimal(10, 2)), CAST(N'2013-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (301, 5, 1, 5, 2013, CAST(2836.07 AS Decimal(10, 2)), CAST(N'2013-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (302, 5, 1, 5, 2013, CAST(2836.07 AS Decimal(10, 2)), CAST(N'2013-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (303, 5, 1, 6, 2013, CAST(2836.07 AS Decimal(10, 2)), CAST(N'2013-06-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (304, 5, 1, 6, 2013, CAST(2836.06 AS Decimal(10, 2)), CAST(N'2013-06-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (305, 5, 1, 7, 2013, CAST(2836.08 AS Decimal(10, 2)), CAST(N'2013-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (306, 5, 1, 7, 2013, CAST(2836.07 AS Decimal(10, 2)), CAST(N'2013-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (307, 5, 1, 8, 2013, CAST(2836.07 AS Decimal(10, 2)), CAST(N'2013-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (308, 5, 1, 8, 2013, CAST(2779.45 AS Decimal(10, 2)), CAST(N'2013-08-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (309, 5, 1, 9, 2013, CAST(2564.92 AS Decimal(10, 2)), CAST(N'2013-09-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (310, 5, 1, 9, 2013, CAST(2564.93 AS Decimal(10, 2)), CAST(N'2013-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (311, 9, 2, 9, 2013, CAST(1038.69 AS Decimal(10, 2)), CAST(N'2013-09-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (312, 9, 2, 9, 2013, CAST(1252.32 AS Decimal(10, 2)), CAST(N'2013-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (313, 5, 1, 10, 2013, CAST(2564.92 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (314, 9, 2, 10, 2013, CAST(917.20 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (315, 5, 1, 10, 2013, CAST(2564.92 AS Decimal(10, 2)), CAST(N'2013-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (316, 9, 2, 10, 2013, CAST(1403.52 AS Decimal(10, 2)), CAST(N'2013-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (317, 5, 1, 11, 2013, CAST(2564.93 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (318, 9, 2, 11, 2013, CAST(788.70 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (319, 5, 1, 11, 2013, CAST(2564.92 AS Decimal(10, 2)), CAST(N'2013-11-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (320, 9, 2, 11, 2013, CAST(1219.03 AS Decimal(10, 2)), CAST(N'2013-11-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (321, 5, 1, 12, 2013, CAST(2564.92 AS Decimal(10, 2)), CAST(N'2013-12-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (322, 9, 2, 12, 2013, CAST(933.78 AS Decimal(10, 2)), CAST(N'2013-12-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (323, 5, 1, 12, 2013, CAST(2564.93 AS Decimal(10, 2)), CAST(N'2013-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (324, 9, 2, 12, 2013, CAST(1222.29 AS Decimal(10, 2)), CAST(N'2013-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (325, 5, 1, 1, 2014, CAST(2688.28 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (326, 9, 2, 1, 2014, CAST(935.76 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (327, 5, 1, 1, 2014, CAST(2688.28 AS Decimal(10, 2)), CAST(N'2014-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (328, 9, 2, 1, 2014, CAST(1224.26 AS Decimal(10, 2)), CAST(N'2014-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (329, 5, 1, 2, 2014, CAST(5674.64 AS Decimal(10, 2)), CAST(N'2014-02-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (330, 5, 1, 2, 2014, CAST(11157.05 AS Decimal(10, 2)), CAST(N'2014-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (331, 9, 2, 2, 2014, CAST(935.77 AS Decimal(10, 2)), CAST(N'2014-02-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (332, 9, 2, 2, 2014, CAST(1224.26 AS Decimal(10, 2)), CAST(N'2014-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1301, 5, 1, 3, 2014, CAST(2468.93 AS Decimal(10, 2)), CAST(N'2014-03-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1302, 5, 1, 3, 2014, CAST(2468.94 AS Decimal(10, 2)), CAST(N'2014-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1303, 9, 2, 3, 2014, CAST(1253.23 AS Decimal(10, 2)), CAST(N'2014-03-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1304, 9, 2, 3, 2014, CAST(1248.50 AS Decimal(10, 2)), CAST(N'2014-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1305, 5, 1, 4, 2014, CAST(2468.93 AS Decimal(10, 2)), CAST(N'2014-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1306, 5, 1, 4, 2014, CAST(2468.93 AS Decimal(10, 2)), CAST(N'2014-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1307, 9, 2, 4, 2014, CAST(960.03 AS Decimal(10, 2)), CAST(N'2014-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (1308, 9, 2, 4, 2014, CAST(1248.50 AS Decimal(10, 2)), CAST(N'2014-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (2305, 5, 1, 5, 2014, CAST(2399.88 AS Decimal(10, 2)), CAST(N'2014-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (2306, 5, 1, 5, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (2307, 9, 2, 5, 2014, CAST(960.02 AS Decimal(10, 2)), CAST(N'2014-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (2308, 9, 2, 5, 2014, CAST(1248.52 AS Decimal(10, 2)), CAST(N'2014-05-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (3305, 5, 1, 6, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-06-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (3306, 5, 1, 6, 2014, CAST(2399.88 AS Decimal(10, 2)), CAST(N'2014-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (3307, 9, 2, 6, 2014, CAST(1029.69 AS Decimal(10, 2)), CAST(N'2014-06-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (3308, 9, 2, 6, 2014, CAST(6193.57 AS Decimal(10, 2)), CAST(N'2014-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (4305, 5, 1, 7, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (4306, 5, 1, 7, 2014, CAST(2399.88 AS Decimal(10, 2)), CAST(N'2014-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (4307, 9, 2, 7, 2014, CAST(86.49 AS Decimal(10, 2)), CAST(N'2014-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (5305, 5, 1, 8, 2014, CAST(2399.90 AS Decimal(10, 2)), CAST(N'2014-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (5306, 5, 1, 8, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-08-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (5307, 9, 2, 8, 2014, CAST(1304.99 AS Decimal(10, 2)), CAST(N'2014-08-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6305, 5, 1, 9, 2014, CAST(2399.88 AS Decimal(10, 2)), CAST(N'2014-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6306, 9, 2, 9, 2014, CAST(967.80 AS Decimal(10, 2)), CAST(N'2014-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6307, 5, 1, 9, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6308, 9, 2, 9, 2014, CAST(1480.64 AS Decimal(10, 2)), CAST(N'2014-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6309, 5, 1, 10, 2014, CAST(2399.89 AS Decimal(10, 2)), CAST(N'2014-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6310, 5, 1, 10, 2014, CAST(2399.88 AS Decimal(10, 2)), CAST(N'2014-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6311, 9, 2, 10, 2014, CAST(1519.55 AS Decimal(10, 2)), CAST(N'2014-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (6312, 9, 2, 10, 2014, CAST(1271.26 AS Decimal(10, 2)), CAST(N'2014-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (7309, 5, 1, 11, 2014, CAST(2468.93 AS Decimal(10, 2)), CAST(N'2014-11-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (7310, 5, 1, 11, 2014, CAST(2468.93 AS Decimal(10, 2)), CAST(N'2014-11-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (7311, 9, 2, 11, 2014, CAST(913.86 AS Decimal(10, 2)), CAST(N'2014-11-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (7312, 9, 2, 11, 2014, CAST(1271.25 AS Decimal(10, 2)), CAST(N'2014-11-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (8309, 5, 1, 12, 2014, CAST(2746.67 AS Decimal(10, 2)), CAST(N'2014-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (8310, 5, 1, 12, 2014, CAST(2746.66 AS Decimal(10, 2)), CAST(N'2014-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (8311, 9, 2, 12, 2014, CAST(954.30 AS Decimal(10, 2)), CAST(N'2014-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (8312, 9, 2, 12, 2014, CAST(1271.26 AS Decimal(10, 2)), CAST(N'2014-12-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (9309, 5, 1, 1, 2015, CAST(1938.81 AS Decimal(10, 2)), CAST(N'2015-01-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (9310, 5, 1, 1, 2015, CAST(2624.59 AS Decimal(10, 2)), CAST(N'2015-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (9311, 9, 2, 1, 2015, CAST(940.53 AS Decimal(10, 2)), CAST(N'2015-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (9312, 9, 2, 1, 2015, CAST(2447.04 AS Decimal(10, 2)), CAST(N'2015-01-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10309, 5, 1, 2, 2015, CAST(6181.25 AS Decimal(10, 2)), CAST(N'2015-02-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10310, 5, 1, 2, 2015, CAST(10570.41 AS Decimal(10, 2)), CAST(N'2015-02-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10311, 1009, 2, 3, 2015, CAST(266.89 AS Decimal(10, 2)), CAST(N'2015-03-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10312, 5, 1, 3, 2015, CAST(2498.64 AS Decimal(10, 2)), CAST(N'2015-03-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10313, 5, 1, 3, 2015, CAST(2553.20 AS Decimal(10, 2)), CAST(N'2015-03-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10314, 1009, 2, 3, 2015, CAST(447.43 AS Decimal(10, 2)), CAST(N'2015-03-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (10315, 1009, 2, 3, 2015, CAST(408.20 AS Decimal(10, 2)), CAST(N'2015-03-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11312, 5, 1, 4, 2015, CAST(2333.86 AS Decimal(10, 2)), CAST(N'2015-04-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11313, 5, 1, 4, 2015, CAST(2333.86 AS Decimal(10, 2)), CAST(N'2015-04-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11314, 1009, 2, 4, 2015, CAST(357.16 AS Decimal(10, 2)), CAST(N'2015-04-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11315, 1009, 2, 4, 2015, CAST(388.56 AS Decimal(10, 2)), CAST(N'2015-04-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11316, 5, 1, 5, 2015, CAST(2330.90 AS Decimal(10, 2)), CAST(N'2015-05-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11317, 5, 1, 5, 2015, CAST(2316.16 AS Decimal(10, 2)), CAST(N'2015-05-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11318, 1009, 2, 5, 2015, CAST(243.35 AS Decimal(10, 2)), CAST(N'2015-05-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (11319, 1009, 2, 5, 2015, CAST(533.77 AS Decimal(10, 2)), CAST(N'2015-05-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12312, 5, 1, 6, 2015, CAST(2330.91 AS Decimal(10, 2)), CAST(N'2015-06-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12313, 5, 1, 6, 2015, CAST(2330.91 AS Decimal(10, 2)), CAST(N'2015-06-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12314, 1009, 2, 6, 2015, CAST(490.61 AS Decimal(10, 2)), CAST(N'2015-06-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12315, 1009, 2, 6, 2015, CAST(266.90 AS Decimal(10, 2)), CAST(N'2015-06-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12316, 9, 2, 6, 2015, CAST(620.21 AS Decimal(10, 2)), CAST(N'2015-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12317, 5, 1, 7, 2015, CAST(2330.90 AS Decimal(10, 2)), CAST(N'2015-07-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12318, 5, 1, 7, 2015, CAST(2330.91 AS Decimal(10, 2)), CAST(N'2015-07-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12319, 5, 1, 7, 2015, CAST(2330.92 AS Decimal(10, 2)), CAST(N'2015-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12320, 1009, 2, 7, 2015, CAST(306.13 AS Decimal(10, 2)), CAST(N'2015-07-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12321, 1009, 2, 7, 2015, CAST(474.92 AS Decimal(10, 2)), CAST(N'2015-07-17' AS Date))
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (12322, 1009, 2, 7, 2015, CAST(274.73 AS Decimal(10, 2)), CAST(N'2015-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (13317, 5, 1, 8, 2015, CAST(2330.90 AS Decimal(10, 2)), CAST(N'2015-08-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (13318, 5, 1, 8, 2015, CAST(2330.91 AS Decimal(10, 2)), CAST(N'2015-08-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (13319, 5, 1, 9, 2015, CAST(2430.63 AS Decimal(10, 2)), CAST(N'2015-09-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (13320, 5, 1, 9, 2015, CAST(2430.62 AS Decimal(10, 2)), CAST(N'2015-09-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14317, 5, 1, 10, 2015, CAST(2324.64 AS Decimal(10, 2)), CAST(N'2015-10-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14318, 5, 1, 10, 2015, CAST(2324.65 AS Decimal(10, 2)), CAST(N'2015-10-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14319, 1010, 2, 9, 2015, CAST(1393.44 AS Decimal(10, 2)), CAST(N'2015-09-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14320, 1010, 2, 10, 2015, CAST(1423.34 AS Decimal(10, 2)), CAST(N'2015-10-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14321, 1010, 2, 10, 2015, CAST(1371.18 AS Decimal(10, 2)), CAST(N'2015-10-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14322, 5, 1, 11, 2015, CAST(2324.65 AS Decimal(10, 2)), CAST(N'2015-11-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14323, 5, 1, 11, 2015, CAST(2324.65 AS Decimal(10, 2)), CAST(N'2015-11-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14324, 1010, 2, 11, 2015, CAST(1360.30 AS Decimal(10, 2)), CAST(N'2015-11-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14325, 1010, 2, 11, 2015, CAST(1369.77 AS Decimal(10, 2)), CAST(N'2015-11-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14326, 5, 1, 12, 2015, CAST(2324.64 AS Decimal(10, 2)), CAST(N'2015-12-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14327, 5, 1, 12, 2015, CAST(2324.65 AS Decimal(10, 2)), CAST(N'2015-12-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14328, 5, 1, 12, 2015, CAST(2324.65 AS Decimal(10, 2)), CAST(N'2015-12-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14329, 1010, 2, 12, 2015, CAST(1369.77 AS Decimal(10, 2)), CAST(N'2015-12-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14330, 1010, 2, 12, 2015, CAST(1369.78 AS Decimal(10, 2)), CAST(N'2015-12-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14331, 5, 1, 1, 2016, CAST(2524.92 AS Decimal(10, 2)), CAST(N'2016-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14332, 5, 1, 1, 2016, CAST(2524.92 AS Decimal(10, 2)), CAST(N'2016-01-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14333, 1010, 2, 1, 2016, CAST(1369.65 AS Decimal(10, 2)), CAST(N'2016-01-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14334, 1010, 2, 1, 2016, CAST(1369.66 AS Decimal(10, 2)), CAST(N'2016-01-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14335, 5, 1, 2, 2016, CAST(6785.20 AS Decimal(10, 2)), CAST(N'2016-02-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14336, 5, 1, 2, 2016, CAST(9131.71 AS Decimal(10, 2)), CAST(N'2016-02-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14337, 1010, 2, 2, 2016, CAST(1369.65 AS Decimal(10, 2)), CAST(N'2016-02-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14338, 1010, 2, 2, 2016, CAST(1290.30 AS Decimal(10, 2)), CAST(N'2016-02-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14339, 5, 1, 3, 2016, CAST(2543.57 AS Decimal(10, 2)), CAST(N'2016-03-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14340, 5, 1, 3, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-03-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14341, 1010, 2, 3, 2016, CAST(1290.31 AS Decimal(10, 2)), CAST(N'2016-03-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14342, 1010, 2, 3, 2016, CAST(1290.30 AS Decimal(10, 2)), CAST(N'2016-03-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14343, 5, 1, 4, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-04-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14344, 5, 1, 4, 2016, CAST(2587.28 AS Decimal(10, 2)), CAST(N'2016-04-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14345, 1010, 2, 4, 2016, CAST(1290.30 AS Decimal(10, 2)), CAST(N'2016-04-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14346, 1010, 2, 4, 2016, CAST(1290.31 AS Decimal(10, 2)), CAST(N'2016-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14347, 5, 1, 5, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-05-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14348, 5, 1, 5, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-05-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14349, 1010, 2, 5, 2016, CAST(1290.30 AS Decimal(10, 2)), CAST(N'2016-05-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14350, 1010, 2, 5, 2016, CAST(1309.98 AS Decimal(10, 2)), CAST(N'2016-05-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14351, 5, 1, 6, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-06-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14352, 5, 1, 6, 2016, CAST(2584.16 AS Decimal(10, 2)), CAST(N'2016-06-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14353, 1010, 2, 6, 2016, CAST(1290.31 AS Decimal(10, 2)), CAST(N'2016-06-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (14354, 1010, 2, 6, 2016, CAST(2478.78 AS Decimal(10, 2)), CAST(N'2016-06-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15351, 5, 1, 7, 2016, CAST(2584.17 AS Decimal(10, 2)), CAST(N'2016-07-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15352, 5, 1, 7, 2016, CAST(2484.13 AS Decimal(10, 2)), CAST(N'2016-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15353, 5, 1, 7, 2016, CAST(2481.02 AS Decimal(10, 2)), CAST(N'2016-07-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15354, 1010, 2, 7, 2016, CAST(1518.09 AS Decimal(10, 2)), CAST(N'2016-07-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15355, 1010, 2, 7, 2016, CAST(1518.09 AS Decimal(10, 2)), CAST(N'2016-07-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15356, 9, 2, 7, 2016, CAST(28.32 AS Decimal(10, 2)), CAST(N'2016-07-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15357, 9, 2, 7, 2016, CAST(163.33 AS Decimal(10, 2)), CAST(N'2016-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15358, 5, 1, 8, 2016, CAST(2481.02 AS Decimal(10, 2)), CAST(N'2016-08-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15359, 5, 1, 8, 2016, CAST(2481.01 AS Decimal(10, 2)), CAST(N'2016-08-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15360, 1010, 2, 8, 2016, CAST(1518.09 AS Decimal(10, 2)), CAST(N'2016-08-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15361, 1010, 2, 8, 2016, CAST(1518.10 AS Decimal(10, 2)), CAST(N'2016-08-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15362, 9, 2, 8, 2016, CAST(151.67 AS Decimal(10, 2)), CAST(N'2016-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15363, 5, 1, 9, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-09-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15364, 5, 1, 9, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-09-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15365, 1010, 2, 9, 2016, CAST(1518.06 AS Decimal(10, 2)), CAST(N'2016-09-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15366, 9, 2, 9, 2016, CAST(1198.29 AS Decimal(10, 2)), CAST(N'2016-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15367, 9, 2, 9, 2016, CAST(1548.43 AS Decimal(10, 2)), CAST(N'2016-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15368, 5, 1, 11, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-11-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15369, 5, 1, 11, 2016, CAST(2570.11 AS Decimal(10, 2)), CAST(N'2016-11-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15370, 9, 2, 11, 2016, CAST(1063.24 AS Decimal(10, 2)), CAST(N'2016-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15371, 9, 2, 11, 2016, CAST(1413.97 AS Decimal(10, 2)), CAST(N'2016-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15372, 5, 1, 10, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-10-07' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15373, 5, 1, 10, 2016, CAST(2573.53 AS Decimal(10, 2)), CAST(N'2016-10-21' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15374, 1010, 2, 10, 2016, CAST(84.85 AS Decimal(10, 2)), CAST(N'2016-10-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15375, 9, 2, 10, 2016, CAST(1150.40 AS Decimal(10, 2)), CAST(N'2016-10-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15376, 9, 2, 10, 2016, CAST(1413.97 AS Decimal(10, 2)), CAST(N'2016-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15377, 5, 1, 12, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-12-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15378, 5, 1, 12, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-12-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15379, 5, 1, 12, 2016, CAST(2570.10 AS Decimal(10, 2)), CAST(N'2016-12-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15380, 9, 2, 12, 2016, CAST(1063.24 AS Decimal(10, 2)), CAST(N'2016-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15381, 9, 2, 12, 2016, CAST(1413.97 AS Decimal(10, 2)), CAST(N'2016-12-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15382, 5, 1, 1, 2017, CAST(2588.43 AS Decimal(10, 2)), CAST(N'2017-01-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15383, 5, 1, 1, 2017, CAST(2589.34 AS Decimal(10, 2)), CAST(N'2017-01-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15384, 9, 2, 1, 2017, CAST(1064.32 AS Decimal(10, 2)), CAST(N'2017-01-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15385, 9, 2, 1, 2017, CAST(1415.08 AS Decimal(10, 2)), CAST(N'2017-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15386, 5, 1, 2, 2017, CAST(2495.88 AS Decimal(10, 2)), CAST(N'2017-02-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15387, 5, 1, 2, 2017, CAST(14410.90 AS Decimal(10, 2)), CAST(N'2017-02-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15388, 9, 2, 2, 2017, CAST(1064.32 AS Decimal(10, 2)), CAST(N'2017-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15389, 9, 2, 2, 2017, CAST(1415.08 AS Decimal(10, 2)), CAST(N'2017-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15390, 5, 1, 3, 2017, CAST(2524.82 AS Decimal(10, 2)), CAST(N'2017-03-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15391, 5, 1, 3, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-03-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15392, 9, 2, 3, 2017, CAST(1064.32 AS Decimal(10, 2)), CAST(N'2017-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15393, 9, 2, 3, 2017, CAST(1415.07 AS Decimal(10, 2)), CAST(N'2017-03-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15394, 5, 1, 4, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-04-07' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15395, 5, 1, 4, 2017, CAST(2555.59 AS Decimal(10, 2)), CAST(N'2017-04-21' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15396, 9, 2, 4, 2017, CAST(1063.53 AS Decimal(10, 2)), CAST(N'2017-04-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15397, 9, 2, 4, 2017, CAST(1415.07 AS Decimal(10, 2)), CAST(N'2017-04-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15398, 5, 1, 5, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-05-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15399, 5, 1, 5, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-05-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15400, 9, 2, 5, 2017, CAST(1063.52 AS Decimal(10, 2)), CAST(N'2017-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (15401, 9, 2, 5, 2017, CAST(1415.08 AS Decimal(10, 2)), CAST(N'2017-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16398, 5, 1, 6, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-06-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16399, 5, 1, 6, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-06-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16400, 5, 1, 6, 2017, CAST(2553.01 AS Decimal(10, 2)), CAST(N'2017-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16401, 9, 2, 6, 2017, CAST(1119.81 AS Decimal(10, 2)), CAST(N'2017-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16402, 9, 2, 6, 2017, CAST(2239.98 AS Decimal(10, 2)), CAST(N'2017-06-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16403, 5, 1, 7, 2017, CAST(2555.59 AS Decimal(10, 2)), CAST(N'2017-07-14' AS Date))
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16404, 5, 1, 7, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-07-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16405, 9, 2, 7, 2017, CAST(1115.28 AS Decimal(10, 2)), CAST(N'2017-07-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16406, 9, 2, 7, 2017, CAST(1471.37 AS Decimal(10, 2)), CAST(N'2017-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16407, 5, 1, 8, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-08-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16408, 5, 1, 8, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-08-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16409, 9, 2, 8, 2017, CAST(1115.36 AS Decimal(10, 2)), CAST(N'2017-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16410, 9, 2, 8, 2017, CAST(1405.90 AS Decimal(10, 2)), CAST(N'2017-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16411, 5, 1, 9, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-09-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16412, 5, 1, 9, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-09-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16413, 9, 2, 9, 2017, CAST(1368.05 AS Decimal(10, 2)), CAST(N'2017-09-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16414, 9, 2, 9, 2017, CAST(1363.27 AS Decimal(10, 2)), CAST(N'2017-09-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16415, 5, 1, 10, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-10-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16416, 5, 1, 10, 2017, CAST(2555.77 AS Decimal(10, 2)), CAST(N'2017-10-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16417, 9, 2, 10, 2017, CAST(1147.71 AS Decimal(10, 2)), CAST(N'2017-10-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16418, 9, 2, 10, 2017, CAST(1307.61 AS Decimal(10, 2)), CAST(N'2017-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16419, 5, 1, 11, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-11-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16420, 5, 1, 11, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-11-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16421, 9, 2, 11, 2017, CAST(949.63 AS Decimal(10, 2)), CAST(N'2017-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16422, 9, 2, 11, 2017, CAST(1397.71 AS Decimal(10, 2)), CAST(N'2017-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16423, 5, 1, 12, 2017, CAST(2553.02 AS Decimal(10, 2)), CAST(N'2017-12-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16424, 5, 1, 12, 2017, CAST(2553.03 AS Decimal(10, 2)), CAST(N'2017-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16425, 5, 1, 12, 2017, CAST(2553.01 AS Decimal(10, 2)), CAST(N'2017-12-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16426, 9, 2, 12, 2017, CAST(949.62 AS Decimal(10, 2)), CAST(N'2017-12-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16427, 9, 2, 12, 2017, CAST(1307.62 AS Decimal(10, 2)), CAST(N'2017-12-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16428, 5, 1, 1, 2018, CAST(2554.14 AS Decimal(10, 2)), CAST(N'2018-01-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16429, 5, 1, 1, 2018, CAST(2624.62 AS Decimal(10, 2)), CAST(N'2018-01-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16430, 9, 2, 1, 2018, CAST(949.63 AS Decimal(10, 2)), CAST(N'2018-01-12' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16431, 9, 2, 1, 2018, CAST(1342.22 AS Decimal(10, 2)), CAST(N'2018-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16432, 5, 1, 2, 2018, CAST(2587.07 AS Decimal(10, 2)), CAST(N'2018-02-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16433, 5, 1, 2, 2018, CAST(14823.92 AS Decimal(10, 2)), CAST(N'2018-02-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16434, 9, 2, 2, 2018, CAST(977.77 AS Decimal(10, 2)), CAST(N'2018-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16435, 9, 2, 2, 2018, CAST(1342.22 AS Decimal(10, 2)), CAST(N'2018-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16436, 5, 1, 3, 2018, CAST(2586.37 AS Decimal(10, 2)), CAST(N'2018-03-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16437, 5, 1, 3, 2018, CAST(2616.11 AS Decimal(10, 2)), CAST(N'2018-03-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16438, 9, 2, 3, 2018, CAST(977.77 AS Decimal(10, 2)), CAST(N'2018-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16439, 9, 2, 3, 2018, CAST(1342.22 AS Decimal(10, 2)), CAST(N'2018-03-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16440, 5, 1, 4, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-04-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16441, 5, 1, 4, 2018, CAST(2566.59 AS Decimal(10, 2)), CAST(N'2018-04-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16442, 9, 2, 4, 2018, CAST(977.76 AS Decimal(10, 2)), CAST(N'2018-04-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16443, 9, 2, 4, 2018, CAST(1342.23 AS Decimal(10, 2)), CAST(N'2018-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16444, 5, 1, 5, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-05-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16445, 5, 1, 5, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-05-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16446, 9, 2, 5, 2018, CAST(977.76 AS Decimal(10, 2)), CAST(N'2018-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16447, 9, 2, 5, 2018, CAST(1342.23 AS Decimal(10, 2)), CAST(N'2018-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16448, 5, 1, 6, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-06-01' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16449, 5, 1, 6, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16450, 5, 1, 6, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-06-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16451, 9, 2, 6, 2018, CAST(1035.92 AS Decimal(10, 2)), CAST(N'2018-06-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16452, 9, 2, 6, 2018, CAST(2250.58 AS Decimal(10, 2)), CAST(N'2018-06-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16453, 5, 1, 7, 2018, CAST(2566.59 AS Decimal(10, 2)), CAST(N'2018-07-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16454, 5, 1, 7, 2018, CAST(2564.69 AS Decimal(10, 2)), CAST(N'2018-07-27' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16455, 9, 2, 7, 2018, CAST(1070.80 AS Decimal(10, 2)), CAST(N'2018-07-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16456, 9, 2, 7, 2018, CAST(1441.76 AS Decimal(10, 2)), CAST(N'2018-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16457, 5, 1, 8, 2018, CAST(2636.16 AS Decimal(10, 2)), CAST(N'2018-08-10' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16458, 5, 1, 8, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-08-24' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16459, 9, 2, 8, 2018, CAST(1070.80 AS Decimal(10, 2)), CAST(N'2018-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16460, 9, 2, 8, 2018, CAST(2997.10 AS Decimal(10, 2)), CAST(N'2018-08-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16461, 5, 1, 9, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-09-07' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16462, 5, 1, 9, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-09-21' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16463, 9, 2, 9, 2018, CAST(1328.68 AS Decimal(10, 2)), CAST(N'2018-09-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16464, 9, 2, 9, 2018, CAST(1582.97 AS Decimal(10, 2)), CAST(N'2018-09-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16465, 5, 1, 10, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-10-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16466, 5, 1, 10, 2018, CAST(2710.01 AS Decimal(10, 2)), CAST(N'2018-10-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16467, 9, 2, 10, 2018, CAST(1361.30 AS Decimal(10, 2)), CAST(N'2018-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16468, 9, 2, 10, 2018, CAST(1526.89 AS Decimal(10, 2)), CAST(N'2018-10-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16469, 5, 1, 11, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-11-02' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16470, 5, 1, 11, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-11-16' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16471, 5, 1, 11, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16472, 9, 2, 11, 2018, CAST(1157.38 AS Decimal(10, 2)), CAST(N'2018-11-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16473, 9, 2, 11, 2018, CAST(1526.89 AS Decimal(10, 2)), CAST(N'2018-11-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16474, 5, 1, 12, 2018, CAST(2707.65 AS Decimal(10, 2)), CAST(N'2018-12-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16475, 5, 1, 12, 2018, CAST(2707.66 AS Decimal(10, 2)), CAST(N'2018-12-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16476, 9, 2, 12, 2018, CAST(1157.38 AS Decimal(10, 2)), CAST(N'2018-12-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16477, 9, 2, 12, 2018, CAST(1526.87 AS Decimal(10, 2)), CAST(N'2018-12-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16478, 5, 1, 1, 2019, CAST(2707.69 AS Decimal(10, 2)), CAST(N'2019-01-11' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16479, 5, 1, 1, 2019, CAST(2705.32 AS Decimal(10, 2)), CAST(N'2019-01-25' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16480, 5, 1, 2, 2019, CAST(2705.30 AS Decimal(10, 2)), CAST(N'2019-02-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16481, 5, 1, 2, 2019, CAST(16188.70 AS Decimal(10, 2)), CAST(N'2019-02-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16482, 5, 1, 3, 2019, CAST(2738.25 AS Decimal(10, 2)), CAST(N'2019-03-08' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16483, 5, 1, 3, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-03-22' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16484, 9, 2, 1, 2019, CAST(1199.12 AS Decimal(10, 2)), CAST(N'2019-01-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16485, 9, 2, 1, 2019, CAST(1531.75 AS Decimal(10, 2)), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16486, 9, 2, 2, 2019, CAST(1199.12 AS Decimal(10, 2)), CAST(N'2019-02-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16487, 9, 2, 2, 2019, CAST(1531.75 AS Decimal(10, 2)), CAST(N'2019-02-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16488, 9, 2, 3, 2019, CAST(1199.12 AS Decimal(10, 2)), CAST(N'2019-03-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16489, 9, 2, 3, 2019, CAST(1531.75 AS Decimal(10, 2)), CAST(N'2019-03-29' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16490, 5, 1, 4, 2019, CAST(3063.58 AS Decimal(10, 2)), CAST(N'2019-04-05' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16491, 5, 1, 4, 2019, CAST(2875.88 AS Decimal(10, 2)), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16492, 9, 2, 4, 2019, CAST(1199.12 AS Decimal(10, 2)), CAST(N'2019-04-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16493, 9, 2, 4, 2019, CAST(1531.75 AS Decimal(10, 2)), CAST(N'2019-04-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16494, 5, 1, 5, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-05-03' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16495, 5, 1, 5, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-05-17' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16496, 5, 1, 5, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16497, 9, 2, 5, 2019, CAST(1199.12 AS Decimal(10, 2)), CAST(N'2019-05-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16498, 9, 2, 5, 2019, CAST(1552.74 AS Decimal(10, 2)), CAST(N'2019-05-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16499, 5, 1, 6, 2019, CAST(2874.70 AS Decimal(10, 2)), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16500, 5, 1, 6, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16501, 9, 2, 6, 2019, CAST(1278.69 AS Decimal(10, 2)), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16502, 9, 2, 6, 2019, CAST(2456.17 AS Decimal(10, 2)), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16503, 5, 1, 7, 2019, CAST(2875.87 AS Decimal(10, 2)), CAST(N'2019-07-12' AS Date))
GO
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16504, 5, 1, 7, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-07-26' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16505, 9, 2, 7, 2019, CAST(1459.04 AS Decimal(10, 2)), CAST(N'2019-07-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16506, 9, 2, 7, 2019, CAST(1801.09 AS Decimal(10, 2)), CAST(N'2019-07-31' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16507, 5, 1, 8, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-08-09' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16508, 5, 1, 8, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-08-23' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16509, 9, 2, 8, 2019, CAST(1307.61 AS Decimal(10, 2)), CAST(N'2019-08-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16510, 9, 2, 8, 2019, CAST(1692.84 AS Decimal(10, 2)), CAST(N'2019-08-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16511, 5, 1, 9, 2019, CAST(2874.69 AS Decimal(10, 2)), CAST(N'2019-09-06' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16512, 5, 1, 9, 2019, CAST(2874.70 AS Decimal(10, 2)), CAST(N'2019-09-20' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16513, 9, 2, 9, 2019, CAST(1355.92 AS Decimal(10, 2)), CAST(N'2019-09-13' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16514, 9, 2, 9, 2019, CAST(1659.93 AS Decimal(10, 2)), CAST(N'2019-09-30' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16515, 5, 1, 10, 2019, CAST(2887.54 AS Decimal(10, 2)), CAST(N'2019-10-04' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16516, 5, 1, 10, 2019, CAST(2888.89 AS Decimal(10, 2)), CAST(N'2019-10-18' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16517, 9, 2, 10, 2019, CAST(1465.25 AS Decimal(10, 2)), CAST(N'2019-10-15' AS Date))
INSERT [dbo].[income] ([income_pk], [income_source_id], [family_member_id], [month_id], [year_id], [income_amount], [income_recdate]) VALUES (16518, 9, 2, 10, 2019, CAST(1602.42 AS Decimal(10, 2)), CAST(N'2019-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[income] OFF
SET IDENTITY_INSERT [dbo].[income_sources] ON 

INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (1, N'CHS', N'Children Home Society', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (2, N'WFFB', N'Wells Fargo Financial Bank', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (3, N'LHS', N'Lennox High School', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (4, N'KIL', N'Killian Community College', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (5, N'USB', N'US Bank', 1)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (6, N'HLC', N'Huntington Learning Center', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (7, N'EHS', N'Eastview High School', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (8, N'MB', N'Mackin Books', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (9, N'BES', N'Burnsvill Eagan Savage 191', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (1009, N'SCL', N'Scott County Libraries', 0)
INSERT [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (1010, N'RAVE', N'Rosemount-Apple Valley-Eagan 196', 1)
SET IDENTITY_INSERT [dbo].[income_sources] OFF
SET IDENTITY_INSERT [dbo].[institutions] ON 

INSERT [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (1, N'Grace Preschool', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (2, N'Clarion University', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (4, N'Southview Elementry', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (1003, N'Mankato State', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[institutions] OFF
SET IDENTITY_INSERT [dbo].[insur_payments] ON 

INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (1, 2, 12, 2007, CAST(192.01 AS Decimal(10, 2)), CAST(N'2008-01-06' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (2, 2, 6, 2008, CAST(192.01 AS Decimal(10, 2)), CAST(N'2008-07-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (3, 1, 12, 2008, CAST(460.00 AS Decimal(10, 2)), CAST(N'2008-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4, 2, 12, 2008, CAST(340.00 AS Decimal(10, 2)), CAST(N'2008-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5, 1, 11, 2009, CAST(460.00 AS Decimal(10, 2)), CAST(N'2009-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (6, 2, 11, 2009, CAST(340.00 AS Decimal(10, 2)), CAST(N'2009-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (7, 1, 11, 2010, CAST(460.00 AS Decimal(10, 2)), CAST(N'2010-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (8, 2, 11, 2010, CAST(340.00 AS Decimal(10, 2)), CAST(N'2010-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (9, 1, 11, 2011, CAST(460.00 AS Decimal(10, 2)), CAST(N'2011-12-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (10, 2, 11, 2011, CAST(340.00 AS Decimal(10, 2)), CAST(N'2011-12-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (11, 1, 11, 2012, CAST(460.00 AS Decimal(10, 2)), CAST(N'2012-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (12, 2, 11, 2012, CAST(340.00 AS Decimal(10, 2)), CAST(N'2012-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (13, 4, 11, 2005, CAST(395.10 AS Decimal(10, 2)), CAST(N'2005-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (14, 3, 11, 2005, CAST(91.20 AS Decimal(10, 2)), CAST(N'2005-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (15, 5, 8, 2006, CAST(219.40 AS Decimal(10, 2)), CAST(N'2006-09-10' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (16, 4, 11, 2006, CAST(363.60 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (17, 5, 11, 2006, CAST(353.80 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (18, 4, 4, 2007, CAST(355.30 AS Decimal(10, 2)), CAST(N'2007-06-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (19, 5, 4, 2007, CAST(327.50 AS Decimal(10, 2)), CAST(N'2007-06-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (20, 4, 12, 2007, CAST(361.90 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (21, 5, 12, 2007, CAST(320.30 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (22, 4, 6, 2008, CAST(333.40 AS Decimal(10, 2)), CAST(N'2008-07-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (23, 5, 6, 2008, CAST(297.00 AS Decimal(10, 2)), CAST(N'2008-07-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (24, 4, 12, 2008, CAST(333.40 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (25, 5, 12, 2008, CAST(297.00 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (26, 4, 6, 2009, CAST(371.80 AS Decimal(10, 2)), CAST(N'2009-07-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (27, 5, 6, 2009, CAST(331.60 AS Decimal(10, 2)), CAST(N'2009-07-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (28, 4, 12, 2009, CAST(370.00 AS Decimal(10, 2)), CAST(N'2010-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (29, 5, 12, 2009, CAST(332.30 AS Decimal(10, 2)), CAST(N'2010-01-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (30, 6, 7, 2010, CAST(186.80 AS Decimal(10, 2)), CAST(N'2010-08-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (31, 5, 7, 2010, CAST(186.79 AS Decimal(10, 2)), CAST(N'2010-08-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (32, 6, 2, 2011, CAST(184.90 AS Decimal(10, 2)), CAST(N'2011-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (33, 5, 2, 2011, CAST(170.90 AS Decimal(10, 2)), CAST(N'2011-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (34, 6, 8, 2011, CAST(173.53 AS Decimal(10, 2)), CAST(N'2011-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (35, 5, 8, 2011, CAST(173.52 AS Decimal(10, 2)), CAST(N'2011-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (36, 6, 2, 2012, CAST(177.89 AS Decimal(10, 2)), CAST(N'2012-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (37, 5, 2, 2012, CAST(177.90 AS Decimal(10, 2)), CAST(N'2012-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (38, 6, 8, 2012, CAST(198.39 AS Decimal(10, 2)), CAST(N'2012-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (39, 5, 8, 2012, CAST(192.05 AS Decimal(10, 2)), CAST(N'2012-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (40, 1, 11, 2013, CAST(460.00 AS Decimal(10, 2)), CAST(N'2013-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (41, 2, 11, 2013, CAST(340.00 AS Decimal(10, 2)), CAST(N'2013-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (42, 5, 8, 2013, CAST(191.30 AS Decimal(10, 2)), CAST(N'2013-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (43, 6, 8, 2013, CAST(191.00 AS Decimal(10, 2)), CAST(N'2013-08-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (44, 5, 2, 2014, CAST(191.29 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (45, 6, 2, 2014, CAST(191.29 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (46, 5, 2, 2013, CAST(190.37 AS Decimal(10, 2)), CAST(N'2013-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (47, 6, 2, 2013, CAST(190.36 AS Decimal(10, 2)), CAST(N'2013-02-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (1040, 5, 8, 2014, CAST(228.38 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (1041, 7, 8, 2014, CAST(228.38 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (2040, 2, 11, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (2041, 1, 11, 2014, CAST(460.00 AS Decimal(10, 2)), CAST(N'2014-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (3040, 5, 12, 2014, CAST(14.91 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (3041, 6, 12, 2014, CAST(14.91 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4040, 5, 2, 2015, CAST(192.16 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4041, 7, 2, 2015, CAST(192.16 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4044, 7, 9, 2015, CAST(238.00 AS Decimal(10, 2)), CAST(N'2015-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4045, 5, 9, 2015, CAST(193.20 AS Decimal(10, 2)), CAST(N'2015-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (4046, 10, 9, 2015, CAST(248.00 AS Decimal(10, 2)), CAST(N'2015-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5042, 2, 11, 2015, CAST(148.75 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5043, 10, 2, 2016, CAST(410.30 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5044, 2, 8, 2016, CAST(148.75 AS Decimal(10, 2)), CAST(N'2016-11-27' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5045, 7, 8, 2016, CAST(238.00 AS Decimal(10, 2)), CAST(N'2016-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5046, 5, 8, 2016, CAST(177.70 AS Decimal(10, 2)), CAST(N'2016-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5047, 10, 8, 2016, CAST(238.00 AS Decimal(10, 2)), CAST(N'2016-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5049, 2, 11, 2016, CAST(340.00 AS Decimal(10, 2)), CAST(N'2016-12-30' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5050, 1, 11, 2016, CAST(460.00 AS Decimal(10, 2)), CAST(N'2016-12-30' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5052, 1007, 2, 2017, CAST(235.60 AS Decimal(10, 2)), CAST(N'2017-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5053, 7, 2, 2017, CAST(258.60 AS Decimal(10, 2)), CAST(N'2017-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5054, 10, 8, 2017, CAST(222.00 AS Decimal(10, 2)), CAST(N'2017-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5057, 2, 11, 2017, CAST(148.75 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5058, 1007, 11, 2017, CAST(118.75 AS Decimal(10, 2)), CAST(N'2017-12-02' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5059, 7, 11, 2017, CAST(130.55 AS Decimal(10, 2)), CAST(N'2017-12-02' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5061, 1, 12, 2017, CAST(460.00 AS Decimal(10, 2)), CAST(N'2017-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5062, 2, 12, 2017, CAST(340.00 AS Decimal(10, 2)), CAST(N'2017-12-31' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5063, 1007, 9, 2017, CAST(126.25 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5064, 7, 9, 2017, CAST(138.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5065, 1007, 2, 2018, CAST(258.40 AS Decimal(10, 2)), CAST(N'2018-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5066, 7, 2, 2018, CAST(274.10 AS Decimal(10, 2)), CAST(N'2018-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5068, 10, 8, 2018, CAST(242.00 AS Decimal(10, 2)), CAST(N'2018-09-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5070, 1007, 9, 2018, CAST(225.00 AS Decimal(10, 2)), CAST(N'2018-10-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5071, 7, 9, 2018, CAST(225.00 AS Decimal(10, 2)), CAST(N'2018-10-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5072, 2, 11, 2018, CAST(488.75 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5073, 1, 11, 2018, CAST(460.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5075, 7, 2, 2019, CAST(271.05 AS Decimal(10, 2)), CAST(N'2019-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5076, 1007, 2, 2019, CAST(271.05 AS Decimal(10, 2)), CAST(N'2019-03-15' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5077, 10, 9, 2019, CAST(305.00 AS Decimal(10, 2)), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5078, 1007, 9, 2019, CAST(264.70 AS Decimal(10, 2)), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5079, 7, 9, 2019, CAST(271.90 AS Decimal(10, 2)), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5080, 1, 11, 2019, CAST(460.00 AS Decimal(10, 2)), CAST(N'2019-12-01' AS Date))
INSERT [dbo].[insur_payments] ([insur_payment_pk], [insur_id], [month_id], [year_id], [amount], [duedate]) VALUES (5081, 2, 11, 2019, CAST(508.75 AS Decimal(10, 2)), CAST(N'2019-12-01' AS Date))
SET IDENTITY_INSERT [dbo].[insur_payments] OFF
SET IDENTITY_INSERT [dbo].[insurance] ON 

INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (1, 3, N'Andy-Life', NULL, NULL, 1)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (2, 3, N'Katie-Life', NULL, NULL, 1)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (3, 2, N'LHS', NULL, 1, 0)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (4, 2, N'Grand Am', NULL, 2, 0)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (5, 2, N'Torrent', NULL, 3, 0)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (6, 2, N'Uplander', NULL, 3, 0)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (7, 2, N'Caravan', NULL, 5, 1)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (10, 4, N'Umbrella', 3, NULL, 1)
INSERT [dbo].[insurance] ([insur_pk], [insur_type_id], [insur_alias], [property_id], [vehicle_id], [active]) VALUES (1007, 2, N'Ram', NULL, 1005, 1)
SET IDENTITY_INSERT [dbo].[insurance] OFF
SET IDENTITY_INSERT [dbo].[insurance_types] ON 

INSERT [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (1, N'Home', 1)
INSERT [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (2, N'Auto', 1)
INSERT [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (3, N'Term Life', 1)
INSERT [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (4, N'Umbrella', 1)
SET IDENTITY_INSERT [dbo].[insurance_types] OFF
SET IDENTITY_INSERT [dbo].[join_insur_family_member] ON 

INSERT [dbo].[join_insur_family_member] ([join_pk], [insur_id], [family_member_id]) VALUES (1, 1, 1)
INSERT [dbo].[join_insur_family_member] ([join_pk], [insur_id], [family_member_id]) VALUES (2, 2, 2)
INSERT [dbo].[join_insur_family_member] ([join_pk], [insur_id], [family_member_id]) VALUES (3, 5, 1)
INSERT [dbo].[join_insur_family_member] ([join_pk], [insur_id], [family_member_id]) VALUES (4, 6, 2)
SET IDENTITY_INSERT [dbo].[join_insur_family_member] OFF
SET IDENTITY_INSERT [dbo].[join_loan_family_member] ON 

INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (1, 1, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (2, 1, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (3, 2, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (4, 2, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (5, 3, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (6, 3, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (7, 4, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (8, 4, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (9, 5, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (10, 5, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (11, 6, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (12, 7, 2)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (13, 8, 1)
INSERT [dbo].[join_loan_family_member] ([join_pk], [loan_id], [family_member_id]) VALUES (14, 8, 2)
SET IDENTITY_INSERT [dbo].[join_loan_family_member] OFF
SET IDENTITY_INSERT [dbo].[join_tag_tag_types] ON 

INSERT [dbo].[join_tag_tag_types] ([join_pk], [tag_id], [tag_type_id]) VALUES (1, 1, 1)
INSERT [dbo].[join_tag_tag_types] ([join_pk], [tag_id], [tag_type_id]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[join_tag_tag_types] OFF
SET IDENTITY_INSERT [dbo].[join_vehicle_expense_tag] ON 

INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (1, 1, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (2, 2, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (3, 3, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (4, 4, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (5, 5, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (6, 6, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (7, 7, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (8, 8, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (9, 9, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (10, 10, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (11, 11, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (12, 12, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (13, 13, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (14, 14, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (15, 15, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (16, 16, 1)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (17, 17, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (18, 18, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (19, 19, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (20, 20, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (21, 21, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (22, 22, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (23, 23, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (24, 24, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (25, 25, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (26, 26, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (27, 27, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (28, 28, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (29, 29, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (30, 30, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (31, 31, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (32, 32, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (33, 33, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (34, 34, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (35, 35, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (36, 36, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (37, 37, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (38, 38, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (39, 39, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (40, 40, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (41, 41, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (42, 42, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (43, 43, 2)
INSERT [dbo].[join_vehicle_expense_tag] ([join_pk], [vehicle_expense_id], [tag_id]) VALUES (44, 44, 2)
SET IDENTITY_INSERT [dbo].[join_vehicle_expense_tag] OFF
SET IDENTITY_INSERT [dbo].[loan] ON 

INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (1, 1, N'Wilson Ave', 1, NULL, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (2, 2, N'Wilson Ave 2nd', 1, NULL, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (3, 1, N'Lowell Dr', 2, NULL, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (4, 4, N'Grand Am', NULL, 2, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (5, 4, N'Torrent', NULL, 3, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (6, 5, N'Katie-Augie', NULL, NULL, 1)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (7, 5, N'Katie-Clarion', NULL, NULL, 0)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (8, 1, N'Louisiana Ave', 3, NULL, 1)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (9, 4, N'Caravan', NULL, 5, 1)
INSERT [dbo].[loan] ([loan_pk], [loan_type_id], [loan_alias], [property_id], [vehicle_id], [active]) VALUES (1002, 4, N'Ram', NULL, 1005, 1)
SET IDENTITY_INSERT [dbo].[loan] OFF
SET IDENTITY_INSERT [dbo].[loan_payments] ON 

INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (1, 1, 1, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-02-03' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (2, 1, 2, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (3, 1, 3, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (4, 1, 4, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (5, 1, 5, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-06-04' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (6, 1, 6, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-07-04' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7, 1, 7, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (8, 1, 8, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (9, 1, 9, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (10, 1, 10, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11, 1, 11, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2005-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12, 1, 12, 2005, CAST(644.83 AS Decimal(10, 2)), CAST(N'2006-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13, 1, 1, 2006, CAST(644.83 AS Decimal(10, 2)), CAST(N'2006-02-03' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14, 1, 2, 2006, CAST(755.44 AS Decimal(10, 2)), CAST(N'2006-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15, 1, 3, 2006, CAST(755.44 AS Decimal(10, 2)), CAST(N'2006-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16, 1, 4, 2006, CAST(755.44 AS Decimal(10, 2)), CAST(N'2006-05-03' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17, 1, 5, 2006, CAST(755.44 AS Decimal(10, 2)), CAST(N'2006-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (18, 1, 6, 2006, CAST(1133.16 AS Decimal(10, 2)), CAST(N'2006-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (19, 1, 7, 2006, CAST(761.52 AS Decimal(10, 2)), CAST(N'2006-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (20, 1, 8, 2006, CAST(761.52 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (21, 1, 9, 2006, CAST(761.52 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (22, 1, 10, 2006, CAST(761.52 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (23, 1, 11, 2006, CAST(761.52 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (24, 1, 12, 2006, CAST(1142.28 AS Decimal(10, 2)), CAST(N'2007-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (25, 1, 1, 2007, CAST(761.52 AS Decimal(10, 2)), CAST(N'2007-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (26, 1, 2, 2007, CAST(761.52 AS Decimal(10, 2)), CAST(N'2007-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (27, 1, 3, 2007, CAST(761.52 AS Decimal(10, 2)), CAST(N'2007-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (28, 1, 4, 2007, CAST(761.52 AS Decimal(10, 2)), CAST(N'2007-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (29, 1, 5, 2007, CAST(761.52 AS Decimal(10, 2)), CAST(N'2007-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (30, 2, 1, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-01-31' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (31, 2, 2, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-02-22' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (32, 2, 3, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-03-22' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (33, 2, 4, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (34, 2, 5, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (35, 2, 6, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (36, 2, 7, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (37, 2, 8, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (38, 2, 9, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (39, 2, 10, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (40, 2, 11, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (41, 2, 12, 2005, CAST(300.00 AS Decimal(10, 2)), CAST(N'2005-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (42, 2, 1, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (43, 2, 2, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (44, 2, 3, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (45, 2, 4, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (46, 2, 5, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (47, 2, 6, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (48, 2, 7, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (49, 2, 8, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (50, 2, 9, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (51, 2, 10, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (52, 2, 11, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (53, 2, 12, 2006, CAST(300.00 AS Decimal(10, 2)), CAST(N'2006-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (54, 2, 1, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (55, 2, 2, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (56, 2, 3, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (57, 2, 4, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (58, 2, 5, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (59, 2, 6, 2007, CAST(300.00 AS Decimal(10, 2)), CAST(N'2007-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (60, 3, 6, 2007, CAST(1456.89 AS Decimal(10, 2)), CAST(N'2007-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (61, 3, 7, 2007, CAST(1456.89 AS Decimal(10, 2)), CAST(N'2007-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (62, 3, 8, 2007, CAST(1456.89 AS Decimal(10, 2)), CAST(N'2007-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (63, 3, 9, 2007, CAST(1456.89 AS Decimal(10, 2)), CAST(N'2007-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (64, 3, 10, 2007, CAST(1456.89 AS Decimal(10, 2)), CAST(N'2007-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (65, 3, 11, 2007, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2007-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (66, 3, 12, 2007, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (67, 3, 1, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (68, 3, 2, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (69, 3, 3, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (70, 3, 4, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (71, 3, 5, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (72, 3, 6, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (73, 3, 7, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (74, 3, 8, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (75, 3, 9, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (76, 3, 10, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (77, 3, 11, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (78, 3, 12, 2008, CAST(1578.30 AS Decimal(10, 2)), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (79, 3, 1, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (80, 3, 2, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (81, 3, 3, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (82, 3, 4, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (83, 3, 5, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (84, 3, 6, 2009, CAST(1495.75 AS Decimal(10, 2)), CAST(N'2009-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (85, 3, 7, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2009-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (86, 3, 8, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2009-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (87, 3, 9, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2009-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (88, 3, 10, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2009-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (89, 3, 11, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2009-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (90, 3, 12, 2009, CAST(1286.50 AS Decimal(10, 2)), CAST(N'2010-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (91, 3, 1, 2010, CAST(1393.71 AS Decimal(10, 2)), CAST(N'2010-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (92, 3, 2, 2010, CAST(1393.71 AS Decimal(10, 2)), CAST(N'2010-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (93, 3, 3, 2010, CAST(1393.71 AS Decimal(10, 2)), CAST(N'2010-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (94, 3, 4, 2010, CAST(1393.71 AS Decimal(10, 2)), CAST(N'2010-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (95, 3, 5, 2010, CAST(1393.71 AS Decimal(10, 2)), CAST(N'2010-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (96, 3, 6, 2010, CAST(2092.86 AS Decimal(10, 2)), CAST(N'2010-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (97, 3, 7, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (98, 3, 8, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (99, 3, 9, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-10-01' AS Date))
GO
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (100, 3, 10, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (101, 3, 11, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (102, 3, 12, 2010, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2010-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (103, 3, 1, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (104, 3, 2, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (105, 3, 3, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (106, 3, 4, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (107, 3, 5, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (108, 3, 6, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (109, 3, 7, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (110, 3, 8, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (111, 3, 9, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (112, 3, 10, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (113, 3, 11, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2011-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (114, 3, 12, 2011, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (115, 3, 1, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (116, 3, 2, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (117, 3, 3, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (118, 3, 4, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (119, 3, 5, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (120, 3, 6, 2012, CAST(1414.17 AS Decimal(10, 2)), CAST(N'2012-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (121, 3, 7, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2012-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (122, 3, 8, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2012-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (123, 3, 9, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2012-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (124, 3, 10, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2012-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (125, 3, 11, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2012-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (126, 3, 12, 2012, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (127, 3, 1, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (128, 3, 2, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (129, 3, 3, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-04-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (130, 3, 4, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (131, 4, 1, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (132, 4, 2, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (133, 4, 3, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (134, 4, 4, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (135, 4, 5, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (136, 4, 6, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (137, 4, 7, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (138, 4, 8, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (139, 4, 9, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (140, 4, 10, 2005, CAST(186.30 AS Decimal(10, 2)), CAST(N'2005-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (141, 5, 8, 2006, CAST(280.26 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (142, 5, 9, 2006, CAST(280.26 AS Decimal(10, 2)), CAST(N'2006-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (143, 5, 10, 2006, CAST(280.26 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (144, 5, 11, 2006, CAST(280.26 AS Decimal(10, 2)), CAST(N'2006-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (145, 5, 12, 2006, CAST(280.26 AS Decimal(10, 2)), CAST(N'2006-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (146, 5, 1, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-02-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (147, 5, 2, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (148, 5, 3, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (149, 5, 4, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (150, 5, 5, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (151, 5, 6, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (152, 5, 7, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (153, 5, 8, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (154, 5, 9, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (155, 5, 10, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (156, 5, 11, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (157, 5, 12, 2007, CAST(280.26 AS Decimal(10, 2)), CAST(N'2007-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (158, 5, 1, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (159, 5, 2, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-03-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (160, 5, 3, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (161, 5, 4, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (162, 5, 5, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (163, 5, 6, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (164, 5, 7, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (165, 5, 8, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (166, 5, 9, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (167, 5, 10, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (168, 5, 11, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (169, 5, 12, 2008, CAST(280.26 AS Decimal(10, 2)), CAST(N'2008-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (170, 5, 1, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (171, 5, 2, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (172, 5, 3, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (173, 5, 4, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (174, 5, 5, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (175, 5, 6, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (176, 5, 7, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (177, 5, 8, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (178, 5, 9, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (179, 5, 10, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (180, 5, 11, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (181, 5, 12, 2009, CAST(280.26 AS Decimal(10, 2)), CAST(N'2009-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (182, 5, 1, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (183, 5, 2, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (184, 5, 3, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (185, 5, 4, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (186, 5, 5, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (187, 5, 6, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (188, 5, 7, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (189, 5, 8, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (190, 5, 9, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (191, 5, 10, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (192, 5, 11, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (193, 5, 12, 2010, CAST(280.26 AS Decimal(10, 2)), CAST(N'2010-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (194, 5, 1, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (195, 5, 2, 2011, CAST(280.26 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (196, 5, 3, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (197, 5, 4, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (198, 5, 5, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (199, 5, 6, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-07-20' AS Date))
GO
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (200, 5, 7, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (201, 5, 8, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (202, 5, 9, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (203, 5, 10, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (204, 5, 11, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2011-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (205, 5, 12, 2011, CAST(280.26 AS Decimal(10, 2)), CAST(N'2012-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (206, 5, 1, 2012, CAST(280.26 AS Decimal(10, 2)), CAST(N'2012-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (207, 5, 2, 2012, CAST(1401.30 AS Decimal(10, 2)), CAST(N'2012-02-29' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (208, 6, 1, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (209, 6, 2, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (210, 6, 3, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (211, 6, 4, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (212, 6, 5, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (213, 6, 6, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (214, 6, 7, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (215, 6, 8, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (216, 6, 9, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (217, 6, 10, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (218, 6, 11, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (219, 6, 12, 2005, CAST(137.16 AS Decimal(10, 2)), CAST(N'2005-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (220, 6, 1, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (221, 6, 2, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (222, 6, 3, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (223, 6, 4, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (224, 6, 5, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (225, 6, 6, 2006, CAST(137.16 AS Decimal(10, 2)), CAST(N'2006-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (226, 6, 7, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (227, 6, 8, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (228, 6, 9, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (229, 6, 10, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (230, 6, 11, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (231, 6, 12, 2006, CAST(68.58 AS Decimal(10, 2)), CAST(N'2006-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (232, 6, 1, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (233, 6, 2, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (234, 6, 3, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (235, 6, 4, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (236, 6, 5, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (237, 6, 6, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (238, 6, 7, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (239, 6, 8, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (240, 6, 9, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (241, 6, 10, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (242, 6, 11, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (243, 6, 12, 2007, CAST(68.58 AS Decimal(10, 2)), CAST(N'2007-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (244, 6, 1, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (245, 6, 2, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (246, 6, 3, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (247, 6, 4, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (248, 6, 5, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (249, 6, 6, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (250, 6, 7, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (251, 6, 8, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (252, 6, 9, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (253, 6, 10, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (254, 6, 11, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (255, 6, 12, 2008, CAST(68.58 AS Decimal(10, 2)), CAST(N'2008-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (256, 6, 1, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (257, 6, 2, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (258, 6, 3, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (259, 6, 4, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (260, 6, 5, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (261, 6, 6, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (262, 6, 7, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (263, 6, 8, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (264, 6, 9, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (265, 6, 12, 2009, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (266, 6, 1, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2009-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (267, 6, 2, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (268, 6, 3, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (269, 6, 4, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (270, 6, 5, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (271, 6, 6, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (272, 6, 7, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (273, 6, 8, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (274, 6, 9, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (275, 6, 10, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (276, 6, 11, 2010, CAST(68.58 AS Decimal(10, 2)), CAST(N'2010-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (277, 7, 11, 2010, CAST(68.19 AS Decimal(10, 2)), CAST(N'2010-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (278, 6, 12, 2010, CAST(68.58 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (279, 6, 1, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (280, 7, 1, 2011, CAST(68.19 AS Decimal(10, 2)), CAST(N'2011-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (281, 6, 2, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (282, 7, 2, 2011, CAST(68.19 AS Decimal(10, 2)), CAST(N'2011-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (283, 6, 3, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (284, 6, 4, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (285, 6, 5, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (286, 6, 6, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (287, 6, 7, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (288, 6, 8, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (289, 6, 9, 2011, CAST(68.58 AS Decimal(10, 2)), CAST(N'2011-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (290, 7, 10, 2011, CAST(70.00 AS Decimal(10, 2)), CAST(N'2011-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (291, 7, 11, 2011, CAST(111.02 AS Decimal(10, 2)), CAST(N'2011-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (292, 7, 12, 2011, CAST(111.02 AS Decimal(10, 2)), CAST(N'2011-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (293, 7, 1, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (294, 7, 2, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (295, 6, 3, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (296, 7, 3, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (297, 6, 4, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (298, 7, 4, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (299, 6, 5, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-05-20' AS Date))
GO
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (300, 7, 5, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (301, 6, 6, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (302, 7, 6, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (303, 6, 7, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-07-15' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (304, 7, 7, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-07-15' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (305, 6, 8, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (306, 7, 8, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (307, 6, 9, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (308, 7, 9, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (309, 6, 10, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (310, 7, 10, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (311, 6, 11, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (312, 7, 11, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (313, 6, 12, 2012, CAST(50.00 AS Decimal(10, 2)), CAST(N'2012-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (314, 7, 12, 2012, CAST(111.02 AS Decimal(10, 2)), CAST(N'2012-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (315, 6, 1, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (316, 7, 1, 2013, CAST(111.02 AS Decimal(10, 2)), CAST(N'2013-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (317, 6, 2, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (318, 7, 2, 2013, CAST(111.02 AS Decimal(10, 2)), CAST(N'2013-02-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (319, 6, 3, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-03-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (320, 7, 3, 2013, CAST(7716.13 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (321, 6, 4, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-04-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (322, 6, 5, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-05-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (323, 3, 5, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-06-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (324, 3, 6, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (325, 6, 6, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-06-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (326, 3, 7, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-08-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (327, 6, 7, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-07-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (328, 3, 8, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-09-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (329, 6, 8, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-08-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (330, 3, 9, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-10-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (331, 6, 9, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-09-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (332, 3, 10, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-11-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (333, 6, 10, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-10-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (334, 3, 11, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2013-12-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (335, 6, 11, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-11-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (336, 3, 12, 2013, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2014-01-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (337, 6, 12, 2013, CAST(50.00 AS Decimal(10, 2)), CAST(N'2013-12-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (338, 6, 1, 2014, CAST(50.00 AS Decimal(10, 2)), CAST(N'2014-01-20' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (339, 6, 2, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (340, 3, 2, 2014, CAST(1345.31 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (1321, 6, 3, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (1322, 3, 3, 2014, CAST(1345.31 AS Decimal(10, 2)), CAST(N'2014-05-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (1323, 6, 4, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (1324, 3, 4, 2014, CAST(1345.31 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (2323, 6, 5, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (2324, 3, 5, 2014, CAST(1345.31 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (3323, 8, 5, 2014, CAST(815.16 AS Decimal(10, 2)), CAST(N'2014-07-01' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (4323, 6, 6, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (4324, 8, 6, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (5323, 6, 7, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (5324, 8, 7, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (5325, 9, 7, 2014, CAST(125.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (5326, 3, 1, 2014, CAST(1434.30 AS Decimal(10, 2)), CAST(N'2014-03-02' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (6323, 6, 8, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (6324, 8, 8, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (6325, 9, 8, 2014, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7323, 6, 9, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7324, 9, 9, 2014, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7325, 8, 9, 2014, CAST(1780.62 AS Decimal(10, 2)), CAST(N'2014-11-02' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7326, 6, 10, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7327, 8, 10, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (7328, 9, 10, 2014, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (8326, 6, 11, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (8327, 8, 11, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (8328, 9, 11, 2014, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (9326, 6, 12, 2014, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (9327, 8, 12, 2014, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (9328, 9, 12, 2014, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (10326, 6, 1, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (10327, 8, 1, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (10328, 9, 1, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11326, 6, 2, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11327, 8, 2, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11328, 9, 2, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11329, 6, 3, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11330, 8, 3, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (11331, 9, 3, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12329, 6, 4, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12330, 8, 4, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12331, 9, 4, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12332, 6, 5, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12333, 8, 5, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (12334, 9, 5, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13329, 6, 6, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13330, 8, 6, 2015, CAST(1780.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13331, 9, 6, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13332, 6, 7, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13333, 8, 7, 2015, CAST(1869.38 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (13334, 9, 7, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14332, 6, 8, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14333, 8, 8, 2015, CAST(2737.58 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14334, 9, 8, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14335, 6, 9, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14336, 8, 9, 2015, CAST(1825.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (14337, 9, 9, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15332, 6, 10, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15333, 8, 10, 2015, CAST(1825.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15334, 9, 10, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15335, 6, 11, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15336, 8, 11, 2015, CAST(1825.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15337, 9, 11, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15338, 6, 12, 2015, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15339, 8, 12, 2015, CAST(1825.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15340, 9, 12, 2015, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15341, 6, 1, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15342, 8, 1, 2016, CAST(1825.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15343, 9, 1, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15344, 6, 2, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15345, 8, 2, 2016, CAST(2091.17 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15346, 9, 2, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15347, 6, 3, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15348, 8, 3, 2016, CAST(1958.11 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15349, 9, 3, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15350, 6, 4, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15351, 8, 4, 2016, CAST(1958.11 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15352, 9, 4, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15353, 6, 5, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15354, 8, 5, 2016, CAST(1958.11 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15355, 9, 5, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15356, 6, 6, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15357, 8, 6, 2016, CAST(1958.11 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (15358, 9, 6, 2016, CAST(250.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16356, 6, 7, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16357, 8, 7, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16358, 9, 7, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16359, 6, 8, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16360, 8, 8, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16361, 9, 8, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16362, 6, 9, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16363, 8, 9, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16364, 9, 9, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16365, 8, 11, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16366, 9, 11, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16367, 6, 11, 2016, CAST(50.00 AS Decimal(10, 2)), CAST(N'2016-12-15' AS Date))
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16368, 6, 10, 2016, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16369, 8, 10, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16370, 9, 10, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16371, 8, 12, 2016, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16372, 9, 12, 2016, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16373, 6, 12, 2016, CAST(831.77 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16374, 8, 1, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16375, 9, 1, 2017, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16376, 8, 2, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16377, 9, 2, 2017, CAST(3500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16378, 8, 3, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16379, 9, 3, 2017, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16380, 8, 4, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16381, 9, 4, 2017, CAST(1415.74 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16382, 1002, 4, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16383, 1002, 3, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16384, 8, 5, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (16385, 1002, 5, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17384, 8, 6, 2017, CAST(3861.60 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17385, 1002, 6, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17386, 8, 7, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17387, 1002, 7, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17388, 8, 8, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17389, 1002, 8, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17390, 8, 9, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17391, 1002, 9, 2017, CAST(285.71 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17392, 8, 10, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17393, 8, 11, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17394, 8, 12, 2017, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17395, 8, 1, 2018, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17396, 8, 2, 2018, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17397, 8, 3, 2018, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17398, 8, 4, 2018, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17399, 8, 5, 2018, CAST(1930.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17400, 8, 6, 2018, CAST(3896.74 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17401, 8, 7, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17402, 8, 8, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17403, 8, 9, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17404, 8, 10, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17405, 8, 11, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17406, 8, 12, 2018, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17407, 8, 1, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17408, 8, 2, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17409, 8, 3, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17410, 8, 4, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17411, 8, 5, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17412, 8, 6, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17413, 8, 7, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17414, 8, 8, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17415, 8, 9, 2019, CAST(1965.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[loan_payments] ([loan_payment_pk], [loan_id], [month_id], [year_id], [amount], [duedate]) VALUES (17416, 8, 10, 2019, CAST(1965.94 AS Decimal(10, 2)), CAST(N'2019-12-01' AS Date))
SET IDENTITY_INSERT [dbo].[loan_payments] OFF
SET IDENTITY_INSERT [dbo].[loan_types] ON 

INSERT [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (1, N'Mortgage', 1)
INSERT [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (2, N'2nd Mortgage', 1)
INSERT [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (3, N'Line of Credit', 1)
INSERT [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (4, N'Auto', 1)
INSERT [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (5, N'Student', 1)
SET IDENTITY_INSERT [dbo].[loan_types] OFF
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (1, N'Jan', N'January')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (2, N'Feb', N'February')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (3, N'Mar', N'March')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (4, N'Apr', N'April')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (5, N'May', N'May')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (6, N'Jun', N'June')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (7, N'Jul', N'July')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (8, N'Aug', N'August')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (9, N'Sep', N'September')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (10, N'Oct', N'October')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (11, N'Nov', N'November')
INSERT [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (12, N'Dec', N'December')
SET IDENTITY_INSERT [dbo].[properties] ON 

INSERT [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (1, N'Wilson Ave', N'4509 Wilson Ave', NULL, N'Sioux Falls', N'SD', N'57106', 0)
INSERT [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (2, N'Lowell Dr', N'1082 Lowell Dr', NULL, N'Apple Valley', N'MN', N'55124', 1)
INSERT [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (3, N'Louisiana Ave', N'13868 Louisiana Ave.', N'', N'Savage', N'MN', N'55378', 1)
SET IDENTITY_INSERT [dbo].[properties] OFF
SET IDENTITY_INSERT [dbo].[tag_types] ON 

INSERT [dbo].[tag_types] ([tag_type_pk], [tag_type_name]) VALUES (1, N'Auto')
SET IDENTITY_INSERT [dbo].[tag_types] OFF
SET IDENTITY_INSERT [dbo].[tags] ON 

INSERT [dbo].[tags] ([tag_pk], [tag_name]) VALUES (1, N'Tabs')
INSERT [dbo].[tags] ([tag_pk], [tag_name]) VALUES (2, N'Maintenance')
SET IDENTITY_INSERT [dbo].[tags] OFF
SET IDENTITY_INSERT [dbo].[tuition] ON 

INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (1, N'Karlee - Grace', 1, 3, 0)
INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (2, N'Katie - Clarion', 2, 2, 0)
INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (3, N'Camden - Grace', 1, 4, 0)
INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (4, N'Maggie - Grace', 1, 5, 0)
INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (5, N'Camden - Kinder', 4, 4, 0)
INSERT [dbo].[tuition] ([tuition_pk], [tuition_alias], [institution_id], [family_member_id], [active]) VALUES (1004, N'Katie - MSU', 1003, 2, 1)
SET IDENTITY_INSERT [dbo].[tuition] OFF
SET IDENTITY_INSERT [dbo].[tuition_payments] ON 

INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (1, 3, 9, 2012, CAST(195.00 AS Decimal(10, 2)), CAST(N'2012-09-12' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (2, 3, 10, 2012, CAST(160.00 AS Decimal(10, 2)), CAST(N'2012-10-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (3, 3, 11, 2012, CAST(160.00 AS Decimal(10, 2)), CAST(N'2012-11-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (4, 3, 12, 2012, CAST(160.00 AS Decimal(10, 2)), CAST(N'2012-12-04' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5, 3, 1, 2013, CAST(160.00 AS Decimal(10, 2)), CAST(N'2013-01-08' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (6, 3, 2, 2013, CAST(160.00 AS Decimal(10, 2)), CAST(N'2013-02-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (11, 3, 3, 2013, CAST(160.00 AS Decimal(10, 2)), CAST(N'2013-03-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (12, 3, 4, 2013, CAST(160.00 AS Decimal(10, 2)), CAST(N'2013-04-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (13, 3, 5, 2013, CAST(160.00 AS Decimal(10, 2)), CAST(N'2013-05-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (14, 3, 9, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-09-12' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (15, 3, 10, 2011, CAST(115.00 AS Decimal(10, 2)), CAST(N'2011-10-03' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (16, 3, 11, 2011, CAST(115.00 AS Decimal(10, 2)), CAST(N'2011-11-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (17, 3, 12, 2011, CAST(115.00 AS Decimal(10, 2)), CAST(N'2011-12-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (18, 3, 1, 2012, CAST(115.00 AS Decimal(10, 2)), CAST(N'2012-01-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (19, 3, 2, 2012, CAST(115.00 AS Decimal(10, 2)), CAST(N'2012-02-06' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (20, 3, 3, 2012, CAST(115.00 AS Decimal(10, 2)), CAST(N'2012-03-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (21, 3, 4, 2012, CAST(115.00 AS Decimal(10, 2)), CAST(N'2012-04-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (22, 3, 5, 2012, CAST(115.00 AS Decimal(10, 2)), CAST(N'2012-05-07' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (23, 2, 6, 2012, CAST(1653.21 AS Decimal(10, 2)), CAST(N'2012-07-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (24, 2, 8, 2012, CAST(1731.45 AS Decimal(10, 2)), CAST(N'2012-09-04' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (25, 1, 9, 2009, CAST(140.00 AS Decimal(10, 2)), CAST(N'2009-09-14' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (26, 1, 10, 2009, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-10-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (27, 1, 11, 2009, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-11-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (28, 1, 12, 2009, CAST(105.00 AS Decimal(10, 2)), CAST(N'2009-12-07' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (29, 1, 1, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-01-04' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (30, 1, 2, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-02-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (31, 1, 3, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-03-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (32, 1, 4, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-04-05' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (33, 1, 5, 2010, CAST(105.00 AS Decimal(10, 2)), CAST(N'2010-05-03' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (34, 1, 9, 2010, CAST(185.00 AS Decimal(10, 2)), CAST(N'2010-09-13' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (35, 1, 10, 2010, CAST(150.00 AS Decimal(10, 2)), CAST(N'2010-10-04' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (36, 1, 11, 2010, CAST(150.00 AS Decimal(10, 2)), CAST(N'2010-11-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (37, 1, 12, 2010, CAST(150.00 AS Decimal(10, 2)), CAST(N'2010-12-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (38, 1, 1, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-01-03' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (39, 1, 2, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-02-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (40, 1, 3, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-03-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (41, 1, 4, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-04-04' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (42, 1, 5, 2011, CAST(150.00 AS Decimal(10, 2)), CAST(N'2011-05-02' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (43, 5, 9, 2013, CAST(340.00 AS Decimal(10, 2)), CAST(N'2013-10-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (44, 4, 9, 2013, CAST(125.00 AS Decimal(10, 2)), CAST(N'2013-09-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (45, 5, 10, 2013, CAST(340.00 AS Decimal(10, 2)), CAST(N'2013-10-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (46, 4, 10, 2013, CAST(125.00 AS Decimal(10, 2)), CAST(N'2013-10-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (47, 5, 11, 2013, CAST(340.00 AS Decimal(10, 2)), CAST(N'2013-11-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (48, 4, 11, 2013, CAST(125.00 AS Decimal(10, 2)), CAST(N'2013-11-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (49, 5, 12, 2013, CAST(340.00 AS Decimal(10, 2)), CAST(N'2013-12-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (50, 4, 12, 2013, CAST(125.00 AS Decimal(10, 2)), CAST(N'2013-12-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (51, 5, 1, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-01-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (52, 4, 1, 2014, CAST(125.00 AS Decimal(10, 2)), CAST(N'2014-01-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (53, 5, 2, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-02-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (54, 4, 2, 2014, CAST(125.00 AS Decimal(10, 2)), CAST(N'2014-02-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (1043, 5, 3, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-03-14' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (1044, 4, 3, 2014, CAST(125.00 AS Decimal(10, 2)), CAST(N'2014-03-03' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (1045, 5, 4, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-04-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (1046, 4, 4, 2014, CAST(125.00 AS Decimal(10, 2)), CAST(N'2014-04-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (2045, 4, 5, 2014, CAST(125.00 AS Decimal(10, 2)), CAST(N'2014-05-01' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (3045, 5, 5, 2014, CAST(340.00 AS Decimal(10, 2)), CAST(N'2014-05-15' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (4045, 1004, 1, 2015, CAST(2430.48 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5045, 1004, 12, 2018, CAST(500.00 AS Decimal(10, 2)), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5046, 1004, 9, 2018, CAST(2839.64 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5047, 1004, 8, 2019, CAST(300.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5048, 1004, 6, 2019, CAST(2729.64 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5049, 1004, 2, 2019, CAST(2529.64 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5050, 1004, 5, 2019, CAST(300.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[tuition_payments] ([tuition_payment_pk], [tuition_id], [month_id], [year_id], [amount], [duedate]) VALUES (5051, 1004, 9, 2019, CAST(2844.84 AS Decimal(10, 2)), CAST(N'2019-10-01' AS Date))
SET IDENTITY_INSERT [dbo].[tuition_payments] OFF
SET IDENTITY_INSERT [dbo].[vehicle_expenses] ON 

INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (1, 2, 8, 2005, CAST(59.00 AS Decimal(10, 2)), CAST(N'2005-09-30' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (2, 1, 8, 2005, CAST(46.40 AS Decimal(10, 2)), CAST(N'2005-09-30' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (3, 2, 7, 2006, CAST(59.00 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (4, 3, 7, 2006, CAST(787.87 AS Decimal(10, 2)), CAST(N'2006-09-01' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (5, 2, 9, 2007, CAST(128.25 AS Decimal(10, 2)), CAST(N'2007-09-30' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6, 3, 9, 2007, CAST(220.25 AS Decimal(10, 2)), CAST(N'2007-09-30' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (7, 2, 7, 2008, CAST(200.25 AS Decimal(10, 2)), CAST(N'2008-08-01' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (8, 3, 7, 2008, CAST(110.25 AS Decimal(10, 2)), CAST(N'2008-08-01' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (9, 2, 7, 2009, CAST(103.00 AS Decimal(10, 2)), CAST(N'2009-08-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (10, 3, 7, 2009, CAST(202.00 AS Decimal(10, 2)), CAST(N'2009-08-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (11, 4, 1, 2010, CAST(254.00 AS Decimal(10, 2)), CAST(N'2010-02-16' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (12, 3, 7, 2010, CAST(176.00 AS Decimal(10, 2)), CAST(N'2010-08-01' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (13, 3, 8, 2011, CAST(146.75 AS Decimal(10, 2)), CAST(N'2011-08-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (14, 4, 11, 2011, CAST(198.50 AS Decimal(10, 2)), CAST(N'2011-12-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (15, 3, 8, 2012, CAST(118.75 AS Decimal(10, 2)), CAST(N'2012-08-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (16, 4, 11, 2012, CAST(163.75 AS Decimal(10, 2)), CAST(N'2012-12-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (17, 2, 1, 2006, CAST(257.93 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (18, 1, 1, 2006, CAST(223.65 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (19, 1, 2, 2006, CAST(33.77 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (20, 2, 6, 2006, CAST(22.86 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (21, 1, 6, 2006, CAST(302.21 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (22, 2, 11, 2006, CAST(633.49 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (23, 2, 4, 2007, CAST(25.69 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (24, 2, 7, 2007, CAST(80.82 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (25, 3, 7, 2007, CAST(30.82 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (26, 2, 8, 2007, CAST(29.97 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (27, 3, 8, 2007, CAST(29.98 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (28, 3, 12, 2007, CAST(12.60 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (29, 2, 4, 2008, CAST(358.25 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (30, 3, 4, 2008, CAST(14.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (31, 3, 7, 2008, CAST(12.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (32, 2, 1, 2009, CAST(23.57 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (33, 3, 1, 2009, CAST(23.56 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (34, 2, 5, 2009, CAST(12.62 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (35, 4, 1, 2010, CAST(82.45 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (36, 4, 2, 2010, CAST(5.78 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (37, 4, 4, 2010, CAST(181.69 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (38, 3, 7, 2010, CAST(12.66 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (39, 3, 11, 2010, CAST(12.66 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (40, 4, 12, 2010, CAST(326.14 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (41, 3, 5, 2011, CAST(19.27 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (42, 4, 9, 2011, CAST(138.02 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (43, 4, 10, 2011, CAST(732.53 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (44, 3, 10, 2011, CAST(732.54 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (45, 4, 11, 2013, CAST(134.15 AS Decimal(10, 2)), CAST(N'2013-12-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (46, 4, 11, 2013, CAST(35.16 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (48, 3, 7, 2013, CAST(91.15 AS Decimal(10, 2)), CAST(N'2013-08-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (49, 4, 1, 2014, CAST(56.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (1045, 3, 4, 2014, CAST(783.10 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (2045, 4, 5, 2014, CAST(42.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (2046, 3, 5, 2014, CAST(43.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (3045, 3, 7, 2014, CAST(73.15 AS Decimal(10, 2)), CAST(N'2014-08-29' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (4045, 5, 3, 2015, CAST(25.68 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (5045, 5, 5, 2015, CAST(324.00 AS Decimal(10, 2)), CAST(N'2015-05-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6045, 5, 5, 2016, CAST(290.00 AS Decimal(10, 2)), CAST(N'2016-05-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6046, 3, 10, 2016, CAST(1152.12 AS Decimal(10, 2)), NULL)
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6047, 5, 5, 2017, CAST(254.00 AS Decimal(10, 2)), CAST(N'2017-05-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6048, 1005, 1, 2018, CAST(275.00 AS Decimal(10, 2)), CAST(N'2018-01-31' AS Date))
INSERT [dbo].[vehicle_expenses] ([vehicle_expense_pk], [vehicle_id], [month_id], [year_id], [amount], [duedate]) VALUES (6049, 5, 5, 2018, CAST(219.00 AS Decimal(10, 2)), CAST(N'2018-05-31' AS Date))
SET IDENTITY_INSERT [dbo].[vehicle_expenses] OFF
SET IDENTITY_INSERT [dbo].[vehicles] ON 

INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (1, N'LHS', N'LHS', N'Chrysler', 1995, 0)
INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (2, N'Grand Am', N'Grand Am', N'Pontiac', 2003, 0)
INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (3, N'Torrent', N'Torrent', N'Pontiac', 2006, 0)
INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (4, N'Uplander', N'Uplander', N'Chevy', 2007, 1)
INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (5, N'Caravan', N'Grand Caravan', N'Dodge', 2014, 1)
INSERT [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (1005, N'Ram', N'Dodge Ram 1500', N'Dodge', 2014, 1)
SET IDENTITY_INSERT [dbo].[vehicles] OFF
INSERT [dbo].[years] ([year_pk]) VALUES (2000)
INSERT [dbo].[years] ([year_pk]) VALUES (2001)
INSERT [dbo].[years] ([year_pk]) VALUES (2002)
INSERT [dbo].[years] ([year_pk]) VALUES (2003)
INSERT [dbo].[years] ([year_pk]) VALUES (2004)
INSERT [dbo].[years] ([year_pk]) VALUES (2005)
INSERT [dbo].[years] ([year_pk]) VALUES (2006)
INSERT [dbo].[years] ([year_pk]) VALUES (2007)
INSERT [dbo].[years] ([year_pk]) VALUES (2008)
INSERT [dbo].[years] ([year_pk]) VALUES (2009)
INSERT [dbo].[years] ([year_pk]) VALUES (2010)
INSERT [dbo].[years] ([year_pk]) VALUES (2011)
INSERT [dbo].[years] ([year_pk]) VALUES (2012)
INSERT [dbo].[years] ([year_pk]) VALUES (2013)
INSERT [dbo].[years] ([year_pk]) VALUES (2014)
INSERT [dbo].[years] ([year_pk]) VALUES (2015)
INSERT [dbo].[years] ([year_pk]) VALUES (2016)
INSERT [dbo].[years] ([year_pk]) VALUES (2017)
INSERT [dbo].[years] ([year_pk]) VALUES (2018)
INSERT [dbo].[years] ([year_pk]) VALUES (2019)
INSERT [dbo].[years] ([year_pk]) VALUES (2020)
INSERT [dbo].[years] ([year_pk]) VALUES (2021)
INSERT [dbo].[years] ([year_pk]) VALUES (2022)
INSERT [dbo].[years] ([year_pk]) VALUES (2023)
INSERT [dbo].[years] ([year_pk]) VALUES (2024)
INSERT [dbo].[years] ([year_pk]) VALUES (2025)
INSERT [dbo].[years] ([year_pk]) VALUES (2026)
INSERT [dbo].[years] ([year_pk]) VALUES (2027)
INSERT [dbo].[years] ([year_pk]) VALUES (2028)
INSERT [dbo].[years] ([year_pk]) VALUES (2029)
INSERT [dbo].[years] ([year_pk]) VALUES (2030)
INSERT [dbo].[years] ([year_pk]) VALUES (2031)
INSERT [dbo].[years] ([year_pk]) VALUES (2032)
INSERT [dbo].[years] ([year_pk]) VALUES (2033)
INSERT [dbo].[years] ([year_pk]) VALUES (2034)
INSERT [dbo].[years] ([year_pk]) VALUES (2035)
INSERT [dbo].[years] ([year_pk]) VALUES (2036)
INSERT [dbo].[years] ([year_pk]) VALUES (2037)
INSERT [dbo].[years] ([year_pk]) VALUES (2038)
INSERT [dbo].[years] ([year_pk]) VALUES (2039)
INSERT [dbo].[years] ([year_pk]) VALUES (2040)
INSERT [dbo].[years] ([year_pk]) VALUES (2041)
INSERT [dbo].[years] ([year_pk]) VALUES (2042)
INSERT [dbo].[years] ([year_pk]) VALUES (2043)
INSERT [dbo].[years] ([year_pk]) VALUES (2044)
INSERT [dbo].[years] ([year_pk]) VALUES (2045)
INSERT [dbo].[years] ([year_pk]) VALUES (2046)
INSERT [dbo].[years] ([year_pk]) VALUES (2047)
INSERT [dbo].[years] ([year_pk]) VALUES (2048)
INSERT [dbo].[years] ([year_pk]) VALUES (2049)
INSERT [dbo].[years] ([year_pk]) VALUES (2050)
INSERT [dbo].[years] ([year_pk]) VALUES (2051)
INSERT [dbo].[years] ([year_pk]) VALUES (2052)
INSERT [dbo].[years] ([year_pk]) VALUES (2053)
INSERT [dbo].[years] ([year_pk]) VALUES (2054)
INSERT [dbo].[years] ([year_pk]) VALUES (2055)
INSERT [dbo].[years] ([year_pk]) VALUES (2056)
INSERT [dbo].[years] ([year_pk]) VALUES (2057)
INSERT [dbo].[years] ([year_pk]) VALUES (2058)
INSERT [dbo].[years] ([year_pk]) VALUES (2059)
INSERT [dbo].[years] ([year_pk]) VALUES (2060)
INSERT [dbo].[years] ([year_pk]) VALUES (2061)
INSERT [dbo].[years] ([year_pk]) VALUES (2062)
INSERT [dbo].[years] ([year_pk]) VALUES (2063)
INSERT [dbo].[years] ([year_pk]) VALUES (2064)
INSERT [dbo].[years] ([year_pk]) VALUES (2065)
INSERT [dbo].[years] ([year_pk]) VALUES (2066)
INSERT [dbo].[years] ([year_pk]) VALUES (2067)
INSERT [dbo].[years] ([year_pk]) VALUES (2068)
INSERT [dbo].[years] ([year_pk]) VALUES (2069)
INSERT [dbo].[years] ([year_pk]) VALUES (2070)
INSERT [dbo].[years] ([year_pk]) VALUES (2071)
INSERT [dbo].[years] ([year_pk]) VALUES (2072)
INSERT [dbo].[years] ([year_pk]) VALUES (2073)
INSERT [dbo].[years] ([year_pk]) VALUES (2074)
INSERT [dbo].[years] ([year_pk]) VALUES (2075)
INSERT [dbo].[years] ([year_pk]) VALUES (2076)
INSERT [dbo].[years] ([year_pk]) VALUES (2077)
INSERT [dbo].[years] ([year_pk]) VALUES (2078)
INSERT [dbo].[years] ([year_pk]) VALUES (2079)
INSERT [dbo].[years] ([year_pk]) VALUES (2080)
INSERT [dbo].[years] ([year_pk]) VALUES (2081)
INSERT [dbo].[years] ([year_pk]) VALUES (2082)
INSERT [dbo].[years] ([year_pk]) VALUES (2083)
INSERT [dbo].[years] ([year_pk]) VALUES (2084)
INSERT [dbo].[years] ([year_pk]) VALUES (2085)
INSERT [dbo].[years] ([year_pk]) VALUES (2086)
INSERT [dbo].[years] ([year_pk]) VALUES (2087)
INSERT [dbo].[years] ([year_pk]) VALUES (2088)
INSERT [dbo].[years] ([year_pk]) VALUES (2089)
INSERT [dbo].[years] ([year_pk]) VALUES (2090)
INSERT [dbo].[years] ([year_pk]) VALUES (2091)
INSERT [dbo].[years] ([year_pk]) VALUES (2092)
INSERT [dbo].[years] ([year_pk]) VALUES (2093)
INSERT [dbo].[years] ([year_pk]) VALUES (2094)
INSERT [dbo].[years] ([year_pk]) VALUES (2095)
INSERT [dbo].[years] ([year_pk]) VALUES (2096)
INSERT [dbo].[years] ([year_pk]) VALUES (2097)
INSERT [dbo].[years] ([year_pk]) VALUES (2098)
INSERT [dbo].[years] ([year_pk]) VALUES (2099)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2100)
INSERT [dbo].[years] ([year_pk]) VALUES (2101)
INSERT [dbo].[years] ([year_pk]) VALUES (2102)
INSERT [dbo].[years] ([year_pk]) VALUES (2103)
INSERT [dbo].[years] ([year_pk]) VALUES (2104)
INSERT [dbo].[years] ([year_pk]) VALUES (2105)
INSERT [dbo].[years] ([year_pk]) VALUES (2106)
INSERT [dbo].[years] ([year_pk]) VALUES (2107)
INSERT [dbo].[years] ([year_pk]) VALUES (2108)
INSERT [dbo].[years] ([year_pk]) VALUES (2109)
INSERT [dbo].[years] ([year_pk]) VALUES (2110)
INSERT [dbo].[years] ([year_pk]) VALUES (2111)
INSERT [dbo].[years] ([year_pk]) VALUES (2112)
INSERT [dbo].[years] ([year_pk]) VALUES (2113)
INSERT [dbo].[years] ([year_pk]) VALUES (2114)
INSERT [dbo].[years] ([year_pk]) VALUES (2115)
INSERT [dbo].[years] ([year_pk]) VALUES (2116)
INSERT [dbo].[years] ([year_pk]) VALUES (2117)
INSERT [dbo].[years] ([year_pk]) VALUES (2118)
INSERT [dbo].[years] ([year_pk]) VALUES (2119)
INSERT [dbo].[years] ([year_pk]) VALUES (2120)
INSERT [dbo].[years] ([year_pk]) VALUES (2121)
INSERT [dbo].[years] ([year_pk]) VALUES (2122)
INSERT [dbo].[years] ([year_pk]) VALUES (2123)
INSERT [dbo].[years] ([year_pk]) VALUES (2124)
INSERT [dbo].[years] ([year_pk]) VALUES (2125)
INSERT [dbo].[years] ([year_pk]) VALUES (2126)
INSERT [dbo].[years] ([year_pk]) VALUES (2127)
INSERT [dbo].[years] ([year_pk]) VALUES (2128)
INSERT [dbo].[years] ([year_pk]) VALUES (2129)
INSERT [dbo].[years] ([year_pk]) VALUES (2130)
INSERT [dbo].[years] ([year_pk]) VALUES (2131)
INSERT [dbo].[years] ([year_pk]) VALUES (2132)
INSERT [dbo].[years] ([year_pk]) VALUES (2133)
INSERT [dbo].[years] ([year_pk]) VALUES (2134)
INSERT [dbo].[years] ([year_pk]) VALUES (2135)
INSERT [dbo].[years] ([year_pk]) VALUES (2136)
INSERT [dbo].[years] ([year_pk]) VALUES (2137)
INSERT [dbo].[years] ([year_pk]) VALUES (2138)
INSERT [dbo].[years] ([year_pk]) VALUES (2139)
INSERT [dbo].[years] ([year_pk]) VALUES (2140)
INSERT [dbo].[years] ([year_pk]) VALUES (2141)
INSERT [dbo].[years] ([year_pk]) VALUES (2142)
INSERT [dbo].[years] ([year_pk]) VALUES (2143)
INSERT [dbo].[years] ([year_pk]) VALUES (2144)
INSERT [dbo].[years] ([year_pk]) VALUES (2145)
INSERT [dbo].[years] ([year_pk]) VALUES (2146)
INSERT [dbo].[years] ([year_pk]) VALUES (2147)
INSERT [dbo].[years] ([year_pk]) VALUES (2148)
INSERT [dbo].[years] ([year_pk]) VALUES (2149)
INSERT [dbo].[years] ([year_pk]) VALUES (2150)
INSERT [dbo].[years] ([year_pk]) VALUES (2151)
INSERT [dbo].[years] ([year_pk]) VALUES (2152)
INSERT [dbo].[years] ([year_pk]) VALUES (2153)
INSERT [dbo].[years] ([year_pk]) VALUES (2154)
INSERT [dbo].[years] ([year_pk]) VALUES (2155)
INSERT [dbo].[years] ([year_pk]) VALUES (2156)
INSERT [dbo].[years] ([year_pk]) VALUES (2157)
INSERT [dbo].[years] ([year_pk]) VALUES (2158)
INSERT [dbo].[years] ([year_pk]) VALUES (2159)
INSERT [dbo].[years] ([year_pk]) VALUES (2160)
INSERT [dbo].[years] ([year_pk]) VALUES (2161)
INSERT [dbo].[years] ([year_pk]) VALUES (2162)
INSERT [dbo].[years] ([year_pk]) VALUES (2163)
INSERT [dbo].[years] ([year_pk]) VALUES (2164)
INSERT [dbo].[years] ([year_pk]) VALUES (2165)
INSERT [dbo].[years] ([year_pk]) VALUES (2166)
INSERT [dbo].[years] ([year_pk]) VALUES (2167)
INSERT [dbo].[years] ([year_pk]) VALUES (2168)
INSERT [dbo].[years] ([year_pk]) VALUES (2169)
INSERT [dbo].[years] ([year_pk]) VALUES (2170)
INSERT [dbo].[years] ([year_pk]) VALUES (2171)
INSERT [dbo].[years] ([year_pk]) VALUES (2172)
INSERT [dbo].[years] ([year_pk]) VALUES (2173)
INSERT [dbo].[years] ([year_pk]) VALUES (2174)
INSERT [dbo].[years] ([year_pk]) VALUES (2175)
INSERT [dbo].[years] ([year_pk]) VALUES (2176)
INSERT [dbo].[years] ([year_pk]) VALUES (2177)
INSERT [dbo].[years] ([year_pk]) VALUES (2178)
INSERT [dbo].[years] ([year_pk]) VALUES (2179)
INSERT [dbo].[years] ([year_pk]) VALUES (2180)
INSERT [dbo].[years] ([year_pk]) VALUES (2181)
INSERT [dbo].[years] ([year_pk]) VALUES (2182)
INSERT [dbo].[years] ([year_pk]) VALUES (2183)
INSERT [dbo].[years] ([year_pk]) VALUES (2184)
INSERT [dbo].[years] ([year_pk]) VALUES (2185)
INSERT [dbo].[years] ([year_pk]) VALUES (2186)
INSERT [dbo].[years] ([year_pk]) VALUES (2187)
INSERT [dbo].[years] ([year_pk]) VALUES (2188)
INSERT [dbo].[years] ([year_pk]) VALUES (2189)
INSERT [dbo].[years] ([year_pk]) VALUES (2190)
INSERT [dbo].[years] ([year_pk]) VALUES (2191)
INSERT [dbo].[years] ([year_pk]) VALUES (2192)
INSERT [dbo].[years] ([year_pk]) VALUES (2193)
INSERT [dbo].[years] ([year_pk]) VALUES (2194)
INSERT [dbo].[years] ([year_pk]) VALUES (2195)
INSERT [dbo].[years] ([year_pk]) VALUES (2196)
INSERT [dbo].[years] ([year_pk]) VALUES (2197)
INSERT [dbo].[years] ([year_pk]) VALUES (2198)
INSERT [dbo].[years] ([year_pk]) VALUES (2199)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2200)
INSERT [dbo].[years] ([year_pk]) VALUES (2201)
INSERT [dbo].[years] ([year_pk]) VALUES (2202)
INSERT [dbo].[years] ([year_pk]) VALUES (2203)
INSERT [dbo].[years] ([year_pk]) VALUES (2204)
INSERT [dbo].[years] ([year_pk]) VALUES (2205)
INSERT [dbo].[years] ([year_pk]) VALUES (2206)
INSERT [dbo].[years] ([year_pk]) VALUES (2207)
INSERT [dbo].[years] ([year_pk]) VALUES (2208)
INSERT [dbo].[years] ([year_pk]) VALUES (2209)
INSERT [dbo].[years] ([year_pk]) VALUES (2210)
INSERT [dbo].[years] ([year_pk]) VALUES (2211)
INSERT [dbo].[years] ([year_pk]) VALUES (2212)
INSERT [dbo].[years] ([year_pk]) VALUES (2213)
INSERT [dbo].[years] ([year_pk]) VALUES (2214)
INSERT [dbo].[years] ([year_pk]) VALUES (2215)
INSERT [dbo].[years] ([year_pk]) VALUES (2216)
INSERT [dbo].[years] ([year_pk]) VALUES (2217)
INSERT [dbo].[years] ([year_pk]) VALUES (2218)
INSERT [dbo].[years] ([year_pk]) VALUES (2219)
INSERT [dbo].[years] ([year_pk]) VALUES (2220)
INSERT [dbo].[years] ([year_pk]) VALUES (2221)
INSERT [dbo].[years] ([year_pk]) VALUES (2222)
INSERT [dbo].[years] ([year_pk]) VALUES (2223)
INSERT [dbo].[years] ([year_pk]) VALUES (2224)
INSERT [dbo].[years] ([year_pk]) VALUES (2225)
INSERT [dbo].[years] ([year_pk]) VALUES (2226)
INSERT [dbo].[years] ([year_pk]) VALUES (2227)
INSERT [dbo].[years] ([year_pk]) VALUES (2228)
INSERT [dbo].[years] ([year_pk]) VALUES (2229)
INSERT [dbo].[years] ([year_pk]) VALUES (2230)
INSERT [dbo].[years] ([year_pk]) VALUES (2231)
INSERT [dbo].[years] ([year_pk]) VALUES (2232)
INSERT [dbo].[years] ([year_pk]) VALUES (2233)
INSERT [dbo].[years] ([year_pk]) VALUES (2234)
INSERT [dbo].[years] ([year_pk]) VALUES (2235)
INSERT [dbo].[years] ([year_pk]) VALUES (2236)
INSERT [dbo].[years] ([year_pk]) VALUES (2237)
INSERT [dbo].[years] ([year_pk]) VALUES (2238)
INSERT [dbo].[years] ([year_pk]) VALUES (2239)
INSERT [dbo].[years] ([year_pk]) VALUES (2240)
INSERT [dbo].[years] ([year_pk]) VALUES (2241)
INSERT [dbo].[years] ([year_pk]) VALUES (2242)
INSERT [dbo].[years] ([year_pk]) VALUES (2243)
INSERT [dbo].[years] ([year_pk]) VALUES (2244)
INSERT [dbo].[years] ([year_pk]) VALUES (2245)
INSERT [dbo].[years] ([year_pk]) VALUES (2246)
INSERT [dbo].[years] ([year_pk]) VALUES (2247)
INSERT [dbo].[years] ([year_pk]) VALUES (2248)
INSERT [dbo].[years] ([year_pk]) VALUES (2249)
INSERT [dbo].[years] ([year_pk]) VALUES (2250)
INSERT [dbo].[years] ([year_pk]) VALUES (2251)
INSERT [dbo].[years] ([year_pk]) VALUES (2252)
INSERT [dbo].[years] ([year_pk]) VALUES (2253)
INSERT [dbo].[years] ([year_pk]) VALUES (2254)
INSERT [dbo].[years] ([year_pk]) VALUES (2255)
INSERT [dbo].[years] ([year_pk]) VALUES (2256)
INSERT [dbo].[years] ([year_pk]) VALUES (2257)
INSERT [dbo].[years] ([year_pk]) VALUES (2258)
INSERT [dbo].[years] ([year_pk]) VALUES (2259)
INSERT [dbo].[years] ([year_pk]) VALUES (2260)
INSERT [dbo].[years] ([year_pk]) VALUES (2261)
INSERT [dbo].[years] ([year_pk]) VALUES (2262)
INSERT [dbo].[years] ([year_pk]) VALUES (2263)
INSERT [dbo].[years] ([year_pk]) VALUES (2264)
INSERT [dbo].[years] ([year_pk]) VALUES (2265)
INSERT [dbo].[years] ([year_pk]) VALUES (2266)
INSERT [dbo].[years] ([year_pk]) VALUES (2267)
INSERT [dbo].[years] ([year_pk]) VALUES (2268)
INSERT [dbo].[years] ([year_pk]) VALUES (2269)
INSERT [dbo].[years] ([year_pk]) VALUES (2270)
INSERT [dbo].[years] ([year_pk]) VALUES (2271)
INSERT [dbo].[years] ([year_pk]) VALUES (2272)
INSERT [dbo].[years] ([year_pk]) VALUES (2273)
INSERT [dbo].[years] ([year_pk]) VALUES (2274)
INSERT [dbo].[years] ([year_pk]) VALUES (2275)
INSERT [dbo].[years] ([year_pk]) VALUES (2276)
INSERT [dbo].[years] ([year_pk]) VALUES (2277)
INSERT [dbo].[years] ([year_pk]) VALUES (2278)
INSERT [dbo].[years] ([year_pk]) VALUES (2279)
INSERT [dbo].[years] ([year_pk]) VALUES (2280)
INSERT [dbo].[years] ([year_pk]) VALUES (2281)
INSERT [dbo].[years] ([year_pk]) VALUES (2282)
INSERT [dbo].[years] ([year_pk]) VALUES (2283)
INSERT [dbo].[years] ([year_pk]) VALUES (2284)
INSERT [dbo].[years] ([year_pk]) VALUES (2285)
INSERT [dbo].[years] ([year_pk]) VALUES (2286)
INSERT [dbo].[years] ([year_pk]) VALUES (2287)
INSERT [dbo].[years] ([year_pk]) VALUES (2288)
INSERT [dbo].[years] ([year_pk]) VALUES (2289)
INSERT [dbo].[years] ([year_pk]) VALUES (2290)
INSERT [dbo].[years] ([year_pk]) VALUES (2291)
INSERT [dbo].[years] ([year_pk]) VALUES (2292)
INSERT [dbo].[years] ([year_pk]) VALUES (2293)
INSERT [dbo].[years] ([year_pk]) VALUES (2294)
INSERT [dbo].[years] ([year_pk]) VALUES (2295)
INSERT [dbo].[years] ([year_pk]) VALUES (2296)
INSERT [dbo].[years] ([year_pk]) VALUES (2297)
INSERT [dbo].[years] ([year_pk]) VALUES (2298)
INSERT [dbo].[years] ([year_pk]) VALUES (2299)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2300)
INSERT [dbo].[years] ([year_pk]) VALUES (2301)
INSERT [dbo].[years] ([year_pk]) VALUES (2302)
INSERT [dbo].[years] ([year_pk]) VALUES (2303)
INSERT [dbo].[years] ([year_pk]) VALUES (2304)
INSERT [dbo].[years] ([year_pk]) VALUES (2305)
INSERT [dbo].[years] ([year_pk]) VALUES (2306)
INSERT [dbo].[years] ([year_pk]) VALUES (2307)
INSERT [dbo].[years] ([year_pk]) VALUES (2308)
INSERT [dbo].[years] ([year_pk]) VALUES (2309)
INSERT [dbo].[years] ([year_pk]) VALUES (2310)
INSERT [dbo].[years] ([year_pk]) VALUES (2311)
INSERT [dbo].[years] ([year_pk]) VALUES (2312)
INSERT [dbo].[years] ([year_pk]) VALUES (2313)
INSERT [dbo].[years] ([year_pk]) VALUES (2314)
INSERT [dbo].[years] ([year_pk]) VALUES (2315)
INSERT [dbo].[years] ([year_pk]) VALUES (2316)
INSERT [dbo].[years] ([year_pk]) VALUES (2317)
INSERT [dbo].[years] ([year_pk]) VALUES (2318)
INSERT [dbo].[years] ([year_pk]) VALUES (2319)
INSERT [dbo].[years] ([year_pk]) VALUES (2320)
INSERT [dbo].[years] ([year_pk]) VALUES (2321)
INSERT [dbo].[years] ([year_pk]) VALUES (2322)
INSERT [dbo].[years] ([year_pk]) VALUES (2323)
INSERT [dbo].[years] ([year_pk]) VALUES (2324)
INSERT [dbo].[years] ([year_pk]) VALUES (2325)
INSERT [dbo].[years] ([year_pk]) VALUES (2326)
INSERT [dbo].[years] ([year_pk]) VALUES (2327)
INSERT [dbo].[years] ([year_pk]) VALUES (2328)
INSERT [dbo].[years] ([year_pk]) VALUES (2329)
INSERT [dbo].[years] ([year_pk]) VALUES (2330)
INSERT [dbo].[years] ([year_pk]) VALUES (2331)
INSERT [dbo].[years] ([year_pk]) VALUES (2332)
INSERT [dbo].[years] ([year_pk]) VALUES (2333)
INSERT [dbo].[years] ([year_pk]) VALUES (2334)
INSERT [dbo].[years] ([year_pk]) VALUES (2335)
INSERT [dbo].[years] ([year_pk]) VALUES (2336)
INSERT [dbo].[years] ([year_pk]) VALUES (2337)
INSERT [dbo].[years] ([year_pk]) VALUES (2338)
INSERT [dbo].[years] ([year_pk]) VALUES (2339)
INSERT [dbo].[years] ([year_pk]) VALUES (2340)
INSERT [dbo].[years] ([year_pk]) VALUES (2341)
INSERT [dbo].[years] ([year_pk]) VALUES (2342)
INSERT [dbo].[years] ([year_pk]) VALUES (2343)
INSERT [dbo].[years] ([year_pk]) VALUES (2344)
INSERT [dbo].[years] ([year_pk]) VALUES (2345)
INSERT [dbo].[years] ([year_pk]) VALUES (2346)
INSERT [dbo].[years] ([year_pk]) VALUES (2347)
INSERT [dbo].[years] ([year_pk]) VALUES (2348)
INSERT [dbo].[years] ([year_pk]) VALUES (2349)
INSERT [dbo].[years] ([year_pk]) VALUES (2350)
INSERT [dbo].[years] ([year_pk]) VALUES (2351)
INSERT [dbo].[years] ([year_pk]) VALUES (2352)
INSERT [dbo].[years] ([year_pk]) VALUES (2353)
INSERT [dbo].[years] ([year_pk]) VALUES (2354)
INSERT [dbo].[years] ([year_pk]) VALUES (2355)
INSERT [dbo].[years] ([year_pk]) VALUES (2356)
INSERT [dbo].[years] ([year_pk]) VALUES (2357)
INSERT [dbo].[years] ([year_pk]) VALUES (2358)
INSERT [dbo].[years] ([year_pk]) VALUES (2359)
INSERT [dbo].[years] ([year_pk]) VALUES (2360)
INSERT [dbo].[years] ([year_pk]) VALUES (2361)
INSERT [dbo].[years] ([year_pk]) VALUES (2362)
INSERT [dbo].[years] ([year_pk]) VALUES (2363)
INSERT [dbo].[years] ([year_pk]) VALUES (2364)
INSERT [dbo].[years] ([year_pk]) VALUES (2365)
INSERT [dbo].[years] ([year_pk]) VALUES (2366)
INSERT [dbo].[years] ([year_pk]) VALUES (2367)
INSERT [dbo].[years] ([year_pk]) VALUES (2368)
INSERT [dbo].[years] ([year_pk]) VALUES (2369)
INSERT [dbo].[years] ([year_pk]) VALUES (2370)
INSERT [dbo].[years] ([year_pk]) VALUES (2371)
INSERT [dbo].[years] ([year_pk]) VALUES (2372)
INSERT [dbo].[years] ([year_pk]) VALUES (2373)
INSERT [dbo].[years] ([year_pk]) VALUES (2374)
INSERT [dbo].[years] ([year_pk]) VALUES (2375)
INSERT [dbo].[years] ([year_pk]) VALUES (2376)
INSERT [dbo].[years] ([year_pk]) VALUES (2377)
INSERT [dbo].[years] ([year_pk]) VALUES (2378)
INSERT [dbo].[years] ([year_pk]) VALUES (2379)
INSERT [dbo].[years] ([year_pk]) VALUES (2380)
INSERT [dbo].[years] ([year_pk]) VALUES (2381)
INSERT [dbo].[years] ([year_pk]) VALUES (2382)
INSERT [dbo].[years] ([year_pk]) VALUES (2383)
INSERT [dbo].[years] ([year_pk]) VALUES (2384)
INSERT [dbo].[years] ([year_pk]) VALUES (2385)
INSERT [dbo].[years] ([year_pk]) VALUES (2386)
INSERT [dbo].[years] ([year_pk]) VALUES (2387)
INSERT [dbo].[years] ([year_pk]) VALUES (2388)
INSERT [dbo].[years] ([year_pk]) VALUES (2389)
INSERT [dbo].[years] ([year_pk]) VALUES (2390)
INSERT [dbo].[years] ([year_pk]) VALUES (2391)
INSERT [dbo].[years] ([year_pk]) VALUES (2392)
INSERT [dbo].[years] ([year_pk]) VALUES (2393)
INSERT [dbo].[years] ([year_pk]) VALUES (2394)
INSERT [dbo].[years] ([year_pk]) VALUES (2395)
INSERT [dbo].[years] ([year_pk]) VALUES (2396)
INSERT [dbo].[years] ([year_pk]) VALUES (2397)
INSERT [dbo].[years] ([year_pk]) VALUES (2398)
INSERT [dbo].[years] ([year_pk]) VALUES (2399)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2400)
INSERT [dbo].[years] ([year_pk]) VALUES (2401)
INSERT [dbo].[years] ([year_pk]) VALUES (2402)
INSERT [dbo].[years] ([year_pk]) VALUES (2403)
INSERT [dbo].[years] ([year_pk]) VALUES (2404)
INSERT [dbo].[years] ([year_pk]) VALUES (2405)
INSERT [dbo].[years] ([year_pk]) VALUES (2406)
INSERT [dbo].[years] ([year_pk]) VALUES (2407)
INSERT [dbo].[years] ([year_pk]) VALUES (2408)
INSERT [dbo].[years] ([year_pk]) VALUES (2409)
INSERT [dbo].[years] ([year_pk]) VALUES (2410)
INSERT [dbo].[years] ([year_pk]) VALUES (2411)
INSERT [dbo].[years] ([year_pk]) VALUES (2412)
INSERT [dbo].[years] ([year_pk]) VALUES (2413)
INSERT [dbo].[years] ([year_pk]) VALUES (2414)
INSERT [dbo].[years] ([year_pk]) VALUES (2415)
INSERT [dbo].[years] ([year_pk]) VALUES (2416)
INSERT [dbo].[years] ([year_pk]) VALUES (2417)
INSERT [dbo].[years] ([year_pk]) VALUES (2418)
INSERT [dbo].[years] ([year_pk]) VALUES (2419)
INSERT [dbo].[years] ([year_pk]) VALUES (2420)
INSERT [dbo].[years] ([year_pk]) VALUES (2421)
INSERT [dbo].[years] ([year_pk]) VALUES (2422)
INSERT [dbo].[years] ([year_pk]) VALUES (2423)
INSERT [dbo].[years] ([year_pk]) VALUES (2424)
INSERT [dbo].[years] ([year_pk]) VALUES (2425)
INSERT [dbo].[years] ([year_pk]) VALUES (2426)
INSERT [dbo].[years] ([year_pk]) VALUES (2427)
INSERT [dbo].[years] ([year_pk]) VALUES (2428)
INSERT [dbo].[years] ([year_pk]) VALUES (2429)
INSERT [dbo].[years] ([year_pk]) VALUES (2430)
INSERT [dbo].[years] ([year_pk]) VALUES (2431)
INSERT [dbo].[years] ([year_pk]) VALUES (2432)
INSERT [dbo].[years] ([year_pk]) VALUES (2433)
INSERT [dbo].[years] ([year_pk]) VALUES (2434)
INSERT [dbo].[years] ([year_pk]) VALUES (2435)
INSERT [dbo].[years] ([year_pk]) VALUES (2436)
INSERT [dbo].[years] ([year_pk]) VALUES (2437)
INSERT [dbo].[years] ([year_pk]) VALUES (2438)
INSERT [dbo].[years] ([year_pk]) VALUES (2439)
INSERT [dbo].[years] ([year_pk]) VALUES (2440)
INSERT [dbo].[years] ([year_pk]) VALUES (2441)
INSERT [dbo].[years] ([year_pk]) VALUES (2442)
INSERT [dbo].[years] ([year_pk]) VALUES (2443)
INSERT [dbo].[years] ([year_pk]) VALUES (2444)
INSERT [dbo].[years] ([year_pk]) VALUES (2445)
INSERT [dbo].[years] ([year_pk]) VALUES (2446)
INSERT [dbo].[years] ([year_pk]) VALUES (2447)
INSERT [dbo].[years] ([year_pk]) VALUES (2448)
INSERT [dbo].[years] ([year_pk]) VALUES (2449)
INSERT [dbo].[years] ([year_pk]) VALUES (2450)
INSERT [dbo].[years] ([year_pk]) VALUES (2451)
INSERT [dbo].[years] ([year_pk]) VALUES (2452)
INSERT [dbo].[years] ([year_pk]) VALUES (2453)
INSERT [dbo].[years] ([year_pk]) VALUES (2454)
INSERT [dbo].[years] ([year_pk]) VALUES (2455)
INSERT [dbo].[years] ([year_pk]) VALUES (2456)
INSERT [dbo].[years] ([year_pk]) VALUES (2457)
INSERT [dbo].[years] ([year_pk]) VALUES (2458)
INSERT [dbo].[years] ([year_pk]) VALUES (2459)
INSERT [dbo].[years] ([year_pk]) VALUES (2460)
INSERT [dbo].[years] ([year_pk]) VALUES (2461)
INSERT [dbo].[years] ([year_pk]) VALUES (2462)
INSERT [dbo].[years] ([year_pk]) VALUES (2463)
INSERT [dbo].[years] ([year_pk]) VALUES (2464)
INSERT [dbo].[years] ([year_pk]) VALUES (2465)
INSERT [dbo].[years] ([year_pk]) VALUES (2466)
INSERT [dbo].[years] ([year_pk]) VALUES (2467)
INSERT [dbo].[years] ([year_pk]) VALUES (2468)
INSERT [dbo].[years] ([year_pk]) VALUES (2469)
INSERT [dbo].[years] ([year_pk]) VALUES (2470)
INSERT [dbo].[years] ([year_pk]) VALUES (2471)
INSERT [dbo].[years] ([year_pk]) VALUES (2472)
INSERT [dbo].[years] ([year_pk]) VALUES (2473)
INSERT [dbo].[years] ([year_pk]) VALUES (2474)
INSERT [dbo].[years] ([year_pk]) VALUES (2475)
INSERT [dbo].[years] ([year_pk]) VALUES (2476)
INSERT [dbo].[years] ([year_pk]) VALUES (2477)
INSERT [dbo].[years] ([year_pk]) VALUES (2478)
INSERT [dbo].[years] ([year_pk]) VALUES (2479)
INSERT [dbo].[years] ([year_pk]) VALUES (2480)
INSERT [dbo].[years] ([year_pk]) VALUES (2481)
INSERT [dbo].[years] ([year_pk]) VALUES (2482)
INSERT [dbo].[years] ([year_pk]) VALUES (2483)
INSERT [dbo].[years] ([year_pk]) VALUES (2484)
INSERT [dbo].[years] ([year_pk]) VALUES (2485)
INSERT [dbo].[years] ([year_pk]) VALUES (2486)
INSERT [dbo].[years] ([year_pk]) VALUES (2487)
INSERT [dbo].[years] ([year_pk]) VALUES (2488)
INSERT [dbo].[years] ([year_pk]) VALUES (2489)
INSERT [dbo].[years] ([year_pk]) VALUES (2490)
INSERT [dbo].[years] ([year_pk]) VALUES (2491)
INSERT [dbo].[years] ([year_pk]) VALUES (2492)
INSERT [dbo].[years] ([year_pk]) VALUES (2493)
INSERT [dbo].[years] ([year_pk]) VALUES (2494)
INSERT [dbo].[years] ([year_pk]) VALUES (2495)
INSERT [dbo].[years] ([year_pk]) VALUES (2496)
INSERT [dbo].[years] ([year_pk]) VALUES (2497)
INSERT [dbo].[years] ([year_pk]) VALUES (2498)
INSERT [dbo].[years] ([year_pk]) VALUES (2499)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2500)
INSERT [dbo].[years] ([year_pk]) VALUES (2501)
INSERT [dbo].[years] ([year_pk]) VALUES (2502)
INSERT [dbo].[years] ([year_pk]) VALUES (2503)
INSERT [dbo].[years] ([year_pk]) VALUES (2504)
INSERT [dbo].[years] ([year_pk]) VALUES (2505)
INSERT [dbo].[years] ([year_pk]) VALUES (2506)
INSERT [dbo].[years] ([year_pk]) VALUES (2507)
INSERT [dbo].[years] ([year_pk]) VALUES (2508)
INSERT [dbo].[years] ([year_pk]) VALUES (2509)
INSERT [dbo].[years] ([year_pk]) VALUES (2510)
INSERT [dbo].[years] ([year_pk]) VALUES (2511)
INSERT [dbo].[years] ([year_pk]) VALUES (2512)
INSERT [dbo].[years] ([year_pk]) VALUES (2513)
INSERT [dbo].[years] ([year_pk]) VALUES (2514)
INSERT [dbo].[years] ([year_pk]) VALUES (2515)
INSERT [dbo].[years] ([year_pk]) VALUES (2516)
INSERT [dbo].[years] ([year_pk]) VALUES (2517)
INSERT [dbo].[years] ([year_pk]) VALUES (2518)
INSERT [dbo].[years] ([year_pk]) VALUES (2519)
INSERT [dbo].[years] ([year_pk]) VALUES (2520)
INSERT [dbo].[years] ([year_pk]) VALUES (2521)
INSERT [dbo].[years] ([year_pk]) VALUES (2522)
INSERT [dbo].[years] ([year_pk]) VALUES (2523)
INSERT [dbo].[years] ([year_pk]) VALUES (2524)
INSERT [dbo].[years] ([year_pk]) VALUES (2525)
INSERT [dbo].[years] ([year_pk]) VALUES (2526)
INSERT [dbo].[years] ([year_pk]) VALUES (2527)
INSERT [dbo].[years] ([year_pk]) VALUES (2528)
INSERT [dbo].[years] ([year_pk]) VALUES (2529)
INSERT [dbo].[years] ([year_pk]) VALUES (2530)
INSERT [dbo].[years] ([year_pk]) VALUES (2531)
INSERT [dbo].[years] ([year_pk]) VALUES (2532)
INSERT [dbo].[years] ([year_pk]) VALUES (2533)
INSERT [dbo].[years] ([year_pk]) VALUES (2534)
INSERT [dbo].[years] ([year_pk]) VALUES (2535)
INSERT [dbo].[years] ([year_pk]) VALUES (2536)
INSERT [dbo].[years] ([year_pk]) VALUES (2537)
INSERT [dbo].[years] ([year_pk]) VALUES (2538)
INSERT [dbo].[years] ([year_pk]) VALUES (2539)
INSERT [dbo].[years] ([year_pk]) VALUES (2540)
INSERT [dbo].[years] ([year_pk]) VALUES (2541)
INSERT [dbo].[years] ([year_pk]) VALUES (2542)
INSERT [dbo].[years] ([year_pk]) VALUES (2543)
INSERT [dbo].[years] ([year_pk]) VALUES (2544)
INSERT [dbo].[years] ([year_pk]) VALUES (2545)
INSERT [dbo].[years] ([year_pk]) VALUES (2546)
INSERT [dbo].[years] ([year_pk]) VALUES (2547)
INSERT [dbo].[years] ([year_pk]) VALUES (2548)
INSERT [dbo].[years] ([year_pk]) VALUES (2549)
INSERT [dbo].[years] ([year_pk]) VALUES (2550)
INSERT [dbo].[years] ([year_pk]) VALUES (2551)
INSERT [dbo].[years] ([year_pk]) VALUES (2552)
INSERT [dbo].[years] ([year_pk]) VALUES (2553)
INSERT [dbo].[years] ([year_pk]) VALUES (2554)
INSERT [dbo].[years] ([year_pk]) VALUES (2555)
INSERT [dbo].[years] ([year_pk]) VALUES (2556)
INSERT [dbo].[years] ([year_pk]) VALUES (2557)
INSERT [dbo].[years] ([year_pk]) VALUES (2558)
INSERT [dbo].[years] ([year_pk]) VALUES (2559)
INSERT [dbo].[years] ([year_pk]) VALUES (2560)
INSERT [dbo].[years] ([year_pk]) VALUES (2561)
INSERT [dbo].[years] ([year_pk]) VALUES (2562)
INSERT [dbo].[years] ([year_pk]) VALUES (2563)
INSERT [dbo].[years] ([year_pk]) VALUES (2564)
INSERT [dbo].[years] ([year_pk]) VALUES (2565)
INSERT [dbo].[years] ([year_pk]) VALUES (2566)
INSERT [dbo].[years] ([year_pk]) VALUES (2567)
INSERT [dbo].[years] ([year_pk]) VALUES (2568)
INSERT [dbo].[years] ([year_pk]) VALUES (2569)
INSERT [dbo].[years] ([year_pk]) VALUES (2570)
INSERT [dbo].[years] ([year_pk]) VALUES (2571)
INSERT [dbo].[years] ([year_pk]) VALUES (2572)
INSERT [dbo].[years] ([year_pk]) VALUES (2573)
INSERT [dbo].[years] ([year_pk]) VALUES (2574)
INSERT [dbo].[years] ([year_pk]) VALUES (2575)
INSERT [dbo].[years] ([year_pk]) VALUES (2576)
INSERT [dbo].[years] ([year_pk]) VALUES (2577)
INSERT [dbo].[years] ([year_pk]) VALUES (2578)
INSERT [dbo].[years] ([year_pk]) VALUES (2579)
INSERT [dbo].[years] ([year_pk]) VALUES (2580)
INSERT [dbo].[years] ([year_pk]) VALUES (2581)
INSERT [dbo].[years] ([year_pk]) VALUES (2582)
INSERT [dbo].[years] ([year_pk]) VALUES (2583)
INSERT [dbo].[years] ([year_pk]) VALUES (2584)
INSERT [dbo].[years] ([year_pk]) VALUES (2585)
INSERT [dbo].[years] ([year_pk]) VALUES (2586)
INSERT [dbo].[years] ([year_pk]) VALUES (2587)
INSERT [dbo].[years] ([year_pk]) VALUES (2588)
INSERT [dbo].[years] ([year_pk]) VALUES (2589)
INSERT [dbo].[years] ([year_pk]) VALUES (2590)
INSERT [dbo].[years] ([year_pk]) VALUES (2591)
INSERT [dbo].[years] ([year_pk]) VALUES (2592)
INSERT [dbo].[years] ([year_pk]) VALUES (2593)
INSERT [dbo].[years] ([year_pk]) VALUES (2594)
INSERT [dbo].[years] ([year_pk]) VALUES (2595)
INSERT [dbo].[years] ([year_pk]) VALUES (2596)
INSERT [dbo].[years] ([year_pk]) VALUES (2597)
INSERT [dbo].[years] ([year_pk]) VALUES (2598)
INSERT [dbo].[years] ([year_pk]) VALUES (2599)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2600)
INSERT [dbo].[years] ([year_pk]) VALUES (2601)
INSERT [dbo].[years] ([year_pk]) VALUES (2602)
INSERT [dbo].[years] ([year_pk]) VALUES (2603)
INSERT [dbo].[years] ([year_pk]) VALUES (2604)
INSERT [dbo].[years] ([year_pk]) VALUES (2605)
INSERT [dbo].[years] ([year_pk]) VALUES (2606)
INSERT [dbo].[years] ([year_pk]) VALUES (2607)
INSERT [dbo].[years] ([year_pk]) VALUES (2608)
INSERT [dbo].[years] ([year_pk]) VALUES (2609)
INSERT [dbo].[years] ([year_pk]) VALUES (2610)
INSERT [dbo].[years] ([year_pk]) VALUES (2611)
INSERT [dbo].[years] ([year_pk]) VALUES (2612)
INSERT [dbo].[years] ([year_pk]) VALUES (2613)
INSERT [dbo].[years] ([year_pk]) VALUES (2614)
INSERT [dbo].[years] ([year_pk]) VALUES (2615)
INSERT [dbo].[years] ([year_pk]) VALUES (2616)
INSERT [dbo].[years] ([year_pk]) VALUES (2617)
INSERT [dbo].[years] ([year_pk]) VALUES (2618)
INSERT [dbo].[years] ([year_pk]) VALUES (2619)
INSERT [dbo].[years] ([year_pk]) VALUES (2620)
INSERT [dbo].[years] ([year_pk]) VALUES (2621)
INSERT [dbo].[years] ([year_pk]) VALUES (2622)
INSERT [dbo].[years] ([year_pk]) VALUES (2623)
INSERT [dbo].[years] ([year_pk]) VALUES (2624)
INSERT [dbo].[years] ([year_pk]) VALUES (2625)
INSERT [dbo].[years] ([year_pk]) VALUES (2626)
INSERT [dbo].[years] ([year_pk]) VALUES (2627)
INSERT [dbo].[years] ([year_pk]) VALUES (2628)
INSERT [dbo].[years] ([year_pk]) VALUES (2629)
INSERT [dbo].[years] ([year_pk]) VALUES (2630)
INSERT [dbo].[years] ([year_pk]) VALUES (2631)
INSERT [dbo].[years] ([year_pk]) VALUES (2632)
INSERT [dbo].[years] ([year_pk]) VALUES (2633)
INSERT [dbo].[years] ([year_pk]) VALUES (2634)
INSERT [dbo].[years] ([year_pk]) VALUES (2635)
INSERT [dbo].[years] ([year_pk]) VALUES (2636)
INSERT [dbo].[years] ([year_pk]) VALUES (2637)
INSERT [dbo].[years] ([year_pk]) VALUES (2638)
INSERT [dbo].[years] ([year_pk]) VALUES (2639)
INSERT [dbo].[years] ([year_pk]) VALUES (2640)
INSERT [dbo].[years] ([year_pk]) VALUES (2641)
INSERT [dbo].[years] ([year_pk]) VALUES (2642)
INSERT [dbo].[years] ([year_pk]) VALUES (2643)
INSERT [dbo].[years] ([year_pk]) VALUES (2644)
INSERT [dbo].[years] ([year_pk]) VALUES (2645)
INSERT [dbo].[years] ([year_pk]) VALUES (2646)
INSERT [dbo].[years] ([year_pk]) VALUES (2647)
INSERT [dbo].[years] ([year_pk]) VALUES (2648)
INSERT [dbo].[years] ([year_pk]) VALUES (2649)
INSERT [dbo].[years] ([year_pk]) VALUES (2650)
INSERT [dbo].[years] ([year_pk]) VALUES (2651)
INSERT [dbo].[years] ([year_pk]) VALUES (2652)
INSERT [dbo].[years] ([year_pk]) VALUES (2653)
INSERT [dbo].[years] ([year_pk]) VALUES (2654)
INSERT [dbo].[years] ([year_pk]) VALUES (2655)
INSERT [dbo].[years] ([year_pk]) VALUES (2656)
INSERT [dbo].[years] ([year_pk]) VALUES (2657)
INSERT [dbo].[years] ([year_pk]) VALUES (2658)
INSERT [dbo].[years] ([year_pk]) VALUES (2659)
INSERT [dbo].[years] ([year_pk]) VALUES (2660)
INSERT [dbo].[years] ([year_pk]) VALUES (2661)
INSERT [dbo].[years] ([year_pk]) VALUES (2662)
INSERT [dbo].[years] ([year_pk]) VALUES (2663)
INSERT [dbo].[years] ([year_pk]) VALUES (2664)
INSERT [dbo].[years] ([year_pk]) VALUES (2665)
INSERT [dbo].[years] ([year_pk]) VALUES (2666)
INSERT [dbo].[years] ([year_pk]) VALUES (2667)
INSERT [dbo].[years] ([year_pk]) VALUES (2668)
INSERT [dbo].[years] ([year_pk]) VALUES (2669)
INSERT [dbo].[years] ([year_pk]) VALUES (2670)
INSERT [dbo].[years] ([year_pk]) VALUES (2671)
INSERT [dbo].[years] ([year_pk]) VALUES (2672)
INSERT [dbo].[years] ([year_pk]) VALUES (2673)
INSERT [dbo].[years] ([year_pk]) VALUES (2674)
INSERT [dbo].[years] ([year_pk]) VALUES (2675)
INSERT [dbo].[years] ([year_pk]) VALUES (2676)
INSERT [dbo].[years] ([year_pk]) VALUES (2677)
INSERT [dbo].[years] ([year_pk]) VALUES (2678)
INSERT [dbo].[years] ([year_pk]) VALUES (2679)
INSERT [dbo].[years] ([year_pk]) VALUES (2680)
INSERT [dbo].[years] ([year_pk]) VALUES (2681)
INSERT [dbo].[years] ([year_pk]) VALUES (2682)
INSERT [dbo].[years] ([year_pk]) VALUES (2683)
INSERT [dbo].[years] ([year_pk]) VALUES (2684)
INSERT [dbo].[years] ([year_pk]) VALUES (2685)
INSERT [dbo].[years] ([year_pk]) VALUES (2686)
INSERT [dbo].[years] ([year_pk]) VALUES (2687)
INSERT [dbo].[years] ([year_pk]) VALUES (2688)
INSERT [dbo].[years] ([year_pk]) VALUES (2689)
INSERT [dbo].[years] ([year_pk]) VALUES (2690)
INSERT [dbo].[years] ([year_pk]) VALUES (2691)
INSERT [dbo].[years] ([year_pk]) VALUES (2692)
INSERT [dbo].[years] ([year_pk]) VALUES (2693)
INSERT [dbo].[years] ([year_pk]) VALUES (2694)
INSERT [dbo].[years] ([year_pk]) VALUES (2695)
INSERT [dbo].[years] ([year_pk]) VALUES (2696)
INSERT [dbo].[years] ([year_pk]) VALUES (2697)
INSERT [dbo].[years] ([year_pk]) VALUES (2698)
INSERT [dbo].[years] ([year_pk]) VALUES (2699)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2700)
INSERT [dbo].[years] ([year_pk]) VALUES (2701)
INSERT [dbo].[years] ([year_pk]) VALUES (2702)
INSERT [dbo].[years] ([year_pk]) VALUES (2703)
INSERT [dbo].[years] ([year_pk]) VALUES (2704)
INSERT [dbo].[years] ([year_pk]) VALUES (2705)
INSERT [dbo].[years] ([year_pk]) VALUES (2706)
INSERT [dbo].[years] ([year_pk]) VALUES (2707)
INSERT [dbo].[years] ([year_pk]) VALUES (2708)
INSERT [dbo].[years] ([year_pk]) VALUES (2709)
INSERT [dbo].[years] ([year_pk]) VALUES (2710)
INSERT [dbo].[years] ([year_pk]) VALUES (2711)
INSERT [dbo].[years] ([year_pk]) VALUES (2712)
INSERT [dbo].[years] ([year_pk]) VALUES (2713)
INSERT [dbo].[years] ([year_pk]) VALUES (2714)
INSERT [dbo].[years] ([year_pk]) VALUES (2715)
INSERT [dbo].[years] ([year_pk]) VALUES (2716)
INSERT [dbo].[years] ([year_pk]) VALUES (2717)
INSERT [dbo].[years] ([year_pk]) VALUES (2718)
INSERT [dbo].[years] ([year_pk]) VALUES (2719)
INSERT [dbo].[years] ([year_pk]) VALUES (2720)
INSERT [dbo].[years] ([year_pk]) VALUES (2721)
INSERT [dbo].[years] ([year_pk]) VALUES (2722)
INSERT [dbo].[years] ([year_pk]) VALUES (2723)
INSERT [dbo].[years] ([year_pk]) VALUES (2724)
INSERT [dbo].[years] ([year_pk]) VALUES (2725)
INSERT [dbo].[years] ([year_pk]) VALUES (2726)
INSERT [dbo].[years] ([year_pk]) VALUES (2727)
INSERT [dbo].[years] ([year_pk]) VALUES (2728)
INSERT [dbo].[years] ([year_pk]) VALUES (2729)
INSERT [dbo].[years] ([year_pk]) VALUES (2730)
INSERT [dbo].[years] ([year_pk]) VALUES (2731)
INSERT [dbo].[years] ([year_pk]) VALUES (2732)
INSERT [dbo].[years] ([year_pk]) VALUES (2733)
INSERT [dbo].[years] ([year_pk]) VALUES (2734)
INSERT [dbo].[years] ([year_pk]) VALUES (2735)
INSERT [dbo].[years] ([year_pk]) VALUES (2736)
INSERT [dbo].[years] ([year_pk]) VALUES (2737)
INSERT [dbo].[years] ([year_pk]) VALUES (2738)
INSERT [dbo].[years] ([year_pk]) VALUES (2739)
INSERT [dbo].[years] ([year_pk]) VALUES (2740)
INSERT [dbo].[years] ([year_pk]) VALUES (2741)
INSERT [dbo].[years] ([year_pk]) VALUES (2742)
INSERT [dbo].[years] ([year_pk]) VALUES (2743)
INSERT [dbo].[years] ([year_pk]) VALUES (2744)
INSERT [dbo].[years] ([year_pk]) VALUES (2745)
INSERT [dbo].[years] ([year_pk]) VALUES (2746)
INSERT [dbo].[years] ([year_pk]) VALUES (2747)
INSERT [dbo].[years] ([year_pk]) VALUES (2748)
INSERT [dbo].[years] ([year_pk]) VALUES (2749)
INSERT [dbo].[years] ([year_pk]) VALUES (2750)
INSERT [dbo].[years] ([year_pk]) VALUES (2751)
INSERT [dbo].[years] ([year_pk]) VALUES (2752)
INSERT [dbo].[years] ([year_pk]) VALUES (2753)
INSERT [dbo].[years] ([year_pk]) VALUES (2754)
INSERT [dbo].[years] ([year_pk]) VALUES (2755)
INSERT [dbo].[years] ([year_pk]) VALUES (2756)
INSERT [dbo].[years] ([year_pk]) VALUES (2757)
INSERT [dbo].[years] ([year_pk]) VALUES (2758)
INSERT [dbo].[years] ([year_pk]) VALUES (2759)
INSERT [dbo].[years] ([year_pk]) VALUES (2760)
INSERT [dbo].[years] ([year_pk]) VALUES (2761)
INSERT [dbo].[years] ([year_pk]) VALUES (2762)
INSERT [dbo].[years] ([year_pk]) VALUES (2763)
INSERT [dbo].[years] ([year_pk]) VALUES (2764)
INSERT [dbo].[years] ([year_pk]) VALUES (2765)
INSERT [dbo].[years] ([year_pk]) VALUES (2766)
INSERT [dbo].[years] ([year_pk]) VALUES (2767)
INSERT [dbo].[years] ([year_pk]) VALUES (2768)
INSERT [dbo].[years] ([year_pk]) VALUES (2769)
INSERT [dbo].[years] ([year_pk]) VALUES (2770)
INSERT [dbo].[years] ([year_pk]) VALUES (2771)
INSERT [dbo].[years] ([year_pk]) VALUES (2772)
INSERT [dbo].[years] ([year_pk]) VALUES (2773)
INSERT [dbo].[years] ([year_pk]) VALUES (2774)
INSERT [dbo].[years] ([year_pk]) VALUES (2775)
INSERT [dbo].[years] ([year_pk]) VALUES (2776)
INSERT [dbo].[years] ([year_pk]) VALUES (2777)
INSERT [dbo].[years] ([year_pk]) VALUES (2778)
INSERT [dbo].[years] ([year_pk]) VALUES (2779)
INSERT [dbo].[years] ([year_pk]) VALUES (2780)
INSERT [dbo].[years] ([year_pk]) VALUES (2781)
INSERT [dbo].[years] ([year_pk]) VALUES (2782)
INSERT [dbo].[years] ([year_pk]) VALUES (2783)
INSERT [dbo].[years] ([year_pk]) VALUES (2784)
INSERT [dbo].[years] ([year_pk]) VALUES (2785)
INSERT [dbo].[years] ([year_pk]) VALUES (2786)
INSERT [dbo].[years] ([year_pk]) VALUES (2787)
INSERT [dbo].[years] ([year_pk]) VALUES (2788)
INSERT [dbo].[years] ([year_pk]) VALUES (2789)
INSERT [dbo].[years] ([year_pk]) VALUES (2790)
INSERT [dbo].[years] ([year_pk]) VALUES (2791)
INSERT [dbo].[years] ([year_pk]) VALUES (2792)
INSERT [dbo].[years] ([year_pk]) VALUES (2793)
INSERT [dbo].[years] ([year_pk]) VALUES (2794)
INSERT [dbo].[years] ([year_pk]) VALUES (2795)
INSERT [dbo].[years] ([year_pk]) VALUES (2796)
INSERT [dbo].[years] ([year_pk]) VALUES (2797)
INSERT [dbo].[years] ([year_pk]) VALUES (2798)
INSERT [dbo].[years] ([year_pk]) VALUES (2799)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2800)
INSERT [dbo].[years] ([year_pk]) VALUES (2801)
INSERT [dbo].[years] ([year_pk]) VALUES (2802)
INSERT [dbo].[years] ([year_pk]) VALUES (2803)
INSERT [dbo].[years] ([year_pk]) VALUES (2804)
INSERT [dbo].[years] ([year_pk]) VALUES (2805)
INSERT [dbo].[years] ([year_pk]) VALUES (2806)
INSERT [dbo].[years] ([year_pk]) VALUES (2807)
INSERT [dbo].[years] ([year_pk]) VALUES (2808)
INSERT [dbo].[years] ([year_pk]) VALUES (2809)
INSERT [dbo].[years] ([year_pk]) VALUES (2810)
INSERT [dbo].[years] ([year_pk]) VALUES (2811)
INSERT [dbo].[years] ([year_pk]) VALUES (2812)
INSERT [dbo].[years] ([year_pk]) VALUES (2813)
INSERT [dbo].[years] ([year_pk]) VALUES (2814)
INSERT [dbo].[years] ([year_pk]) VALUES (2815)
INSERT [dbo].[years] ([year_pk]) VALUES (2816)
INSERT [dbo].[years] ([year_pk]) VALUES (2817)
INSERT [dbo].[years] ([year_pk]) VALUES (2818)
INSERT [dbo].[years] ([year_pk]) VALUES (2819)
INSERT [dbo].[years] ([year_pk]) VALUES (2820)
INSERT [dbo].[years] ([year_pk]) VALUES (2821)
INSERT [dbo].[years] ([year_pk]) VALUES (2822)
INSERT [dbo].[years] ([year_pk]) VALUES (2823)
INSERT [dbo].[years] ([year_pk]) VALUES (2824)
INSERT [dbo].[years] ([year_pk]) VALUES (2825)
INSERT [dbo].[years] ([year_pk]) VALUES (2826)
INSERT [dbo].[years] ([year_pk]) VALUES (2827)
INSERT [dbo].[years] ([year_pk]) VALUES (2828)
INSERT [dbo].[years] ([year_pk]) VALUES (2829)
INSERT [dbo].[years] ([year_pk]) VALUES (2830)
INSERT [dbo].[years] ([year_pk]) VALUES (2831)
INSERT [dbo].[years] ([year_pk]) VALUES (2832)
INSERT [dbo].[years] ([year_pk]) VALUES (2833)
INSERT [dbo].[years] ([year_pk]) VALUES (2834)
INSERT [dbo].[years] ([year_pk]) VALUES (2835)
INSERT [dbo].[years] ([year_pk]) VALUES (2836)
INSERT [dbo].[years] ([year_pk]) VALUES (2837)
INSERT [dbo].[years] ([year_pk]) VALUES (2838)
INSERT [dbo].[years] ([year_pk]) VALUES (2839)
INSERT [dbo].[years] ([year_pk]) VALUES (2840)
INSERT [dbo].[years] ([year_pk]) VALUES (2841)
INSERT [dbo].[years] ([year_pk]) VALUES (2842)
INSERT [dbo].[years] ([year_pk]) VALUES (2843)
INSERT [dbo].[years] ([year_pk]) VALUES (2844)
INSERT [dbo].[years] ([year_pk]) VALUES (2845)
INSERT [dbo].[years] ([year_pk]) VALUES (2846)
INSERT [dbo].[years] ([year_pk]) VALUES (2847)
INSERT [dbo].[years] ([year_pk]) VALUES (2848)
INSERT [dbo].[years] ([year_pk]) VALUES (2849)
INSERT [dbo].[years] ([year_pk]) VALUES (2850)
INSERT [dbo].[years] ([year_pk]) VALUES (2851)
INSERT [dbo].[years] ([year_pk]) VALUES (2852)
INSERT [dbo].[years] ([year_pk]) VALUES (2853)
INSERT [dbo].[years] ([year_pk]) VALUES (2854)
INSERT [dbo].[years] ([year_pk]) VALUES (2855)
INSERT [dbo].[years] ([year_pk]) VALUES (2856)
INSERT [dbo].[years] ([year_pk]) VALUES (2857)
INSERT [dbo].[years] ([year_pk]) VALUES (2858)
INSERT [dbo].[years] ([year_pk]) VALUES (2859)
INSERT [dbo].[years] ([year_pk]) VALUES (2860)
INSERT [dbo].[years] ([year_pk]) VALUES (2861)
INSERT [dbo].[years] ([year_pk]) VALUES (2862)
INSERT [dbo].[years] ([year_pk]) VALUES (2863)
INSERT [dbo].[years] ([year_pk]) VALUES (2864)
INSERT [dbo].[years] ([year_pk]) VALUES (2865)
INSERT [dbo].[years] ([year_pk]) VALUES (2866)
INSERT [dbo].[years] ([year_pk]) VALUES (2867)
INSERT [dbo].[years] ([year_pk]) VALUES (2868)
INSERT [dbo].[years] ([year_pk]) VALUES (2869)
INSERT [dbo].[years] ([year_pk]) VALUES (2870)
INSERT [dbo].[years] ([year_pk]) VALUES (2871)
INSERT [dbo].[years] ([year_pk]) VALUES (2872)
INSERT [dbo].[years] ([year_pk]) VALUES (2873)
INSERT [dbo].[years] ([year_pk]) VALUES (2874)
INSERT [dbo].[years] ([year_pk]) VALUES (2875)
INSERT [dbo].[years] ([year_pk]) VALUES (2876)
INSERT [dbo].[years] ([year_pk]) VALUES (2877)
INSERT [dbo].[years] ([year_pk]) VALUES (2878)
INSERT [dbo].[years] ([year_pk]) VALUES (2879)
INSERT [dbo].[years] ([year_pk]) VALUES (2880)
INSERT [dbo].[years] ([year_pk]) VALUES (2881)
INSERT [dbo].[years] ([year_pk]) VALUES (2882)
INSERT [dbo].[years] ([year_pk]) VALUES (2883)
INSERT [dbo].[years] ([year_pk]) VALUES (2884)
INSERT [dbo].[years] ([year_pk]) VALUES (2885)
INSERT [dbo].[years] ([year_pk]) VALUES (2886)
INSERT [dbo].[years] ([year_pk]) VALUES (2887)
INSERT [dbo].[years] ([year_pk]) VALUES (2888)
INSERT [dbo].[years] ([year_pk]) VALUES (2889)
INSERT [dbo].[years] ([year_pk]) VALUES (2890)
INSERT [dbo].[years] ([year_pk]) VALUES (2891)
INSERT [dbo].[years] ([year_pk]) VALUES (2892)
INSERT [dbo].[years] ([year_pk]) VALUES (2893)
INSERT [dbo].[years] ([year_pk]) VALUES (2894)
INSERT [dbo].[years] ([year_pk]) VALUES (2895)
INSERT [dbo].[years] ([year_pk]) VALUES (2896)
INSERT [dbo].[years] ([year_pk]) VALUES (2897)
INSERT [dbo].[years] ([year_pk]) VALUES (2898)
INSERT [dbo].[years] ([year_pk]) VALUES (2899)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (2900)
INSERT [dbo].[years] ([year_pk]) VALUES (2901)
INSERT [dbo].[years] ([year_pk]) VALUES (2902)
INSERT [dbo].[years] ([year_pk]) VALUES (2903)
INSERT [dbo].[years] ([year_pk]) VALUES (2904)
INSERT [dbo].[years] ([year_pk]) VALUES (2905)
INSERT [dbo].[years] ([year_pk]) VALUES (2906)
INSERT [dbo].[years] ([year_pk]) VALUES (2907)
INSERT [dbo].[years] ([year_pk]) VALUES (2908)
INSERT [dbo].[years] ([year_pk]) VALUES (2909)
INSERT [dbo].[years] ([year_pk]) VALUES (2910)
INSERT [dbo].[years] ([year_pk]) VALUES (2911)
INSERT [dbo].[years] ([year_pk]) VALUES (2912)
INSERT [dbo].[years] ([year_pk]) VALUES (2913)
INSERT [dbo].[years] ([year_pk]) VALUES (2914)
INSERT [dbo].[years] ([year_pk]) VALUES (2915)
INSERT [dbo].[years] ([year_pk]) VALUES (2916)
INSERT [dbo].[years] ([year_pk]) VALUES (2917)
INSERT [dbo].[years] ([year_pk]) VALUES (2918)
INSERT [dbo].[years] ([year_pk]) VALUES (2919)
INSERT [dbo].[years] ([year_pk]) VALUES (2920)
INSERT [dbo].[years] ([year_pk]) VALUES (2921)
INSERT [dbo].[years] ([year_pk]) VALUES (2922)
INSERT [dbo].[years] ([year_pk]) VALUES (2923)
INSERT [dbo].[years] ([year_pk]) VALUES (2924)
INSERT [dbo].[years] ([year_pk]) VALUES (2925)
INSERT [dbo].[years] ([year_pk]) VALUES (2926)
INSERT [dbo].[years] ([year_pk]) VALUES (2927)
INSERT [dbo].[years] ([year_pk]) VALUES (2928)
INSERT [dbo].[years] ([year_pk]) VALUES (2929)
INSERT [dbo].[years] ([year_pk]) VALUES (2930)
INSERT [dbo].[years] ([year_pk]) VALUES (2931)
INSERT [dbo].[years] ([year_pk]) VALUES (2932)
INSERT [dbo].[years] ([year_pk]) VALUES (2933)
INSERT [dbo].[years] ([year_pk]) VALUES (2934)
INSERT [dbo].[years] ([year_pk]) VALUES (2935)
INSERT [dbo].[years] ([year_pk]) VALUES (2936)
INSERT [dbo].[years] ([year_pk]) VALUES (2937)
INSERT [dbo].[years] ([year_pk]) VALUES (2938)
INSERT [dbo].[years] ([year_pk]) VALUES (2939)
INSERT [dbo].[years] ([year_pk]) VALUES (2940)
INSERT [dbo].[years] ([year_pk]) VALUES (2941)
INSERT [dbo].[years] ([year_pk]) VALUES (2942)
INSERT [dbo].[years] ([year_pk]) VALUES (2943)
INSERT [dbo].[years] ([year_pk]) VALUES (2944)
INSERT [dbo].[years] ([year_pk]) VALUES (2945)
INSERT [dbo].[years] ([year_pk]) VALUES (2946)
INSERT [dbo].[years] ([year_pk]) VALUES (2947)
INSERT [dbo].[years] ([year_pk]) VALUES (2948)
INSERT [dbo].[years] ([year_pk]) VALUES (2949)
INSERT [dbo].[years] ([year_pk]) VALUES (2950)
INSERT [dbo].[years] ([year_pk]) VALUES (2951)
INSERT [dbo].[years] ([year_pk]) VALUES (2952)
INSERT [dbo].[years] ([year_pk]) VALUES (2953)
INSERT [dbo].[years] ([year_pk]) VALUES (2954)
INSERT [dbo].[years] ([year_pk]) VALUES (2955)
INSERT [dbo].[years] ([year_pk]) VALUES (2956)
INSERT [dbo].[years] ([year_pk]) VALUES (2957)
INSERT [dbo].[years] ([year_pk]) VALUES (2958)
INSERT [dbo].[years] ([year_pk]) VALUES (2959)
INSERT [dbo].[years] ([year_pk]) VALUES (2960)
INSERT [dbo].[years] ([year_pk]) VALUES (2961)
INSERT [dbo].[years] ([year_pk]) VALUES (2962)
INSERT [dbo].[years] ([year_pk]) VALUES (2963)
INSERT [dbo].[years] ([year_pk]) VALUES (2964)
INSERT [dbo].[years] ([year_pk]) VALUES (2965)
INSERT [dbo].[years] ([year_pk]) VALUES (2966)
INSERT [dbo].[years] ([year_pk]) VALUES (2967)
INSERT [dbo].[years] ([year_pk]) VALUES (2968)
INSERT [dbo].[years] ([year_pk]) VALUES (2969)
INSERT [dbo].[years] ([year_pk]) VALUES (2970)
INSERT [dbo].[years] ([year_pk]) VALUES (2971)
INSERT [dbo].[years] ([year_pk]) VALUES (2972)
INSERT [dbo].[years] ([year_pk]) VALUES (2973)
INSERT [dbo].[years] ([year_pk]) VALUES (2974)
INSERT [dbo].[years] ([year_pk]) VALUES (2975)
INSERT [dbo].[years] ([year_pk]) VALUES (2976)
INSERT [dbo].[years] ([year_pk]) VALUES (2977)
INSERT [dbo].[years] ([year_pk]) VALUES (2978)
INSERT [dbo].[years] ([year_pk]) VALUES (2979)
INSERT [dbo].[years] ([year_pk]) VALUES (2980)
INSERT [dbo].[years] ([year_pk]) VALUES (2981)
INSERT [dbo].[years] ([year_pk]) VALUES (2982)
INSERT [dbo].[years] ([year_pk]) VALUES (2983)
INSERT [dbo].[years] ([year_pk]) VALUES (2984)
INSERT [dbo].[years] ([year_pk]) VALUES (2985)
INSERT [dbo].[years] ([year_pk]) VALUES (2986)
INSERT [dbo].[years] ([year_pk]) VALUES (2987)
INSERT [dbo].[years] ([year_pk]) VALUES (2988)
INSERT [dbo].[years] ([year_pk]) VALUES (2989)
INSERT [dbo].[years] ([year_pk]) VALUES (2990)
INSERT [dbo].[years] ([year_pk]) VALUES (2991)
INSERT [dbo].[years] ([year_pk]) VALUES (2992)
INSERT [dbo].[years] ([year_pk]) VALUES (2993)
INSERT [dbo].[years] ([year_pk]) VALUES (2994)
INSERT [dbo].[years] ([year_pk]) VALUES (2995)
INSERT [dbo].[years] ([year_pk]) VALUES (2996)
INSERT [dbo].[years] ([year_pk]) VALUES (2997)
INSERT [dbo].[years] ([year_pk]) VALUES (2998)
INSERT [dbo].[years] ([year_pk]) VALUES (2999)
GO
INSERT [dbo].[years] ([year_pk]) VALUES (3000)
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "View_IncomeTotals_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "years"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 84
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_ExpenseTotals_1"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_LoanTotals_1"
            Begin Extent = 
               Top = 84
               Left = 289
               Bottom = 196
               Right = 475
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_VehicleExpenseTotals_1"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 382
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_TuitionTotals_1"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 496
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_InsuranceTotals_1"
            Begin Extent = 
               Top = 384
               Left = 262
               Bottom = 513' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AnnualTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 7170
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AnnualTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AnnualTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[22] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "expenses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 242
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 24
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2460
         Alias = 2685
         Table = 1170
         Output = 930
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 870
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "income"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 220
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "income_sources"
            Begin Extent = 
               Top = 106
               Left = 287
               Bottom = 324
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "family_members"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 225
               Right = 695
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 2160
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_IncomeTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_IncomeTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "insur_payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "years"
            Begin Extent = 
               Top = 6
               Left = 277
               Bottom = 84
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "months"
            Begin Extent = 
               Top = 84
               Left = 277
               Bottom = 196
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "insur_payments"
            Begin Extent = 
               Top = 16
               Left = 49
               Bottom = 205
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "insurance"
            Begin Extent = 
               Top = 8
               Left = 323
               Bottom = 205
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loan_payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "years"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 84
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "months"
            Begin Extent = 
               Top = 84
               Left = 274
               Bottom = 196
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LoanMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LoanMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "loan_payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 189
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loan"
            Begin Extent = 
               Top = 4
               Left = 314
               Bottom = 192
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LoanTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LoanTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[11] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "expenses_1"
            Begin Extent = 
               Top = 130
               Left = 679
               Bottom = 259
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_VehicleExpenseMonthlyTotals"
            Begin Extent = 
               Top = 41
               Left = 16
               Bottom = 153
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_IncomeMonthlyTotals_1"
            Begin Extent = 
               Top = 175
               Left = 46
               Bottom = 304
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_LoanMonthlyTotals"
            Begin Extent = 
               Top = 8
               Left = 690
               Bottom = 120
               Right = 872
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_TuitionMonthlyTotals"
            Begin Extent = 
               Top = 275
               Left = 514
               Bottom = 387
               Right = 708
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_InsuranceMonthlyTotals"
            Begin Extent = 
               Top = 273
               Left = 261
               Bottom = 385
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_Months"
            Begin Extent = 
               Top = 0
               Left = 359
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'              Bottom = 112
               Right = 529
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "years"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 197
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "months"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 194
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Months'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Months'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tuition_payments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "years"
            Begin Extent = 
               Top = 6
               Left = 286
               Bottom = 84
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "months"
            Begin Extent = 
               Top = 84
               Left = 286
               Bottom = 196
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_TuitionMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_TuitionMonthlyTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vehicle_expenses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vehicles"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 201
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_VehicleExpenseTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_VehicleExpenseTotals'
GO
USE [master]
GO
ALTER DATABASE [Budget] SET  READ_WRITE 
GO
