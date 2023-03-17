CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

Select * INTO vine_updated FROM vine_table
where total_votes >= 20

Select * INTO vine_updated_helpful FROM vine_updated
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5


Select * INTO vine_updated_helpful_Y FROM vine_updated_helpful
WHERE vine_updated_helpful.vine = 'Y'

Select * INTO vine_updated_helpful_N FROM vine_updated_helpful
WHERE vine_updated_helpful.vine = 'N'

Select  star_rating, count(review_id), count(review_id)
FROM vine_updated_helpful_Y
GROUP BY star_rating
ORDER BY star_rating ASC


Select VY.star_rating, COUNT(VY.review_id), 
	ROUND((Count(VY.review_ID)* 100.00/(Select count(review_id) FROM vine_updated_helpful_Y)) ,2) AS PERCENT , (Select  count(review_id) FROM vine_updated_helpful_Y)
FROM vine_updated_helpful_Y VY
GROUP BY star_rating
ORDER BY star_rating ASC

Select VN.star_rating, COUNT(VN.review_id), 
	Round((Count(VN.review_ID)* 100.00/(Select count(review_id) FROM vine_updated_helpful_N)),2) AS PERCENT , (Select  count(review_id) FROM vine_updated_helpful_N)
FROM vine_updated_helpful_N VN
GROUP BY star_rating
ORDER BY star_rating ASC
