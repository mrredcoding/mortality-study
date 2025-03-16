-- Function: Return Average Mortality Rate for a cci_level
CREATE OR REPLACE FUNCTION get_avg_mortality_rate(cci_level INT)
RETURNS TABLE(Average_Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE format('SELECT AVG(CCI%s) FROM Mortality_Rate', cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_avg_mortality_rate(0)


-- Function: Return Average Life Expentancy for a cci_level
CREATE OR REPLACE FUNCTION get_avg_life_expectancy(cci_level INT)
RETURNS TABLE(Average_Life_Expectancy FLOAT) AS $$
BEGIN
	RETURN QUERY EXECUTE FORMAT('SELECT AVG(EV_CCI%s) FROM Mortality_Rate', cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_avg_life_expectancy(0)


-- Function: Return Max Mortality Rate for a cci_level
CREATE OR REPLACE FUNCTION get_max_mortality_rate(cci_level INT)
RETURNS TABLE(Age INT, Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE FORMAT('SELECT Age, CCI%s FROM Mortality_Rate ORDER BY CCI%s DESC LIMIT 1', cci_level, cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example:
SELECT * FROM get_max_mortality_rate(0)
