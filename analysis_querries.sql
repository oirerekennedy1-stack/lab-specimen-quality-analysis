-- Query 1: Rejection rate by department
-- Finding: Emergency has the highest rate among real departments (~10.6% vs ~9% overall)
SELECT department,
       COUNT(*) AS total,
       SUM(rejection_status = 'Rejected') AS rejected,
       ROUND(SUM(rejection_status = 'Rejected') / COUNT(*) * 100, 1) AS rejection_rate
FROM specimens
GROUP BY department
ORDER BY rejection_rate DESC;


-- Query 2: Turnaround time by department (mean + median)
-- Finding: all departments cluster tightly (73-79 min); mean and median are close,
-- so turnaround time is not meaningfully skewed by outliers
SELECT department,
       COUNT(*) AS total,
       ROUND(AVG(turnaround_time_min), 1) AS avg_turnaround,
       ROUND(
           (SELECT AVG(t2.turnaround_time_min)
            FROM (
                SELECT turnaround_time_min,
                       ROW_NUMBER() OVER (ORDER BY turnaround_time_min) AS rn,
                       COUNT(*) OVER () AS cnt
                FROM specimens t3
                WHERE t3.department = t1.department
                  AND t3.turnaround_time_min IS NOT NULL
            ) t2
            WHERE t2.rn IN (FLOOR((cnt+1)/2), CEIL((cnt+1)/2))
           ), 1
       ) AS median_turnaround
FROM specimens t1
GROUP BY department
ORDER BY avg_turnaround DESC;


-- Query 3: Rejection reason breakdown by department
-- Finding: reasons are broadly evenly spread across departments (no single
-- dominant cause anywhere); Emergency/Outpatient have higher counts mainly
-- because they have more total rejections, not a different failure pattern
SELECT department, rejection_reason, COUNT(*) AS total
FROM specimens
WHERE rejection_status = 'Rejected'
GROUP BY department, rejection_reason
ORDER BY department, total DESC;
