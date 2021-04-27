------------------------------------------------------------
        --Script MySQL.
------------------------------------------------------------


------------------------------------------------------------
 --Table: Client
------------------------------------------------------------

CREATE TABLE Client(
        NUM_CLIENT        Int  Auto_increment  NOT NULL ,
        NOM_CLIENT        Text NOT NULL ,
        PREMON_CLIENT     Text NOT NULL ,
        DATE_NAISS_CLIENT Date NOT NULL ,
        HASH_MDP_CLIENT   Text NOT NULL ,
        MAIL_CLIENT       Text NOT NULL ,
        PAYS_CLIENT       Text NOT NULL ,
        VILLE_CLIENT      Text NOT NULL ,
        ADRESSE__CLIENT   Text NOT NULL ,
        CP__CLIENT        Int NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (NUM_CLIENT)
);


------------------------------------------------------------
 --Table: Smartphone
------------------------------------------------------------

CREATE TABLE Smartphone(
        NUM_SMARTPHONE                       Int  Auto_increment  NOT NULL ,
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
	,CONSTRAINT Smartphone_PK PRIMARY KEY (NUM_SMARTPHONE)
);


------------------------------------------------------------
 --Table: Forfait
------------------------------------------------------------

CREATE TABLE Forfait(
        NUM_FORFAIT   Int  Auto_increment  NOT NULL ,
        PRIX_FORFAIT  Float NOT NULL ,
        DUREE_FORFAIT Int NOT NULL
	,CONSTRAINT Forfait_PK PRIMARY KEY (NUM_FORFAIT)
);


------------------------------------------------------------
 --Table: Commande
------------------------------------------------------------

CREATE TABLE Commande(
        NUM_COMMANDE    Int  Auto_increment  NOT NULL ,
        STATUT_COMMANDE Text NOT NULL ,
        NUM_CLIENT      Int NOT NULL
	,CONSTRAINT Commande_PK PRIMARY KEY (NUM_COMMANDE)

	,CONSTRAINT Commande_Client_FK FOREIGN KEY (NUM_CLIENT) REFERENCES Client(NUM_CLIENT)
);


------------------------------------------------------------
 --Table: Facture
------------------------------------------------------------

CREATE TABLE Facture(
        NUM_FACTURE                Int  Auto_increment  NOT NULL ,
        NUM_INTERMEDIAIRE_PAIEMENT Int NOT NULL ,
        NUM_COMMANDE               Int NOT NULL
	,CONSTRAINT Facture_PK PRIMARY KEY (NUM_FACTURE)

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

