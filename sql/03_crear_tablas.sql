CREATE TABLE gasto_por_cliente AS
SELECT
    cliente,
    COUNT(*) AS cantidad_transacciones,
    SUM(monto) AS monto_total
FROM transacciones
GROUP BY cliente;


CREATE STREAM transacciones_grandes AS
SELECT
    id,
    cliente,
    categoria,
    monto
FROM transacciones
WHERE monto > 100000;