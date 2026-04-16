/*
 Tally Tables Exercise

 The temporary table, #PatientAdmission, has values for dates between the 1st and 8th January 2026 inclusive
 But not all dates are present

AI prompt to help get started:

 Act as a SQL expert.   
 A table #PatientAdmission with columns AdmittedDate DATE (PK) and NumAdmissions INT  
 should have rows with contiguous dates from the earliest date (say 1 Jan 2026) 
 and the latest date (say 31 Dec 2026) 
 There should be no gaps. How do I list any gaps?
 I have a Tally table with column N with values between 1 and 10000.  Please use that in your response
 */

DROP TABLE IF EXISTS #PatientAdmission;
CREATE TABLE #PatientAdmission (AdmittedDate DATE, NumAdmissions INT);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-01', 50);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-02', 60);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-03', 40);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-05', 20);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-07', 60);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2026-01-08', 50);
SELECT * FROM #PatientAdmission;

 drop table if exists #MyDates
 
select
    N
    ,DATEADD(DAY, N-1, '2026-01-01') AS TheDate
into #MyDates
 from Tally where N <=8
 
select * from #MyDates as a
left join #PatientAdmission as b  on a.TheDate = b.AdmittedDate
where AdmittedDate is null


SELECT
    md.TheDate AS TheDate
    --,pa.AdmittedDate AS AdmittedDate
    ,pa.NumAdmissions AS NumAdmissions
    , CASE WHEN pa.AdmittedDate IS NULL THEN 0 ELSE NumAdmissions END AS ProperAdmissions
    , ISNULL(pa.NumAdmissions, 0) AS ProperAdmissions2
    , COALESCE(pa.NumAdmissions, 0) AS ProperAdmissions3
FROM
    #MyDates md
    LEFT JOIN #PatientAdmission pa ON md.TheDate = pa.AdmittedDate
--WHERE pa.AdmittedDate IS NULL;