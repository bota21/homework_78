DROP SCHEMA office;
CREATE SCHEMA office;
USE office;

CREATE TABLE IF NOT EXISTS categories(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_category VARCHAR(100) NOT NULL DEFAULT 'name category',
description_optional TEXT(1000)
);
CREATE TABLE IF NOT EXISTS places(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
place_name VARCHAR(100) NOT NULL DEFAULT 'place name'
);
ALTER TABLE places 
ADD COLUMN description_optional TEXT(1000);

CREATE TABLE IF NOT EXISTS products(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
category_id 
INT NOT NULL,
CONSTRAINT FK_categories
FOREIGN KEY (category_id)
REFERENCES categories(id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
place_id
INT NOT NULL, 
CONSTRAINT FK_places
FOREIGN KEY (place_id) 
REFERENCES places(id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
date_arrive DATE,
description_optional TEXT(1000)
);

INSERT INTO categories(id, name_category, description_optional) VALUES 
(1, 'furniture', 'office furniture'), 
(2, 'equipment', 'office equipment'),
(3, 'tableware', 'office tableware');

INSERT INTO places(id, place_name, description_optional) VALUES 
(1, 'stock', 'under office'), 
(2, 'office', 'in the office'), 
(3, 'tower', 'above the office'),
(4, 'home', 'at home');

INSERT INTO products(id, title, category_id, place_id, date_arrive, description_optional) VALUES 
(1, 'monitor', 2, 2, '20.04.2004', ''),
(2, 'teapot', 3, 2, '31.05.2004', ''),
(3, 'cupboard', 1, 1, '03.07.2004', ''),
(4, 'table', 1, 2, '04.07.2004', ''),
(5, 'system unit', 2, 3, '16.07.2004', ''),
(6, 'chair', 1, 3, '21.10.2008', ''),
(7, 'printer', 2, 1, '01.01.2010', ''),
(8, 'laptop', 2, 2, '02.03.2010', '');

DELETE FROM places WHERE id = 4;
SELECT * FROM products;
SHOW TABLES;
SELECT products.id, products.title, categories.name_category AS category, 
products.place_id AS place, products.date_arrive, products.description_optional 
FROM products, categories, places WHERE products.category_id = categories.id AND 
products.place_id=places.id
ORDER BY products.id;
