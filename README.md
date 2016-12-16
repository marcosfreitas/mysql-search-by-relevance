MySQL Search by relevance with FULLTEXT indexes
===============================================

> These steps below are designed to do this query works.

## Steps

+ You need to create index of the type FULLTEXT for each field of the table that will be searched and other one index of the same type for all collumns that you created an index FULLTEXT.

> one fulltext index for each field searchable

![one fulltext index for each field searchable](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/one-fulltext-index-for-each-field-searchable.png)

> and an index for all those collumns searchable

![one fulltext index for each field searchable](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/index-for-all-those-collumns-searchable.png)


+ Now, with all of those indexes let's build our query.

> this MYSQL query works building an index of relevance and will order by it.

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





