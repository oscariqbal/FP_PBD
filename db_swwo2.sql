-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 09:19 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_swwo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `catering`
--

CREATE TABLE `catering` (
  `id_catering` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `nama_paket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `snack` tinyint(1) DEFAULT '0',
  `nasi_putih` tinyint(1) DEFAULT '0',
  `sup_ayam` tinyint(1) DEFAULT '0',
  `sambel_goreng_kombinasi` tinyint(1) DEFAULT '0',
  `oseng_sosis` tinyint(1) DEFAULT '0',
  `bihun_goreng` tinyint(1) DEFAULT '0',
  `kerupuk_udang` tinyint(1) DEFAULT '0',
  `ice_cream` tinyint(1) DEFAULT '0',
  `pudding` tinyint(1) DEFAULT '0',
  `buah_iris` tinyint(1) DEFAULT '0',
  `es_teh` tinyint(1) DEFAULT '0',
  `minuman_bersoda` tinyint(1) DEFAULT '0',
  `daging_ayam_sapi` tinyint(1) DEFAULT '0',
  `harga_catering` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catering`
--

INSERT INTO `catering` (`id_catering`, `id_service`, `nama_paket`, `snack`, `nasi_putih`, `sup_ayam`, `sambel_goreng_kombinasi`, `oseng_sosis`, `bihun_goreng`, `kerupuk_udang`, `ice_cream`, `pudding`, `buah_iris`, `es_teh`, `minuman_bersoda`, `daging_ayam_sapi`, `harga_catering`) VALUES
(1, 1, 'Paket A', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 15000.00),
(2, 1, 'Paket B', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 25000.00),
(3, 1, 'Paket C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id_customer` int NOT NULL,
  `nama_pria` varchar(100) NOT NULL,
  `nama_wanita` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id_customer`, `nama_pria`, `nama_wanita`, `email`, `nomor_hp`, `alamat`) VALUES
(1, 'Wahyu', 'Marsha Lenathea', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(2, 'Iqbal', 'Stephanie Floriska', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(3, 'Tyok', 'Flora Shafiqa Riyadi', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(4, 'Sahid', 'Kathrina Irene Indarto Putri', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(5, 'Satria ', 'Pevita Pearce', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `id_decoration` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `id_decoration_type` int DEFAULT NULL,
  `style` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `deskripsi_decoration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `harga_decoration` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`id_decoration`, `id_service`, `id_decoration_type`, `style`, `deskripsi_decoration`, `harga_decoration`) VALUES
(1, 2, 1, 'A', 'Dekorasi Pelaminan A', 8000000.00),
(2, 2, 1, 'B', 'Dekorasi Pelaminan B', 10000000.00),
(3, 2, 1, 'C', 'Dekorasi Pelaminan C', 13000000.00),
(4, 2, 1, 'D', 'Dekorasi Pelaminan D', 15000000.00),
(5, 2, 2, 'A', 'Dekorasi Prasmanan A', 750000.00),
(6, 2, 2, 'B', 'Dekorasi Prasmanan B', 1000000.00),
(7, 2, 3, 'A', 'Dekorasi Stand A', 100000.00),
(8, 2, 3, 'B', 'Dekorasi Stand B', 100000.00),
(9, 2, 3, 'C', 'Dekorasi Stand C', 100000.00),
(10, 2, 3, 'D', 'Dekorasi Stand D', 100000.00),
(11, 2, 4, 'A', 'Dekorasi Gate A', 200000.00),
(12, 2, 4, 'B', 'Dekorasi Gate B', 200000.00),
(13, 2, 5, 'A', 'Dekorasi Ceiling A', 75000.00),
(14, 2, 5, 'B', 'Dekorasi Ceiling B', 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `decoration_type`
--

CREATE TABLE `decoration_type` (
  `id_decoration_type` int NOT NULL,
  `tipe_decoration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsi_decoration_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_range_harga` decimal(10,2) DEFAULT NULL,
  `end_range_harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `decoration_type`
--

INSERT INTO `decoration_type` (`id_decoration_type`, `tipe_decoration`, `deskripsi_decoration_type`, `start_range_harga`, `end_range_harga`) VALUES
(1, 'Pelaminan', 'Dekorasi Pelaminan', 8000000.00, 15000000.00),
(2, 'Prasmanan', 'Dekorasi Prasmanan', 750000.00, 1000000.00),
(3, 'Stand', 'Dekorasi Stand', 100000.00, 100000.00),
(4, 'Gate', 'Dekorasi Gate', 200000.00, 200000.00),
(5, 'Ceiling', 'Dekorasi Ceiling', 70000.00, 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mc`
--

CREATE TABLE `mc` (
  `id_mc` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `id_mc_type` int DEFAULT NULL,
  `nama_mc` varchar(100) DEFAULT NULL,
  `deskripsi_mc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `harga_mc` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mc`
--

INSERT INTO `mc` (`id_mc`, `id_service`, `id_mc_type`, `nama_mc`, `deskripsi_mc`, `harga_mc`) VALUES
(1, 3, 1, 'Satria Toto Lowonegoro', 'MC Tradisional', 1500000.00),
(2, 3, 1, 'Gus Tyo Baharrudin', 'MC Tradisional', 1450000.00),
(3, 3, 1, 'Wahyu Syuro Mangkuwa Nitalima', 'MC Tradisional', 1500000.00),
(4, 3, 2, 'Sachidhani Estalicious', 'MC Modern', 1600000.00),
(5, 3, 2, 'Iqbal Nathalan', 'MC Modern', 1700000.00),
(6, 3, 2, 'Hamzah Fariddun Haqqi', 'MC Modern', 2000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mc_type`
--

CREATE TABLE `mc_type` (
  `id_mc_type` int NOT NULL,
  `tipe_mc` varchar(50) NOT NULL,
  `deskripsi_mc_type` varchar(100) NOT NULL,
  `start_range_harga_mc` decimal(10,2) DEFAULT NULL,
  `end_range_harga_mc` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mc_type`
--

INSERT INTO `mc_type` (`id_mc_type`, `tipe_mc`, `deskripsi_mc_type`, `start_range_harga_mc`, `end_range_harga_mc`) VALUES
(1, 'Tradisional', 'MC Tradisional', 1000000.00, 2000000.00),
(2, 'Modern', 'MC Modern', 1000000.00, 2000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mua`
--

CREATE TABLE `mua` (
  `id_mua` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `id_mua_type` int DEFAULT NULL,
  `nama_mua` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deskripsi_mua` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `harga_mua` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mua`
--

INSERT INTO `mua` (`id_mua`, `id_service`, `id_mua_type`, `nama_mua`, `deskripsi_mua`, `harga_mua`) VALUES
(1, 4, 1, 'Anggrek Mekar MUA', 'MUA Tradisional', 2000000.00),
(2, 4, 1, 'Anindya Make Up', 'MUA Tradisional', 4000000.00),
(3, 4, 2, 'Fina Make Up', 'MUA Modern', 2500000.00),
(4, 4, 2, 'Akeyla MUA', 'MUA Modern', 4500000.00),
(5, 4, 3, 'Anggrek Mekar MUA', 'MUA Muslim', 4500000.00),
(6, 4, 3, 'Arista Make Up', 'MUA Muslim', 3500000.00),
(7, 4, 3, 'Fina Make Up', 'MUA Muslim', 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mua_type`
--

CREATE TABLE `mua_type` (
  `id_mua_type` int NOT NULL,
  `tipe_mua` varchar(50) NOT NULL,
  `deskripsi_mua_type` varchar(100) NOT NULL,
  `start_range_harga_mua` decimal(10,2) DEFAULT NULL,
  `end_range_harga_mua` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mua_type`
--

INSERT INTO `mua_type` (`id_mua_type`, `tipe_mua`, `deskripsi_mua_type`, `start_range_harga_mua`, `end_range_harga_mua`) VALUES
(1, 'Tradisional', 'MUA Tradisional', 2000000.00, 5000000.00),
(2, 'Modern', 'MUA Modern', 2000000.00, 5000000.00),
(3, 'Muslim', 'MUA Muslim', 2000000.00, 5000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int NOT NULL,
  `id_customer` int NOT NULL,
  `tanggal_acara` date NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `catering` int DEFAULT NULL,
  `decoration_pelaminan` int DEFAULT NULL,
  `decoration_prasmanan` int DEFAULT NULL,
  `decoration_stand` int DEFAULT NULL,
  `decoration_gate` int DEFAULT NULL,
  `decoration_ceiling` int DEFAULT NULL,
  `mc` int DEFAULT NULL,
  `mua` int DEFAULT NULL,
  `soundsystem` int DEFAULT NULL,
  `venue` int DEFAULT NULL,
  `pesan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `id_customer`, `tanggal_acara`, `tanggal_pemesanan`, `catering`, `decoration_pelaminan`, `decoration_prasmanan`, `decoration_stand`, `decoration_gate`, `decoration_ceiling`, `mc`, `mua`, `soundsystem`, `venue`, `pesan`) VALUES
(1, 1, '2024-07-11', '2024-07-10', 1, 1, 5, 7, 11, 13, 1, 1, 1, 1, 'wahyu oke'),
(2, 2, '2024-07-11', '2024-07-10', 1, 1, 5, 8, 12, 13, 2, 2, 2, 4, 'iqbal oke'),
(3, 3, '2024-07-13', '2024-07-10', 1, 2, 5, 8, 11, 14, 3, 5, 3, 3, 'tyok oke'),
(4, 4, '2024-07-14', '2024-07-10', 2, 1, 5, NULL, 11, 13, 3, 4, 4, 5, 'sahud oke'),
(5, 5, '2024-07-17', '2024-07-10', NULL, 2, 5, 9, 12, 13, 4, 3, 2, 1, 'satria oke');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id_service` int NOT NULL,
  `nama_service` varchar(100) NOT NULL,
  `deskripsi_service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ketersediaan` varchar(50) DEFAULT NULL,
  `kontak_support` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id_service`, `nama_service`, `deskripsi_service`, `ketersediaan`, `kontak_support`) VALUES
(1, 'catering', 'Layanan Catering Satria Wijaya WO', 'Available', '0895321554375'),
(2, 'decoration', 'Layanan Decoration Satria Wijaya WO', 'Available', '0895321554375'),
(3, 'mc', 'Layanan MC Satria Wijaya WO', 'Available', '0895321554375'),
(4, 'mua', 'Layanan MUA Satria Wijaya WO', 'Available', '0895321554375'),
(5, 'soundsystem', 'Layanan Sound System Satria Wijaya WO', 'Available', '0895321554375'),
(6, 'venue', 'Layanan Venue Satria Wijaya WO', 'Available', '0895321554375');

-- --------------------------------------------------------

--
-- Table structure for table `soundsystem`
--

CREATE TABLE `soundsystem` (
  `id_soundsystem` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `id_soundsystem_type` int DEFAULT NULL,
  `nama_soundsystem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsi_soundsystem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `harga_soundsystem` decimal(10,2) DEFAULT NULL,
  `vendor_soundsystem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `soundsystem`
--

INSERT INTO `soundsystem` (`id_soundsystem`, `id_service`, `id_soundsystem_type`, `nama_soundsystem`, `deskripsi_soundsystem`, `harga_soundsystem`, `vendor_soundsystem`) VALUES
(1, 5, 2, 'Cumi Cumi Audio', 'Sound System Skala Besar', 5000000.00, 'Cumi Cumi Group'),
(2, 5, 2, 'Dihas Sound System', 'Sound System Skala Besar', 4000000.00, 'Dihas SoundCore'),
(3, 5, 1, 'Akhid Audio', 'Sound System Skala Kecil', 2000000.00, 'Cumi Cumi Group'),
(4, 5, 1, 'Hudz Sound System', 'Sound System Skala Kecil', 1500000.00, 'Hudz Group'),
(5, 5, 2, 'Hudz Sound System', 'Sound System Skala Besar', 4000000.00, 'Hudz Group');

-- --------------------------------------------------------

--
-- Table structure for table `soundsystem_type`
--

CREATE TABLE `soundsystem_type` (
  `id_soundsystem_type` int NOT NULL,
  `tipe_soundsystem` varchar(50) NOT NULL,
  `deskripsi_soundsystem_type` varchar(100) NOT NULL,
  `start_range_harga_soundsystem` decimal(10,2) DEFAULT NULL,
  `end_range_harga_soundsystem` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `soundsystem_type`
--

INSERT INTO `soundsystem_type` (`id_soundsystem_type`, `tipe_soundsystem`, `deskripsi_soundsystem_type`, `start_range_harga_soundsystem`, `end_range_harga_soundsystem`) VALUES
(1, 'Skala Kecil', 'Sound System Skala Kecil', 1250000.00, 2000000.00),
(2, 'Skala Besar', 'Sound System Skala Besar', 2000000.00, 5000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_nama` varchar(40) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_namalengkap` varchar(100) NOT NULL,
  `user_nim` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_nama`, `user_password`, `user_namalengkap`, `user_nim`) VALUES
(1, 'Iqbal', '$2y$10$f78NXyim8zCQujLeb4FBf.NkSv3utNthG8vYFzVJJl.Gu1EdsGqUe', 'Oscar Iqbal Mustofa', '22.11.4559'),
(2, 'Tyo', '$2y$10$cwD04nwyfKpyj4LIhUKtbuvcIjV06v1A30ztTGvcPwmwi5mxbHRu.', 'Gustantyo Priambodo', '22.11.4553'),
(3, 'Sahid', '$2y$10$zc.qvpWqrGPBXhUSCXd0Her3qRCZPaXE0UhlkZaZUUcdTaRADUKBy', 'Muhammad Sachidhani', '22.11.4576'),
(4, 'Satria', '$2y$10$b4FKmFGRF5sn0oeJOzk/defJxhn.RFscv0DO7ozD3anWKsEK5IIrW', 'Satria Adhi Pramudita', '22.11.4588'),
(5, 'Wahyu', '$2y$10$nCUNnDvkRQEnOAjSGZ5is.8qc3K5t0sG9ayXhdSts/dbotThtZwx6', 'Wahyu Setyaningtyas', '22.11.4582');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id_venue` int NOT NULL,
  `id_service` int DEFAULT NULL,
  `id_venue_type` int DEFAULT NULL,
  `lokasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deskripsi_venue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `kapasitas` int DEFAULT NULL,
  `harga_venue` decimal(10,2) DEFAULT NULL,
  `vendor_venue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id_venue`, `id_service`, `id_venue_type`, `lokasi`, `deskripsi_venue`, `kapasitas`, `harga_venue`, `vendor_venue`) VALUES
(1, 6, 3, 'SMA N 1 Parakan', 'Venue Skala Besar', 2000, 5000000.00, 'SMA N 1 Parakan'),
(2, 6, 3, 'Gedung Juang', 'Venue Skala Besar', 2000, 5000000.00, 'Gedung Juang'),
(3, 6, 2, 'Gedung Manunggal', 'Venue Skala Menengah', 1000, 2000000.00, 'Gedung Manunggal'),
(4, 6, 2, 'Gedung Sasana Gita', 'Venue Skala Menengah', 1000, 2000000.00, 'Gedung Sasana Gita'),
(5, 6, 2, 'Gedung Mandiri', 'Venue Skala Menengah', 500, 1700000.00, 'Gedung Mandiri'),
(6, 6, 1, 'Balai Desa Tegalwatu', 'Venue Skala Kecil', 300, 500000.00, 'Perangkat Desa Tegalwatu');

-- --------------------------------------------------------

--
-- Table structure for table `venue_type`
--

CREATE TABLE `venue_type` (
  `id_venue_type` int NOT NULL,
  `tipe_venue` varchar(50) NOT NULL,
  `deskripsi_venue_type` varchar(100) NOT NULL,
  `start_range_harga_venue` decimal(10,2) DEFAULT NULL,
  `end_range_harga_venue` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `venue_type`
--

INSERT INTO `venue_type` (`id_venue_type`, `tipe_venue`, `deskripsi_venue_type`, `start_range_harga_venue`, `end_range_harga_venue`) VALUES
(1, 'Skala Kecil', 'Venue Skala Kecil', 500000.00, 2000000.00),
(2, 'Skala Menengah', 'Venue Skala Menengah', 2000000.00, 5000000.00),
(3, 'Skala Besar', 'Venue Skala Besar', 5000000.00, 10000000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catering`
--
ALTER TABLE `catering`
  ADD PRIMARY KEY (`id_catering`),
  ADD KEY `id_service` (`id_service`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id_decoration`),
  ADD KEY `id_decoration_type` (`id_decoration_type`),
  ADD KEY `fk_service_decoration` (`id_service`);

--
-- Indexes for table `decoration_type`
--
ALTER TABLE `decoration_type`
  ADD PRIMARY KEY (`id_decoration_type`);

--
-- Indexes for table `mc`
--
ALTER TABLE `mc`
  ADD PRIMARY KEY (`id_mc`),
  ADD KEY `fk_service_mc` (`id_service`),
  ADD KEY `id_mc_type` (`id_mc_type`);

--
-- Indexes for table `mc_type`
--
ALTER TABLE `mc_type`
  ADD PRIMARY KEY (`id_mc_type`);

--
-- Indexes for table `mua`
--
ALTER TABLE `mua`
  ADD PRIMARY KEY (`id_mua`),
  ADD KEY `fk_service_mua` (`id_service`),
  ADD KEY `id_mua_type` (`id_mua_type`);

--
-- Indexes for table `mua_type`
--
ALTER TABLE `mua_type`
  ADD PRIMARY KEY (`id_mua_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `catering` (`catering`),
  ADD KEY `decoration_pelaminan` (`decoration_pelaminan`),
  ADD KEY `decoration_prasmanan` (`decoration_prasmanan`),
  ADD KEY `decoration_stand` (`decoration_stand`),
  ADD KEY `decoration_gate` (`decoration_gate`),
  ADD KEY `decoration_ceiling` (`decoration_ceiling`),
  ADD KEY `mc` (`mc`),
  ADD KEY `mua` (`mua`),
  ADD KEY `soundsystem` (`soundsystem`),
  ADD KEY `venue` (`venue`),
  ADD KEY `orders_ibfk_1` (`id_customer`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `soundsystem`
--
ALTER TABLE `soundsystem`
  ADD PRIMARY KEY (`id_soundsystem`),
  ADD KEY `fk_service_soundsystem` (`id_service`),
  ADD KEY `id_soundsystem_type` (`id_soundsystem_type`);

--
-- Indexes for table `soundsystem_type`
--
ALTER TABLE `soundsystem_type`
  ADD PRIMARY KEY (`id_soundsystem_type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id_venue`),
  ADD KEY `fk_service_venue` (`id_service`),
  ADD KEY `id_venue_type` (`id_venue_type`);

--
-- Indexes for table `venue_type`
--
ALTER TABLE `venue_type`
  ADD PRIMARY KEY (`id_venue_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catering`
--
ALTER TABLE `catering`
  MODIFY `id_catering` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `decoration`
--
ALTER TABLE `decoration`
  MODIFY `id_decoration` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `decoration_type`
--
ALTER TABLE `decoration_type`
  MODIFY `id_decoration_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mc`
--
ALTER TABLE `mc`
  MODIFY `id_mc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mc_type`
--
ALTER TABLE `mc_type`
  MODIFY `id_mc_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mua`
--
ALTER TABLE `mua`
  MODIFY `id_mua` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mua_type`
--
ALTER TABLE `mua_type`
  MODIFY `id_mua_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soundsystem`
--
ALTER TABLE `soundsystem`
  MODIFY `id_soundsystem` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `soundsystem_type`
--
ALTER TABLE `soundsystem_type`
  MODIFY `id_soundsystem_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id_venue` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `venue_type`
--
ALTER TABLE `venue_type`
  MODIFY `id_venue_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catering`
--
ALTER TABLE `catering`
  ADD CONSTRAINT `catering_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Constraints for table `decoration`
--
ALTER TABLE `decoration`
  ADD CONSTRAINT `decoration_ibfk_1` FOREIGN KEY (`id_decoration_type`) REFERENCES `decoration_type` (`id_decoration_type`),
  ADD CONSTRAINT `fk_service_decoration` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Constraints for table `mc`
--
ALTER TABLE `mc`
  ADD CONSTRAINT `fk_service_mc` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `mc_ibfk_1` FOREIGN KEY (`id_mc_type`) REFERENCES `mc_type` (`id_mc_type`);

--
-- Constraints for table `mua`
--
ALTER TABLE `mua`
  ADD CONSTRAINT `fk_service_mua` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `mua_ibfk_1` FOREIGN KEY (`id_mua_type`) REFERENCES `mua_type` (`id_mua_type`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_10` FOREIGN KEY (`soundsystem`) REFERENCES `soundsystem` (`id_soundsystem`),
  ADD CONSTRAINT `orders_ibfk_11` FOREIGN KEY (`venue`) REFERENCES `venue` (`id_venue`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`catering`) REFERENCES `catering` (`id_catering`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`decoration_pelaminan`) REFERENCES `decoration` (`id_decoration`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`decoration_prasmanan`) REFERENCES `decoration` (`id_decoration`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`decoration_stand`) REFERENCES `decoration` (`id_decoration`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`decoration_gate`) REFERENCES `decoration` (`id_decoration`),
  ADD CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`decoration_ceiling`) REFERENCES `decoration` (`id_decoration`),
  ADD CONSTRAINT `orders_ibfk_8` FOREIGN KEY (`mc`) REFERENCES `mc` (`id_mc`),
  ADD CONSTRAINT `orders_ibfk_9` FOREIGN KEY (`mua`) REFERENCES `mua` (`id_mua`);

--
-- Constraints for table `soundsystem`
--
ALTER TABLE `soundsystem`
  ADD CONSTRAINT `fk_service_soundsystem` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `soundsystem_ibfk_1` FOREIGN KEY (`id_soundsystem_type`) REFERENCES `soundsystem_type` (`id_soundsystem_type`);

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `fk_service_venue` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`id_venue_type`) REFERENCES `venue_type` (`id_venue_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
