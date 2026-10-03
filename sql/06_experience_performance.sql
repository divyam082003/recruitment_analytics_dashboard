SELECT
  Experience_Band,

  COUNT(*) AS total_candidates,

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
  Experience_Band

ORDER BY
  selection_rate_pct DESC;
