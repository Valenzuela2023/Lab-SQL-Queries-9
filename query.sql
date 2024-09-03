With may as (
	Select customer_id, COUNT(*) AS rentals_in_May
	FROM rentals_may
	group by customer_id
)
, june as (
	Select customer_id, COUNT(*) AS rentals_in_june
	FROM rentals_june
	group by customer_id
)
SELECT coalesce (m.customer_id, j.customer_id) as customer_id, m.rentals_in_May, j.rentals_in_june
FROM may m
INNER JOIN june j
	ON m.customer_id = j.customer_id
WHERE coalesce (m.customer_id, j.customer_id) IN ('{{ customer_parameter|join("', '") }}'); 
