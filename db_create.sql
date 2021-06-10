create schema "investimentAttractiveness";

alter schema "investimentAttractiveness" owner to postgres;

create table if not exists "investimentAttractiveness".result_logs
(
	id integer generated always as identity
		constraint result_logs_pkey
			primary key,
	create_date date not null,
	ip_address varchar not null,
	author varchar not null,
	request_info varchar not null,
	operation_type_id integer not null,
	returned_result varchar
);

alter table "investimentAttractiveness".result_logs owner to postgres;

create table if not exists "investimentAttractiveness".roles
(
	id integer not null
		constraint roles_pkey
			primary key,
	name varchar not null
);

alter table "investimentAttractiveness".roles owner to postgres;

create table if not exists "investimentAttractiveness".user_statuses
(
	id integer not null
		constraint user_statuses_pkey
			primary key,
	name varchar not null
);

alter table "investimentAttractiveness".user_statuses owner to postgres;

create table if not exists "investimentAttractiveness".users
(
	id integer generated always as identity
		constraint users_pkey
			primary key,
	username varchar not null,
	password varchar not null,
	user_status integer not null
		constraint status_fk
			references user_statuses,
	role integer not null
		constraint role_fk
			references roles
);

alter table "investimentAttractiveness".users owner to postgres;


INSERT INTO "investimentAttractiveness".roles(id, name)
	VALUES  (1, 'ROLE_USER'),
			(2, 'ROLE_ADMIN');
			
INSERT INTO "investimentAttractiveness".user_statuses(id, name)
	VALUES (1, 'Активен'),
		   (2, 'Заблокирован');