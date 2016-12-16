SELECT SQL_CALC_FOUND_ROWS *, (
	(5*(MATCH(ad_title) AGAINST ("camisa" IN BOOLEAN MODE))) +
    (4*(MATCH(ad_city) AGAINST ("Alcântara" IN BOOLEAN MODE))) +
    (3*(MATCH(ad_district) AGAINST ("Alcântara" IN BOOLEAN MODE))) +
    (2.5*(MATCH(ad_state) AGAINST ("MA" IN BOOLEAN MODE))) +
    (2*(MATCH(ad_description) AGAINST ("camisa" IN BOOLEAN MODE))) +
    (1*(MATCH(ad_tags) AGAINST ("camisa" IN BOOLEAN MODE)))
) as relevance FROM ads
WHERE (
	MATCH(ad_title,ad_description,ad_tags,ad_location,ad_city,ad_district,ad_state) AGAINST ("camisa" IN BOOLEAN MODE)
    AND ad_status = 1
)
ORDER BY relevance DESC;