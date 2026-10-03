SELECT
  Salary_Band,

  COUNT(*) AS total_candidates,

  COUNTIF(Final_Status = 'Selected') AS selected_candidates,

  COUNTIF(Joining_Status = 'Joined') AS joined_candidates,

  ROUND(
    AVG(Offer_Salary),
    2
  ) AS avg_offer_salary,

  ROUND(
    AVG(Candidate_Rating),
    2
  ) AS avg_candidate_rating,

  ROUND(
    COUNTIF(Joining_Status = 'Joined') * 100.0 /
    NULLIF(COUNTIF(Final_Status = 'Selected'), 0),
    2
  ) AS joining_rate_pct

FROM
  `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

GROUP BY
  Salary_Band

ORDER BY
  avg_offer_salary ASC;
