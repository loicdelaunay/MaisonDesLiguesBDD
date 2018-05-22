CREATE OR REPLACE PROCEDURE insert_atelier(plibelle varchar, pnbplacemaxi number)
is
erreur exception;
BEGIN
INSERT INTO ATELIER (LIBELLEATELIER,NBPLACESMAXI) VALUES (plibelle,pnbplacemaxi);
commit;
exception
    when others then 
        RAISE_APPLICATION_ERROR(-20001, 'Insertion atelier non valide');
END;