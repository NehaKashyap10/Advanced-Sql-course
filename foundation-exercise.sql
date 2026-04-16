/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

SELECT
	*
FROM
	PatientStay ps ;

/*
1. Filter the list the patients to show only those  -
a) in the Oxleas hospital,
b) and also in the PRUH hospital,
c) admitted in February 2024
d) only the surgical wards (i.e. wards ending with the word Surgery)


2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.
3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
*/

-- Write the SQL statement here


/*
5. How many patients has each hospital admitted? 
6. How much is the total tariff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

-- Write the SQL statement here
	-- for each country, list and the three dates with the highest daily cases

Select * from 


(SELECT 
    cc.Country
    , cc.DateRecorded
    , cc.DailyCases
    , RANK() OVER (PARTITION BY cc.Country ORDER BY cc.DailyCases DESC) Ranking
FROM
    CovidCase cc)as Ranked_data
	where Ranked_data.Ranking <=3


	
	-- for each country, list and the three dates with the highest daily cases
WITH cte AS (
SELECT
    cc.Country
    , cc.DateRecorded
    , cc.DailyCases
    , RANK() OVER (PARTITION BY cc.Country ORDER BY cc.DailyCases DESC) Ranking
FROM
    CovidCase cc )
SELECT
    *
FROM cte
where cte.Ranking <= 3
ORDER BY cte.Country, cte.Ranking;