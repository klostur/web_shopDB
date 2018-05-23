-- Modifikacija cene DOUBLE jer zaokruzuje 11.990 na 11.99 u drugom zadatku
ALTER TABLE product
MODIFY COLUMN price DOUBLE(8,3) NULL;
-- Prvi Zadatak
SELECT 
    first_name,
    last_name,
    IFNULL(email,'nepoznatno'),
    country.name,
    place.name,
    address.street,
    address.number
FROM
    user
        JOIN
    address ON address.id = user.address_id
        JOIN
    place ON address.place_id = place.id
        JOIN
    country ON place.country_id = country.id
ORDER BY 4,5,1,2; -- Lijenost je cudo

-- Drugi zadatak
SELECT 
    user.id,
    user.first_name,
    user.last_name,
    product.name,
    product.price
FROM
    shoppingcartitem
		JOIN 
	product ON product.id = shoppingcartitem.product_id
		JOIN 
	user ON user.id = shoppingcartitem.user_id
WHERE user.id = 2;

-- Treci zadatak (milion tabela povezanih jedna sa drugom)
SELECT 
    country.name AS 'Country Name', 
    product.name,
    product.price,
    shoppingcartitem.count AS 'Komada'
FROM
    shoppingcartitem
        JOIN
    product ON shoppingcartitem.product_id = product.id
        JOIN
    user ON shoppingcartitem.user_id = user.id
        JOIN
    address ON user.address_id = address.id
        JOIN
    place ON address.place_id = place.id
        JOIN
    country ON place.country_id = country.id
WHERE
    country.name = 'Srbija';

-- Cetvrti zadatak
SELECT 
    country.name AS 'Country Name', 
    CONCAT(user.first_name, ' ', user.last_name) AS 'User',
    /*product.name,
    product.price,*/
    shoppingcartitem.count AS 'Komada'
FROM
    shoppingcartitem
        JOIN
    product ON shoppingcartitem.product_id = product.id
        LEFT JOIN
    user ON shoppingcartitem.user_id = user.id
        JOIN
    address ON user.address_id = address.id
        JOIN
    place ON address.place_id = place.id
        JOIN
    country ON place.country_id = country.id
WHERE
    country.name = 'Switzerland' AND shoppingcartitem.count >= 1
GROUP BY 2;

-- Peti zadatak
SELECT 
    CONCAT(user.first_name, ' ', user.last_name) AS 'User',
    SUM(shoppingcartitem.count) AS 'Komada'
FROM
    shoppingcartitem
        JOIN
    product ON shoppingcartitem.product_id = product.id
		JOIN
    user ON shoppingcartitem.user_id = user.id
GROUP BY 1 ORDER BY 2 DESC;

-- Sesti zadatak
SELECT
	CONCAT(user.first_name, ' ', user.last_name) AS 'User'
FROM user
	JOIN address ON user.address_id = address.id
   WHERE place_id IS NULL;
   
-- Sedmi zadatak
SELECT 
	CONCAT(user.first_name, ' ', user.last_name) AS 'Useri koji nisu nista kupili'
FROM 
	user
		LEFT JOIN
	shoppingcartitem
    ON shoppingcartitem.user_id = user.id
WHERE shoppingcartitem.id IS NULL;

-- Osmi zadatak
SELECT 
	product.name AS 'Prozivodi koje niko nije kupio'
FROM 
	product
		LEFT JOIN
	shoppingcartitem ON shoppingcartitem.product_id = product.id
WHERE shoppingcartitem.id IS NULL;

-- Deveti zadatak
SELECT 
    country.name AS 'Country Name', 
    SUM(shoppingcartitem.count) AS 'Komada'
FROM
    shoppingcartitem
        JOIN
    product ON shoppingcartitem.product_id = product.id
        LEFT JOIN
    user ON shoppingcartitem.user_id = user.id
        JOIN
    address ON user.address_id = address.id
        JOIN
    place ON address.place_id = place.id
        JOIN
    country ON place.country_id = country.id
GROUP BY 1 ORDER BY 2 DESC;

-- Deseti zadatak
SELECT
	IFNULL(country.name, 'Nepoznato') AS 'Naziv drzave',
    COUNT(user.id) AS 'Registrovanih korisnika'
FROM
	user
		LEFT JOIN
    address ON user.address_id = address.id
        LEFT JOIN
    place ON address.place_id = place.id
        LEFT JOIN
    country ON place.country_id = country.id
GROUP BY 1 ORDER By 2 DESC;

-- Jedanaesti zadatak
SELECT 
    country.name AS 'Ime Drzave',
    SUM(price) 'Ukupna zarada'
FROM
    shoppingcartitem
        JOIN
    product ON shoppingcartitem.product_id = product.id
        JOIN
    user ON shoppingcartitem.user_id = user.id
        JOIN
    address ON user.address_id = address.id
        JOIN
    place ON address.place_id = place.id
        JOIN
    country ON place.country_id = country.id
GROUP BY country.id
ORDER BY 2 DESC;
	
		
	
    
    
    
    
    
    
    
    




