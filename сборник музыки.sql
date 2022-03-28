create table if not exists Жанры (
    id serial primary key,
    жанры_name varchar(100) not null unique
);

create table if not exists Музыканты (
    id serial primary key,
    name varchar(100) not null unique
);

create table if not exists МузыкантыЖанры (
    музыканты_id integer references Музыканты(id),
    жанры_id integer references Жанры(id),
    constraint pk_МузыкантыЖанры primary key (музыканты_id, жанры_id)
);

create table if not exists Альбомы (
    id serial primary key,
    альбомы_name varchar(100) not null,
    альбомы_start integer not null check (альбомы_start > 0)
);

create table if not exists МузыкантыАльбомы (
    музыканты_id integer not null references Музыканты(id),
    альбомы_id integer not null references Альбомы(id),
    constraint pk_МузыкантыАльбомы primary key (музыканты_id, альбомы_id)
);

create table if not exists Треки (
    id serial primary key,
    треки_name varchar(100) not null,
    треки_time numeric(3,2) not null check ( треки_time > 0 ),
    альбомы_id integer not null references Альбомы(id)
);

create table if not exists Сборники (
    id serial primary key,
    сборники_name varchar(100) not null,
    сборники_start numeric(6,2) not null check ( сборники_start > 0 )
);

create table if not exists ТрекиСборники (
    треки_id integer not null references Треки(id),
    сборники_id integer not null references Сборники(id),
    constraint pk_ТрекиСборники primary key (треки_id, сборники_id)
);