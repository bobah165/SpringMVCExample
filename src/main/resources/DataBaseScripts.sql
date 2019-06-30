create table usersApp
(
  id SERIAL PRIMARY KEY,
  NAME VARCHAR(50) NOT NULL,
  PASSWORD VARCHAR(50) NOT NULL
);

INSERT INTO usersApp(NAME, PASSWORD) VALUES ('Alex',1);
INSERT INTO usersApp(NAME, PASSWORD) VALUES ('Bob',2);



create table products
  (
    id serial primary key,
    name varchar(50) not null,
    count numeric(5) not null
  );

insert into products (name, count) values ('Tour #1',0);
insert into products (name, count) VALUES ('Tour #2',0);
insert into products (name, count) values ('Tour #3',0);
insert into products (name, count) VALUES ('Tour #4',0);