SELECT 'ФИО: Трусова Виктория Леонидовна';

-- 1. Простые выборки
-- 1.1 Выбрать 10 записей из таблицы ratings
SELECT * 
    FROM ratings LIMIT 10;
    
-- 1.2 Выбрать из таблицы links все записи, у которых imdbid оканчивается на "42", 100<movieid<1000
SELECT * 
    FROM links 
WHERE imdbid 
    LIKE'%42' AND links.movieid>100 AND links.movieid<1000;

-- 2. Сложные выборки
-- 2.1 Выбрать из таблицы links все imdbId, которым ставили рейтинг 5
SELECT DISTINCT imdbid, rating
    FROM movie.links
INNER JOIN movie.ratings
    ON links.movieid=ratings.movieid
WHERE rating=5
LIMIT 10;
        
-- 3. Аггрегация данных: базовые статистики
-- 3.1 Посчитать число фильмов без оценок
SELECT COUNT(DISTINCT imdbid)
    FROM movie.links
LEFT JOIN movie.ratings
    ON links.movieid=ratings.movieid
WHERE rating IS NULL;

-- 3.2 Вывести top-10 пользователей, у который средний рейтинг выше 3.5
SELECT userId,
    AVG(rating) AS avg_rating
    FROM movie.ratings
GROUP BY userId HAVING AVG(rating)>3.5
ORDER BY avg_rating DESC
LIMIT 10;

-- 4. Иерархические запросы
-- 4.1 Достать любые 10 imbdId из links у которых средний рейтинг больше 3.5
SELECT DISTINCT imdbid
    FROM movie.links  
WHERE
    3.5 < (
            SELECT AVG(rating)
            FROM movie.ratings
          )
LIMIT 10;

-- 4.2 Посчитать средний рейтинг по пользователям, у которых более 10 оценок
WITH active_users_tmp as (
    SELECT userid 
        FROM ratings 
    GROUP BY userid 
    HAVING count(1)>10
)
SELECT (rating) 
    FROM ratings 
WHERE userid in (SELECT * FROM active_users_tmp);
