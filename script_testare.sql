--JOIN INTRE TABELA PRODUSE SI TABELA CATEGORIE
SELECT p.nume_produs,p.pret,p.stoc,c.nume_categorie
FROM PRODUSE p
JOIN 
    CATEGORIE c ON p.id_categorie=c.id_categorie
ORDER BY c.id_categorie;

--JOIN INTRE TABELA PRODUSE,DETALII_COMANDA,COMANDA,CLIENTI
SELECT p.nume_produs, p.pret, d.cantitate,c.id_client,l.nume_client,d.id_comanda
FROM PRODUSE p,DETALII_COMANDA D, COMANDA c,CLIENTI l
WHERE d.id_comanda=c.id_comanda and p.id_produs=d.id_produs and l.id_client=c.id_client
ORDER BY d.id_comanda;

--JOIN INTRE PRODUSE SI DETALII_CLIENTI
SELECT p.nume_produs, p.pret, d.cantitate
FROM PRODUSE p, DETALII_COMANDA d
WHERE d.id_produs=p.id_produs
ORDER BY p.id_produs;

--JOIN INTRE DETALII_COMANDA SI COMANDA
SELECT c.data_comanda,c.metoda_plata,c.metoda_livrare,d.cantitate
FROM DETALII_COMANDA d, COMANDA c
WHERE d.id_comanda=c.id_comanda;

--JOIN INTRE DETALII_COMANDA, CLIENTI SI DETALII_CLIENTI
SELECT c.nume_client,d.email,d.data_nasterii,data_inregistrarii, d.adresa,d.nr_telefon,r.data_comanda,r.metoda_livrare,r.metoda_plata
FROM CLIENTI c, DETALII_CLIENTi d, COMANDA r
WHERE c.id_client=d.id_client AND r.id_client=c.id_client
ORDER BY c.id_client;

--JOIN INTRE CLIENTI SI DETALII CLIENTI
SELECT c.nume_client, d.nr_telefon,d.adresa,d.email,d.data_nasterii,d.data_inregistrarii
FROM CLIENTI c, DETALII_CLIENTI d
WHERE d.id_client = c.id_client;





--TESTARE CONSTRANGERI DIN TABELA CATEGORIE
INSERT INTO CATEGORIE(id_categorie,nume_categorie)      --id_categorie incepe de la 100 si este unique 
VALUES (101,'Imbracaminte');                            --ORA-00001: unique constraint (BD031.CATEGORIE_PK) violated

INSERT INTO CATEGORIE(id_categorie,nume_categorie)      --id_categorie incepe de la 100, nu 200
VALUES (200,'Imbracaminte');                            --ORA-00001: unique constraint (BD031.CATEGORIE_PK) violated
DELETE FROM CATEGORIE
WHERE id_categorie=200;

INSERT INTO CATEGORIE(id_categorie)      --nume_categorie trebuie introdus obligatoriu
VALUES (106);                            --ORA-01400: cannot insert NULL into ("BD031"."CATEGORIE"."NUME_CATEGORIE")

UPDATE CATEGORIE
SET nume_categorie='Pantofi'
WHERE id_categorie=100;

INSERT INTO CATEGORIE(id_categorie,nume_categorie)      --nume_categorie trebuie sa contina doar litere 
VALUES (101,'234');                                     --ORA-02290: check constraint (BD031.CATEGORIE_NUME_CATEGORIE_CK) violated



--TESTARE CONSTRANGERI DIN TABELA PRODUSE
INSERT INTO PRODUSE (id_produs,nume_produs,pret,stoc,id_categorie)      --id_produs trebuia sa aiba 3 cifre, sa fie unique si sa inceapa de la 200
            VALUES(                                                     --ORA-02290: check constraint (BD031.PRODUSE_ID_PROD_CK) violated
            20,
            'Ochelari protectie',
            200,
            10,
            103);
            
INSERT INTO PRODUSE (pret,stoc,id_categorie)      --nume_produs trebuia sa fie introdus obligatoriu 
            VALUES(
            200,
            10,
            103); 
            
INSERT INTO PRODUSE (nume_produs,pret,stoc,id_categorie)      --nume_produs trebuia sa aiba doar litere
            VALUES(
            'Och23ie',                                       --ORA-02290: check constraint (BD031.PRODUSE_NUME_PRODUS_CK) violated
            200,
            10,
            103);
INSERT INTO PRODUSE (nume_produs,stoc,id_categorie)         --pret este obligatoriu de introdus
            VALUES(                                         --ORA-01400: cannot insert NULL into ("BD031"."PRODUSE"."PRET")
            'Casca protectie copii',
            30,
            103); 
INSERT INTO PRODUSE (nume_produs,pret,stoc,id_categorie)    --pretul este intre 10 si 1000 lei
            VALUES(                                        -- SQL Error: ORA-01438: value larger than specified precision allowed for this column
            'Casca protectie copii',
            11111,
            30,
            103);
INSERT INTO PRODUSE (nume_produs,pret,stoc,id_categorie)    --pretul este intre 10 si 1000 lei
            VALUES(                                        -- ORA-02290: check constraint (BD031.PRODUSE_PRET_CK) violated
            'Casca protectie copii',
            1,
            30,
            103);
            
INSERT INTO PRODUSE (nume_produs,pret,id_categorie)         --stoc este obligatoriu
            VALUES(                                         --ORA-01400: cannot insert NULL into ("BD031"."PRODUSE"."STOC")
            'Casca protectie copii',
            400,
            103); 
            
INSERT INTO PRODUSE (nume_produs,pret,stoc, id_categorie)      --stoc este un nr
            VALUES(                                         --https://docs.oracle.com/error-help/db/ora-01722/01722. 00000 -  "unable to convert string value containing %s to a number: %s"
            'Clapari copii',
            550,
            'hei',
            102);

INSERT INTO PRODUSE (nume_produs,pret,stoc)             --id_categorie nu poate fi null si este unique
            VALUES(                                        --ORA-01400: cannot insert NULL into ("BD031"."PRODUSE"."ID_CATEGORIE")

            'Clapari copii',
            550,
            20);
INSERT INTO PRODUSE (id_produs,nume_produs,pret,stoc, id_categorie)
            VALUES(                                         --ORA-00001: unique constraint (BD031.PRODUSE_PK) violated
            200,
            'Clapari copii',
            550,
            20,
            102);
            

--VERIFICARI PENTRU DETALII_COMANDA
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)                --cantitate trebuie sa fie un nr
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Pantaloni schi barbati'),          --https://docs.oracle.com/error-help/db/ora-01722/01722. 00000 -  "unable to convert string value containing %s to a number: %s"
            (SELECT id_comanda FROM COMANDA WHERE id_client=503),
            'abc');
INSERT INTO DETALII_COMANDA (id_produs,id_comanda)                            --cantitate este obligarie 
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Pantaloni schi barbati'),              --ORA-01400: cannot insert NULL into ("BD031"."DETALII_COMANDA"."CANTITATE")
            (SELECT id_comanda FROM COMANDA WHERE id_client=503));

UPDATE DETALII_COMANDA          --update la comanda
SET id_comanda=300
WHERE id_produs=209;



--VALIDARI IN TABELA COMANDA
INSERT INTO COMANDA (id_comanda,id_client,metoda_plata,metoda_livrare,data_comanda)         --ORA-02290: check constraint (BD031.COMANDA_ID_COMANDA_CK) violated
            VALUES(10,                                                                      --id_comanda incepe de la 300 si este unique
            503,
            'card',
            'curier',
            SYSDATE);
INSERT INTO COMANDA (id_comanda,id_client,metoda_plata,metoda_livrare,data_comanda)         --ORA-00001: unique constraint (BD031.COMANDA_PK) violated
            VALUES(300,
            503,
            'card',
            'curier',
            SYSDATE);
INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)                    --SQL Error: ORA-01722: invalid number
            VALUES(                                                                         --id_client este un nr
            'abx',
            'card',
            'curier',
            SYSDATE);
INSERT INTO COMANDA (metoda_plata,metoda_livrare,data_comanda)                  --ORA-01400: cannot insert NULL into ("BD031"."COMANDA"."ID_CLIENT")
            VALUES(                                                             --id_client trebuie introdus obligatoriu
            'card',
            'curier',
            SYSDATE);
INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)        --ORA-02290: check constraint (BD031.COMANDA_METODA_PLATA_CK) violated
            VALUES(                                                             --metoda_plata poate fi doar cash sau card
            503,
            'bani',
            'curier',
            SYSDATE);
INSERT INTO COMANDA (id_client,metoda_livrare,data_comanda)                     --ORA-01400: cannot insert NULL into ("BD031"."COMANDA"."METODA_PLATA")
            VALUES(                                                             -- metoda_plata nu poate fi null
            503,
            
            'curier',
            SYSDATE);
            
            
UPDATE COMANDA                              --SQL Error: ORA-20001: Data invalida: 08.12.2024 20:37:50 trebuie sa fie mai mare decat data curenta.
SET metoda_livrare='easybox'                --metoda_livarer poate fi doar curier sau posta
where id_comanda=300;                       --data_comanda nu poate fi mai mica decat data curenta

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)        --id_client trebuie sa fie un nr mai mare de 500
            VALUES(                                                             --https://docs.oracle.com/error-help/db/ora-01722/01722. 00000 -  "unable to convert string value containing %s to a number: %s"
            'abc',
            'card',
            'posta',
            SYSDATE);
            
--VERIFICARE PENTRU TABELA CLIENTI
UPDATE CLIENTI                      --SQL Error: ORA-01722: invalid number
SET id_client='abc'                 --ID_CLIENT TREBUIE SA FIE UN NR
where id_client=500;

UPDATE CLIENTI                        --ORA-02290: check constraint (BD031.CLIENTI_NUME_CLIENT_CK) violated
SET NUME_CLIENT='123'                  --numele trebuie sa fie format doar din litere
WHERE ID_CLIENT=500;

INSERT INTO CLIENTI (id_client,nume_client) VALUES (500,'Popescu Andrei');          --ORA-00001: unique constraint (BD031.CLIENTI_PK) violated
--id_client este unique

INSERT INTO CLIENTI (nume_client) VALUES ('Popescu Andrei');            --ORA-00001: unique constraint (BD031.CLIENTI_NUME_CLIENT_UN) violated
--numele este unique

INSERT INTO CLIENTI (nume_client) VALUES (123);                     --ORA-02290: check constraint (BD031.CLIENTI_NUME_CLIENT_CK) violated
--numele trebuie sa contina doar litere

INSERT INTO CLIENTI (id_client,nume_client) VALUES ('abc','Popescu Andrei');            --SQL Error: ORA-01722: invalid number
--id_client este un numar

INSERT INTO CLIENTI (id_client) VALUES (513);               --ORA-01400: cannot insert NULL into ("BD031"."CLIENTI"."NUME_CLIENT")
--numele nu trebuie sa fie null




--VERIFICARI PENTRU TABELA DETALII_CLIENTI
INSERT INTO DETALII_CLIENTI (email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (                                                                        --ORA-01400: cannot insert NULL into ("BD031"."DETALII_CLIENTI"."ID_CLIENT")
            'pandrei@gmail.com',
            'Str.Plopilor nr.3',                                                             --id_client nu poate fi null
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                                                                                     --ORA-00001: unique constraint (BD031.DETALII_CLIENTI_EMAIL_UN) violated
            'pandrei@gmail.com',                                                                              --email este unique
            'Str.Plopilor nr.3',
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                --ORA-01400: cannot insert NULL into ("BD031"."DETALII_CLIENTI"."EMAIL")
            'Str.Plopilor nr.3',        --email nu poate fi null
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                                                    --adresa nu e obliagtorie
            'pandrei@gmail.com',                        --ORA-00001: unique constraint (BD031.DETALII_CLIENTI__IDX) violated
                                                        --constrangerea pentru id unique
            
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa,  data_nasterii, data_inregistrarii)              -- ORA-01400: cannot insert NULL into ("BD031"."DETALII_CLIENTI"."NR_TELEFON")
            VALUES (500,                                                                                --NR DE TELEFON NU POATE FI NUll
            'pandrei@gmail.com',
            'Str.Plopilor nr.3',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                                    --SQL Error: ORA-12899: value too large for column "BD031"."DETALII_CLIENTI"."NR_TELEFON" (actual: 14, maximum: 10)
            'pandrei@gmail.com',                            --nr de telefon are doar 10 cifre
            'Str.Plopilor nr.3',
            '07214567831111',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                        --SQL Error: ORA-20001: Data invalida: 23.04.2020 - Persoana trebuie sa aiba cel putin 16 ani.
            'pandrei@gmail.com',
            'Str.Plopilor nr.3',
            '0721456783',
            TO_DATE('2020-04-23','YYYY-MM-DD'),
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                        --SQL Error: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
            'pandrei@gmail.com',                --data_nasterii trebuie sa iaba un format valid
            'Str.Plopilor nr.3',
            '0721456783',
            17,
            TO_DATE('2022-05-20','YYYY-MM-DD'));

INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon,  data_inregistrarii)
            VALUES (500,                        --ORA-01400: cannot insert NULL into ("BD031"."DETALII_CLIENTI"."DATA_NASTERII")
            'pandrei@gmail.com',                --data_nasterii nu poate fi null
            'Str.Plopilor nr.3',
            '0721456783',
           
            TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
            VALUES (500,                            --SQL Error: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
            'pandrei@gmail.com',                    --data_inregostrarii trebuie sa aiba format valid
            'Str.Plopilor nr.3',
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD'),
            17);
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii)
            VALUES (500,                        --data inregistrarii poate lipsi
            'pandrei@gmail.com',
            'Str.Plopilor nr.3',
            '0721456783',
            TO_DATE('1980-04-23','YYYY-MM-DD')
            );


UPDATE DETALII_CLIENTI                  --ORA-00001: unique constraint (BD031.DETALII_CLIENTI_EMAIL_UN) violated
SET EMAIL='pandrei@gmail.com'           --email ul este unique
WHERE ID_CLIENT=502;



UPDATE DETALII_CLIENTI                  --ORA-00001: unique constraint (BD031.DETALII_CLIENTI_NR_TELEFON_UN) violated
SET nr_telefon='0721456783'           --nr_telefon este unique
WHERE ID_CLIENT=502;

UPDATE DETALII_CLIENTI                  --ORA-00001: unique constraint (BD031.DETALII_CLIENTI_ADRESA_UN) violated
SET adresa= 'Str.Plopilor nr.3'         --adresa este unique
WHERE ID_CLIENT=502;