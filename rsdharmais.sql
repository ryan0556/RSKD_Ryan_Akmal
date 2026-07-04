-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2026 at 12:30 PM
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
-- Database: `rsdharmais`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `spesialis` varchar(100) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `nip`, `nik`, `no_telp`, `tempat_lahir`, `tanggal_lahir`, `spesialis`, `pendidikan`, `email`, `password`, `created_at`) VALUES
(38, 'akmal', '02', '01', '08', 'Jakarta', '2026-07-03', 'Kandungan', 'S3', 'akmal@gmail.com', '$2y$10$SOAr2CZw0X2vggCp1ViaG.BwXG39tMIt04UfQ6yGvg86gg9aGSj/6', '2026-07-03 10:00:20'),
(40, 'Akmal', '04', '', '08', 'Jakarta', '2026-07-03', 'Kandungan', 'S1', 'akmal@gmal.com', '$2y$10$iFupbWzTJ9NAvv3mnUzs/eE4ozqntiNexkIwSAeWA93CJcfkKaDeK', '2026-07-03 10:40:35'),
(41, 'jaja', '11', '11', '11', 'jakarta', '2026-07-03', 'Jantung', 'S3', 'a@gmail.com', '11', '2026-07-03 11:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_praktek`
--

CREATE TABLE `jadwal_praktek` (
  `id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_praktek`
--

INSERT INTO `jadwal_praktek` (`id`, `dokter_id`, `hari`, `tanggal`, `jam_mulai`, `jam_selesai`) VALUES
(40, 38, 'Harian (Gu', '2026-07-14', '17:04:00', '05:04:00'),
(42, 40, 'Senin', NULL, '17:49:00', '17:49:00'),
(43, 40, 'Selasa', NULL, '17:49:00', '17:49:00'),
(44, 40, 'Rabu', NULL, '17:49:00', '17:49:00'),
(45, 40, 'Jumat', NULL, '06:40:00', '12:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `kontrol`
--

CREATE TABLE `kontrol` (
  `id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `status` enum('menunggu','selesai','dibatalkan','diundur') DEFAULT 'menunggu',
  `catatan` text DEFAULT NULL,
  `tanggal_undur` date DEFAULT NULL,
  `waktu_undur` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kontrol`
--

INSERT INTO `kontrol` (`id`, `pasien_id`, `dokter_id`, `tanggal`, `waktu`, `status`, `catatan`, `tanggal_undur`, `waktu_undur`, `created_at`) VALUES
(36, 45, 38, '2026-07-08', '17:03:00', 'menunggu', NULL, NULL, NULL, '2026-07-03 10:03:38'),
(37, 46, 40, '2026-07-03', '06:11:00', 'menunggu', NULL, NULL, NULL, '2026-07-03 11:11:54'),
(38, 46, 40, '2026-07-22', '09:12:00', 'menunggu', NULL, NULL, NULL, '2026-07-03 11:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `nik`, `no_telp`, `tempat_lahir`, `tanggal_lahir`, `email`, `password`, `created_at`) VALUES
(44, 'acmal', '01', '0812345678901', 'Jalarta', '2026-07-03', 'Ajmal@gmail.com', '$2y$10$ho1Ht8tELbKGDGHb94R/eOscba7p3bdB.DgOwYkfyFevIwZkaGL0O', '2026-07-02 22:38:16'),
(45, 'Asd', '12', '02', 'Klo', '2026-07-03', 'sko@gmail.com', '$2y$10$226BHe1jIO53RLErX.NCPu/Dh1og.wVP8OL/QjdCCup2VEEb1BX7K', '2026-07-03 10:01:40'),
(46, 'Akmal', '05', '06', 'jkt', '2026-07-03', 'a@gmail.com', '$2y$10$b9d4I1NRtXcPpAhCjWtCduNIiMOZ9UAunkw50wam3d3HChqmKwVLG', '2026-07-03 10:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `perjanjian`
--

CREATE TABLE `perjanjian` (
  `id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` enum('menunggu','selesai','dibatalkan','diundur') DEFAULT 'menunggu',
  `catatan` text DEFAULT NULL,
  `tanggal_undur` date DEFAULT NULL,
  `waktu_undur` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perjanjian`
--

INSERT INTO `perjanjian` (`id`, `pasien_id`, `dokter_id`, `tanggal`, `jam_mulai`, `jam_selesai`, `status`, `catatan`, `tanggal_undur`, `waktu_undur`, `created_at`) VALUES
(17, 46, 40, '2026-07-03', '08:40:00', '09:10:00', 'menunggu', NULL, NULL, NULL, '2026-07-03 11:10:02'),
(18, 46, 40, '2026-07-10', '11:40:00', '12:10:00', 'menunggu', NULL, NULL, NULL, '2026-07-03 11:14:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `jadwal_praktek`
--
ALTER TABLE `jadwal_praktek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- Indexes for table `kontrol`
--
ALTER TABLE `kontrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `perjanjian`
--
ALTER TABLE `perjanjian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jadwal_praktek`
--
ALTER TABLE `jadwal_praktek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `kontrol`
--
ALTER TABLE `kontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `perjanjian`
--
ALTER TABLE `perjanjian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_praktek`
--
ALTER TABLE `jadwal_praktek`
  ADD CONSTRAINT `jadwal_praktek_ibfk_1` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kontrol`
--
ALTER TABLE `kontrol`
  ADD CONSTRAINT `kontrol_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kontrol_ibfk_2` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `perjanjian`
--
ALTER TABLE `perjanjian`
  ADD CONSTRAINT `perjanjian_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `perjanjian_ibfk_2` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
