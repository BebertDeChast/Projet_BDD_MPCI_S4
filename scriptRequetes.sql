-- Quels sont les produits que les clients ont mis de côté ?

SELECT * 
FROM Smartphone
WHERE NUM_SMARTPHONE IN (SELECT DISTINCT NUM_SMARTPHONE
                        FROM METTRE_DE_COTE);

-- Quels sont les smartphones et les forfaits qui sont commandés par des clients ayant moins de 25 ans ?

SELECT NUM_SMARTPHONE, NUM_FORFAIT
FROM CONTENIR
WHERE NUM_COMMANDE IN (SELECT NUM_COMMANDE
                        FROM Client NATURAL JOIN Commande
                        WHERE (strftime('%Y','now') - strftime('%Y', DATE_NAISS_CLIENT)) < 25);

-- Quel est le nombre de smartphones par commande ?

SELECT NUM_COMMANDE, count(*)
FROM CONTENIR
GROUP BY NUM_COMMANDE;

-- Quels sont les smartphones qui n'ont jamais été vendus ?

SELECT *
FROM Smartphone
WHERE NUM_SMARTPHONE NOT IN (SELECT NUM_SMARTPHONE
                            FROM Facture NATURAL JOIN Commande NATURAL JOIN CONTENIR);

-- Quels sont les smartphones qui ont été les plus vendus entre le 1er Novembre 2020 et le 31 Décembre 2020 ?

SELECT NUM_SMARTPHONE, count(*) AS NBR_VENDU
FROM Smartphone NATURAL JOIN CONTENIR NATURAL JOIN Commande NATURAL JOIN Facture
WHERE strftime('%s', DATE_FACTURE) BETWEEN strftime('%s', date('2020-11-01')) AND strftime('%s', date('2020-12-31'))
GROUP BY NUM_SMARTPHONE;

-- Quels sont les clients originaires de Marseille qui ont commandé des smartphones de la marque «Apple»

SELECT *
FROM Client 
WHERE VILLE_CLIENT = 'MARSEILLE' AND NUM_CLIENT IN (SELECT NUM_CLIENT
                                                    FROM Commande NATURAL JOIN CONTENIR NATURAL JOIN Smartphone
                                                    WHERE MARQUE_SMARTPHONE = 'APPLE');
