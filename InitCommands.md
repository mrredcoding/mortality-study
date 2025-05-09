# Mortality Project Init Commands

## CMD's Commands

### Init

    cd C:\Program Files\PostgreSQL\17\bin
    
    initdb -D <directory>/BDSchema
    initdb -D <directory>/BDMen
    initdb -D <directory>/BDWomen
 
### Define Ports

In each postgresql.conf, decomment the **port section** and change it to the following:
- For **BDSchema** : port **5440**
- For **BDMen** : port **5441**
- For **BDWomen** : port **5442**

### Launch Servers

    postgres -D <directory>/BDSchema
    postgres -D <directory>/BDMen
    postgres -D <directory>/BDWomen

### Connect to Servers

	psql -h localhost -p 5440 postgres
	psql -h localhost -p 5441 postgres
	psql -h localhost -p 5442 postgres

### Create Role

#### In BDSchema

	CREATE ROLE mortality_schema_admin
	WITH LOGIN SUPERUSER PASSWORD 'AzertySchema';

#### In BDMen

	CREATE ROLE mortality_men_admin
	WITH LOGIN SUPERUSER PASSWORD 'AzertyMen';

#### In BDWomen

	CREATE ROLE mortality_women_admin
	WITH LOGIN SUPERUSER PASSWORD 'AzertyWomen';

## PgAdmin's Commands

### Create Node to BDSchema

	CREATE EXTENSION postgres_fdw;
	
	CREATE SERVER nodeSchema
	FOREIGN DATA WRAPPER postgres_fdw
	OPTIONS (host 'localhost', dbname 'dbMortalitySchema', port '5440');
	
	CREATE USER MAPPING
	FOR CURRENT_USER
	SERVER nodeSchema
	OPTIONS (user 'mortality_schema_admin', password 'AzertySchema');

### Create Schema in BDMen & BDWomen

	CREATE SCHEMA foreign_schema_nodeSchema;
	
	IMPORT FOREIGN SCHEMA public
	FROM SERVER nodeSchema
	INTO foreign_schema_nodeSchema;
