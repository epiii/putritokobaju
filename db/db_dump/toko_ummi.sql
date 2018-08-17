-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2018 at 11:02 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_ummi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode` varchar(7) NOT NULL,
  `jenisBarang` varchar(50) DEFAULT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `ukuran` varchar(50) DEFAULT NULL,
  `merk` varchar(10) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode`, `jenisBarang`, `harga_beli`, `harga_jual`, `ukuran`, `merk`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
('B000017', 'jacket', 15000, 20000, ' L', 'levi\'s', 100, 3, '2017-04-16 17:00:00', 3, '2018-08-11 09:45:27'),
('B000128', 'jacket', 8625, 11500, ' M', 'levi\'s', 50, 3, '2017-08-05 17:00:00', 3, '2018-08-11 09:45:49'),
('B000129', 'jacket', 8625, 11500, ' M', 'Gucci', 80, 3, '2017-08-06 17:00:00', 3, '2018-08-11 09:46:15'),
('B000179', 'jacket', 3750, 5000, ' XL', 'levi\'s', 50, 3, '2017-09-25 17:00:00', 3, '2018-08-11 09:46:38'),
('B000181', 'jacket', 10125, 13500, ' M', 'levi\'s', 50, 3, '2017-09-27 17:00:00', 3, '2018-08-11 09:47:52'),
('B000351', 'dress', 15000, 20000, ' Xl', 'elzata', 5, 3, '2018-03-16 17:00:00', 3, '2018-08-11 09:49:32'),
('B000352', 'dress', 8250, 11000, ' L', 'Pink', 0, 3, '2018-03-17 17:00:00', 3, '2018-08-11 09:49:57'),
('B000353', 'Dress', 16500, 22000, 'XL', 'guess', 0, 3, '2018-03-18 17:00:00', 3, '2018-08-11 09:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode` varchar(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`kode_transaksi`, `tanggal_masuk`, `kode`, `jumlah_masuk`, `created_user`, `created_date`) VALUES
('TM-2017-0000006', '2017-04-01', 'B000129', 80, 3, '2017-04-01 12:00:22'),
('TM-2017-0000007', '2017-04-01', 'B000128', 50, 3, '2017-04-01 12:00:22'),
('TM-2017-0000009', '2017-04-01', 'B000017', 100, 3, '2017-04-01 12:00:22'),
('TM-2017-0000013', '2017-04-01', 'B000181', 50, 3, '2017-04-01 12:00:22'),
('TM-2017-0000014', '2017-04-01', 'B000179', 50, 3, '2017-04-01 12:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `is_users`
--

CREATE TABLE `is_users` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Super Admin','Manajer','Gudang') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `is_users`
--

INSERT INTO `is_users` (`id_user`, `username`, `nama_user`, `password`, `email`, `telepon`, `foto`, `hak_akses`, `status`, `created_at`, `updated_at`) VALUES
(1, 'putrianda', 'putri andalusia', 'b554cb8be20ba5ad3564615619deb0d3', 'putri@gmail.com', '085669919769', 'indrasatya.jpg', 'Super Admin', 'aktif', '2017-04-01 08:15:15', '2018-08-11 07:00:00'),
(2, 'kadina', 'Kadina Putri', '202cb962ac59075b964b07152d234b70', 'kadinaputri@gmail.com', '085680892909', 'kadina.png', 'Manajer', 'aktif', '2017-04-01 08:15:15', '2017-04-01 08:15:15'),
(3, 'danang', 'Danang Kesuma', '202cb962ac59075b964b07152d234b70', 'danang@gmail.com', '085758858855', '', 'Gudang', 'aktif', '2017-04-01 08:15:15', '2017-04-01 08:15:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `updated_user` (`updated_user`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_barang` (`kode`),
  ADD KEY `created_user` (`created_user`);

--
-- Indexes for table `is_users`
--
ALTER TABLE `is_users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`hak_akses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `is_users`
--
ALTER TABLE `is_users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`updated_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`kode`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
