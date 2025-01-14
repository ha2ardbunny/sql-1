-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 04:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview_question`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `city` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `city`) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'New York'),
(3, 'Charlie', 'Los Angeles'),
(4, 'Diana', 'New York'),
(5, 'Eve', 'Chicago'),
(6, 'Frank', 'New York'),
(7, 'Grace', 'Boston'),
(8, 'Hank', 'Miami'),
(9, 'Ivy', 'New York'),
(10, 'Jack', 'Seattle');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `position` text NOT NULL,
  `department` text NOT NULL,
  `salary` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `position`, `department`, `salary`) VALUES
(1, 'John', 'Manager', 'Sales', 60000.00),
(2, 'Jane', 'Clerk', 'Operations', 40000.00),
(3, 'Paul', 'Analyst', 'IT', 55000.00),
(4, 'Anna', 'Developer', 'Development', 70000.00),
(5, 'Mike', 'Engineer', 'Engineering', 52000.00),
(6, 'Sue', 'HR', 'HR', 45000.00),
(7, 'Tom', 'Analyst', 'IT', 58000.00),
(8, 'Chris', 'Manager', 'Sales', 80000.00),
(9, 'Emma', 'Developer', 'Development', 60000.00),
(10, 'Sophia', 'Designer', 'Design', 49000.00);

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`product_id`, `product_name`, `quantity`, `price`) VALUES
(1, 'Laptop', 10, 1100.00),
(2, 'Phone', 20, 2200.00),
(3, 'Tablet', 15, 660.00),
(4, 'Monitor', 5, 220.00),
(5, 'Keyboard', 30, 55.00),
(6, 'Mouse', 50, 33.00),
(7, 'Printer', 12, 165.00),
(8, 'Camera', 8, 330.00),
(9, 'Router', 25, 132.00),
(10, 'Speaker', 10, 82.50);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `customer_id`, `total_amount`) VALUES
(1, '2025-01-01', 1, 100.00),
(2, '2025-01-02', 2, 150.00),
(3, '2025-01-03', 3, 200.00),
(4, '2025-01-04', 4, 250.00),
(5, '2025-01-05', 5, 300.00),
(6, '2025-01-06', 6, 350.00),
(7, '2025-01-07', 7, 400.00),
(8, '2025-01-08', 8, 450.00),
(9, '2025-01-09', 9, 500.00),
(10, '2025-01-10', 10, 550.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(100) NOT NULL,
  `sale_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`order_id`, `customer_id`, `product_id`, `quantity`, `sale_date`) VALUES
(1, 1, 2, 2, '2025-01-01'),
(2, 2, 4, 1, '2025-01-02'),
(2, 3, 3, 1, '2025-01-02'),
(3, 4, 5, 3, '2025-01-03'),
(1, 5, 2, 2, '2025-01-01'),
(4, 6, 7, 1, '2025-01-04'),
(4, 7, 8, 2, '2025-01-04'),
(5, 8, 9, 2, '2025-01-05'),
(3, 9, 6, 4, '2025-01-03'),
(5, 10, 10, 1, '2025-01-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `inventories` (`product_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
