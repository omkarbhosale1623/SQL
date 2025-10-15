create database zara;
use zara;

select*from products;
select*from products where Promotion='Yes';
select name as ProductName, price as ProductPrice from products;

select*from products where `Product Position`='Front of Store' and price > 100 and promotion = 'Yes';

INSERT INTO products
(`Product ID`, `Product Position`, `Promotion`, `Product Category`, `Seasonal`, `Sales Volume`, `brand`, `url`, `sku`, `name`, `description`, `price`, `currency`, `scraped_at`, `terms`, `section`)
VALUES
('200001', 'Front of Store', 'Yes', 'Clothing', 'No', 1200, 'Zara', 'http://example.com/200001', 'SKU200001', 'Winter Coat', 'Warm and stylish winter coat', 180, 'USD', '2024-02-20', 'Winter Collection', 'MAN');

INSERT INTO products (`Product ID`, `Product Position`, `Promotion`, `Product Category`, `Seasonal`, `Sales Volume`, `brand`, `url`, `sku`, `name`, `description`, `price`, `currency`, `scraped_at`, `terms`, `section`)
VALUES
('200002', 'End-cap', 'No', 'Accessories', 'Yes', 900, 'Zara', 'http://example.com/200002', 'SKU200002', 'Wool Scarf', 'Cozy wool scarf', 50, 'USD', '2024-02-21', 'Winter', 'WOMAN'),
('200003', 'Back of Store', 'Yes', 'Clothing', 'No', 300, 'Zara', 'http://example.com/200003', 'SKU200003', 'Casual Shirt', 'Cotton shirt for everyday wear', 75, 'USD', '2024-02-21', 'Spring', 'MAN');


INSERT INTO products (`Product ID`, `brand`, `name`, `price`)
VALUES ('200004', 'Zara', 'Basic T-shirt', 25);




INSERT INTO products (`Product ID`, `Product Position`, `Promotion`, `Product Category`, `Seasonal`, `Sales Volume`, `brand`, `url`, `sku`, `name`, `description`, `price`, `currency`, `scraped_at`, `terms`, `section`)
VALUES
('200005', 'Front of Store', 'Yes', 'Clothing', 'Yes', 800, 'Zara', 'http://example.com/200005', 'SKU200005', 'Down Jacket', 'Warm down jacket', 200, 'USD', '2024-02-22', 'Winter', 'MAN'),
('200006', 'Back of Store', 'No', 'Clothing', 'Yes', 650, 'Zara', 'http://example.com/200006', 'SKU200006', 'Puffer Jacket', 'Stylish puffer jacket', 180, 'USD', '2024-02-22', 'Winter', 'MAN'),
('200007', 'End-cap', 'Yes', 'Clothing', 'Yes', 720, 'Zara', 'http://example.com/200007', 'SKU200007', 'Bomber Jacket', 'Trendy bomber jacket', 150, 'USD', '2024-02-22', 'Winter', 'MAN'),
('200008', 'Front of Store', 'Yes', 'Clothing', 'Yes', 500, 'Zara', 'http://example.com/200008', 'SKU200008', 'Leather Jacket', 'Classic leather jacket', 220, 'USD', '2024-02-22', 'Winter', 'MAN'),
('200009', 'Back of Store', 'No', 'Clothing', 'Yes', 400, 'Zara', 'http://example.com/200009', 'SKU200009', 'Denim Jacket', 'Casual denim jacket', 130, 'USD', '2024-02-22', 'Winter', 'MAN');



INSERT INTO products (`Product ID`, `Product Position`, `brand`, `name`, `price`)
VALUES ('200010', NULL, 'Zara', 'Sneakers', 90);



SELECT * FROM products;

SELECT name, price, brand FROM products;


select name as item, sku as productcode from products;



SELECT * FROM products WHERE `Product Category` = 'Clothing';



SELECT * FROM products WHERE brand = 'Zara' AND `Sales Volume` > 1000;



SELECT * FROM products WHERE price < 150 AND Seasonal = 'Yes';


SELECT * FROM products WHERE price < 150 AND Seasonal = 'Yes';


SELECT * FROM products WHERE Promotion = 'Yes' OR Seasonal = 'Yes';


SELECT * FROM products WHERE Promotion = 'No';


SELECT * FROM products WHERE price > 100 AND Seasonal = 'No';

SELECT * FROM products WHERE UPPER(name) LIKE '%JACKET%';


