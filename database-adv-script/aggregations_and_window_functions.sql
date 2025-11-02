-- Total bookings per user
SELECT
  user_id,
  COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY user_id;

-- Rank properties by number of bookings (using RANK)
SELECT
  property_id,
  COUNT(*) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM bookings
GROUP BY property_id
ORDER BY property_rank;

-- Rank properties by number of bookings (using ROW_NUMBER)
-- use a subquery to compute total_bookings first, then apply ROW_NUMBER()
SELECT
  t.property_id,
  t.total_bookings,
  ROW_NUMBER() OVER (ORDER BY t.total_bookings DESC) AS property_row_number
FROM (
  SELECT property_id, COUNT(*) AS total_bookings
  FROM bookings
  GROUP BY property_id
) t
ORDER BY property_row_number;
