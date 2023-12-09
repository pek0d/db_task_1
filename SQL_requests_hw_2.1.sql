-- Добавление в БД таблицы исполнители
INSERT INTO artists (id, name)
VALUES (1,'Linkin Park');
INSERT INTO artists (id, name)
VALUES (2,'P.O.D');
INSERT INTO artists (id, name)
VALUES (3,'Papa Roach');
INSERT INTO artists (id, name)
VALUES (4,'Tiesto');
INSERT INTO artists (id, name)
VALUES (5,'Скриптонит');

-- Добавление в БД таблицы жанры
INSERT INTO genres (id, name)
VALUES (1, 'Rock');
INSERT INTO genres (id, name)
VALUES (2, 'Pop');
INSERT INTO genres (id, name)
VALUES (3, 'Rap');

-- Добавление в БД таблицы альбомы
INSERT INTO albums (id, name, release_year)
VALUES (1, 'Reanimation', 2002);
INSERT INTO albums (id,name, release_year)
VALUES (2, 'Hybrid Theory', 2000);
INSERT INTO albums (id, name, release_year)
VALUES (3, 'Lovehatetragedy', 2002);

-- Добавление в БД таблицы tracks
INSERT INTO tracks (id, name, duration)
VALUES (1,'Crawling', 184);
INSERT INTO tracks (id, name, duration)
VALUES (2,'Youth of the nation', 172);
INSERT INTO tracks (id, name, duration)
VALUES (3,'She loves me not', 192);
INSERT INTO tracks (id, name, duration)
VALUES (4,'Just be', 234);
INSERT INTO tracks (id, name, duration)
VALUES (5,'baby mama', 187);

-- Добавление в БД таблицы Compilations
INSERT INTO compilations (name, release_year)
VALUES ('compilation one', 2003);
INSERT INTO compilations (name, release_year)
VALUES ('serenity', 2005);
INSERT INTO compilations (name, release_year)
VALUES ('dual', 2004);
INSERT INTO compilations (name, release_year)
VALUES ('trinity', 2002);
