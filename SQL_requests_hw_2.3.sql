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
SELECT albums.name AS album_name, AVG(tracks.duration) AS avg_duration
FROM albumtracks
JOIN tracks ON albumtracks.track_id = tracks.id
JOIN albums ON albumtracks.album_id = albums.id
GROUP BY albums.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
-- КОРРЕКТИРОВКА Если я верно понял замечание то это 9-й запрос. 
SELECT a.id, a.name
FROM artists a
WHERE a.id NOT IN (
    SELECT aa.artist_id
    FROM artistalbum aa
    JOIN albums al ON aa.album_id = al.id
    WHERE al.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (P.O.D).
-- ДОРАБОТКА Если я верно понял замечание то это 11(10)-й запрос. Исправил()
SELECT c.name AS compilation_name
FROM compilations c
JOIN tracks t ON c.track_id = t.id
JOIN albumtracks at ON t.id = at.track_id
JOIN albums al ON at.album_id = al.id
JOIN artistalbum aa ON al.id = aa.album_id
JOIN artists a ON aa.artist_id = a.id
WHERE a.name = 'P.O.D';


-- Запросы из Задания 4
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name AS album_name
FROM albums a
JOIN artistalbum aa ON a.id = aa.album_id
JOIN artistgenre ag ON aa.artist_id = ag.artist_id
GROUP BY a.name
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- Названия треков, которые не входят в сборники.
SELECT t.name AS track_name
FROM tracks t
LEFT JOIN compilations c ON t.id = c.track_id
WHERE c.track_id IS NULL;

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name AS album_name, COUNT(t.id) AS track_count
FROM albums a
JOIN albumtracks at ON a.id = at.album_id
JOIN tracks t ON at.track_id = t.id
GROUP BY a.name
HAVING COUNT(t.id) = (
    SELECT COUNT(t.id)
    FROM tracks t
    JOIN albumtracks at ON t.id = at.track_id
    JOIN albums al ON at.album_id = al.id
    GROUP BY al.name
    ORDER BY COUNT(t.id)
    LIMIT 1
);
