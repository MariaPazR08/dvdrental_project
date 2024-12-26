
--consultas para la tabla customer--

-- Insertar un nuevo cliente en la tabla customer
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date)
VALUES (1, 'Alice', 'Johnson', 'alice.johnson@example.com', 1, TRUE, CURRENT_DATE);

-- Modificar el email de un cliente existente
UPDATE customer
SET email = 'alice.new@example.com'
WHERE customer_id = 1;

-- Eliminar un cliente por su ID
DELETE FROM customer
WHERE customer_id = 1;

--Consultas para la tabla staff---

-- Insertar un nuevo empleado
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES ('John', 'Doe', 2, 'john.doe@example.com', 1, TRUE, 'johndoe', 'password123');

-- Actualizar el estado activo de un empleado
UPDATE staff
SET active = FALSE
WHERE staff_id = 2;

-- Eliminar un empleado por su ID
DELETE FROM staff
WHERE staff_id = 2;

--Consultas para la tabla actor

-- Insertar un nuevo actor
INSERT INTO actor (first_name, last_name)
VALUES ('Scarlett', 'Johansson');

-- Cambiar el nombre de un actor
UPDATE actor
SET first_name = 'Scarlett Ingrid'
WHERE actor_id = 10;

-- Eliminar un actor
DELETE FROM actor
WHERE actor_id = 10;

--Consultas mas avanzadas---

-- Rentas de clientes para enero de 2023
SELECT r.rental_id AS "Rental ID", r.rental_date AS "Rental Date", 
       c.first_name AS "Customer First Name", c.last_name AS "Customer Last Name"
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2023
  AND EXTRACT(MONTH FROM r.rental_date) = 1;

-- Listar todas las transacciones de pago
SELECT payment_id AS "Payment ID", payment_date AS "Payment Date", amount AS "Amount"
FROM payment;

-- Películas del año 2006 con tarifa mayor a 4.0
SELECT title AS "Film Title", rental_rate AS "Rental Rate"
FROM film
WHERE release_year = 2006
  AND rental_rate > 4.0;

