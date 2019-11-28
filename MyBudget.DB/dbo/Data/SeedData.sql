/*
This script was created by Visual Studio on 11/27/2019 at 1:26 PM.
Run this script on (localdb)\MSSQLLocalDB.MyBudget2 (WN-USBWIN10VM\aesalmela) to make it the same as (localdb)\MSSQLLocalDB.MyBudget (WN-USBWIN10VM\aesalmela).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[tuition] DROP CONSTRAINT [FK_tuition_institutions]
ALTER TABLE [dbo].[tuition] DROP CONSTRAINT [FK_tuition_family_members]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_tuition]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_insurance]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_loans]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_months]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_years]
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [FK_payments_vehicles]
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [FK_insurance_family_members]
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [FK_insurance_properties]
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [FK_insurance_vehicles]
ALTER TABLE [dbo].[insurance] DROP CONSTRAINT [FK_insurance_insurance_types]
ALTER TABLE [dbo].[income] DROP CONSTRAINT [FK_income_months]
ALTER TABLE [dbo].[income] DROP CONSTRAINT [FK_income_income_sources]
ALTER TABLE [dbo].[income] DROP CONSTRAINT [FK_income_years]
ALTER TABLE [dbo].[income] DROP CONSTRAINT [FK_income_family_members]
ALTER TABLE [dbo].[vehicles] DROP CONSTRAINT [FK_vehicles_years]
ALTER TABLE [dbo].[loans] DROP CONSTRAINT [FK_loans_vehicles]
ALTER TABLE [dbo].[loans] DROP CONSTRAINT [FK_loans_properties]
ALTER TABLE [dbo].[loans] DROP CONSTRAINT [FK_loans_family_members]
ALTER TABLE [dbo].[loans] DROP CONSTRAINT [FK_loans_loan_types]
ALTER TABLE [dbo].[expenses] DROP CONSTRAINT [FK_expenses_years]
ALTER TABLE [dbo].[expenses] DROP CONSTRAINT [FK_expenses_expense_types]
ALTER TABLE [dbo].[expenses] DROP CONSTRAINT [FK_expenses_months]
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1980)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1981)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1982)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1983)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1984)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1985)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1986)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1987)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1988)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1989)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1990)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1991)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1992)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1993)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1994)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1995)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1996)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1997)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1998)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (1999)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2000)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2001)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2002)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2003)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2004)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2005)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2006)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2007)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2008)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2009)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2010)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2011)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2012)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2013)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2014)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2015)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2016)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2017)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2018)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2019)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2020)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2021)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2022)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2023)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2024)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2025)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2026)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2027)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2028)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2029)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2030)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2031)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2032)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2033)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2034)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2035)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2036)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2037)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2038)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2039)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2040)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2041)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2042)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2043)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2044)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2045)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2046)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2047)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2048)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2049)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2050)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2051)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2052)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2053)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2054)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2055)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2056)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2057)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2058)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2059)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2060)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2061)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2062)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2063)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2064)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2065)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2066)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2067)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2068)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2069)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2070)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2071)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2072)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2073)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2074)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2075)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2076)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2077)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2078)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2079)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2080)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2081)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2082)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2083)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2084)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2085)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2086)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2087)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2088)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2089)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2090)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2091)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2092)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2093)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2094)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2095)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2096)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2097)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2098)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2099)
INSERT INTO [dbo].[years] ([year_pk]) VALUES (2100)
SET IDENTITY_INSERT [dbo].[loan_types] ON
INSERT INTO [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (1, N'Mortgage', 1)
INSERT INTO [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (2, N'2nd Mortgage', 1)
INSERT INTO [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (3, N'Line of Credit', 1)
INSERT INTO [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (4, N'Auto', 1)
INSERT INTO [dbo].[loan_types] ([loan_type_pk], [loan_type_name], [active]) VALUES (5, N'Student', 1)
SET IDENTITY_INSERT [dbo].[loan_types] OFF
SET IDENTITY_INSERT [dbo].[loans] ON
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (1, N'Wilson Ave', 1, NULL, 2, NULL, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (2, N'Wilson Ave 2nd', 2, NULL, 2, NULL, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (3, N'Grand Am', 4, NULL, NULL, 2, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (4, N'Lowell Dr', 1, NULL, 3, NULL, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (5, N'Torrent', 4, NULL, NULL, 3, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (6, N'Katie-Augie', 5, 4, NULL, NULL, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (7, N'Katie-Clarion', 5, 4, NULL, NULL, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (8, N'Louisiana Ave', 1, NULL, 4, NULL, 1)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (9, N'Caravan', 4, NULL, NULL, 5, 0)
INSERT INTO [dbo].[loans] ([loan_pk], [loan_alias], [loan_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (10, N'Ram', 4, NULL, NULL, 6, 0)
SET IDENTITY_INSERT [dbo].[loans] OFF
SET IDENTITY_INSERT [dbo].[vehicles] ON
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (1, N'LHS', N'LHs', N'Chrysler', 1995, 0)
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (2, N'Grand Am', N'Grand Am', N'Pontiac', 2003, 0)
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (3, N'Torrent', N'Torrent', N'Pontiac', 2006, 0)
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (4, N'Uplander', N'Uplander', N'Chevy', 2007, 0)
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (5, N'Van', N'Grand Caravan', N'Dodge', 2014, 1)
INSERT INTO [dbo].[vehicles] ([vehicle_pk], [vehicle_name], [vehicle_model], [vehicle_make], [vehicle_year_id], [active]) VALUES (6, N'Ram', N'Ram 1500', N'Dodge', 2014, 1)
SET IDENTITY_INSERT [dbo].[vehicles] OFF
SET IDENTITY_INSERT [dbo].[family_members] ON
INSERT INTO [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (3, N'Andy', NULL, NULL, 1)
INSERT INTO [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (4, N'Katie', NULL, NULL, 1)
INSERT INTO [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (5, N'Karlee', NULL, NULL, 1)
INSERT INTO [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (6, N'Cam', NULL, NULL, 1)
INSERT INTO [dbo].[family_members] ([family_member_pk], [first_name], [middle_name], [last_name], [active]) VALUES (7, N'Maggie', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[family_members] OFF
SET IDENTITY_INSERT [dbo].[insurance] ON
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (1, N'Andy-Life', 3, 3, NULL, NULL, 1)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (2, N'Katie-Life', 3, 4, NULL, NULL, 1)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (3, N'LHS', 2, NULL, NULL, 1, 0)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (4, N'Grand Am', 2, NULL, NULL, 2, 0)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (5, N'Torrent', 2, NULL, NULL, 3, 0)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (6, N'Uplander', 2, NULL, NULL, 4, 0)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (7, N'Caravan', 2, NULL, NULL, 5, 1)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (8, N'Umbrella', 4, NULL, 4, NULL, 1)
INSERT INTO [dbo].[insurance] ([insurance_pk], [insurance_alias], [insurance_type_id], [family_member_id], [property_id], [vehicle_id], [active]) VALUES (9, N'Ram', 2, NULL, NULL, 6, 1)
SET IDENTITY_INSERT [dbo].[insurance] OFF
SET IDENTITY_INSERT [dbo].[properties] ON
INSERT INTO [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (2, N'Wilson Ave', N'4509 Wilson Ave', NULL, N'Sioux Falls', N'SD', N'57106', 0)
INSERT INTO [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (3, N'Lowell Dr', N'1082 Lowell Dr', NULL, N'Apple Valley', N'MN', N'55124', 0)
INSERT INTO [dbo].[properties] ([property_pk], [property_name], [property_address1], [property_address2], [property_city], [property_state], [property_zip], [active]) VALUES (4, N'Louisiana Ave', N'13868 Louisiana Ave', NULL, N'Savage', N'MN', N'55378', 1)
SET IDENTITY_INSERT [dbo].[properties] OFF
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (1, N'JAN', N'Janurary')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (2, N'FEB', N'Feburary')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (3, N'MAR', N'March')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (4, N'APR', N'April')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (5, N'MAY', N'May')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (6, N'JUN', N'June')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (7, N'JUL', N'July')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (8, N'AUG', N'August')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (9, N'SEP', N'September')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (10, N'OCT', N'October')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (11, N'NOV', N'November')
INSERT INTO [dbo].[months] ([month_pk], [month_abbr], [month_name]) VALUES (12, N'DEC', N'December')
SET IDENTITY_INSERT [dbo].[tuition] ON
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (1, N'Karlee - Grace', 5, 1, 0)
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (2, N'Katie - Clarion', 4, 2, 0)
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (3, N'Cam - Grace', 6, 1, 0)
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (4, N'Maggie - Grace', 7, 1, 0)
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (5, N'Cam - Kinder', 6, 3, 0)
INSERT INTO [dbo].[tuition] ([tuition_pk], [tuition_alias], [family_member_id], [institution_id], [active]) VALUES (6, N'Katie - MSU', 4, 4, 1)
SET IDENTITY_INSERT [dbo].[tuition] OFF
SET IDENTITY_INSERT [dbo].[expense_types] ON
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (1, N'Gasoline', N'Gasoline')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (2, N'Electrical', N'Electric')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (3, N'Water', N'Water')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (4, N'Garbage', N'Garbage')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (5, N'Gym', N'Gym')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (6, N'Healthcare', N'Healthcare')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (7, N'Household Goods', N'HG')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (8, N'Home Improvements', N'HI')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (9, N'Daycare', N'Daycare')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (10, N'Natural Gas', N'Gas')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (11, N'Cell Phone', N'Cell')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (12, N'Home Phone', N'Phone')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (13, N'Cable TV', N'Cable')
INSERT INTO [dbo].[expense_types] ([expense_type_pk], [expense_type], [expense_type_abbr]) VALUES (14, N'Internet', N'Internet')
SET IDENTITY_INSERT [dbo].[expense_types] OFF
SET IDENTITY_INSERT [dbo].[income_sources] ON
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (1, N'CHS', N'Children Home Society', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (2, N'WFFB', N'Wells Fargo Financial Bank', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (3, N'LHS', N'Lennox High School', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (4, N'KIL', N'Killian Community College', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (5, N'USB', N'US Bank', 1)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (6, N'HLC', N'Huntington Learning Center', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (7, N'EHS', N'Eastview High School', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (8, N'MB', N'Mackin Books', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (9, N'BES', N'Burnsvill Eagan Savage 191', 1)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (10, N'SCL', N'Scott County Libraries', 0)
INSERT INTO [dbo].[income_sources] ([income_source_pk], [income_source_acro], [income_source_name], [active]) VALUES (11, N'RAVE', N'Rosemount-Apple Valley-Eagan 196', 0)
SET IDENTITY_INSERT [dbo].[income_sources] OFF
SET IDENTITY_INSERT [dbo].[insurance_types] ON
INSERT INTO [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (1, N'Home', 1)
INSERT INTO [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (2, N'Auto', 1)
INSERT INTO [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (3, N'Term Life', 1)
INSERT INTO [dbo].[insurance_types] ([insur_type_pk], [insur_type_name], [active]) VALUES (4, N'Umbrella', 1)
SET IDENTITY_INSERT [dbo].[insurance_types] OFF
SET IDENTITY_INSERT [dbo].[institutions] ON
INSERT INTO [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (1, N'Grace Preschool', NULL, NULL, NULL, NULL, NULL, 0)
INSERT INTO [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (2, N'Clarion University', NULL, NULL, NULL, NULL, NULL, 0)
INSERT INTO [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (3, N'Southview Elementary', NULL, NULL, NULL, NULL, NULL, 0)
INSERT INTO [dbo].[institutions] ([institution_pk], [institution_name], [institution_address1], [institution_address2], [institution_city], [institution_state], [institution_zip], [active]) VALUES (4, N'Mankato State', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[institutions] OFF
ALTER TABLE [dbo].[tuition]
    ADD CONSTRAINT [FK_tuition_institutions] FOREIGN KEY ([institution_id]) REFERENCES [dbo].[institutions] ([institution_pk])
ALTER TABLE [dbo].[tuition]
    ADD CONSTRAINT [FK_tuition_family_members] FOREIGN KEY ([family_member_id]) REFERENCES [dbo].[family_members] ([family_member_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_tuition] FOREIGN KEY ([tuition_id]) REFERENCES [dbo].[tuition] ([tuition_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_insurance] FOREIGN KEY ([insurance_id]) REFERENCES [dbo].[insurance] ([insurance_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_loans] FOREIGN KEY ([loan_id]) REFERENCES [dbo].[loans] ([loan_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_months] FOREIGN KEY ([month_id]) REFERENCES [dbo].[months] ([month_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_years] FOREIGN KEY ([year_id]) REFERENCES [dbo].[years] ([year_pk])
ALTER TABLE [dbo].[payments]
    ADD CONSTRAINT [FK_payments_vehicles] FOREIGN KEY ([vehicle_id]) REFERENCES [dbo].[vehicles] ([vehicle_pk])
ALTER TABLE [dbo].[insurance]
    ADD CONSTRAINT [FK_insurance_family_members] FOREIGN KEY ([family_member_id]) REFERENCES [dbo].[family_members] ([family_member_pk])
ALTER TABLE [dbo].[insurance]
    ADD CONSTRAINT [FK_insurance_properties] FOREIGN KEY ([property_id]) REFERENCES [dbo].[properties] ([property_pk])
ALTER TABLE [dbo].[insurance]
    ADD CONSTRAINT [FK_insurance_vehicles] FOREIGN KEY ([vehicle_id]) REFERENCES [dbo].[vehicles] ([vehicle_pk])
ALTER TABLE [dbo].[insurance]
    ADD CONSTRAINT [FK_insurance_insurance_types] FOREIGN KEY ([insurance_type_id]) REFERENCES [dbo].[insurance_types] ([insur_type_pk])
ALTER TABLE [dbo].[income]
    ADD CONSTRAINT [FK_income_months] FOREIGN KEY ([month_id]) REFERENCES [dbo].[months] ([month_pk])
ALTER TABLE [dbo].[income]
    ADD CONSTRAINT [FK_income_income_sources] FOREIGN KEY ([income_source_id]) REFERENCES [dbo].[income_sources] ([income_source_pk])
ALTER TABLE [dbo].[income]
    ADD CONSTRAINT [FK_income_years] FOREIGN KEY ([year_id]) REFERENCES [dbo].[years] ([year_pk])
ALTER TABLE [dbo].[income]
    ADD CONSTRAINT [FK_income_family_members] FOREIGN KEY ([family_member_id]) REFERENCES [dbo].[family_members] ([family_member_pk])
ALTER TABLE [dbo].[vehicles]
    ADD CONSTRAINT [FK_vehicles_years] FOREIGN KEY ([vehicle_year_id]) REFERENCES [dbo].[years] ([year_pk])
ALTER TABLE [dbo].[loans]
    ADD CONSTRAINT [FK_loans_vehicles] FOREIGN KEY ([vehicle_id]) REFERENCES [dbo].[vehicles] ([vehicle_pk])
ALTER TABLE [dbo].[loans]
    ADD CONSTRAINT [FK_loans_properties] FOREIGN KEY ([property_id]) REFERENCES [dbo].[properties] ([property_pk])
ALTER TABLE [dbo].[loans]
    ADD CONSTRAINT [FK_loans_family_members] FOREIGN KEY ([family_member_id]) REFERENCES [dbo].[family_members] ([family_member_pk])
ALTER TABLE [dbo].[loans]
    ADD CONSTRAINT [FK_loans_loan_types] FOREIGN KEY ([loan_type_id]) REFERENCES [dbo].[loan_types] ([loan_type_pk])
ALTER TABLE [dbo].[expenses]
    ADD CONSTRAINT [FK_expenses_years] FOREIGN KEY ([year_id]) REFERENCES [dbo].[years] ([year_pk])
ALTER TABLE [dbo].[expenses]
    ADD CONSTRAINT [FK_expenses_expense_types] FOREIGN KEY ([expense_type_id]) REFERENCES [dbo].[expense_types] ([expense_type_pk])
ALTER TABLE [dbo].[expenses]
    ADD CONSTRAINT [FK_expenses_months] FOREIGN KEY ([month_id]) REFERENCES [dbo].[months] ([month_pk])
COMMIT TRANSACTION
