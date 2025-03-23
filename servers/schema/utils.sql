-- Procedure get_avg_mortality_rate
-- Retrieve Global Average Mortality Rate depending on the comorbidity
CREATE OR REPLACE PROCEDURE get_avg_mortality_rate(
    IN cci_level INT,
    OUT average_mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(CCI%s) FROM Mortality_Rate', cci_level)
    INTO average_mortality_rate;
END;
$$;

-- Example:
CALL get_avg_mortality_rate(0, NULL);

-- Function get_avg_life_expectancy
-- Retrieve Global Average Life Expentancy depending on the comorbidity
CREATE OR REPLACE PROCEDURE get_avg_life_expectancy(
    IN cci_level INT,
    OUT average_life_expectancy FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format('SELECT AVG(EV_CCI%s) FROM Mortality_Rate', cci_level)
    INTO average_life_expectancy;
END;
$$;

-- Example:
CALL get_avg_life_expectancy(0, NULL);

-- Function get_max_mortality_rate
-- Retrieve Global Max Mortality Rate depending on the comorbidity
CREATE OR REPLACE PROCEDURE get_max_mortality_rate(
    IN cci_level INT,
    OUT age INT,
    OUT mortality_rate FLOAT
)
LANGUAGE plpgsql AS $$
BEGIN
    EXECUTE format(
        'SELECT Age, CCI%s FROM Mortality_Rate ORDER BY CCI%s DESC LIMIT 1', 
        cci_level, cci_level
    )
    INTO age, mortality_rate;
END;
$$;

-- Example:
CALL get_max_mortality_rate(0, NULL, NULL);

-- Function: Raise an Exception if update on age or gender
CREATE OR REPLACE FUNCTION prevent_change_gender_age_value()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.Age <> OLD.Age OR NEW.Gender <> OLD.Gender) THEN
        RAISE EXCEPTION 'Trying to change Age or Gender value (Old value : Age=% and Gender=% | New valeur : Age=% and Gender=%).',
            OLD.Age, OLD.Gender, NEW.Age, NEW.Gender;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Before update execute function prevent_change_gender_age_value()
CREATE TRIGGER check_change_gender_age
BEFORE UPDATE ON mortality_rate
FOR EACH ROW EXECUTE PROCEDURE prevent_change_gender_age_value();

-- Function: Raise an Exception if gender isn't Male or Female
CREATE OR REPLACE FUNCTION prevent_invalid_gender()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Gender NOT IN ('Male', 'Female') THEN
        RAISE EXCEPTION 'Invalid gender value : %, it can only be "Male" or "Female".', NEW.Gender;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Before insert, execute function prevent_invalid_gender()
CREATE TRIGGER check_gender_before_insert
BEFORE INSERT ON mortality_rate
FOR EACH ROW EXECUTE PROCEDURE prevent_invalid_gender();

-- Function: Insert which entry had changes
CREATE OR REPLACE FUNCTION audit_mortality_rate_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO mortality_rate_audit(operation, age, gender)
    VALUES (TG_OP, COALESCE(NEW.Age, OLD.Age), COALESCE(NEW.Gender, OLD.Gender));
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Before insert, update and delete, execute function mortality_rate_audit_trigger()
CREATE TRIGGER mortality_rate_audit_trigger
AFTER INSERT OR UPDATE OR DELETE ON mortality_rate
FOR EACH ROW EXECUTE PROCEDURE audit_mortality_rate_changes();
