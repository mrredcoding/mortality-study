-- Procedures on schema database

-- Procedure foreign_schema_nodeSchema.get_avg_mortality_rate
-- Retrieve Global Average Mortality Rate depending on the comorbidity
CREATE OR REPLACE PROCEDURE foreign_schema_nodeSchema.get_avg_mortality_rate(
    IN cci_level INT,
    OUT average_mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(CCI%s) FROM foreign_schema_nodeSchema.Mortality_Rate', cci_level)
    INTO average_mortality_rate;
END;
$$;

-- Example:
CALL foreign_schema_nodeSchema.get_avg_mortality_rate(0, NULL);

-- Function foreign_schema_nodeSchema.get_avg_life_expectancy
-- Retrieve Global Average Life Expentancy depending on the comorbidity
CREATE OR REPLACE PROCEDURE foreign_schema_nodeSchema.get_avg_life_expectancy(
    IN cci_level INT,
    OUT average_life_expectancy FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(EV_CCI%s) FROM foreign_schema_nodeSchema.Mortality_Rate', cci_level)
    INTO average_life_expectancy;
END;
$$;

-- Example:
CALL foreign_schema_nodeSchema.get_avg_life_expectancy(0, NULL);

-- Function foreign_schema_nodeSchema.get_max_mortality_rate
-- Retrieve Global Max Mortality Rate depending on the comorbidity
CREATE OR REPLACE PROCEDURE foreign_schema_nodeSchema.get_max_mortality_rate(
    IN cci_level INT,
    OUT age INT,
    OUT mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format(
        'SELECT Age, CCI%s FROM foreign_schema_nodeSchema.Mortality_Rate ORDER BY CCI%s DESC LIMIT 1', 
        cci_level, cci_level
    )
    INTO age, mortality_rate;
END;
$$;

-- Example:
CALL foreign_schema_nodeSchema.get_max_mortality_rate(0, NULL, NULL);

-- Procedures on men database

-- Procedure get_avg_mortality_rate
-- Retrieve Average Mortality Rate for men depending on the comorbidity and the age
CREATE OR REPLACE PROCEDURE get_avg_mortality_rate(
    IN selected_view VARCHAR(50),
    IN cci_level INT,
    OUT average_mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(CCI%s) FROM %I', cci_level, selected_view)
    INTO average_mortality_rate;
END;
$$;

-- Example:
CALL get_avg_mortality_rate('mortality_rate_men_from41to65', 0, NULL);

-- Function get_avg_life_expectancy
-- Average Life Expentancy for men depending on the comorbidity and the age
CREATE OR REPLACE PROCEDURE get_avg_life_expectancy(
    IN selected_view VARCHAR(50),
    IN cci_level INT,
    OUT average_life_expectancy FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(EV_CCI%s) FROM %I', cci_level, selected_view)
    INTO average_life_expectancy;
END;
$$;

-- Example:
CALL get_avg_life_expectancy('mortality_rate_men_from41to65', 0, NULL);

-- Function get_max_mortality_rate
-- Retrieve Max Mortality Rate for men depending on the comorbidity and the age
CREATE OR REPLACE PROCEDURE get_max_mortality_rate(
    IN selected_view VARCHAR(50),
    IN cci_level INT,
    OUT age INT,
    OUT mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format(
        'SELECT Age, CCI%s FROM %I ORDER BY CCI%s DESC LIMIT 1', 
        cci_level, selected_view, cci_level
    )
    INTO age, mortality_rate;
END;
$$;

-- Example:
CALL get_max_mortality_rate('mortality_rate_men_from41to65', 0, NULL, NULL);
