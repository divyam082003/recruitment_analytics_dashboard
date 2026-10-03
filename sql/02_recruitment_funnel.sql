SELECT
  stage,
  candidate_count,
  stage_order
FROM (
  SELECT
    'Applied' AS stage,
    COUNT(*) AS candidate_count,
    1 AS stage_order
  FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

  UNION ALL

  SELECT
    'Screened' AS stage,
    COUNTIF(Screening_Status = 'Passed') AS candidate_count,
    2 AS stage_order
  FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

  UNION ALL

  SELECT
    'Interviewed' AS stage,
    COUNTIF(Interview_Status = 'Completed') AS candidate_count,
    3 AS stage_order
  FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

  UNION ALL

  SELECT
    'Selected' AS stage,
    COUNTIF(Final_Status = 'Selected') AS candidate_count,
    4 AS stage_order
  FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

  UNION ALL

  SELECT
    'Joined' AS stage,
    COUNTIF(Joining_Status = 'Joined') AS candidate_count,
    5 AS stage_order
  FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`
)

ORDER BY stage_order;
