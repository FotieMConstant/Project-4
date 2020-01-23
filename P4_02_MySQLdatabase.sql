-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2020 at 11:44 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `chefs`
--

CREATE TABLE `chefs` (
  `chefId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chefs`
--

INSERT INTO `chefs` (`chefId`, `employeeId`) VALUES
(1, 2),
(2, 3),
(3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientId` int(11) NOT NULL,
  `fName` varchar(254) DEFAULT NULL,
  `lName` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientId`, `fName`, `lName`, `email`, `phone`, `address`) VALUES
(1, 'fotie', 'constant', 'fotieconstant@gmail.com', '677777777', 'Yaounde'),
(2, 'Nken', 'Edward', 'nkenedward@gmail.com', '654678906', 'Douala'),
(3, 'Ndi', 'Kollins', 'ndikollins@gmail.com', '687654298', 'Bafoussam'),
(4, 'Dan', 'Evan', 'danevan@gmail.com', '617876543', 'Bertuoa'),
(5, 'Nde', 'Ali', 'ndeali@gmail.com', '687654329', 'Bamenda');

-- --------------------------------------------------------

--
-- Table structure for table `clientorder`
--

CREATE TABLE `clientorder` (
  `clientId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientorder`
--

INSERT INTO `clientorder` (`clientId`, `orderId`) VALUES
(1, 1),
(4, 2),
(2, 5),
(5, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `createmenu`
--

CREATE TABLE `createmenu` (
  `menuId` int(11) DEFAULT NULL,
  `chefId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `createmenu`
--

INSERT INTO `createmenu` (`menuId`, `chefId`) VALUES
(1, 2),
(2, 1),
(3, 3),
(5, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deliveryperson`
--

CREATE TABLE `deliveryperson` (
  `deliveryPersonId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliveryperson`
--

INSERT INTO `deliveryperson` (`deliveryPersonId`, `employeeId`) VALUES
(1, 1),
(3, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `restaurantId` int(11) DEFAULT NULL,
  `fName` varchar(254) DEFAULT NULL,
  `lName` varchar(254) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `nic` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `restaurantId`, `fName`, `lName`, `gender`, `age`, `phone`, `nic`, `email`) VALUES
(1, 1, 'John', 'Doe', 'M', 45, '678765432', '10031293', 'johndoe@gmail.com'),
(2, 1, 'Jane', 'Doe', 'F', 23, '667654329', '108998793', 'janedoe@gmail.com'),
(3, 1, 'Mbem', 'kelly', 'F', 43, '698543210', '219931312', 'kelly@gmail.com'),
(4, 1, 'Kevin', 'Skill', 'M', 34, '617874543', '3453454', 'kevinskill@gmail.com'),
(5, 1, 'Nji', 'Stella', 'F', 43, '678384567', '11003993', 'njistella@gmail.com'),
(6, 1, 'Mbekam', 'Stephanie', 'F', 25, '657669098', '1099833', 'mbekamstephanie@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `mealId` int(11) NOT NULL,
  `menuId` int(11) DEFAULT NULL,
  `name` varchar(254) DEFAULT NULL,
  `type` enum('dessert','dish') DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`mealId`, `menuId`, `name`, `type`, `description`, `price`) VALUES
(1, 1, 'Honey Mug Cake', 'dessert', 'Mug cake, brown sugar, self raising flour, butter, icing', 450),
(2, 1, 'Carlota', 'dessert', 'Sweetened condensed milk, evaporated milk, cookies', 320),
(3, 3, 'Piggy Pie Dessert', 'dessert', 'Cream cheese, chocolate pudding mix, vanilla pudding mix, butter, sugar', 45),
(4, 4, 'Coconut Blondies with Dark Chocolate', 'dessert', 'Brown sugar, coconut, sweet chocolate chips, eggs, flour', 112),
(5, 5, 'Panang chicken stir-fry', 'dish', 'Sweet chilli sauce, courgette, soy sauce, chicken breasts, ', 67),
(6, 4, 'Caramelized Broccoli with Garlic', 'dish', 'Red pepper, olive oil, lemon juice, black pepper, heads ', 68);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuId`, `date`) VALUES
(1, '2008-11-11'),
(2, '2020-01-02'),
(3, '2020-01-03'),
(4, '2019-12-03'),
(5, '2019-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `ordermeal`
--

CREATE TABLE `ordermeal` (
  `orderId` int(11) DEFAULT NULL,
  `mealId` int(11) DEFAULT NULL,
  `quentity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordermeal`
--

INSERT INTO `ordermeal` (`orderId`, `mealId`, `quentity`) VALUES
(1, 2, 3),
(2, 1, 1),
(3, 2, 4),
(5, 6, 5),
(4, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `deliveryPersonId` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  `estimatedTime` datetime NOT NULL,
  `outOfDelivery` tinyint(1) NOT NULL,
  `orderPrice` float NOT NULL,
  `orderDetail` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `deliveryPersonId`, `orderTime`, `estimatedTime`, `outOfDelivery`, `orderPrice`, `orderDetail`) VALUES
(1, 1, '2008-11-11 13:20:44', '2008-11-11 13:40:44', 0, 450, 'The best meal for today'),
(2, 2, '2020-01-01 00:00:00', '2020-01-01 00:20:00', 0, 45, 'I would love to have this order.'),
(3, 3, '2020-01-01 00:20:00', '2020-01-01 00:40:00', 0, 56, 'Thanks for delivery this in time'),
(4, 1, '2020-01-01 00:20:00', '2020-01-01 00:40:00', 1, 56, 'i would love to have this meal'),
(5, 3, '2020-01-01 10:20:00', '2020-01-01 10:40:00', 0, 100, 'Thank you for this...');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurantId` int(11) NOT NULL,
  `name` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurantId`, `name`) VALUES
(1, 'ExpressFood');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chefs`
--
ALTER TABLE `chefs`
  ADD PRIMARY KEY (`chefId`),
  ADD KEY `employeeId_FK` (`employeeId`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientId`);

--
-- Indexes for table `clientorder`
--
ALTER TABLE `clientorder`
  ADD KEY `clientorder` (`clientId`),
  ADD KEY `clientorder2` (`orderId`);

--
-- Indexes for table `createmenu`
--
ALTER TABLE `createmenu`
  ADD KEY `createmenu` (`chefId`),
  ADD KEY `createmenu2` (`menuId`);

--
-- Indexes for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD PRIMARY KEY (`deliveryPersonId`),
  ADD KEY `employeeId_FK2` (`employeeId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD KEY `restaurantid_FK` (`restaurantId`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`mealId`),
  ADD KEY `menuId_FK` (`menuId`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuId`);

--
-- Indexes for table `ordermeal`
--
ALTER TABLE `ordermeal`
  ADD KEY `ordermeal` (`orderId`),
  ADD KEY `ordermeal2` (`mealId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `deliveryPersonId_FK` (`deliveryPersonId`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurantId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chefs`
--
ALTER TABLE `chefs`
  MODIFY `chefId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  MODIFY `deliveryPersonId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `mealId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chefs`
--
ALTER TABLE `chefs`
  ADD CONSTRAINT `employeeId_FK` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`);

--
-- Constraints for table `clientorder`
--
ALTER TABLE `clientorder`
  ADD CONSTRAINT `clientorder` FOREIGN KEY (`clientId`) REFERENCES `client` (`clientId`),
  ADD CONSTRAINT `clientorder2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`);

--
-- Constraints for table `createmenu`
--
ALTER TABLE `createmenu`
  ADD CONSTRAINT `createmenu` FOREIGN KEY (`chefId`) REFERENCES `chefs` (`chefId`),
  ADD CONSTRAINT `createmenu2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD CONSTRAINT `employeeId_FK2` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `restaurantid_FK` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`);

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `menuId_FK` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `ordermeal`
--
ALTER TABLE `ordermeal`
  ADD CONSTRAINT `ordermeal` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `ordermeal2` FOREIGN KEY (`mealId`) REFERENCES `meal` (`mealId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `deliveryPersonId_FK` FOREIGN KEY (`deliveryPersonId`) REFERENCES `deliveryperson` (`deliveryPersonId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
