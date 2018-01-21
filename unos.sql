    DROP TABLE ADMIN;
    DROP TABLE IZDAT;
    DROP TABLE VIDEO;
    DROP TABLE POLICA;
    DROP TABLE CL_KARTA;
    DROP TABLE RACUN_CLANA;
    DROP TABLE FILM;
    DROP TABLE SALA;
    DROP TABLE RACUN_VID;
    DROP TABLE SALTERSKI;
    DROP TABLE RADNIK;
    DROP TABLE REG_VIDEA;
    DROP TABLE CLAN;
    DROP TABLE ODELJAK;
    DROP TABLE VIDEOTEKA;

--INSERT

INSERT INTO VIDEOTEKA
VALUES ('Prosvetiteljska','Janka Cmelika 29B');

INSERT INTO ODELJAK
    VALUES ('Misteriozni kutak','Misterija',1,'Prosvetiteljska');

INSERT INTO POLICA
    VALUES ('MP1', 3 , 'Misteriozna polica','Misteriozni kutak');

INSERT INTO VIDEO
    VALUES (1, 'Avalon', 'Ko Zna','Misterija','MP1');
INSERT INTO VIDEO
    VALUES (2, 'Avalon', 'Ko Zna','Misterija','MP1');
INSERT INTO VIDEO
    VALUES (3, 'Markoni', 'Illuminati','Misterija','MP1');


INSERT INTO CLAN
VALUES (1,'Boris', 'Bajramovic');
        
INSERT INTO CLAN
    VALUES (2, 'Dragana', 'Hrcek');

INSERT INTO CLAN
    VALUES (3, 'Aleksandra', 'Aleksic');

INSERT INTO CL_KARTA
    VALUES(11,to_date('2017-08-23','yyyy-mm-dd'),to_date('2017-08-23','yyyy-mm-dd'),1,'Prosvetiteljska');

INSERT INTO CL_KARTA
    VALUES(12,to_date('2017-05-13','yyyy-mm-dd'),to_date('2017-05-13','yyyy-mm-dd'),2,'Prosvetiteljska');

INSERT INTO RACUN_CLANA
    VALUES(1001,5000, to_date('2017-06-13','yyyy-mm-dd'),1);

INSERT INTO RACUN_VID
    VALUES(2221,1000000,'Prosvetiteljska');
INSERT INTO RADNIK
    VALUES(1,'Prosvetiteljska');
INSERT INTO RADNIK
    VALUES(2,'Prosvetiteljska');
INSERT INTO REG_VIDEA
    VALUES(1,'Prosvetiteljska',1);

INSERT INTO ADMIN
    VALUES(1,501,'Aleksandar','Pejakovic',100000,1);
INSERT INTO SALTERSKI_RADNIK
    VALUES(2,1,'Dragoljub','Ilic',20000);


INSERT INTO IZDAT
    VALUES(to_date('2017-05-11','yyyy-mm-dd'),to_date('2017-08-18','yyyy-mm-dd'),1,11,1,'Prosvetiteljska',1);
INSERT INTO IZDAT
    VALUES(to_date('2017-11-1','yyyy-mm-dd'),to_date('2017-12-8','yyyy-mm-dd'),2,11,1,'Prosvetiteljska',1);
	
	
INSERT INTO SALA
    VALUES('PRVA',20,10000,'Prosvetiteljska');
INSERT INTO SALA
    VALUES('DRUGA',100,40000,'Prosvetiteljska');

INSERT INTO FILM
    VALUES(to_date('2017-2-5','yyyy-mm-dd'),'Boris Bajramovic','Poloziti Baze','DRUGA');

--POGLEDI	
	
CREATE VIEW film_view AS
   SELECT s.BROJ_MESTA, s.CENA_IZD, f.AUTOR, f.DATUM
   FROM FILM f, SALA s
   WHERE f.SALA_S_NAZIV = s.S_NAZIV;

CREATE VIEW izdat_view AS
   SELECT i.VIDEO_SIFRA_V, i.IZDAT_D, i.ROK_D, i.CL_KARTA_SIFRA_KAR, c.IME, v.NAZIV, v.AUTOR, v.ZANR_V
   FROM IZDAT i, VIDEO v, CL_KARTA k, CLAN c
   WHERE i.VIDEO_SIFRA_V = v.SIFRA_V AND i.CL_KARTA_SIFRA_KAR = k.SIFRA_KAR AND c.SIFRA_C = k.CLAN_SIFRA_C;
   
CREATE VIEW odeljci_view AS
   SELECT v.V_NAZIV, o.O_NAZIV, o.VIDEOTEKA_V_NAZIV, p.P_NAZIV
   FROM VIDEOTEKA v, POLICA p, ODELJAK o
   WHERE o.VIDEOTEKA_V_NAZIV = v.V_NAZIV AND p.ODELJAK_O_NAZIV = o.O_NAZIV; 