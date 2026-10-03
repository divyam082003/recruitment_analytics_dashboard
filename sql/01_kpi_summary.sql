SELECT
  COUNT(*) AS total_candidates,
  COUNT(DISTINCT Candidate_ID) AS unique_candidates,
  COUNTIF(Final_Status = 'Selected') AS selected_candidates,
  COUNTIF(Joining_Status = 'Joined') AS joined_candidates,

  ROUND(
    COUNTIF(Final_Status = 'Selected') * 100.0 / COUNT(*),
    2
  ) AS selection_rate_pct,

  ROUND(
    COUNTIF(Joining_Status = 'Joined') * 100.0 / COUNT(*),
    2
  ) AS joining_rate_pct,

  ROUND(
    AVG(Time_to_Hire_Days),
    2
  ) AS avg_time_to_hire_days,

  ROUND(
    AVG(Interview_Score),
    2
  ) AS avg_interview_score,

  ROUND(
    AVG(Candidate_Rating),
    2
  ) AS avg_candidate_rating

FROM `recruitment-analytics-510304.recruitment_analytics.recruitment_data`;
