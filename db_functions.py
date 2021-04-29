import sqlite3

# Création de la connexion à la BD (C'est beaucoup plus simple qu'en NodeJS)
connection = sqlite3.connect('./bdd.db')


def ajout_client(nom: str, prenom: str, date_de_naissance=None, mdp: str = '1234', mail: str = 'unknown', pays: str = 'France', ville: str = 'Marseille', adresse: str = '48 rue de la boustifaille', cp: int = 10251) -> None:
    """ Rajoute dans la BD un client avec le nom et prénom fournis, les autres attributs auront des arguments par défaut """

    connection.execute(f"""
    INSERT INTO client
    (NOM_CLIENT,PRENOM_CLIENT,DATE_NAISS_client,hash_mdp_client,mail_client,pays_client,ville_client,adresse_client,cp_client)
    VALUES ('{nom}', '{prenom}', '{date_de_naissance}', '{mdp}', '{mail}', '{pays}', '{ville}', '{adresse}', '{cp}')
    """)


def affiche_smartphone(marque: str) -> None:
    """ Affiche la table obtenue, attention l'argument est sensible aux majuscules"""

    afficher_table(f"""
    SELECT *
    FROM Smartphone
    WHERE MARQUE_SMARTPHONE = '{marque}' 
    """)


# Petite fonction bonus car nous on aime automatiser
def afficher_table(query: str) -> None:
    """ Prend en entré une requête SQL (SELECT statement) et l'affiche """
    for row in connection.execute(query):
        print(row)  # Testé et approuvé par la street (moi)


# Un petit test
affiche_smartphone('Huawei')

# Sauvegarde les modifications à la BD et coupe la connexion
connection.commit()
connection.close()
