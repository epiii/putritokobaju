-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2018 at 01:09 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `putriwardrobe`
--

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level_id`, `name`, `description`) VALUES
(1, 'owner', 'owner adalah ....'),
(2, 'supervisor', 'adlaah'),
(3, 'cashier', 'adalah');

-- --------------------------------------------------------

--
-- Table structure for table `merks`
--

CREATE TABLE `merks` (
  `merk_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merks`
--

INSERT INTO `merks` (`merk_id`, `name`) VALUES
(4, 'elzata '),
(5, 'Pink'),
(6, 'guess'),
(7, 'levi\'s'),
(8, 'Gucci');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `code` varchar(250) NOT NULL,
  `size` varchar(250) NOT NULL,
  `merk_id` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_category_id`, `code`, `size`, `merk_id`, `purchase_price`, `selling_price`) VALUES
(2, 3, 'dg01', 'L', 8, 70000, 10000),
(3, 2, 'J21', 'M', 7, 80000, 98000),
(4, 5, 'CLL2', 'L', 6, 70000, 10000),
(5, 5, 'CLE02', 'M', 4, 50000, 86000);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_category_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_category_id`, `name`) VALUES
(2, 'jacket'),
(3, 'dress'),
(4, 'kaos'),
(5, 'celana');

-- --------------------------------------------------------

--
-- Table structure for table `product_wardrobes`
--

CREATE TABLE `product_wardrobes` (
  `product_wardrobe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `wardrobe_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname`
--

CREATE TABLE `stock_opname` (
  `stock_opname_id` int(11) NOT NULL,
  `product_wardrobe_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `real_stock` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `address`) VALUES
(25, 'S08', 'Jl. Nol lapan'),
(28, 'S05 ', 'Jl. Nol Lima'),
(30, 'S14', 'Jl. empat belas\r\n'),
(31, 'S13', 'Jl tiga belas'),
(32, 'S10', 'Jl Nol spuluh'),
(33, 'S09', 'Jl. Nol Sembilan'),
(34, 'S02', 'Jl. Nol dua'),
(36, 'S06', 'Jl. Nol enam'),
(37, 'S12', 'Jl dua belas'),
(38, 'S11', 'Jl sebelas'),
(39, 'S03', 'Jl. Nol tiga'),
(40, 'S01', 'Jl nol satu'),
(41, 'S07', 'Jl Nol Tujuh'),
(42, 'S04', 'Jl. Nol Empat');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `transaction_detail_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_wardrobe_id` int(11) NOT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `type` enum('sold','restock','request','approved') NOT NULL DEFAULT 'sold',
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` text,
  `email` varchar(50) NOT NULL,
  `password` text,
  `status` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `store_id`, `level_id`, `name`, `username`, `email`, `password`, `status`, `phone`) VALUES
(1, NULL, 1, 'Tuan Owner', 'owner', 'owner@gmail.com', 'owner', 1, '08888888888'),
(2, 34, 3, 'bejo', 'bejo', 'bejo@gmail.com', 'bejo', 1, '085666666666'),
(3, 34, 3, 'supri', 'supri', 'superuser@laraship.com', 'supri', 0, '03840293');

-- --------------------------------------------------------

--
-- Table structure for table `wardrobes`
--

CREATE TABLE `wardrobes` (
  `wardrobe_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wardrobes`
--

INSERT INTO `wardrobes` (`wardrobe_id`, `store_id`, `code`, `is_locked`) VALUES
(1, 39, 'W02', 1),
(2, 40, 'W03', 1),
(3, 36, 'W04', 1),
(4, 40, 'fsfsd', 1),
(5, 40, '090909', 1),
(6, 25, '', 0),
(7, 39, 'wj33', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `merks`
--
ALTER TABLE `merks`
  ADD PRIMARY KEY (`merk_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`product_category_id`),
  ADD KEY `merk_id` (`merk_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `product_wardrobes`
--
ALTER TABLE `product_wardrobes`
  ADD PRIMARY KEY (`product_wardrobe_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `wardrobe_id` (`wardrobe_id`);

--
-- Indexes for table `stock_opname`
--
ALTER TABLE `stock_opname`
  ADD PRIMARY KEY (`stock_opname_id`),
  ADD KEY `product_wardrobe_id` (`product_wardrobe_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`transaction_detail_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD UNIQUE KEY `product_wardrobe_id` (`product_wardrobe_id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `wardrobes`
--
ALTER TABLE `wardrobes`
  ADD PRIMARY KEY (`wardrobe_id`),
  ADD KEY `store_id` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `merks`
--
ALTER TABLE `merks`
  MODIFY `merk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_wardrobes`
--
ALTER TABLE `product_wardrobes`
  MODIFY `product_wardrobe_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_opname`
--
ALTER TABLE `stock_opname`
  MODIFY `stock_opname_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wardrobes`
--
ALTER TABLE `wardrobes`
  MODIFY `wardrobe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category_fk` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`product_category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`merk_id`) REFERENCES `merks` (`merk_id`);

--
-- Constraints for table `product_wardrobes`
--
ALTER TABLE `product_wardrobes`
  ADD CONSTRAINT `product_wardrobes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_wardrobes_ibfk_2` FOREIGN KEY (`wardrobe_id`) REFERENCES `wardrobes` (`wardrobe_id`);

--
-- Constraints for table `stock_opname`
--
ALTER TABLE `stock_opname`
  ADD CONSTRAINT `stock_opname_ibfk_1` FOREIGN KEY (`product_wardrobe_id`) REFERENCES `product_wardrobes` (`product_wardrobe_id`),
  ADD CONSTRAINT `stock_opname_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_detail_ibfk_2` FOREIGN KEY (`product_wardrobe_id`) REFERENCES `product_wardrobes` (`product_wardrobe_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`);

--
-- Constraints for table `wardrobes`
--
ALTER TABLE `wardrobes`
  ADD CONSTRAINT `wardrobes_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
