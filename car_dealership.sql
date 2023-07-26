create table customer(
    customer_id serial primary key,
    first_name varchar(100),
    last_name varchar(100),
    address varchar(50)
)

 CREATE OR REPLACE FUNCTION add_customer(_customer_id integer, _first_name varchar, _last_name varchar, _address varchar)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO customer(customer_id,first_name,last_name,address)
    VALUES(_customer_id, _first_name, _last_name, _address);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1,'Bob', 'Jones', '200 rock rd');
SELECT add_customer(2,'tom', 'davis', '300 wave rd');
SELECT add_customer(3,'steve', 'James', '155 sand rd');
CREATE table car(
    car_serial_number serial primary key,
    make varchar(50),
    model varchar(20),
    year varchar(15),

)
CREATE OR REPLACE FUNCTION add_car(_car_serial_number integer, _make varchar, _model varchar, _year varchar)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO car(car_serial_number,make,model,year)
    VALUES(_car_serial_number, _make, _model, _year);
END;
$MAIN$
LANGUAGE plpgsql;



SELECT add_car(1, 'Toyota', 'Camry', '1990');
SELECT add_car(2, 'Honda', 'Accord', '2000');
SELECT add_car(3, 'VOLKSWAGEN', 'Passat','2005');


CREATE TABLE SALESPERSON(
    salesperson_id serial primary key,
    first_name varchar(100),
    last_name varchar(50)

)

insert into salesperson(salesperson_id, first_name, last_name)
values (1, 'Aly', 'Smith');
insert into salesperson(salesperson_id, first_name, last_name)
values (2, 'Amy', 'Lee');


insert into salesperson(salesperson_id, first_name, last_name)
values (3, 'bob','james');

create table invoices(
    invoice_id serial primary key,
    price decimal,
    car_serial_number integer not null,
    customer_id integer not null,
    salesperson_id integer not null,
    foreign key(car_serial_number) references car(car_serial_number),
    foreign key(customer_id) references customer(customer_id),
    foreign key(salesperson_id) references salesperson(salesperson_id)
);

INSERT into invoices(invoice_id, price, car_serial_number, customer_id, salesperson_id)
VALUES (1, 500.00, 1, 2, 1);
INSERT into invoices(invoice_id, price, car_serial_number, customer_id, salesperson_id)
VALUES (2, 400.00, 2, 1, 2)

CREATE table mechanic(
    mechanic_id serial primary key,
    first_name varchar(100),
    last_name varchar(100)
)

INSERT into mechanic(mechanic_id, first_name, last_name)
VALUES (1, 'John', 'Morgan');
INSERT into mechanic(mechanic_id, first_name, last_name)
VALUES (2, 'James', 'Logan');
INSERT into mechanic(mechanic_id, first_name, last_name)
VALUES (3, 'James', 'henderson');


CREATE TABLE service_ticket(
    ticket_id serial primary key,
    customer_id integer not null,
    mechanic_id integer not null,
    car_serial_number integer not null,
    foreign key(customer_id) references customer(customer_id),
    foreign key(mechanic_id) references mechanic(meEchanic_id),
    foreign key(car_serial_number) references car(car_serial_number)
);

insert into service_ticket(ticket_id, customer_id, mechanic_id, car_serial_number)
values (1, 1, 2, 2);
insert into service_ticket(ticket_id, customer_id, mechanic_id, car_serial_number)
values (2, 2, 2, 2);

CREATE TABLE parts(
    part_id serial primary key,
    type varchar(50),
    ticket_id integer not null,
    foreign key(ticket_id) references service_ticket(ticket_id)
)

insert into parts(part_id, type, ticket_id)
values (1, 'engine', 1);
insert into parts(part_id, type, ticket_id)
values (2, 'nozzle', 2);
