--INSERARE IN TABELA CATEGORIE
INSERT INTO CATEGORIE (nume_categorie) VALUES ('Incaltaminte');
INSERT INTO CATEGORIE (nume_categorie) VALUES ('Imbracaminte');
INSERT INTO CATEGORIE (nume_categorie) VALUES ('Accesorii');
INSERT INTO CATEGORIE (nume_categorie) VALUES ('Protectie');
INSERT INTO CATEGORIE (nume_categorie) VALUES ('Echipament');



--INSERARE IN TABELA CLIENTI SI DETALII CLIENTI
INSERT INTO CLIENTI (nume_client) VALUES ('Popescu Andrei');
INSERT INTO DETALII_CLIENTI(id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT id_client,
        'pandrei@gmail.com',
        'Str.Plopilor nr.3',
         '0721456783',
         TO_DATE('1980-04-23','YYYY-MM-DD'),
         TO_DATE('2022-05-20','YYYY-MM-DD')
FROM CLIENTI
WHERE id_client=500;


INSERT INTO CLIENTI (nume_client) VALUES ('Ionescu Ion');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT id_client,
        'iion@gmail.com',
        'Str.Florilor nr.23',
        '0744234283',           
        TO_DATE('1989-12-21','YYYY-MM-DD'),
        TO_DATE('2020-07-20','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=501;
      
INSERT INTO CLIENTI (nume_client) VALUES ('Radu Tudor');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT ID_CLIENT,
        'rtudor@gmail.com',
        'Str.Principala nr.231',
        '0744124283',
        TO_DATE('1999-10-10','YYYY-MM-DD'),
        TO_DATE('2020-01-10','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=502;
            
INSERT INTO CLIENTI (nume_client) VALUES ('Calinescu Larisa');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT ID_CLIENT,
        'clarisa@gmail.com',
        'Str.Eroilor nr.4',
        '0722114483',
        TO_DATE('2006-10-12','YYYY-MM-DD'),
        TO_DATE('2022-07-18','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=503;
            
INSERT INTO CLIENTI (nume_client) VALUES ('Stan Mihai');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT ID_CLIENT,
        'smihai@gmail.com',
        'Str.Zambilei nr.39',
        '0728497892',
        TO_DATE('1979-11-10','YYYY-MM-DD'),
        TO_DATE('2021-12-10','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=504;
            
INSERT INTO CLIENTI (nume_client) VALUES ('Nistor Gabriela');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT ID_CLIENT,
        'ngabriela@gmail.com',
        'Str.Principala nr.112',
        '0723478921',
         TO_DATE('2003-11-30','YYYY-MM-DD'),
         TO_DATE('2020-09-22','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=505;
            
INSERT INTO CLIENTI (nume_client) VALUES ('Petrescu Dan');
INSERT INTO DETALII_CLIENTI (id_client,email, adresa, nr_telefon, data_nasterii, data_inregistrarii)
SELECT ID_CLIENT,
        'pdan@gmail.com',
        'Str.Florilor nr.225',
        '0744521987',
        TO_DATE('1997-02-25','YYYY-MM-DD'),
        TO_DATE('2023-05-22','YYYY-MM-DD')
FROM CLIENTI
WHERE ID_CLIENT=506;
            
            
--INSERARE IN TABELA PRODUSE
INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
    'Jacheta de iarna impermeabila dama',
    230,
    20
FROM CATEGORIE
WHERE ID_CATEGORIE=101;

INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
    'Pantaloni schi barbati',
    300,
    20
FROM CATEGORIE
WHERE ID_CATEGORIE=101;


INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Clapari barbati',
            900,
            10
FROM CATEGORIE
WHERE ID_CATEGORIE=104;


INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Ghete dama',
            500,
            35
FROM CATEGORIE
WHERE ID_CATEGORIE=100;

INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Ghete imblanite dama',
            550,
            25
FROM CATEGORIE 
WHERE ID_CATEGORIE=100;


INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Clapari dama',
            920,
            12
FROM CATEGORIE
WHERE ID_CATEGORIE=104;


INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Ochelari protectie',
            200,
            10
FROM CATEGORIE 
WHERE ID_CATEGORIE=103;



INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Casca protectie copii',
            400,
            30
FROM CATEGORIE
WHERE ID_CATEGORIE=103;


INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Manusi dama',
            120,
            70
FROM CATEGORIE
WHERE ID_CATEGORIE=102;

INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Fes barbati',
            100,
            20
FROM CATEGORIE
WHERE ID_CATEGORIE=102;

INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Bete schi copii',
            700,
            70
FROM CATEGORIE
WHERE ID_CATEGORIE=104;

INSERT INTO PRODUSE (id_categorie,nume_produs,pret,stoc)
SELECT ID_CATEGORIE,
            'Clapari copii',
            550,
            20
FROM CATEGORIE
WHERE ID_CATEGORIE=104;
    
    
    
--INSERARI IN TABELA DE COMANDA
INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'cash',
            'curier',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=500;

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'cash',
            'posta',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=501;

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'card',
            'curier',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=502;

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'card',
            'posta',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=506;         

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'card',
            'curier',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=503; 

INSERT INTO COMANDA (id_client,metoda_plata,metoda_livrare,data_comanda)
SELECT ID_CLIENT,
            'cash',
            'posta',
            SYSDATE
FROM CLIENTI
WHERE ID_CLIENT=505; 

--INSERTURI IN DETALII_COMANDA
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Clapari copii'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=500),
            2);
UPDATE PRODUSE
SET STOC=STOC-2
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Clapari copii');


INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Manusi dama'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=500),
            3);
UPDATE PRODUSE
SET STOC=STOC-3
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Manusi dama');   


INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Bete schi copii'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=501),
            1);
UPDATE PRODUSE
SET STOC=STOC-1
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Bete schi copii');   

            
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Ghete imblanite dama'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=501),
            1);
UPDATE PRODUSE
SET STOC=STOC-1
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Ghete imblanite dama');   

                       
            
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Pantaloni schi barbati'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=503),
            7);
UPDATE PRODUSE
SET STOC=STOC-7
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Pantaloni schi barbati');   
           
            
            
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Casca protectie copii'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=503),
            3);     
UPDATE PRODUSE
SET STOC=STOC-3
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Casca protectie copii');   
           
                
            
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Clapari barbati'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=506),
            4);
UPDATE PRODUSE
SET STOC=STOC-4
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Clapari barbati');   
           
                     
    
INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Ochelari protectie'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=506),
            3);
UPDATE PRODUSE
SET STOC=STOC-3
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Ochelari protectie');   
           
      

INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Ochelari protectie'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=505),
            4); 
UPDATE PRODUSE
SET STOC=STOC-4
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Ochelari protectie');   
           
                  

INSERT INTO DETALII_COMANDA (id_produs,id_comanda,cantitate)
    VALUES((SELECT id_produs FROM PRODUSE WHERE nume_produs='Casca protectie copii'),
            (SELECT id_comanda FROM COMANDA WHERE id_client=502),
            3); 
UPDATE PRODUSE
SET STOC=STOC-3
WHERE ID_PRODUS=(SELECT ID_PRODUS FROM PRODUSE WHERE NUME_PRODUS='Casca protectie copii');   
           
SELECT * FROM DETALII_CLIENTI;
SELECT * FROM CLIENTI;
SELECT * FROM CATEGORIE;
SELECT * FROM PRODUSE;
SELECT * FROM COMANDA;
SELECT *FROM DETALII_COMANDA;


DROP TABLE CLIENTI CASCADE CONSTRAINTS;
DROP TABLE DETALII_CLIENTI CASCADE CONSTRAINTS;
DROP TABLE PRODUSE CASCADE CONSTRAINTS;
DROP TABLE COMANDA CASCADE CONSTRAINTS;
DROP TABLE DETALII_COMANDA CASCADE CONSTRAINTS;
DROP TABLE CATEGORIE CASCADE CONSTRAINTS;



commit;