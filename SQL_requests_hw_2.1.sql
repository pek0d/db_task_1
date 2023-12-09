-- Добавление в БД таблицы исполнители
insert into artists (id, name)
values (1,'Linkin Park');
insert into artists (id, name)
values (2,'P.O.D');
insert into artists (id, name)
values (3,'Papa Roach');
insert into artists (id, name)
values (4,'Tiesto');
insert into artists (id, name)
values (5,'Скриптонит');

-- Добавление в БД таблицы жанры
insert into genres (id, name)
values (1, 'Rock');
insert into genres (id, name)
values (2, 'Pop');
insert into genres (id, name)
values (3, 'Rap');

-- Добавление в БД таблицы альбомы
insert into albums (id, name, release_year)
values (1, 'Reanimation', 2002);
insert into albums (id,name, release_year)
values (2, 'Hybrid Theory', 2000);
insert into albums (id, name, release_year)
values (3, 'Lovehatetragedy', 2002);

-- Добавление в БД таблицы tracks
insert into tracks (id, name, duration)
values (1,'Crawling', 184);
insert into tracks (id, name, duration)
values (2,'Youth of the nation', 172);
insert into tracks (id, name, duration)
values (3,'She loves me not', 192);
insert into tracks (id, name, duration)
values (4,'Just be', 234);
insert into tracks (id, name, duration)
values (5,'baby mama', 187);
