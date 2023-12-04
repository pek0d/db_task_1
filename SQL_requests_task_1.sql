create table if not exists Artists (
	id SERIAL primary key,
	name: varchar (60) not null
);

create table if not exists Genres (
	id SERIAL primary key,
	name: varchar (60) not null
);

create table if not exists ArtistGenre (
	artist_id INTEGER references Artists(id),
	genre_id INTEGER references Generes(id),
	constraint pk primary key (artist_id, genre_id) 
);

create table if not exists Albums (
	id SERIAL primary key,
	name: varchar (60) not null,
	release_year: INTEGER not null
);

create table if not exists ArtistAlbum (
	artist_id INTEGER references Artists(id),
	album_id INTEGER references Albums(id),
	constraint pk primary key (artist_id, album_id) 
);

create table if not exists Tracks (
	id SERIAL primary key,
	name: varchar (60) not null,
	duration: time not null
);

create table if not exists AlbumTracks (
	track_id INTEGER references Tracks(id),
	album_id INTEGER references Albums(id),
	constraint pk primary key (tracks_id, album_id) 
);

create table if not exists Compilations (
	track_id INTEGER references Tracks(id),
	name: varchar (80) not null,
	release_year: INTEGER not null
);
