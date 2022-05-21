--- What is the summery of all approved PPP loans
SELECT count(LoanNumber)as Number_of_Approved,
		sum(InitialApprovalAmount) as Approved_Amount,
		avg(InitialApprovalAmount) as Average_loan_size
  FROM [PortfolioDB].[dbo].[sba_public_data]

--- What is the summery of all approved PPP loans 2020 Vs 2021
select 
	year(DateApproved)as year_approved,
	count(LoanNumber)as Number_of_Approved,
	sum(InitialApprovalAmount) as Approved_Amount,
	avg(InitialApprovalAmount) as Average_loan_size
from [PortfolioDB].[dbo].[sba_public_data]
group by year(DateApproved)
 
 
 
 -- Count of Originating Lenders that year
 
 select 
		year(DateApproved) as year_approved,
		count(distinct OriginatingLender) num_of_OriginatingLenders,
		count(LoanNumber)as Number_of_Approved,
		sum(InitialApprovalAmount) as Approved_Amount,
		avg(InitialApprovalAmount) as Average_loan_size
  from [PortfolioDB].[dbo].[sba_public_data]
  group by year(DateApproved)

 -- Top 15 Originating Landers by Loan Count, Total Amount and Average in 2020 and 2021 
SELECT TOP 15 
	OriginatingLender,
	--count(distinct OriginatingLender) num_of_OriginatingLenders,
	count(LoanNumber)as Number_of_Approved,
	sum(InitialApprovalAmount) as Approved_Amount,
	avg(InitialApprovalAmount) as Average_loan_size
from 
	[PortfolioDB].[dbo].[sba_public_data]
where
	year(DateApproved) = 2021
group by 
	OriginatingLender
order by 3 desc

SELECT TOP 15 
	OriginatingLender,
	--count(distinct OriginatingLender) num_of_OriginatingLenders,
	count(LoanNumber)as Number_of_Approved,
	sum(InitialApprovalAmount) as Approved_Amount,
	avg(InitialApprovalAmount) as Average_loan_size
from 
	[PortfolioDB].[dbo].[sba_public_data]
where
	year(DateApproved) = 2020
group by 
	OriginatingLender
order by 3 desc


--Top 20 Industries that recieved the PPP loans in 2021 and 2020

count(LoanNumber)as Number_of_Approved,
sum(InitialApprovalAmount) as Approved_Amount,
avg(InitialApprovalAmount) as Average_loan_size

SELECT TOP 20 
	d.Sector,
	count(LoanNumber) as Number_of_Approved,
	sum(InitialApprovalAmount) as Approved_Amount,
	avg(InitialApprovalAmount) as Average_loan_size
from 
	[PortfolioDB].[dbo].[sba_public_data] p
	INNER JOIN
	[PortfolioDB].[dbo].[sba_naics_sector_codes_description] d
		ON left(p.NAICSCode,2) = d.LookupCodes
Where
	year(DateApproved) = 2021
group by 
	d.Sector
Order by 3 desc

SELECT Sector, Number_of_Approved, Approved_Amount, (Approved_Amount/SUM(Approved_Amount) OVER())*100 AS PercentByAmount, Average_loan_size
FROM(
	SELECT TOP 20
	d.Sector,
	count(LoanNumber) as Number_of_Approved,
	sum(InitialApprovalAmount) as Approved_Amount,
	avg(InitialApprovalAmount) as Average_loan_size
FROM 
	[PortfolioDB].[dbo].[sba_public_data] p
	INNER JOIN
	[PortfolioDB].[dbo].[sba_naics_sector_codes_description] d
		ON left(p.NAICSCode,2) = d.LookupCodes
Where
	year(DateApproved) = 2021
group by 
	d.Sector
Order by 3 desc
)SUB


-- How much of the PPP loans of 2021 have been fully forgiven
SELECT 
	COUNT(LoanNumber) AS Loans_Approved,
	SUM(CurrentApprovalAmount) AS Current_Approved_Amount,
	AVG(CurrentApprovalAmount) AS Current_Average_Loan_Size,
	SUM(ForgivenessAmount) AS Forgiven_Amount,
	SUM(ForgivenessAmount)/SUM(CurrentApprovalAmount) * 100 AS Percent_Forgiven_Amount
FROM 
	PortfolioDB.[dbo].[sba_public_data]

-- Year, Month with highest PPP loans approved.
SELECT
	YEAR(DateApproved) AS Year_Approved,
	MONTH(DateApproved)  AS Month_Approved,
	COUNT(LoanNumber) AS Loans_Approved,
	SUM(InitialApprovalAmount) AS Initial_Approved_Amount,
	AVG(InitialApprovalAmount) AS Initial_Average_Loan_Size
FROM 
	PortfolioDB.[dbo].[sba_public_data]
GROUP BY YEAR(DateApproved), MONTH(DateApproved)
ORDER BY 4 desc