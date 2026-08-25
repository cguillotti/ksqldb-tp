CREATE STREAM transacciones (
    id VARCHAR,
    cliente VARCHAR,
    categoria VARCHAR,
    monto DOUBLE
) WITH (
    KAFKA_TOPIC='transacciones',
    VALUE_FORMAT='JSON',
    PARTITIONS=1
);