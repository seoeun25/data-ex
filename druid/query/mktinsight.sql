SELECT
count(__time)
FROM
etl_poc_funnel_02
WHERE __time BETWEEN TIMESTAMP '2020-06-01' AND TIMESTAMP '2020-06-01'
LIMIT 10

SELECT
   t1.hashed_user_id,
   substr(t1.datetime, 1, 7) as event_month,
   substr(t1.datetime, 8, 10) as event_date,
   ROW_NUMBER() OVER(PARTITION BY t1.hashed_user_id) AS Total_Visit
FROM
   "druid"."etl_poc_funnel_02" AS t1
limit 10

SELECT
  adult_child_cnt, adult_child_yn, age, age_group, st11_cat, cardinality(st11_cat), unwrap(st11_cat)
FROM
"seg_profile_test_bitset"
WHERE _bs(st11_cat) = '3'

SELECT
  adult_child_cnt, adult_child_yn, age, age_group, st11_cat, cardinality(st11_cat), unwrap(st11_cat)
FROM
"seg_profile_test_bitset"
WHERE _bs(st11_cat) IN ('3', '6', '9')