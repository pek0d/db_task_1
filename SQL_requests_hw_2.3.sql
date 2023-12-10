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
SELECT albums.name AS album_name, AVG(tracks.duration) AS avg_duration
FROM albumtracks
JOIN tracks ON albumtracks.track_id = tracks.id
JOIN albums ON albumtracks.album_id = albums.id
GROUP BY albums.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name
FROM artists
WHERE id NOT IN (
    SELECT DISTINCT id
    FROM albums
    WHERE release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name AS compilation_name
FROM Compilations c
WHERE EXISTS (
    SELECT 1
    FROM tracks t
    JOIN artists a ON t.id = a.id
    WHERE t.name = 'baby mama' AND a.name = 'Скриптонит' AND c.track_id = t.id
);
