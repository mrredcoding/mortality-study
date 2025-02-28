CREATE VIEW mortality_rate_women_bellow41 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Female' AND Age <= 40);

CREATE VIEW mortality_rate_women_from41to65 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Female' AND Age BETWEEN 41 AND 65);

CREATE VIEW mortality_rate_women_above65 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Female' AND Age > 65);
