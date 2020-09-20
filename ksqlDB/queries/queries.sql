CREATE TABLE MOVIE_TABLE (
    id VARCHAR PRIMARY KEY,
    name VARCHAR
) WITH (
    KAFKA_TOPIC = 'movie-topic',
    VALUE_FORMAT = 'JSON'
);

CREATE STREAM RATINGS_STREAM (
    movie_id VARCHAR,
    stars INT
) WITH (
    KAFKA_TOPIC = 'ratings-topic',
    VALUE_FORMAT = 'JSON'
);

-- RATINGS_AVERAGE PER MOVIE
CREATE TABLE RATINGS_AVERAGE_TABLE AS
SELECT
    mt.name as movie_name,
    CAST(SUM(rs.stars) AS DOUBLE) / COUNT(0) as stars_average
FROM RATINGS_STREAM rs 
LEFT JOIN MOVIE_TABLE mt ON rs.movie_id = mt.id
GROUP BY mt.name;