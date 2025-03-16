-- Function foreign_schema_nodeSchema.get_avg_mortality_rate
-- Retrieve Global Average Mortality Rate depending on the comorbidity
CREATE OR REPLACE FUNCTION foreign_schema_nodeSchema.get_avg_mortality_rate(cci_level INT)
RETURNS TABLE(Average_Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE format('SELECT AVG(CCI%s) FROM foreign_schema_nodeSchema.Mortality_Rate', cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM foreign_schema_nodeSchema.get_avg_mortality_rate(0)

-- Function get_avg_mortality_rate
-- Retrieve Average Mortality Rate for women depending on the comorbidity and the age
CREATE OR REPLACE FUNCTION get_avg_mortality_rate(selected_view VARCHAR(50), cci_level INT)
RETURNS TABLE(Average_Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE format('SELECT AVG(CCI%s) FROM %s', cci_level, selected_view);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_avg_mortality_rate('mortality_rate_women_from41to65',0)

-- Function foreign_schema_nodeSchema.get_avg_life_expectancy
-- Retrieve Global Average Life Expentancy depending on the comorbidity
CREATE OR REPLACE FUNCTION foreign_schema_nodeSchema.get_avg_life_expectancy(cci_level INT)
RETURNS TABLE(Average_Life_Expectancy FLOAT) AS $$
BEGIN
	RETURN QUERY EXECUTE FORMAT('SELECT AVG(EV_CCI%s) FROM foreign_schema_nodeSchema;Mortality_Rate', cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM foreign_schema_nodeSchema.get_avg_life_expectancy(0)

-- Function get_avg_life_expectancy
-- Average Life Expentancy for women depending on the comorbidity and the age
CREATE OR REPLACE FUNCTION get_avg_life_expectancy(selected_view VARCHAR(50), cci_level INT)
RETURNS TABLE(Average_Life_Expectancy FLOAT) AS $$
BEGIN
	RETURN QUERY EXECUTE FORMAT('SELECT AVG(EV_CCI%s) FROM %s', cci_level, selected_view);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_avg_life_expectancy('mortality_rate_women_from41to65',0)

-- Function foreign_schema_nodeSchema.get_max_mortality_rate
-- Retrieve Global Max Mortality Rate depending on the comorbidity
CREATE OR REPLACE FUNCTION foreign_schema_nodeSchema.get_max_mortality_rate(cci_level INT)
RETURNS TABLE(Age INT, Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE FORMAT('SELECT Age, CCI%s FROM foreign_schema_nodeSchema.Mortality_Rate ORDER BY CCI%s DESC LIMIT 1', cci_level, cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM foreign_schema_nodeSchema.get_max_mortality_rate(0)

-- Function get_max_mortality_rate
-- Retrieve Max Mortality Rate for women depending on the comorbidity and the age
CREATE OR REPLACE FUNCTION get_max_mortality_rate(selected_view VARCHAR(50), cci_level INT)
RETURNS TABLE(Age INT, Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE FORMAT('SELECT Age, CCI%s FROM %s ORDER BY CCI%s DESC LIMIT 1', cci_level, selected_view, cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_max_mortality_rate('mortality_rate_women_from41to65',0)
