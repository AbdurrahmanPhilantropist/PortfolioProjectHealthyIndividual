-- Create a join table

select *
From "Absenteeism_at_work" a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN "Reasons" r
ON a.ID = r."Number"


-- Find the healthiest employee
select *
from "Absenteeism_at_work"
WHERE "Social drinker" = 0 AND "Social smoker" = 0 AND "Body mass index" < 25
AND "Absenteeism time in hours" < (select avg("Absenteeism time in hours") FROM "Absenteeism_at_work")

-- Compensation rate increases for non-smokers

select count(*)
from "Absenteeism_at_work"
WHERE "Social smoker" = 0

-- Optimize Query
select
    a.ID,
    r."Reason",
    a."Month of absence",
    a."Body mass index",
    CASE
    WHEN a."Body mass index" < 18.5 THEN 'underweight'
    WHEN a."Body mass index" between 18 AND 25 THEN 'Health Weight'
    WHEN a."Body mass index" BETWEEN 25 AND 30 THEN 'Overweight'
    WHEN a."Body mass index" > 18.5 THEN 'Obese'
    ELSE 'Unknown' END AS BMI_category,
CASE
WHEN a."Month of absence" IN (12, 1, 2) THEN 'winter'
WHEN a."Month of absence" IN (3, 4, 5) THEN 'Spring'
WHEN a."Month of absence" IN (6, 7, 8) THEN 'summer'
WHEN a."Month of absence" IN (9, 10, 11) THEN 'fall'
 ELSE 'Unknown' END AS Season_Names

From "Absenteeism_at_work" a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN "Reasons" r
ON a.ID = r."Number"

