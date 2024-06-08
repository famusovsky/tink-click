-- родители не разбираются в клике и не заметят подвоха )))

CREATE VIEW IF NOT EXISTS payments_for_parents
AS SELECT id, date, category, purpose, money
FROM payments
WHERE category != 'gaming' AND category != 'useless';
