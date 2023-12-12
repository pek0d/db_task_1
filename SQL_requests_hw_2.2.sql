-- Название и продолжительность самого длительного трека.
SELECT name, duration
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name, release_year
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artists
WHERE name ~ '^[A-Za-z-]+$';

-- Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM tracks
WHERE name ILIKE '%мой%' OR name ILIKE '%my%';
