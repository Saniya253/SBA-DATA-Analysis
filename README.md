# SBA-DATA-Analysis
This project is about importing, cleaning and exploring the PPP(Paycheck Protection Program) data provided by SBA.
- What is PPP?
According to aarp organization, as part of the CARES Act signed into law in late March, the government set aside $349 billion for what the legislation calls the Paycheck Protection Program (PPP) that is run by the Small Business Administration (SBA), with an additional $310 billion added in late April.

Steps covered-

1. Importing data to SQL Server Database using SSIS.

2. Cleaning the data using T-SQL in the SSMS environment.

3. Performing Exploratory Data Analysis using SQL queries.

4. Importing the cleaned data to Tableau.

5. Developing an Interactive BI Report.

So, we are going to import, clean and analyze this data in order to find insights from it.
First step is to import the data from the website. Data used in this project is SBA's open data downloaded from SBA's website. There are 13 public CSV data files that hold information about loans and 1 file that is data dictionary (Meta Data) which explains the column names/ terms used in PPP files. Then there is data file that lists small business size standards matched to industries described in the North American Industry Classification System (NAICS).
Here's the link to download the data

Public Data: https://data.sba.gov/dataset/ppp-foia
NAICS data: https://www.sba.gov/document/support-table-size-standards

After downloading and importing the files into database using SSIS. Next step is to clean the files to make the format uniform and accessible and adding important data that is missing or not mentioned.

Then, we do the Exploratory Data Analysis to find the answers to questions and find useful insights.
Questions for this project:
- What is the summery of all approved PPP loans
- What is the summery of all approved PPP loans 2020 Vs 2021
- Count of Originating Lenders that year
- Top 15 Originating Landers by Loan Count, Total Amount and Average in 2020 and 2021 
- Top 20 Industries that recieved the PPP loans in 2021 and 2020
- How much of the PPP loans of 2021 have been fully forgiven
- Year, Month with highest PPP loans approved.

Now, we implement step number 4, importing the cleaned data in Tableau to create dashboard.
After it we have created a View, ppp_main, in which we joined the publicdata table with sector info table.
Now, next thing we are going to do is to do the opposite of what we did initially in this project, we imported data from CSV to database using SSIS tool, Now we are gonna export the data from database to text files using the same tool SSIS.
Now we'll start working on Tableau worksheets.
We created charts and tables based on the questions we answered in EDA using SQL phase. Here's the screen shot of final Report.
![PPP Summery Dashboard](https://user-images.githubusercontent.com/87570174/171105799-44e85980-ff07-4116-9428-43ccda53007f.png)

