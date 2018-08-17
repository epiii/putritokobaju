-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2018 at 11:21 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `idPinjam` int(6) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `ukuran` varchar(8) DEFAULT NULL,
  `jumlah` int(6) NOT NULL,
  `toko1` varchar(10) NOT NULL,
  `jenisBarang` varchar(40) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `tglPinjam` datetime NOT NULL,
  `toko2` varchar(10) NOT NULL,
  `status` enum('pending','approved','taken') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`idPinjam`, `kode`, `ukuran`, `jumlah`, `toko1`, `jenisBarang`, `merk`, `tglPinjam`, `toko2`, `status`) VALUES
(5, 'JOCL21', 'M', 8, 'B', 'kaos', 'tshirt', '2018-08-09 22:59:37', 'A', 'taken'),
(6, 'W0E1RG', 'XL', 4, 'D', 'batik', 'bateeq', '2018-08-09 23:00:51', 'A', 'pending'),
(7, '3EL1SM', 'L', 2, 'A', 'kaos', 'Polo', '2018-08-09 23:11:02', 'D', 'taken'),
(8, 'W0E1RG', 'M', 10, 'D', 'batik', 'bateeq', '2018-08-10 23:17:45', 'A', 'taken'),
(9, '1CPJ7A', 'L', 1, 'B', 'hijab', 'Elzata', '2018-08-09 10:26:19', 'D', 'approved'),
(10, '1CPJ7A', 'L', 3, 'B', 'hijab', 'Elzata', '2018-08-14 10:31:14', 'A', 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`idPinjam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `idPinjam` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
