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
