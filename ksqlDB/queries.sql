CREATE STREAM MOVIE_STREAM (
    id INT,
    name VARCHAR
) WITH (
    KAFKA_TOPIC = 'movie-topic',
    VALUE_FORMAT = 'JSON'
);


CREATE TABLE MOVIE_TABLE (
    id VARCHAR PRIMARY KEY,
    name VARCHAR
) WITH (
    KAFKA_TOPIC = 'movie-topic',
    VALUE_FORMAT = 'JSON'
);