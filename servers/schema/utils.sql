-- Function 
CREATE OR REPLACE FUNCTION get_avg_mortality_rate(cci_level INT)
RETURNS TABLE(Average_Mortality_Rate FLOAT) AS $$
BEGIN
    RETURN QUERY EXECUTE format('SELECT AVG(CCI%s) FROM Mortality_Rate', cci_level);
END;
$$ LANGUAGE plpgsql;

-- Example: Get Average Mortality Rate without comorbidity
SELECT * From get_avg_mortality_rate(0)
