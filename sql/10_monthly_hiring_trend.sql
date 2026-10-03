SELECT
  DATE(
    Application_Year,
    EXTRACT(MONTH FROM Application_Date),
    1
  ) AS application_month_date,

  Application_Year,

  EXTRACT(MONTH FROM Application_Date) AS month_number,

  Application_Month,

  COUNT(*) AS total_applications,

  COUNTIF(Screening_Status = 'Passed') AS screened_candidates,

  COUNTIF(Interview_Status = 'Completed') AS interviewed_candidates,

  COUNTIF(Final_Status = 'Selected') AS selected_candidates,

  COUNTIF(Joining_Status = 'Joined') AS joined_candidates,

  ROUND(
    COUNTIF(Final_Status = 'Selected') * 100.0 / COUNT(*),
    2
  ) AS selection_rate_pct,

  ROUND(
    COUNTIF(Joining_Status = 'Joined') * 100.0 / COUNT(*),
    2
  ) AS joining_rate_pct

FROM
  `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

GROUP BY
  application_month_date,
  Application_Year,
  month_number,
  Application_Month

ORDER BY
  application_month_date;
