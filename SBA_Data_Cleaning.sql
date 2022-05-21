/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Field_Name]
      ,[Field_Description]
  FROM [PortfolioDB].[dbo].[ppp_data_dictionary]


-- Cleaning the columns that are useful
SELECT *
INTO sba_naics_sector_codes_description
FROM ( 
 SELECT NAICS_Industry_Description, 
  SUBSTRING(NAICS_Industry_Description, 8,2) as LookupCodes, 
  SUBSTRING(NAICS_Industry_Description,  charindex('–',NAICS_Industry_Description)+2, len(NAICS_Industry_Description)) as Sector
  FROM [PortfolioDB].[dbo].[sba_industry_standards]
  WHERE NAICS_Industry_Description like ('Sector%')
 ) main


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [NAICS_Industry_Description]
      ,[LookupCodes]
      ,[Sector]
  FROM [PortfolioDB].[dbo].[sba_naics_sector_codes_description]
  order by LookupCodes

--Inserting the missing values and updating 'Sector' column accordingly
insert into [dbo].[sba_naics_sector_codes_description]
values 
  ('Sector 31 – 33 – Manufacturing', 32, 'Manufacturing'), 
  ('Sector 31 – 33 – Manufacturing', 33, 'Manufacturing'), 
  ('Sector 44 - 45 – Retail Trade', 45, 'Retail Trade'),
  ('Sector 48 - 49 – Transportation and Warehousing', 49, 'Transportation and Warehousing')


UPDATE sba_naics_sector_codes_description 
set Sector = 'Manufacturing'
where LookupCodes = 31;