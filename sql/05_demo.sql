-- =========================================================
-- DEMO ksqlDB
-- =========================================================

-- 1. Ver objetos existentes
SHOW STREAMS;
SHOW TABLES;
SHOW TOPICS;


-- 2. Ver el stream original
SET 'auto.offset.reset' = 'earliest';

SELECT *
FROM transacciones
EMIT CHANGES;


-- Detener con Ctrl + C antes de continuar.


-- 3. Ver transacciones grandes
SELECT *
FROM transacciones_grandes
EMIT CHANGES;


-- En otra terminal insertar:
-- INSERT INTO transacciones
-- VALUES ('D001', 'Lucia', 'Alimentos', 25000);

-- No debería aparecer porque monto <= 100000.

-- Después:
-- INSERT INTO transacciones
-- VALUES ('D002', 'Lucia', 'Tecnologia', 750000);

-- Esta sí debería aparecer.


-- Detener con Ctrl + C.


-- 4. Mostrar TABLE materializada por cliente
SELECT *
FROM gasto_por_cliente;


-- 5. Insertar nuevas transacciones desde otra terminal
-- INSERT INTO transacciones
-- VALUES ('D003', 'Carlos', 'Alimentos', 50000);

-- INSERT INTO transacciones
-- VALUES ('D004', 'Carlos', 'Tecnologia', 300000);


-- 6. Volver a consultar la TABLE
SELECT *
FROM gasto_por_cliente;


-- 7. Ver agregaciones por ventana de tiempo
SELECT *
FROM gasto_por_categoria_1min
EMIT CHANGES;


-- Desde otra terminal insertar varias operaciones:
-- INSERT INTO transacciones
-- VALUES ('D005', 'Ana', 'Alimentos', 30000);

-- INSERT INTO transacciones
-- VALUES ('D006', 'Juan', 'Alimentos', 45000);

-- INSERT INTO transacciones
-- VALUES ('D007', 'Maria', 'Tecnologia', 200000);