WITH rejection_counts AS (
  SELECT
    Rejection_Reason,
    COUNT(*) AS rejected_candidates

  FROM
    `recruitment-analytics-510304.recruitment_analytics.recruitment_data`

  WHERE
    Rejection_Reason IS NOT NULL
    AND Rejection_Reason != ''

  GROUP BY
    Rejection_Reason
)

SELECT
  Rejection_Reason,
  rejected_candidates,

  ROUND(
    rejected_candidates * 100.0 /
    SUM(rejected_candidates) OVER (),
    2
  ) AS rejection_share_pct

FROM
  rejection_counts

ORDER BY
  rejected_candidates DESC;
