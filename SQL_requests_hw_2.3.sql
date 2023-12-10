-- Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.

-- Количество исполнителей в каждом жанре.
SELECT genre_id, COUNT(artist_id) AS artist_count
FROM artistgenre
GROUP BY genre_id;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT albums.release_year, COUNT(albumtracks.track_id) AS track_count
FROM albums
JOIN albumtracks ON albums.id = albumtracks.album_id
WHERE albums.release_year BETWEEN 2019 AND 2020
GROUP BY albums.release_year;

-- Средняя продолжительность треков по каждому альбому.
-- Все исполнители, которые не выпустили альбомы в 2020 году.
-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
