--Lister tous les plats avec un prix inférieur à 20 €.
SELECT * FROM `dishes` WHERE PRICE <20;

--Lister tous les plats des restaurants de cuisine Française et de cuisine Italienne en utilisant IN.
SELECT * FROM `dishes`
JOIN chefs on dishes.chef_id = chef_id
JOIN restaurants ON chefs.restaurant_id = restaurants.id
WHERE cuisine_type IN ('Française','Italienne');


--Lister tous les ingrédients du Bœuf Bourguignon. 

SELECT * FROM `ingredients` WHERE dish_id =1;


--Lister tous les chefs (leur nom uniquement) et leurs restaurants (leur nom uniquement).

SELECT chefs.name AS nom_chef, restaurants.name AS nom_resto FROM chefs
JOIN restaurants ON chefs.restaurant_id = restaurants.id;


--Lister les chefs et le nombre de plats qu'ils ont créés.

SELECT chefs.name, COUNT(dishes.id) FROM dishes
JOIN chefs ON dishes.chef_id = chefs.id  GROUP BY chef_id ;

-- Lister les chefs qui ont créé plus d'un plat.
Calculez le nombre de chefs ayant créé un seul plat.
SELECT chefs.name, COUNT(dishes.id) AS nb FROM dishes 
JOIN chefs ON dishes.chef_id = chefs.id  GROUP BY chef_id 
HAVING nb  >1
;
Calculez le nombre de plats pour chaque type de cuisine.
Calculez le prix moyen des plats par type de cuisine.
Trouver le prix moyen des plats créés par chaque chef, en incluant seulement les chefs ayant créé plus de 2 plats


