SELECT
  CASE
    WHEN Time_to_Hire_Days <= 15 THEN '0-15 Days'
    WHEN Time_to_Hire_Days <= 30 THEN '16-30 Days'
    WHEN Time_to_Hire_Days <= 45 THEN '31-45 Days'
    ELSE '46-60 Days'
  END AS hiring_time_band,

  COUNT(*) AS hired_candidates,

  MIN(Time_to_Hire_Days) AS min_time_to_hire_days,

  MAX(Time_to_Hire_Days) AS max_time_to_hire_days,

  ROUND(
    AVG(Time_to_Hire_Days),
    2
  ) AS avg_time_to_hire_days

FROM
  `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

WHERE
  Joining_Status = 'Joined'
  AND Time_to_Hire_Days IS NOT NULL

GROUP BY
  hiring_time_band

ORDER BY
  min_time_to_hire_days ASC;
