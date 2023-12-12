-- наполнение таблицы artists
INSERT INTO artists (id, name)
VALUES 
  (1,'Linkin Park'),
  (2,'P.O.D'),
  (3,'Joris Voorn'),
  (4,'Tiesto'),
  (5,'Скриптонит');

-- наполнение таблицы genres
INSERT INTO genres (id, name)
VALUES
  (1, 'Rock'),
  (2, 'Pop'),
  (3, 'Dance'),
  (4, 'Rap');

-- наполнение таблицы albums
INSERT INTO albums (id, name, release_year)
VALUES
  (1, 'Reanimation', 2019),
  (2, 'Hybrid Theory', 2021),
  (3, 'waterfall', 2018),
  (4, 'Lovehatetragedy', 2020);

-- наполнение таблицы tracks
INSERT INTO tracks (id, name, duration)
VALUES 
  (1,'Crawling', 184),
  (2,'Youth of the nation', 172),
  (3,'She loves me not', 192),
  (4,'Just be', 234),
  (5,'baby mama', 187),
  (6,'Say my name', 194);

-- наполнение таблицы albumtracks
INSERT INTO albumtracks (track_id, album_id)
VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 3),
  (5, 3),
  (6, 1);

-- наполнение таблицы artistgenre
INSERT INTO artistgenre (artist_id, genre_id)
VALUES
  (1, 1),
  (2, 3),
  (3, 3),
  (4, 2),
  (5, 4);

-- наполнение таблицы Compilations
INSERT INTO compilations (track_id, "name", release_year)
VALUES
  (6, 'compilation one', 2020),
  (1, 'serenity', 2018),
  (5, 'dual', 2022),
  (2, 'trinity', 2019),
  (3, 'black', 2017);
