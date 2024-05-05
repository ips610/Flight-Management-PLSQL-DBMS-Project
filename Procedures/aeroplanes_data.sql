CREATE OR REPLACE PROCEDURE get_airplane_capacity AS BEGIN FOR rec IN (
    SELECT
        a.aeroplanesid,
        a.aeroplanetype,
        ac.totalcapacity,
        ac.economyclasscapacity,
        ac.premiumeconomyclasscapacity,
        ac.businessclasscapacity,
        ac.firstclasscapacity
    FROM
        aeroplanes a JOIN aeroplanecapacity ac ON a.aeroplanecapacityid = ac.aeroplanecapacityid
) LOOP DBMS_OUTPUT.PUT_LINE(
    'Aeroplane ID: ' || rec.aeroplanesid || ', Type: ' || rec.aeroplanetype || ', Total Capacity: ' || rec.totalcapacity || ', Economy Class Capacity: ' || rec.economyclasscapacity || ', Premium Economy Class Capacity: ' || rec.premiumeconomyclasscapacity || ', Business Class Capacity: ' || rec.businessclasscapacity || ', First Class Capacity: ' || rec.firstclasscapacity
);
END LOOP;
END;


DECLARE
    result_cursor SYS_REFCURSOR;
    airport_name airports.airportname%TYPE;
    airport_city airports.airportcity%TYPE;
    num_terminals NUMBER;
    num_runways NUMBER;
BEGIN
    result_cursor := get_airport_details;

    LOOP
        FETCH result_cursor INTO airport_name, airport_city, num_terminals, num_runways;
        EXIT WHEN result_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Airport Name: ' || airport_name);
        DBMS_OUTPUT.PUT_LINE('Airport City: ' || airport_city);
        DBMS_OUTPUT.PUT_LINE('Number of Terminals: ' || num_terminals);
        DBMS_OUTPUT.PUT_LINE('Number of Runways: ' || num_runways);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

    CLOSE result_cursor;
END;
/

