-- normal mode

-- 1
SELECT * FROM movies

-- 2
SELECT title, id FROM movies LIMIT 10

-- 3
SELECT title, genres FROM movies WHERE id = 485

-- 4
SELECT id FROM movies
WHERE title LIKE '%Made%'
  AND title LIKE '%in%'
  AND title LIKE '%America%'

-- 5
SELECT * FROM movies WHERE id <= 10 ORDER BY title ASC

-- 6
SELECT * FROM movies WHERE title LIKE '%2002%'

-- 7
SELECT title FROM movies WHERE title LIKE '%Godfather,%'

-- 8
SELECT * FROM movies WHERE genres LIKE '%Comedy%'

-- 9
SELECT * FROM movies WHERE genres LIKE '%Comedy%' AND title LIKE '%2000%'

-- 10
SELECT * FROM movies 
WHERE genres 
LIKE '%Comedy%' AND genres LIKE '%Horror%' 
OR genres LIKE '%Comedy%' AND genres LIKE '%Thriller%' 
OR genres LIKE '%Comedy%' AND genres LIKE '%Crime%'

-- 11
SELECT * FROM movies 
WHERE title 
LIKE '%2001%' AND title LIKE '%super%' 
OR title LIKE '%2002%' AND title LIKE '%super%' 

-- 12
-- fix actors so movie_id matches, characters must be from movie
INSERT INTO actors (name, character_name, movie_id, date_of_birth)
VALUES 
  ('Daniel Radcliffe',	'Harry Potter',	81834,	'1989-07-23'),
  ('Emma Watson',	'Hermione',	81834,	'1990-04-15'),
  ('Rupert Grint',	'Ron Weasley',	81834,	'1990-04-16'),
  ('Alan Rickman',	'Severus Snape',	81834,	'1990-04-17'),
  ('Richard Harris',	'Albus Dumbledore',	81834,	'1990-04-18'),
  ('Tom Felton',	'Draco Malfoy',	81834,	'1990-04-19'),
  ('Robbie Coltrane',	'Hagrid',	81834,	'1990-04-20'),
  ('Maggie Smith',	'Professor McGonagall',	81834,	'1990-04-21'),
  ('Richard Griffiths',	'Vernon Dursley', 81834,	'1990-04-22'),
  ('Julie Walters',	'Molly Weasley', 81834,	'1990-04-22'),


  ('Georgie Henley', 'Lucy Pevensie', 41566, '1990-04-23'),
  ('William Moseley',	'Peter Pevensie',	41566,	'1989-07-24'),
  ('Anna Popplewell',	'Susan Pevensie',	41566,	'1990-04-25'),
  ('Skandar Keynes',	'Edmund Pevensie',	41566,	'1990-04-26'),
  ('Tilda Swinton',	'the White Witch',	41566,	'1990-04-27'),
  ('James McAvoy',	'Mr. Tumnus',	41566,	'1990-04-28'),
  ('Liam Neeson',	'Aslan',	41566,	'1990-04-29'),
  ('Jim Broadbent',	'Digory Kirke',	41566,	'1990-04-30'),
  ('Dawn French',	'Mrs. Beaver',	41566,	'1990-05-01'),
  ('Rupert Evertt',	'Mr. Fox', 41566,	'1990-05-02'),

  ('Mia Wasikowska', 'Mia', 74789, '1990-05-03'),
  ('Johnny Depp',	'the Mad Hatter',	74789,	'1989-05-04'),
  ('Helena Bonham Carter',	'Red Queen',	74789,	'1990-05-05'),
  ('Anne Hathaway',	'White Queen',	74789,	'1990-05-06'),
  ('Stephen Fry',	'Chesire Cat',	74789,	'1990-05-07'),
  ('Barbara Windsor',	'The Dormouse',	74789,	'1990-05-08'),
  ('Paul Whitehouse',	'March Hare',	74789,	'1990-05-09'),
  ('Christopher Lee',	'Jabberwock',	74789,	'1990-05-10'),
  ('Leo Bill',	'Hamish',	74789,	'1990-05-11'),
  ('Frances de la Tour',	'Aunt Imogene', 74789,	'1990-05-12')

  -- 13 
  UPDATE movies SET MPAA = 'PG' WHERE id = 74789
  UPDATE movies SET MPAA = 'PG' WHERE id = 41566
  UPDATE movies SET MPAA = 'PG-13' WHERE id = 81834
  UPDATE movies SET MPAA = 'PG' WHERE id = 1
  UPDATE movies SET MPAA = 'R' WHERE id = 115149

-- Joins
  -- 14
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings ON id = movie_id
WHERE movies.title = 'Godfather, The (1972)';

-- 15
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.title = 'Godfather, The (1972)'
ORDER BY ratings.timestamp DESC;

-- 16
SELECT movies.title, links.imdb_Id
FROM movies
LEFT JOIN links ON movies.id = links.imdb_Id
WHERE movies.genres LIKE '%Comedy%' AND title LIKE '%2005%'

-- 17
SELECT *
FROM movies
LEFT JOIN ratings
ON movies.id = ratings.movie_id
WHERE ratings.rating IS NULL;

-- 18    
SELECT movie_id, AVG(rating)
FROM ratings
GROUP BY movie_id;


-- 19    
SELECT movie_id, COUNT(rating)
FROM ratings
GROUP BY movie_id


-- 20
SELECT genres, COUNT(genres)
FROM movies
GROUP BY genres


-- 21
SELECT user_id, AVG(rating)
FROM ratings
GROUP BY user_id

-- 22
SELECT user_id, COUNT(rating)
FROM ratings
GROUP BY user_id
ORDER BY COUNT(rating) DESC
LIMIT 1


-- 23
SELECT user_id, AVG(rating)
FROM ratings
GROUP BY user_id
ORDER BY AVG(rating) DESC
LIMIT 1


-- 24
SELECT user_id, AVG(rating), COUNT(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating) >= 50
ORDER BY AVG(rating) DESC


-- 25
SELECT movie_id, AVG(rating)
FROM ratings
GROUP BY movie_id
HAVING AVG(rating) >= 4




