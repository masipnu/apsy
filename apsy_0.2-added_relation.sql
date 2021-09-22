-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 22, 2021 at 09:56 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsy`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_bayar_vas`
--

CREATE TABLE `log_bayar_vas` (
  `no_ref` varchar(14) NOT NULL,
  `tgl` date NOT NULL DEFAULT curdate(),
  `jam` time NOT NULL DEFAULT current_timestamp(),
  `id_vas` varchar(13) NOT NULL,
  `nominal` int(9) NOT NULL DEFAULT 0,
  `bukti_pemb` varchar(30) NOT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_tf_vai`
--

CREATE TABLE `log_tf_vai` (
  `no_ref` varchar(14) NOT NULL,
  `tgl` date NOT NULL DEFAULT curdate(),
  `jam` time NOT NULL DEFAULT current_timestamp(),
  `id_vai_from` int(1) NOT NULL,
  `id_vai_to` int(1) NOT NULL,
  `nominal` int(9) NOT NULL DEFAULT 0,
  `bukti_pemb` varchar(30) NOT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(1) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'admin'),
(2, 'operator'),
(3, 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `saldo_vai`
--

CREATE TABLE `saldo_vai` (
  `id_vai` int(1) NOT NULL,
  `no_ref_akhir` varchar(14) NOT NULL,
  `saldo` int(9) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saldo_vas`
--

CREATE TABLE `saldo_vas` (
  `id_vas` varchar(13) NOT NULL,
  `no_ref_akhir` varchar(14) NOT NULL,
  `saldo` int(9) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `username_alias` varchar(6) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `va_instansi`
--

CREATE TABLE `va_instansi` (
  `id_user_vai` varchar(13) NOT NULL,
  `id_vai` int(1) NOT NULL,
  `nama_user_vai` varchar(30) NOT NULL,
  `nama_user_vai_alias` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `va_santri`
--

CREATE TABLE `va_santri` (
  `id_vas` varchar(13) NOT NULL,
  `niss` varchar(5) NOT NULL,
  `nama_santri` varchar(50) NOT NULL,
  `nama_alias` varchar(15) NOT NULL,
  `jk` enum('L','P') NOT NULL DEFAULT 'L',
  `alm_rt` varchar(3) NOT NULL,
  `alm_rw` varchar(3) NOT NULL,
  `alm_des` varchar(30) NOT NULL,
  `alm_kec` varchar(30) NOT NULL,
  `alm_kab` varchar(30) NOT NULL,
  `alm_prov` varchar(30) NOT NULL,
  `alm_kp` varchar(5) NOT NULL,
  `ortu_wali` varchar(30) NOT NULL,
  `no_telp_ortu` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_bayar_vas`
--
ALTER TABLE `log_bayar_vas`
  ADD KEY `no_ref` (`no_ref`),
  ADD KEY `id_vas` (`id_vas`);

--
-- Indexes for table `log_tf_vai`
--
ALTER TABLE `log_tf_vai`
  ADD KEY `no_ref` (`no_ref`),
  ADD KEY `id_vai_to` (`id_vai_to`),
  ADD KEY `FK_log_tf_vai_va_instansi_2` (`id_vai_from`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `saldo_vai`
--
ALTER TABLE `saldo_vai`
  ADD KEY `id_vai` (`id_vai`);

--
-- Indexes for table `saldo_vas`
--
ALTER TABLE `saldo_vas`
  ADD KEY `id_vas` (`id_vas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `va_instansi`
--
ALTER TABLE `va_instansi`
  ADD KEY `id_vai` (`id_vai`);

--
-- Indexes for table `va_santri`
--
ALTER TABLE `va_santri`
  ADD KEY `id_vas` (`id_vas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_bayar_vas`
--
ALTER TABLE `log_bayar_vas`
  ADD CONSTRAINT `FK_log_bayar_vas_va_santri` FOREIGN KEY (`id_vas`) REFERENCES `va_santri` (`id_vas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_tf_vai`
--
ALTER TABLE `log_tf_vai`
  ADD CONSTRAINT `FK_log_tf_vai_va_instansi` FOREIGN KEY (`id_vai_to`) REFERENCES `va_instansi` (`id_vai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_log_tf_vai_va_instansi_2` FOREIGN KEY (`id_vai_from`) REFERENCES `va_instansi` (`id_vai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saldo_vai`
--
ALTER TABLE `saldo_vai`
  ADD CONSTRAINT `FK_saldo_vai_va_instansi` FOREIGN KEY (`id_vai`) REFERENCES `va_instansi` (`id_vai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saldo_vas`
--
ALTER TABLE `saldo_vas`
  ADD CONSTRAINT `FK_saldo_vas_va_santri` FOREIGN KEY (`id_vas`) REFERENCES `va_santri` (`id_vas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
