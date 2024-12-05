-- Tạo DATABASE

CREATE DATABASE IF NOT EXISTS db_app_food;

-- Tạo TABLE

CREATE TABLE `user`(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

CREATE TABLE restaurant(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	`desc` VARCHAR(255)
)


CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

CREATE TABLE orders (
	user_id INT,
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)


CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)


CREATE TABLE like_res(
	user_id INT,
	res_id INT,
	date_like DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)

CREATE TABLE rate_res(
	user_id INT,
	res_id INT,
	amount FLOAT,
	date_rate DATETIME,
	 
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)



--  Tạo dữ liệu cho các TABLE

-- Bảng user
INSERT INTO user (full_name, email, pass_word) VALUES
('nguyen van a', 'abcd@example.com', 'password00000')



-- Bảng food
INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Margherita Pizza', 'margherita.png', 12, 'Classic cheese pizza', 6),
('Cheeseburger', 'cheeseburger.png', 8, 'Juicy beef burger with cheese', 7),
('California Roll', 'california.png', 9, 'Fresh crab and avocado sushi',9),
('Veggie Taco', 'veggie_taco.png', 3, 'Taco with mixed veggies', 10),
('Grilled Salmon', 'grilled_salmon.png', 15, 'Fresh salmon grilled to perfection', 6),
('Chocolate Cake', 'chocolate_cake.png', 6, 'Rich chocolate dessert', 7),
('Espresso', 'espresso.png', 2, 'Strong black coffee', 8),
('Ribeye Steak', 'ribeye.png', 24, 'Tender ribeye steak', 9),
('Pancakes', 'pancakes.png', 5, 'Fluffy breakfast pancakes', 10),
('Pasta Alfredo', 'alfredo.png', 11, 'Creamy Alfredo pasta', 15);
											

-- Bảng orders
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(11, 77, 2, 'ORD123', '1,2'),
(16, 78, 1, 'ORD124', '3'),
(18, 79, 3, 'ORD125', NULL),
(12, 74, 1, 'ORD126', '2'),
(15, 76, 2, 'ORD127', '1,4'),
(16, 75, 1, 'ORD128', NULL),
(17, 79, 2, 'ORD129', '3'),
(18, 81, 1, 'ORD130', '1'),
(19, 79, 3, 'ORD131', NULL),
(14, 80, 2, 'ORD132', '4,5');


-- Bảng restaurant
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Pizza Palace', 'pizza.png', 'Delicious pizzas and more'),
('Burger Barn', 'burger.png', 'Best burgers in town'),
('Sushi Spot', 'sushi.png', 'Fresh sushi and sashimi'),
('Taco Tower', 'taco.png', 'Authentic Mexican tacos'),
('Steakhouse Grill', 'steak.png', 'Juicy steaks and sides'),
('Veggie Village', 'veggie.png', 'Healthy vegetarian options'),
('Pasta Place', 'pasta.png', 'Homemade pasta dishes'),
('Seafood Shack', 'seafood.png', 'Fresh seafood daily'),
('Dessert Den', 'dessert.png', 'Sweet treats and desserts'),
('Coffee Corner', 'coffee.png', 'Best coffee and snacks');


--  Bảng sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 1.5, 81),
('Bacon', 2.0, 72),
('Avocado', 1.0, 73),
('Sour Cream', 0.5, 74),
('Lemon Butter', 1.5, 75),
('Whipped Cream', 0.5, 76),
('Sugar Syrup', 0.3, 77),
('Garlic Butter', 0.8, 78),
('Maple Syrup', 1.2, 79),
('Parmesan Cheese', 1.0, 79);


-- Bảng food_type
INSERT INTO food_type (type_name) VALUES
('Fast Food'),
('Italian'),
('Mexican'),
('Japanese'),
('Vegetarian'),
('Seafood'),
('Desserts'),
('Beverages'),
('Steak'),
('Breakfast');


-- Bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(12, 11,  '2024-11-01 11:00:00'),
(13, 12,  '2024-11-02 12:30:00'),
(12, 13, '2024-11-03 14:15:00'),
(14, 14, '2024-11-04 15:45:00'),
(12, 15,  '2024-11-05 17:30:00'),
(15, 16,  '2024-11-06 19:00:00'),
(15, 17,  '2024-11-07 20:30:00'),
(16, 18,  '2024-11-08 21:45:00'),
(19, 19, '2024-11-09 22:00:00'),
(15, 20, '2024-11-10 23:15:00');


--  Bảng rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(11, 11, 4.5, '2024-11-01 11:00:00'),
(12, 12, 5.0, '2024-11-02 12:30:00'),
(13, 13, 3.8, '2024-11-03 14:15:00'),
(14, 14, 4.0, '2024-11-04 15:45:00'),
(15, 15, 4.2, '2024-11-05 17:30:00'),
(16, 16, 4.7, '2024-11-06 19:00:00'),
(17, 17, 3.9, '2024-11-07 20:30:00'),
(18, 18, 4.8, '2024-11-08 21:45:00'),
(19, 19, 4.3, '2024-11-09 22:00:00'),
(15, 20, 4.6, '2024-11-10 23:15:00');



-- tìm 5 người đã like nhà hàng nhiều nhất

SELECT like_res.user_id, user.full_name, COUNT(like_res.user_id) 'tổng số lượt like' from like_res
INNER JOIN user ON user.user_id = like_res.user_id
GROUP by like_res.user_id
ORDER by `tổng số lượt like` DESC
LIMIT 5

-- tìm 2 nhà hàng có lượt like nhiều nhất

SELECT like_res.res_id, restaurant.res_name , COUNT(like_res.res_id) 'tổng số lần nhà hàng được like' from like_res
INNER JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP by like_res.res_id
ORDER BY `tổng số lần nhà hàng được like` DESC
LIMIT 2

-- tìm người đã đặt hàng nhiều nhất

SELECT orders.user_id, user.full_name, COUNT(orders.user_id) 'tổng số lần đặt món' from orders
INNER JOIN user ON user.user_id = orders.user_id
GROUP by orders.user_id
ORDER BY `tổng số lần đặt món` DESC
LIMIT 1

-- tìm người dùng không hoạt động hệ thống(không đặt hàng, không like, không đánh giá nhà hàng)
SELECT user.user_id,user.full_name, orders.user_id,like_res.user_id,rate_res.user_id from user
LEFT JOIN orders ON user.user_id = orders.user_id
LEFT JOIN like_res ON user.user_id = like_res.user_id
LEFT JOIN rate_res ON user.user_id = rate_res.user_id
WHERE orders.user_id IS NULL AND like_res.user_id IS NULL AND rate_res.user_id IS NULL






