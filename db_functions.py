import sqlite3

# Création de la connexion à la BD (C'est beaucoup plus simple qu'en NodeJS)
connection = sqlite3.connect('./bdd.db')


def ajout_client(nom, prenom) :

    """ Rajoute dans la BD un client avec le nom et prénom fournis, les autres attributs auront des arguments par défaut """

    connection.execute(f"""
    INSERT INTO client
    (NOM_CLIENT,PRENOM_CLIENT,DATE_NAISS_client,hash_mdp_client,mail_client,pays_client,ville_client,adresse_client,cp_client)
     VALUES ('{nom}', '{prenom}', 'Inconnu', 1234, 'Inconnu', 'Inconnu', 'Inconnu', 'Inconnu', 'Inconnu')
                        """)


def affiche_smartphone(marque):

    """ Affiche la table obtenue, attention l'argument est sensible aux majuscules"""

    for row in connection.execute(f"""
    SELECT *
    FROM Smartphone
    WHERE MARQUE_SMARTPHONE = '{marque}' """) :
        print(row)


# Petite fonction bonus
def afficher_table(table):
    """ Prend en entré une table (SELECT statement) et l'affiche """
    for row in table:
        print(row) # Testé et approuvé par la street (moi)


# Sauvegarde les modifications à la BD et coupe la connexion
connection.commit()
connection.close()
