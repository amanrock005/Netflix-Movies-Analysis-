select * from netflix_t1;


-- display the director and the number of movies directed by them
select * from netflix_t1;

select director, count(*)
from netflix_t1
group by director;

-- display all the movies that where released in 2000
select *
from netflix_t1
where actual_release ='2000';

-- find the list of directors who have created horror and comedy movies both.

-- display the movies where the cast is Madhuri Dixit
select title, director
from netflix_t1
where cast like '%Madhuri Dixit%';

-- CTE to count the number of movies for each director per year
WITH cte AS (
    SELECT 
        nd.director,
        EXTRACT(YEAR FROM n.date_added) AS date_year,
        COUNT(n.show_id) AS no_of_movies
    FROM 
        netflix n
    INNER JOIN 
        netflix_directors nd ON n.show_id = nd.show_id
    WHERE 
        n.type = 'Movie'
    GROUP BY 
        nd.director, EXTRACT(YEAR FROM n.date_added)
),
cte2 AS (
    -- Rank directors based on the number of movies released each year
    SELECT 
        cte.*,
        ROW_NUMBER() OVER (PARTITION BY date_year ORDER BY no_of_movies DESC, director ASC) AS rn
    FROM 
        cte
)
-- Retrieve only the top director for each year
SELECT * 
FROM cte2 
WHERE rn = 1;
