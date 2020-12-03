/*
        Домашняя работа №5 Трусова В. Л. 

        1. Написать запрос, который выводит общее число тегов
*/
print('Tags count: ', db.tags.find().count());
/*
        2. Добавляем фильтрацию: считаем только количество фильмов с тегом Adventure
*/
print('"Adventure" tags count: ', db.tags.find({tag_name : "Adventure"}).count());
/*
        3. Очень сложный запрос: используем группировку данных посчитать количество вхождений для каждого тега
        и напечатать top-3 самых популярных
*/
printjson(
        db.tags.aggregate([
                { $group: {
                                _id: $tag_name,
                                tag_count: { $sum: 1 }
                           }
                },
                { $sort: { tag_count : -1 }},
                { limit 3}
        ])['_batch']
);
