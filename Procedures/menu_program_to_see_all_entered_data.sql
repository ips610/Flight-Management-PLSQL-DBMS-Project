create or replace procedure airline_data as
    cursor airline_cursor is select * from airlines;
begin
    for rec in airline_cursor loop
        dbms_output.put_line(rec.airlineid|| ' ' ||rec.airlinename);
    end loop;
end;

CREATE or REPLACE PROCEDURE menu AS
    choice NUMBER;
    CURSOR airline_cursor IS SELECT * FROM airlines;

BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
        DBMS_OUTPUT.PUT_LINE('2. See all entered data');
        DBMS_OUTPUT.PUT_LINE('3. Exit');
        DBMS_OUTPUT.PUT_LINE('Enter your choice: ');
        READ(choice);
        IF choice == 1 THEN
                FOR rec IN airline_cursor LOOP
                    dbms_output.put_line(rec.airlineid|| ' ' ||rec.airlinename);
                END LOOP;
        ELSIF choice == 2 THEN
            airline_data;
        ELSIF choice == 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
    END LOOP;
END;


CREATE OR REPLACE PROCEDURE menu AS
    choice NUMBER;
    CURSOR airline_cursor IS SELECT * FROM airlines;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
        DBMS_OUTPUT.PUT_LINE('2. See all entered data');
        DBMS_OUTPUT.PUT_LINE('3. Exit');
        DBMS_OUTPUT.PUT('Enter your choice: ');
        ACCEPT choice NUMBER FORMAT '9';

        IF choice = 1 THEN
            FOR rec IN airline_cursor LOOP
                dbms_output.put_line(rec.airlineid|| ' ' ||rec.airlinename);
            END LOOP;
        ELSIF choice = 2 THEN
            airline_data; -- Assuming this is another procedure you've defined
        ELSIF choice = 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
    END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE menu AS
    choice NUMBER;
    CURSOR airline_cursor IS SELECT * FROM airlines;
    rec airline_cursor%ROWTYPE;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
        DBMS_OUTPUT.PUT_LINE('2. See all entered data');
        DBMS_OUTPUT.PUT_LINE('3. Exit');
        DBMS_OUTPUT.PUT('Enter your choice: ');
        &choice; -- Use & to prompt for input

        IF choice = 1 THEN
            OPEN airline_cursor;
            LOOP
                FETCH airline_cursor INTO rec;
                EXIT WHEN airline_cursor%NOTFOUND;
                dbms_output.put_line(rec.airlineid || ' ' || rec.airlinename);
            END LOOP;
            CLOSE airline_cursor;
        ELSIF choice = 2 THEN
            -- Call another procedure here to see all entered data
            -- airline_data;
            NULL; -- Placeholder since the procedure airline_data is not defined here
        ELSIF choice = 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE menu AS
    choice NUMBER;
    CURSOR airline_cursor IS SELECT * FROM airlines;
    rec airline_cursor%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
    DBMS_OUTPUT.PUT_LINE('2. See all entered data');
    DBMS_OUTPUT.PUT_LINE('3. Exit');
    DBMS_OUTPUT.PUT_LINE('Enter your choice: ');
    -- Use & to prompt for input
    choice := &choice;

    LOOP
        IF choice = 1 THEN
            OPEN airline_cursor;
            LOOP
                FETCH airline_cursor INTO rec;
                EXIT WHEN airline_cursor%NOTFOUND;
                dbms_output.put_line(rec.airlineid || ' ' || rec.airlinename); -- Corrected concatenation
            END LOOP;
            CLOSE airline_cursor;
        ELSIF choice = 2 THEN
            -- Call another procedure here to see all entered data
            -- airline_data;
            NULL; -- Placeholder since the procedure airline_data is not defined here
        ELSIF choice = 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
        EXIT WHEN choice = 3; -- Exit loop when choice is 3
    END LOOP;
END;





CREATE OR REPLACE PROCEDURE menu AS
	choice NUMBER;
	CURSOR airline_cursor IS SELECT * FROM airlines;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
		DBMS_OUTPUT.PUT_LINE('2. See all entered data');
		DBMS_OUTPUT.PUT_LINE('3. Exit');
		DBMS_OUTPUT.PUT_LINE('Enter your choice: ');
		choice := &choice;
		IF choice = 1 THEN
			FOR rec IN airline_cursor LOOP
				dbms_output.put_line(rec.airlineid || ' ' || rec.airlinename);
			END LOOP;
		ELSIF choice = 2 THEN
			airline_data; -- Assuming this is another procedure you've defined
		ELSIF choice = 3 THEN
			EXIT;
		ELSE
			DBMS_OUTPUT.PUT_LINE('Invalid choice');
		END IF;
	END LOOP;
END;
/




CREATE OR REPLACE PROCEDURE menu AS
	choice NUMBER;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
		DBMS_OUTPUT.PUT_LINE('2. See all entered data');
		DBMS_OUTPUT.PUT_LINE('3. Exit');
		DBMS_OUTPUT.PUT_LINE('Enter your choice: ');
		choice := &choice;
		IF choice = 1 THEN
			airline_data;
		ELSIF choice = 2 THEN
			airline_data; -- Assuming this is another procedure you've defined
		ELSIF choice = 3 THEN
			EXIT;
		ELSE
			DBMS_OUTPUT.PUT_LINE('Invalid choice');
		END IF;
	END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE menu AS
    choice NUMBER;
    CURSOR airline_cursor IS SELECT * FROM airlines;
    rec airline_cursor%ROWTYPE;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
        DBMS_OUTPUT.PUT_LINE('2. See all entered data');
        DBMS_OUTPUT.PUT_LINE('3. Exit');
        DBMS_OUTPUT.PUT('Enter your choice: ');
        
        -- Use bind variable to get user input
        EXECUTE IMMEDIATE 'BEGIN :choice := ' || TO_CHAR('&choice') || '; END;' USING OUT choice;

        IF choice = 1 THEN
            FOR rec IN airline_cursor LOOP
                dbms_output.put_line(rec.airlineid || ' ' || rec.airlinename);
            END LOOP;
        ELSIF choice = 2 THEN
            -- Call another procedure here to see all entered data
            -- airline_data;
            NULL; -- Placeholder since the procedure airline_data is not defined here
        ELSIF choice = 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE menu AS
    choice NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. Airlines Data');
        DBMS_OUTPUT.PUT_LINE('2. See all entered data');
        DBMS_OUTPUT.PUT_LINE('3. Exit');
        DBMS_OUTPUT.PUT('Enter your choice: ');
        
        -- Use bind variable to get user input
        EXECUTE IMMEDIATE 'BEGIN :choice := ' || TO_CHAR('&choice') || '; END;' USING OUT choice;

        IF choice = 1 THEN
            airline_data;
        ELSIF choice = 2 THEN
            -- Call another procedure here to see all entered data
            -- airline_data;
            NULL; -- Placeholder since the procedure airline_data is not defined here
        ELSIF choice = 3 THEN
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice');
        END IF;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE menu AS
BEGIN
    airline_data;
END;
/
