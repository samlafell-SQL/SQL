-- Full-Text Index

-- build fast and flexible search engines

CREATE FULLTEXT INDEX idx_title_body ON posts (title, body);

SELECT *
FROM posts
WHERE MATCH(title, body) AGAINST ('react redux');

/*
Include a relevance score!!!
*/

-- Can include IN BOOLEAN MODE with minus/plus
SELECT *, MATCH(title, body) AGAINST ('react -redux +form') AS relevancy_score
FROM posts
WHERE MATCH(title, body) AGAINST ('react -redux +form' IN BOOLEAN MODE);


-- Can include double quotes for exact matches
SELECT *, MATCH(title, body) AGAINST ('"handling a form"' IN BOOLEAN MODE) AS relevancy_score
FROM posts
WHERE MATCH(title, body) AGAINST ('"handling a form"' IN BOOLEAN MODE);



