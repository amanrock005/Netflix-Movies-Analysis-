LOAD DATA
INFILE 'netflix_titles.csv' 
INTO TABLE netflix_t1
APPEND
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
(
    show_id       CHAR(1000),
    type          CHAR(1000),
    title         CHAR(1000),
    director      CHAR(1000),
    cast          CHAR(2000),
    country       CHAR(1000),
    date_added    CHAR(1000),
    actual_release CHAR(1000),
    rating        CHAR(1000),
    duration      CHAR(1000)
)
