MySQL Search by relevance with FULLTEXT indexes
===============================================

> These steps below are designed to do this query works.

## Steps

+ First of all, you should have lastest MySQL version installed to works on MyISAN and InnoDB tables. You need to create index of the type FULLTEXT for each field of the table that will be searched and other one index of the same type for all collumns that you created an index FULLTEXT.

> one fulltext index for each field searchable

![one fulltext index for each field searchable](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/one-fulltext-index-for-each-field-searchable.png)

> and an index for all those collumns searchable

![one fulltext index for each field searchable](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/index-for-all-those-collumns-searchable.png)


+ Now, with all of those indexes let's build our query.

> this MySQL query works building an index of relevance and will order by it.

![query match against](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/query-match-against.png)

> results of query above, resulted records ordered by relevance index

![query match against](https://raw.githubusercontent.com/marcosfreitas/mysql-search-by-relevance/master/images/results-of-query.png)



