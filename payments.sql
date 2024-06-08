CREATE TABLE IF NOT EXISTS payments (
    id String,
    date Date,
    category String,
    purpose String,
    money UInt16,
    increment_index UInt16
)
ENGINE = ReplacingMergeTree(increment_index)
PARTITION BY (date, category)
PRIMARY KEY (date, category, id);

CREATE MATERIALIZED VIEW IF NOT EXISTS payments_mv
    TO payments
AS SELECT
    JSONExtractString(value,'id') AS id,
    toDate(JSONExtractString(value,'date')) AS date,
    JSONExtractString(value,'category') AS category,
    JSONExtractString(value,'purpose') AS purpose,
    JSONExtractInt(value,'money') AS money,
    JSONExtractInt(value,'index') AS increment_index
FROM source
WHERE JSONExtractString(value,'type')='payment';
