-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2024 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `tahun_terbit` varchar(10) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `id_penerbit`, `judul`, `pengarang`, `tahun_terbit`, `harga`, `stok`, `gambar`) VALUES
(39, 2, 'Kata', 'Nadhifa Allya Tsana', '2018', 150000, 100, '303-Kata-Rintik-Sedu.jpg'),
(38, 3, 'Rentang Kisah', 'Gita Savitri', '2017', 50000, 50, '734-Rentang-Kisah.jpg'),
(37, 4, 'Dia Adalah Kakakku', 'Tere Liye', '2009', 100000, 100, '258-Dia-adalah-Kakakku-1.jpg'),
(36, 5, 'Aroma Karsa', 'Dee Lestari', '2000', 100000, 200, '981-aroma-karsa-1.jpg'),
(35, 6, 'Garis Waktu: Sebuah Perjalanan Menghapus Luka', 'Fiersa Besari', '2016', 215000, 10, '139-Garis-Waktu-Sebuah-Perjalanan-Menghapus-Luka.jpg'),
(34, 6, '11:11', 'Fiersa Besari ', '2018', 140000, 100, '742-1111.jpg'),
(33, 7, 'Kids Zaman Neo', ' Anodia Shula Neona Ayu', '2018', 180000, 192, '367-62-Kids-Zaman-Neo.jpg'),
(46, 4, 'Hujan', 'Tere Liye', '2016', 170000, 40, '669-Hujan.png'),
(48, 4, 'Hello', 'Tere Liye', '2023', 80000, 30, '614-Hello.png');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `ID` int(11) NOT NULL,
  `no_transaksi` varchar(7) NOT NULL,
  `ID_buku` int(7) NOT NULL,
  `harga` double NOT NULL,
  `jumlah_beli` int(12) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`ID`, `no_transaksi`, `ID_buku`, `harga`, `jumlah_beli`, `subtotal`) VALUES
(69, 'TRS005', 39, 150000, 2, 300000),
(65, 'TRS002', 34, 140000, 2, 280000),
(66, 'TRS002', 36, 100000, 2, 200000),
(67, 'TRS003', 35, 215000, 22, 4730000),
(68, 'TRS004', 37, 100000, 1, 100000),
(63, 'TRS001', 36, 100000, 5, 500000),
(62, 'TRS001', 34, 140000, 10, 1400000);

-- --------------------------------------------------------

--
-- Table structure for table `head_transaksi`
--

CREATE TABLE `head_transaksi` (
  `no_transaksi` varchar(7) NOT NULL,
  `tanggal` date NOT NULL,
  `total` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `head_transaksi`
--

INSERT INTO `head_transaksi` (`no_transaksi`, `tanggal`, `total`) VALUES
('TRS003', '2024-06-10', 4730000),
('TRS002', '2024-06-10', 480000),
('TRS001', '2024-06-10', 1900000),
('TRS004', '2024-06-23', 100000),
('TRS005', '2024-06-23', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama_penerbit`) VALUES
(2, 'Nadhifa Allya Tsana'),
(3, 'Gita Savitri'),
(4, 'Tere Liye'),
(5, 'Dee Lestari'),
(6, 'Fiersa Besari'),
(7, ' Anodia Shula Neona Ayu');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `hak_akses` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `hak_akses`, `nama`) VALUES
('admin', 'admin', 'admin', 'Alda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`ID`,`no_transaksi`,`ID_buku`);

--
-- Indexes for table `head_transaksi`
--
ALTER TABLE `head_transaksi`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
