CREATE OR REPLACE PROCEDURE insert_atelier(plibelle VARCHAR2, pnbplacemaxi NUMBER)
is
erreur exception;
BEGIN
INSERT INTO ATELIER (ID,LIBELLEATELIER,NBPLACESMAXI) VALUES (seqatelier.nextval,plibelle,pnbplacemaxi);
commit;
exception
    when others then 
        RAISE_APPLICATION_ERROR(-20001, 'Insertion atelier non valide');
END;

EXEC insert_atelier('test',10);

INSERT INTO ATELIER (ID,LIBELLEATELIER,NBPLACESMAXI) VALUES (seqatelier.nextval,'test',110);

SELECT * FROM ATELIER;

DELETE ATELIER WHERE ID = 10;