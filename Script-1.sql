CREATE TABLE if not exists Genre  (
    genre_id SERIAL PRIMARY key not NULL,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE if not exists Singer (
    singer_id SERIAL PRIMARY key not null,
    singer_name VARCHAR(100) NOT NULL
);

CREATE table if not exists Album (
    album_id SERIAL PRIMARY key not null,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL
);

CREATE table if not exists Track (
    track_id SERIAL PRIMARY key not null,
    track_name VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);


CREATE TABLE if not exists Compilation (
    compilation_id SERIAL PRIMARY key not null,
    compilation_name VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year >= 1900) not NULL,
    UNIQUE (compilation_name, release_year)
);

CREATE table if not exists Genre_singers(
    id serial primary key 
    ID_singer INT not null,
    ID_genre INT not null,
    FOREIGN KEY (ID_singer) REFERENCES Singers(ID),
    FOREIGN KEY (ID_genre) REFERENCES Genres(ID)
);


CREATE TABLE if not exists solution Track_Compilation (
   id serial primary key not null 
   track_id INT NOT NULL,
   compilation_id INT NOT NULL,
   FOREIGN KEY (track_id) REFERENCES Track(track_id),
   FOREIGN KEY (compilation_id) REFERENCES Compilation(compilation_id)
 );

CREATE table if not exists solution Singers_Albums(
    id serial primary key not null 
    ID_singer INT not null,
    ID_album INT not null,
    FOREIGN KEY (ID_singer) REFERENCES Singers(ID),
    FOREIGN KEY (ID_album) REFERENCES Albums(ID)
);