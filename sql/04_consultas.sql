SHOW STREAMS;

SHOW TABLES;

SHOW TOPICS;

SELECT *
FROM gasto_por_cliente;


CREATE TABLE gasto_por_categoria_1min AS
SELECT
    categoria,
    COUNT(*) AS cantidad_transacciones,
    SUM(monto) AS monto_total
FROM transacciones
WINDOW TUMBLING (SIZE 1 MINUTE)
GROUP BY categoria;