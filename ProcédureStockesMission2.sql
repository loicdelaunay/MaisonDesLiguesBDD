CREATE OR REPLACE PROCEDURE insert_vacation(pidatelier NUMBER, pnumero NUMBER,pheuredebut VARCHAR2, pheurefin VARCHAR2)
is
erreur exception;
BEGIN
INSERT INTO VACATION (IDATELIER,NUMERO,HEUREDEBUT,HEUREFIN) VALUES (pidatelier,pnumero,to_date(pheuredebut,'dd/mm/yyyy hh:mi'),to_date(pheurefin,'dd/mm/yyyy hh:mi'));
commit;
exception
    when others then 
        RAISE_APPLICATION_ERROR(-20001, 'Insertion vacation non valide');
END;

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

CREATE OR REPLACE PROCEDURE insert_theme(pidatelier NUMBER, pnumero NUMBER, plibelle VARCHAR2)
is
erreur exception;
BEGIN
INSERT INTO THEME (IDATELIER,NUMERO,LIBELLETHEME) VALUES (pidatelier,pnumero,plibelle);
commit;
exception
    when others then 
        RAISE_APPLICATION_ERROR(-20001, 'Insertion theme non valide');
END;


EXEC insert_vacation(1,1,'10/05/2018 10:20','11/05/2018 10:30');
EXEC insert_atelier('test',10);
EXEC insert_theme(1,1,'test');


INSERT INTO VACATION (IDATELIER,NUMERO,HEUREDEBUT,HEUREFIN) VALUES (1,1,to_date('01/12/2018 10:20','yyyy/mm/dd hh:mi'),to_date('02/12/2018:10:20','yyyy/mm/dd:hh:mi'));
INSERT INTO ATELIER (ID,LIBELLEATELIER,NBPLACESMAXI) VALUES (seqatelier.nextval,'test',110);
INSERT INTO THEME (IDATELIER,NUMERO,LIBELLETHEME) VALUES (21,1,'test');


SELECT * FROM VACATION;
SELECT * FROM ATELIER;
SELECT * FROM THEME;


DELETE VACATION;
DELETE ATELIER WHERE ID > 6;
DELETE THEME;