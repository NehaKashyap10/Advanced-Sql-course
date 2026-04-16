SELECT
ps.PatientId
, ps.AdmittedDate
, ps.DischargeDate
, ps.Hospital
, ps.Ward
, DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) + 1 AS LengthOfStay
, DATEADD(WEEK,-2,PS.AdmittedDate) AS ReminderDate
FROM
PatientStay ps
WHERE
ps.Hospital IN ( 'Oxleas', 'PRUH' )
AND ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-28'
AND ps.Ward LIKE '%Surgery'
ORDER BY
ps.AdmittedDate DESC
, ps.PatientId DESC;


SELECT
ps.Hospital
,ps.Ward
, COUNT(*) AS NumberOfAdmissions
, SUM(ps.Tariff) AS TotalTariff
,AVG(ps.Tariff) AS Average_Tariff
FROM
PatientStay ps
GROUP BY
ps.Hospital,
ps.Ward
--HAVING
--COUNT(*) > 10
ORDER BY
NumberOfAdmissions DESC;