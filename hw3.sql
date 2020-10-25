-- Оконные функции
-- Вывести список пользователей в формате userId, movieId, normed_rating, avg_rating где:
--      userId, movieId - без изменения
--      нормированный рейтинг: normed_rating=(r - r_min)/(r_max - r_min)
--      avg_rating - среднее значение рейтинга у данного пользователя

SELECT userId, movieId,
    (rating - MIN(rating) OVER (PARTITION BY userId)) /(MAX(rating) OVER(PARTITION BY userId)-(MIN(rating) OVER (PARTITION BY userId))) as normed_rating,
    AVG(rating) OVER (PARTITION BY userId) as avg_rating
FROM (
    SELECT DISTINCT userId, movieId, rating
    FROM movie.ratings
    WHERE userId >=1 LIMIT 1000
) as sample
ORDER BY userId, rating DESC
LIMIT 30;
