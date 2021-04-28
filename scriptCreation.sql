------------------------------------------------------------
        --Script MySQL.
------------------------------------------------------------
DROP TABLE IF EXISTS METTRE_DE_COTE;
DROP TABLE IF EXISTS VENDRE_AVEC;
DROP TABLE IF EXISTS CONTENIR;
DROP TABLE IF EXISTS Facture;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Forfait;
DROP TABLE IF EXISTS Smartphone;
DROP TABLE IF EXISTS Client;
------------------------------------------------------------
 --Table: Client
------------------------------------------------------------

CREATE TABLE Client(
        NUM_CLIENT        INTEGER PRIMARY KEY AUTOINCREMENT,
        NOM_CLIENT        Text NOT NULL ,
        PRENOM_CLIENT     Text NOT NULL ,
        DATE_NAISS_CLIENT Date NOT NULL ,
        HASH_MDP_CLIENT   Text NOT NULL ,
        MAIL_CLIENT       Text NOT NULL ,
        PAYS_CLIENT       Text NOT NULL ,
        VILLE_CLIENT      Text NOT NULL ,
        ADRESSE_CLIENT   Text NOT NULL ,
        CP_CLIENT        Int NOT NULL
);


------------------------------------------------------------
 --Table: Smartphone
------------------------------------------------------------

CREATE TABLE Smartphone(
        NUM_SMARTPHONE                       INTEGER PRIMARY KEY AUTOINCREMENT,
        MARQUE_SMARTPHONE                    Text NOT NULL ,
        MODELE_SMARTPHONE                    Text NOT NULL ,
        COULEUR_SMARTPHONE                   Text NOT NULL ,
        PRIX_SMARTPHONE                      Float NOT NULL ,
        TAILLE_ECRAN_SMARTPHONE              Float NOT NULL ,
        TYPE_ECRAN_SMARTPHONE                Text NOT NULL ,
        STOCKAGE_SMARTPHONE                  Int NOT NULL ,
        RESOLUTION_APPAREIL_PHOTO_SMARTPHONE Float NOT NULL ,
        COMPATIBILITE_RESEAU_SMARTPHONE      Text NOT NULL ,
        EDITION_LIMITE_SMARTPHONE            Bool NOT NULL
);


------------------------------------------------------------
 --Table: Forfait
------------------------------------------------------------

CREATE TABLE Forfait(
        NUM_FORFAIT   INTEGER PRIMARY KEY AUTOINCREMENT,
        PRIX_FORFAIT  Float NOT NULL ,
        DUREE_FORFAIT Int NOT NULL
	
);


------------------------------------------------------------
 --Table: Commande
------------------------------------------------------------

CREATE TABLE Commande(
        NUM_COMMANDE    INTEGER PRIMARY KEY AUTOINCREMENT,
        STATUT_COMMANDE Text NOT NULL ,
        NUM_CLIENT      Int NOT NULL

	,CONSTRAINT Commande_Client_FK FOREIGN KEY (NUM_CLIENT) REFERENCES Client(NUM_CLIENT)
);


------------------------------------------------------------
 --Table: Facture
------------------------------------------------------------

CREATE TABLE Facture(
        NUM_FACTURE                INTEGER PRIMARY KEY AUTOINCREMENT ,
        NUM_INTERMEDIAIRE_PAIEMENT Int NOT NULL ,
        NUM_COMMANDE               Int NOT NULL

	,CONSTRAINT Facture_Commande_FK FOREIGN KEY (NUM_COMMANDE) REFERENCES Commande(NUM_COMMANDE)
	,CONSTRAINT Facture_Commande_AK UNIQUE (NUM_COMMANDE)
);


------------------------------------------------------------
 --Table: CONTENIR
------------------------------------------------------------

CREATE TABLE CONTENIR(
        NUM_SMARTPHONE Int NOT NULL ,
        NUM_FORFAIT    Int NOT NULL ,
        NUM_COMMANDE   Int NOT NULL
	,CONSTRAINT CONTENIR_PK PRIMARY KEY (NUM_SMARTPHONE,NUM_FORFAIT,NUM_COMMANDE)

	,CONSTRAINT CONTENIR_Smartphone_FK FOREIGN KEY (NUM_SMARTPHONE) REFERENCES Smartphone(NUM_SMARTPHONE)
	,CONSTRAINT CONTENIR_Forfait0_FK FOREIGN KEY (NUM_FORFAIT) REFERENCES Forfait(NUM_FORFAIT)
	,CONSTRAINT CONTENIR_Commande1_FK FOREIGN KEY (NUM_COMMANDE) REFERENCES Commande(NUM_COMMANDE)
);


------------------------------------------------------------
 --Table: VENDRE AVEC
------------------------------------------------------------

CREATE TABLE VENDRE_AVEC(
        NUM_SMARTPHONE Int NOT NULL ,
        NUM_FORFAIT    Int NOT NULL
	,CONSTRAINT VENDRE_AVEC_PK PRIMARY KEY (NUM_SMARTPHONE,NUM_FORFAIT)

	,CONSTRAINT VENDRE_AVEC_Smartphone_FK FOREIGN KEY (NUM_SMARTPHONE) REFERENCES Smartphone(NUM_SMARTPHONE)
	,CONSTRAINT VENDRE_AVEC_Forfait0_FK FOREIGN KEY (NUM_FORFAIT) REFERENCES Forfait(NUM_FORFAIT)
);


------------------------------------------------------------
 --Table: METTRE DE COTE
------------------------------------------------------------

CREATE TABLE METTRE_DE_COTE(
        NUM_SMARTPHONE Int NOT NULL ,
        NUM_CLIENT     Int NOT NULL ,
        NOTIFICATION   Bool NOT NULL
	,CONSTRAINT METTRE_DE_COTE_PK PRIMARY KEY (NUM_SMARTPHONE,NUM_CLIENT)

	,CONSTRAINT METTRE_DE_COTE_Smartphone_FK FOREIGN KEY (NUM_SMARTPHONE) REFERENCES Smartphone(NUM_SMARTPHONE)
	,CONSTRAINT METTRE_DE_COTE_Client0_FK FOREIGN KEY (NUM_CLIENT) REFERENCES Client(NUM_CLIENT)
);

------------------------------------------------------------
 --Insertion de valeurs test
------------------------------------------------------------

INSERT INTO client(NOM_CLIENT,PRENOM_CLIENT,DATE_NAISS_client,hash_mdp_client,mail_client,pays_client,ville_client,adresse_client,cp_client) VALUES ('Lennon', 'Bob', date('2001-12-12'), 'bulia', 'dovakin@mordor.lol', 'Bordeciel', 'Nightcity', '1 rue du dragon', 42042);
INSERT INTO client(NOM_CLIENT,PRENOM_CLIENT,DATE_NAISS_client,hash_mdp_client,mail_client,pays_client,ville_client,adresse_client,cp_client) VALUES ('Vador', 'Dark', date('1500-12-24'), 'luke', 'order66@empire.death', 'Tatoine', 'mos esley', 'a droite de la cantina', 66666);
INSERT INTO smartphone(marque_smartphone,modele_smartphone,couleur_smartphone,prix_smartphone,taille_ecran_smartphone,type_ecran_smartphone,stockage_smartphone,resolution_appareil_photo_smartphone,compatibilite_reseau_smartphone,edition_limite_smartphone) VALUES ('Huawei', 'M10 lite', 'Gris', 700.5, 6.3, 'oled', 128, 48, '5G+', FALSE);
INSERT INTO forfait(PRIX_FORFAIT,DUREE_FORFAIT) VALUES (30, 24);
INSERT INTO commande(statut_commande,num_client) VALUES ('en attente de paiment', 1);
INSERT INTO commande(statut_commande,num_client) VALUES ('en attente de livraison', 2);
INSERT INTO facture(num_intermediaire_paiement,num_commande) VALUES (56151541254, 1);
INSERT INTO contenir(num_smartphone,num_forfait,NUM_COMMANDE) VALUES (1, 1, 2);
INSERT INTO vendre_avec(num_smartphone,num_forfait) VALUES (1, 1);
INSERT INTO mettre_de_cote(num_smartphone,num_client,NOTIFICATION) VALUES (1, 1, TRUE);