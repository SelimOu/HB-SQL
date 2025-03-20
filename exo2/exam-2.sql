--Créer la base de données « bibliotheque » en UTF8.

CREATE DATABASE bibliotheque;


-- Créer les 3 tables en respectant les contraintes de relation et de référence. Les # ne doivent pas paraître dans le nom des champs.
CREATE TABLE adherents(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255) NOT NULL,
    numeroRue INT NOT NULL,
    nomRue varchar(255) NOT NULL,
    ville varchar(255) NOT NULL,
    code_postal INT NOT NULL,
    date_inscription DATE NOT NULL,
    a_surveiller BOOLEAN NOT NULL
    );


CREATE TABLE livres(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre varchar(255) NOT NULL,
    auteur varchar(255) NOT NULL,
    annee_publication DATE NOT NULL,
    disponible BOOLEAN NOT NULL
    );


 CREATE TABLE emprunts (
	id_adherent INT,
	id_livre INT,
	Date_emprun DATE NOT NULL,
	Date_retour DATE NOT NULL,
	PRIMARY KEY (id_adherent, id_livre),
	FOREIGN KEY (id_adherent) REFERENCES adherents(id),
	FOREIGN KEY (id_livre) REFERENCES livres(id)
);




--Créer un utilisateur « bibliothecaire » avec le mot de passe « secret » ayant accès uniquement à cette base de données bibliotheque avec tous les droits.

CREATE USER 'bibliothequaire' IDENTIFIED BY 'secret';

GRANT ALL PRIVILEGES ON biblioteque TO bibliothequaire



--Ajouter les adhérents : Jane Austen, Charles Dickens, Jules Verne, Mary Shelley. 

INSERT INTO adherents (nom,numeroRue,nomRue,ville,code_postal,date_inscription)
VALUE ('Jane Austen', 10, 'rue du jardin', 'Paris',75000,'2025-01-01'),
('Charles Dickens', 10, 'rue du jardin', 'Paris',75000,'2025-01-01'),
('Jules Verne', 10, 'rue du jardin', 'Paris',75000,'2025-01-01'),
('Mary Shelley', 10, 'rue du jardin', 'Paris',75000,'2025-01-01');

--Ajouter les livres : "Orgueil et Préjugés", "David Copperfield", "Vingt mille lieues sous les mers", "Frankenstein"

INSERT INTO livres(titre,auteur,annee_publication,disponible)
VALUES('Orgueil et Préjugés','pierre','2000-09-12',1),
('David Copperfield','pierre','2000-09-12',1),
('Vingt mille lieues sous les mers','pierre','2000-09-12',1),
('Frankenstein','pierre','2000-09-12',1);



--Ajouter des emprunts pour que chaque adhérent emprunte chaque chaque livre.


INSERT INTO emprunts(date_emprun, date_retour, id_adherent, id_livre)
VALUES('2025-03-20','2025-03-30',1,1),
('2025-03-10','2025-03-20',1,2),
('2025-03-01','2025-03-10',1,3),
('2025-03-07','2025-03-22',1,4),
('2025-03-20','2025-03-30',2,1),
('2025-03-10','2025-03-20',2,2),
('2025-03-01','2025-03-10',2,3),
('2025-03-07','2025-03-22',2,4),
('2025-03-20','2025-03-30',3,1),
('2025-03-10','2025-03-20',3,2),
('2025-03-01','2025-03-10',3,3),
('2025-03-07','2025-03-22',3,4),
('2025-03-20','2025-03-30',4,1),
('2025-03-10','2025-03-20',4,2),
('2025-03-01','2025-03-10',4,3),
('2025-03-07','2025-03-22',4,4),

--Charles Dickens déménage, mettez à jour son adresse dans la base de données. 

UPDATE `adherents` SET `numeroRue` = '20', `nomRue` = 'rue de la maison', `ville` = 'clermont', `code_postal` = '63000' WHERE `adherents`.`id` = 2;


--Un livre est empruntable 30 jours, faites une vue qui affiche les personnes qui ont des livres en retard et les livres en question
--Créer un trigger qui passe le booléen « disponible » à true si la date de retour d’un livre est précisée
--Créer une procédure stockée qui passe le booléen « a_surveiller » à true si une personne a un retard de plus de 30 jours
--Mary Shelley arrête son adhésion à la bibliothèque, supprimez son enregistrement de la base de données.
--Sur quel(s) champ(s) pourrait-on mettre un index pour optimiser les requêtes et pourquoi ?
Sur titre ou auteur de la table livre car je pense sur des recharches ou des filtes cest les champs qui vont avoir le plus de requetes

--La bibliothèque doit se conformer à la RGPD. Quelle requête SQL utiliseriez-vous pour anonymiser la base de données? pour supprimer toute la base de données ?
