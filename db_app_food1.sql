/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(72, 'Margherita Pizza', 'margherita.png', 12, 'Classic cheese pizza', 6);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(73, 'Cheeseburger', 'cheeseburger.png', 8, 'Juicy beef burger with cheese', 7);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(74, 'California Roll', 'california.png', 9, 'Fresh crab and avocado sushi', 9);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(75, 'Veggie Taco', 'veggie_taco.png', 3, 'Taco with mixed veggies', 10),
(76, 'Grilled Salmon', 'grilled_salmon.png', 15, 'Fresh salmon grilled to perfection', 6),
(77, 'Chocolate Cake', 'chocolate_cake.png', 6, 'Rich chocolate dessert', 7),
(78, 'Espresso', 'espresso.png', 2, 'Strong black coffee', 8),
(79, 'Ribeye Steak', 'ribeye.png', 24, 'Tender ribeye steak', 9),
(80, 'Pancakes', 'pancakes.png', 5, 'Fluffy breakfast pancakes', 10),
(81, 'Pasta Alfredo', 'alfredo.png', 11, 'Creamy Alfredo pasta', 15);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(6, 'Fast Food');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(7, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(8, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(9, 'Japanese'),
(10, 'Vegetarian'),
(11, 'Seafood'),
(12, 'Desserts'),
(13, 'Beverages'),
(14, 'Steak'),
(15, 'Breakfast'),
(16, 'Fast Food'),
(17, 'Italian'),
(18, 'Mexican'),
(19, 'Japanese'),
(20, 'Vegetarian'),
(21, 'Seafood'),
(22, 'Desserts'),
(23, 'Beverages'),
(24, 'Steak'),
(25, 'Breakfast');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(11, 11, '2024-11-01 11:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(11, 11, '2024-11-02 12:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(12, 13, '2024-11-03 14:15:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(11, 15, '2024-11-04 15:45:00'),
(15, 15, '2024-11-05 17:30:00'),
(16, 16, '2024-11-06 19:00:00'),
(17, 17, '2024-11-07 20:30:00'),
(18, 18, '2024-11-08 21:45:00'),
(15, 20, '2024-11-10 23:15:00'),
(12, 11, '2024-11-01 11:00:00'),
(13, 11, '2024-11-02 12:30:00'),
(12, 13, '2024-11-03 14:15:00'),
(14, 14, '2024-11-04 15:45:00'),
(12, 15, '2024-11-05 17:30:00'),
(15, 15, '2024-11-06 19:00:00'),
(15, 17, '2024-11-07 20:30:00'),
(16, 18, '2024-11-08 21:45:00'),
(15, 20, '2024-11-10 23:15:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(11, 77, 2, 'ORD123', '1,2');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(16, 78, 1, 'ORD124', '3');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(18, 79, 3, 'ORD125', NULL);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(12, 74, 1, 'ORD126', '2'),
(15, 76, 2, 'ORD127', '1,4'),
(16, 75, 1, 'ORD128', NULL),
(17, 79, 2, 'ORD129', '3'),
(18, 81, 1, 'ORD130', '1'),
(16, 79, 3, 'ORD131', NULL),
(14, 80, 2, 'ORD132', '4,5');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(11, 11, 4.5, '2024-11-01 11:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(12, 12, 5, '2024-11-02 12:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(13, 13, 3.8, '2024-11-03 14:15:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(14, 14, 4, '2024-11-04 15:45:00'),
(15, 15, 4.2, '2024-11-05 17:30:00'),
(16, 16, 4.7, '2024-11-06 19:00:00'),
(17, 17, 3.9, '2024-11-07 20:30:00'),
(18, 18, 4.8, '2024-11-08 21:45:00'),
(19, 19, 4.3, '2024-11-09 22:00:00'),
(15, 20, 4.6, '2024-11-10 23:15:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(11, 'Pizza Palace', 'pizza.png', 'Delicious pizzas and more');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(12, 'Burger Barn', 'burger.png', 'Best burgers in town');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(13, 'Sushi Spot', 'sushi.png', 'Fresh sushi and sashimi');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(14, 'Taco Tower', 'taco.png', 'Authentic Mexican tacos'),
(15, 'Steakhouse Grill', 'steak.png', 'Juicy steaks and sides'),
(16, 'Veggie Village', 'veggie.png', 'Healthy vegetarian options'),
(17, 'Pasta Place', 'pasta.png', 'Homemade pasta dishes'),
(18, 'Seafood Shack', 'seafood.png', 'Fresh seafood daily'),
(19, 'Dessert Den', 'dessert.png', 'Sweet treats and desserts'),
(20, 'Coffee Corner', 'coffee.png', 'Best coffee and snacks');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(32, 'Extra Cheese', 1.5, 81);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(33, 'Bacon', 2, 72);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(34, 'Avocado', 1, 73);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(35, 'Sour Cream', 0.5, 74),
(36, 'Lemon Butter', 1.5, 75),
(37, 'Whipped Cream', 0.5, 76),
(38, 'Sugar Syrup', 0.3, 77),
(39, 'Garlic Butter', 0.8, 78),
(40, 'Maple Syrup', 1.2, 79),
(41, 'Parmesan Cheese', 1, 79);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(11, 'John Doe', 'john.doe@example.com', 'password123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(12, 'Jane Smith', 'jane.smith@example.com', 'password456');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(13, 'Alice Johnson', 'alice.johnson@example.com', 'password789');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(14, 'Bob Brown', 'bob.brown@example.com', 'password000'),
(15, 'Charlie Davis', 'charlie.davis@example.com', 'password111'),
(16, 'Eve White', 'eve.white@example.com', 'password222'),
(17, 'Frank Black', 'frank.black@example.com', 'password333'),
(18, 'Grace Green', 'grace.green@example.com', 'password444'),
(19, 'Henry Gray', 'henry.gray@example.com', 'password555'),
(21, 'nguyen van a', 'abcd@example.com', 'password00000');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;