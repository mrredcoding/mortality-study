CREATE VIEW mortality_rate_men_bellow41 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Male' AND Age <= 40);

CREATE VIEW mortality_rate_men_from41to65 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Male' AND Age BETWEEN 41 AND 65);

CREATE VIEW mortality_rate_men_above65 AS (
	SELECT *
	FROM foreign_schema_nodeSchema.mortality_rate
	WHERE Gender = 'Male' AND Age > 65);
