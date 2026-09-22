-- ============================================================
-- TFI / TELUGU FILM INDUSTRY DATABASE
-- ============================================================

DROP DATABASE IF EXISTS tfi;
CREATE DATABASE tfi;

USE tfi;

-- ============================================================
-- 1. HEROES
-- ============================================================

CREATE TABLE heroes (
    hero_id INT PRIMARY KEY AUTO_INCREMENT,
    hero_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    debut_year INT,
    movie_count INT DEFAULT 0,
    salary_per_movie_crore DECIMAL(10,2),
    salary_year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


INSERT INTO heroes
(hero_name, date_of_birth, debut_year, movie_count, salary_per_movie_crore, salary_year)
VALUES
('Chiranjeevi', '1955-08-22', 1978, 150, 50.00, 2025),
('Nagarjuna', '1959-08-29', 1986, 100, 25.00, 2025),
('Venkatesh', '1960-12-13', 1986, 75, 20.00, 2025),
('Balakrishna', '1960-06-10', 1974, 100, 25.00, 2025),
('Pawan Kalyan', '1971-09-02', 1996, 30, 80.00, 2025),
('Mahesh Babu', '1975-08-09', 1979, 30, 100.00, 2025),
('Jr NTR', '1983-05-20', 2001, 30, 60.00, 2025),
('Prabhas', '1979-10-23', 2002, 20, 200.00, 2025),
('Allu Arjun', '1982-04-08', 2003, 20, 300.00, 2025),
('Ram Charan', '1985-03-27', 2007, 15, 100.00, 2025),
('Ravi Teja', '1968-01-26', 1990, 70, 30.00, 2025),
('Nani', '1984-02-24', 2008, 30, 35.00, 2025),
('Vijay Deverakonda', '1989-05-09', 2011, 15, 45.00, 2025),
('Sharwanand', '1984-03-06', 2004, 30, 15.00, 2025),
('Nithiin', '1983-03-30', 2002, 30, 12.00, 2025);


-- ============================================================
-- 2. DIRECTORS
-- ============================================================

CREATE TABLE directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(100) NOT NULL,
    debut_year INT
) ENGINE=InnoDB;


INSERT INTO directors
(director_name, debut_year)
VALUES
('S. S. Rajamouli', 2001),
('Trivikram Srinivas', 2002),
('Sukumar', 2004),
('Koratala Siva', 2013),
('Sandeep Reddy Vanga', 2017),
('Anil Ravipudi', 2015),
('Vamshi Paidipally', 2007),
('Parasuram', 2008),
('Sekhar Kammula', 2000),
('Vivek Athreya', 2017);


-- ============================================================
-- 3. GENRES
-- ============================================================

CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;


INSERT INTO genres (genre_name)
VALUES
('Action'),
('Drama'),
('Comedy'),
('Romance'),
('Thriller'),
('Fantasy'),
('Historical'),
('Adventure'),
('Family'),
('Crime');


-- ============================================================
-- 4. MOVIES
-- ============================================================

CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(150) NOT NULL,
    release_year INT,
    director_id INT,
    genre_id INT,
    budget_crore DECIMAL(10,2),
    box_office_crore DECIMAL(10,2),

    FOREIGN KEY (director_id)
        REFERENCES directors(director_id),

    FOREIGN KEY (genre_id)
        REFERENCES genres(genre_id)
) ENGINE=InnoDB;


INSERT INTO movies
(movie_name, release_year, director_id, genre_id, budget_crore, box_office_crore)
VALUES

('Baahubali: The Beginning',
 2015, 1, 8, 180.00, 650.00),

('Baahubali: The Conclusion',
 2017, 1, 7, 250.00, 1800.00),

('RRR',
 2022, 1, 7, 550.00, 1200.00),

('Pushpa: The Rise',
 2021, 3, 1, 170.00, 350.00),

('Pushpa 2: The Rule',
 2024, 3, 1, 500.00, 1700.00),

('Ala Vaikunthapurramuloo',
 2020, 3, 9, 100.00, 260.00),

('Aravinda Sametha Veera Raghava',
 2018, 2, 1, 90.00, 165.00),

('Ala Vaikunthapurramuloo',
 2020, 3, 9, 100.00, 260.00),

('Guntur Kaaram',
 2024, 2, 1, 200.00, 180.00),

('Salaar',
 2023, 5, 1, 270.00, 700.00),

('Sarkaru Vaari Paata',
 2022, 8, 2, 120.00, 190.00),

('Devara: Part 1',
 2024, 4, 1, 300.00, 500.00),

('Jersey',
 2019, 10, 2, 20.00, 50.00),

('Dasara',
 2023, 10, 1, 65.00, 120.00),

('Fidaa',
 2017, 9, 4, 13.00, 90.00);


-- ============================================================
-- 5. HERO-MOVIE RELATIONSHIP
-- Many-to-many relationship
-- One movie can have multiple heroes
-- One hero can act in multiple movies
-- ============================================================

CREATE TABLE hero_movies (
    hero_id INT,
    movie_id INT,
    role_name VARCHAR(100),

    PRIMARY KEY (hero_id, movie_id),

    FOREIGN KEY (hero_id)
        REFERENCES heroes(hero_id),

    FOREIGN KEY (movie_id)
        REFERENCES movies(movie_id)
) ENGINE=InnoDB;


INSERT INTO hero_movies
(hero_id, movie_id, role_name)
VALUES

-- Prabhas
(8, 1, 'Baahubali'),
(8, 2, 'Baahubali'),
(8, 10, 'Deva'),

-- Ram Charan
(10, 3, 'Alluri Sitarama Raju'),

-- Jr NTR
(7, 3, 'Komaram Bheem'),
(7, 12, 'Devara'),

-- Allu Arjun
(9, 4, 'Pushpa Raj'),
(9, 5, 'Pushpa Raj'),
(9, 6, 'Bantu'),

-- Mahesh Babu
(6, 9, 'Venkata Ramana'),
(6, 11, 'Mahi'),

-- Nani
(12, 13, 'Arjun'),
(12, 14, 'Dharani');


-- ============================================================
-- 6. USEFUL VIEWS
-- ============================================================

CREATE VIEW hero_movie_details AS
SELECT
    h.hero_id,
    h.hero_name,
    m.movie_name,
    m.release_year,
    d.director_name,
    g.genre_name,
    m.budget_crore,
    m.box_office_crore
FROM heroes h
JOIN hero_movies hm
    ON h.hero_id = hm.hero_id
JOIN movies m
    ON hm.movie_id = m.movie_id
JOIN directors d
    ON m.director_id = d.director_id
JOIN genres g
    ON m.genre_id = g.genre_id;


-- ============================================================
-- 7. SAMPLE QUERIES
-- ============================================================

-- Show all heroes
SELECT * FROM heroes;


-- Show heroes and their reported salary
SELECT
    hero_name,
    salary_per_movie_crore
FROM heroes
ORDER BY salary_per_movie_crore DESC;


-- Heroes earning more than 50 crore
SELECT
    hero_name,
    salary_per_movie_crore
FROM heroes
WHERE salary_per_movie_crore > 50;


-- Heroes with more than 20 movies
SELECT
    hero_name,
    movie_count
FROM heroes
WHERE movie_count > 20;


-- Highest reported remuneration
SELECT
    hero_name,
    salary_per_movie_crore
FROM heroes
ORDER BY salary_per_movie_crore DESC
LIMIT 1;


-- Average reported remuneration
SELECT
    AVG(salary_per_movie_crore) AS average_salary
FROM heroes;


-- Movie details with hero
SELECT *
FROM hero_movie_details;


-- Movies released after 2020
SELECT
    movie_name,
    release_year
FROM movies
WHERE release_year > 2020
ORDER BY release_year;


-- Movies with box office greater than 500 crore
SELECT
    movie_name,
    box_office_crore
FROM movies
WHERE box_office_crore > 500
ORDER BY box_office_crore DESC;


-- Hero and number of movies in this database
SELECT
    h.hero_name,
    COUNT(hm.movie_id) AS movies_in_database
FROM heroes h
LEFT JOIN hero_movies hm
    ON h.hero_id = hm.hero_id
GROUP BY h.hero_id, h.hero_name
ORDER BY movies_in_database DESC;


-- Hero + movie + director
SELECT
    h.hero_name,
    m.movie_name,
    d.director_name
FROM hero_movies hm
JOIN heroes h
    ON hm.hero_id = h.hero_id
JOIN movies m
    ON hm.movie_id = m.movie_id
JOIN directors d
    ON m.director_id = d.director_id;


-- ============================================================
-- END
-- ============================================================
