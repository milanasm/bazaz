```sql
-- 1. categories
create table categories(
category_id int PRIMARY KEY identity(1,1),
category_name varchar(25) UNIQUE);
INSERT INTO categories(category_name)
VALUES ('arvuti');
SELECT * FROM categories;
```
<img width="200" height="61" alt="{86F25493-A0A4-452C-BBA2-03839D0A66DC}" src="https://github.com/user-attachments/assets/32a742db-49e0-46a4-abab-a8d887250b7e" />

```sql
-- 2. brands
CREATE TABLE brands(
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(15) UNIQUE);
INSERT INTO brands(brand_name)
VALUES ('ASUS');
select * from brands;
```
<img width="167" height="58" alt="{B04784E8-5C5A-4194-9E32-BB2861F5B371}" src="https://github.com/user-attachments/assets/501d6728-6892-4df0-8ea0-90f95983bc4d" />

```sql
-- 3. products
CREATE TABLE products(
product_id int PRIMARY KEY identity(1,1),
product_name varchar(50) not null,
brand_id int,
FOREIGN KEY (brand_id) references brands(brand_id),
category_id int,
FOREIGN KEY (category_id) references categories(category_id),
model_year int,
list_price money);
select * from products
INSERT INTO products
VALUES ('Sülearvuti ASUS F16', 1, 1, 2024, 1050);
```
<img width="473" height="76" alt="{AE71CA15-D82E-4110-9013-C7F5C6485C24}" src="https://github.com/user-attachments/assets/4db41c46-17f7-4b58-8fec-f8e845714f4d" />

```sql
-- 4. stores
CREATE TABLE stores(
store_id INT PRIMARY KEY IDENTITY(1,1),
store_name VARCHAR(20) NOT NULL,
phone VARCHAR(13),
email VARCHAR(20),
street VARCHAR(50),
city VARCHAR(30),
state VARCHAR(30),
zip_code CHAR(5))
SELECT * FROM stores;
INSERT INTO stores
VALUES ('Kristiine Keskus', '37253546754', 'kristiine@gmail.com', 'Endla tn 45', 'Tallinn', 'Eesti', '10121');
```
<img width="595" height="60" alt="{4E98CC76-56AB-4FAE-BBED-A95DEAAA8A47}" src="https://github.com/user-attachments/assets/c47bd04a-42db-4325-9415-f157093ec04b" />

```sql
-- 5. stocks
CREATE TABLE stocks(
store_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (store_id, product_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));
SELECT * FROM stocks
insert into stocks
VALUES (2, 1, 13)
```
<img width="210" height="58" alt="{69DDD22C-47E3-4335-8353-40BD953A04BA}" src="https://github.com/user-attachments/assets/83eff935-1889-4cbd-8794-270c128989a0" />

```sql
-- 6. customers
CREATE TABLE customers(
customer_id INT PRIMARY KEY IDENTITY(1,1),
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone VARCHAR(13),
email VARCHAR(20) UNIQUE,
street VARCHAR(50),
city VARCHAR(15) check (city='Tallinn' or city='Narva'),
state VARCHAR(20),
zip_code CHAR(5));
Select * from customers
INSERT INTO customers
VALUES('Karolina', 'Oshlakova', '54546565', 'karolina@gmail', 'Sõpruse pst 182', 'Tallinn', 'Eesti', '12122')
```
<img width="656" height="57" alt="{EAAA1465-DA28-4A02-8C8F-27A007012466}" src="https://github.com/user-attachments/assets/1691d997-7938-4c9b-aad9-de5ffd057896" />

```sql
-- 7. staffs
CREATE TABLE staffs(
staff_id INT PRIMARY KEY IDENTITY(1,1),
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
email VARCHAR(25),
phone VARCHAR(13),
active BIT,
store_id INT,
FOREIGN KEY (store_id) REFERENCES stores(store_id),
manager bit);
SELECT * FROM staffs;
INSERT INTO staffs
VALUES('Marina', 'Oleinik', 'ol@gmail.com', '53538787', 2, 1, 0)
```
<img width="538" height="59" alt="{BC4133E1-106B-4EFC-A823-636C9D3CDD83}" src="https://github.com/user-attachments/assets/8dce6915-0f01-4c1f-9591-17a166923140" />

```sql
-- 8. orders
CREATE TABLE orders(
order_id INT PRIMARY KEY IDENTITY(1,1),
customer_id INT,
order_status VARCHAR(15) check(order_status='complete' or order_status='incomplete'),
order_date DATE,
required_date DATE,
shipped_date DATE,
store_id INT,
staff_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id),
FOREIGN KEY (staff_id) REFERENCES staffs(staff_id));
SELECT * FROM orders;
INSERT INTO orders
VALUES (1, 'complete', '2026-04-27', '2026-04-30', '2026-04-29', 1, 1);
```
<img width="569" height="58" alt="{40C0CA3C-CE57-4DF9-AAC1-17FEFDA37BFE}" src="https://github.com/user-attachments/assets/decce64f-b450-4317-ab65-51dc72d6a1f4" />

```sql
-- 9. order_items
CREATE TABLE order_items(
order_id INT,
item_id INT,
PRIMARY KEY (order_id, item_id),
product_id INT,
quantity INT,
list_price MONEY,
discount int,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));
SELECT * FROM order_items;
INSERT INTO order_items
VALUES (1,1, 1, 1, 1050, 100)
```
<img width="372" height="40" alt="{C675FED7-862E-4842-B32F-2B268FD81793}" src="https://github.com/user-attachments/assets/96ee83fe-fea7-4860-850a-1db10ef42603" />

DIAGRAAM
<img width="809" height="854" alt="{8325EEDA-555F-4B8E-A8B9-04C121696FBE}" src="https://github.com/user-attachments/assets/3a9a8a99-67f5-4dad-829e-ef93162fefaa" />









