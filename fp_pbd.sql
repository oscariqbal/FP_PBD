-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 03:24 AM
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
-- Database: `fp_pbd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DataCustomer` ()   BEGIN
    SELECT id_customer, nama_pria, nama_wanita, alamat FROM customers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNomorHP` (IN `customer_id` INT, IN `nomor_hp_baru` VARCHAR(15))   BEGIN
    DECLARE customer_exists INT;
    
    SELECT COUNT(*) INTO customer_exists
    FROM customers
    WHERE id_customer = customer_id;
    
    IF customer_exists > 0 THEN
        UPDATE customers
        SET nomor_hp = nomor_hp_baru
        WHERE id_customer = customer_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer does not exist';
    END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_customers` () RETURNS INT READS SQL DATA BEGIN
  DECLARE v_total_customers INT;
 
  SELECT COUNT(*)
  INTO v_total_customers
  FROM customers;
 
  RETURN v_total_customers;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `total_harga_decoration` (`id_service` INT, `id_decoration_type` INT) RETURNS INT READS SQL DATA BEGIN
    DECLARE total_harga INT;
 
    SELECT SUM(d.harga_decoration) INTO total_harga
    FROM decoration d
    WHERE d.id_service = id_service
      AND d.id_decoration_type = id_decoration_type;
 
    RETURN IFNULL(total_harga, 0);
END$$

DELIMITER ;

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
(1, 1, 'Paket A', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, NULL, 15000.00),
(2, 1, 'Paket B', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 25000.00),
(3, 1, 'Paket C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `catering_list`
--

CREATE TABLE `catering_list` (
  `id` int NOT NULL,
  `daftar_menu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catering_list`
--

INSERT INTO `catering_list` (`id`, `daftar_menu`) VALUES
(1, 'snack'),
(2, 'nasi_putih'),
(3, 'sup_ayam'),
(4, 'sambel_goreng_kombinasi'),
(5, 'oseng_sosis'),
(6, 'bihun_goreng'),
(7, 'kerupuk_udang'),
(8, 'ice_cream'),
(9, 'pudding'),
(10, 'buah_iris'),
(11, 'es_teh'),
(12, 'minuman_bersoda');

--
-- Triggers `catering_list`
--
DELIMITER $$
CREATE TRIGGER `after_cateringList_delete` AFTER DELETE ON `catering_list` FOR EACH ROW BEGIN
    IF OLD.daftar_menu = 'snack' THEN
        UPDATE catering
        SET snack = NULL;
    ELSEIF OLD.daftar_menu = 'nasi_putih' THEN
        UPDATE catering
        SET nasi_putih = NULL;
    ELSEIF OLD.daftar_menu = 'sup_ayam' THEN
        UPDATE catering
        SET sup_ayam = NULL;
    ELSEIF OLD.daftar_menu = 'sambel_goreng_kombinasi' THEN
        UPDATE catering
        SET sambel_goreng_kombinasi = NULL;
    ELSEIF OLD.daftar_menu = 'oseng_sosis' THEN
        UPDATE catering
        SET oseng_sosis = NULL;
    ELSEIF OLD.daftar_menu = 'bihun_goreng' THEN
        UPDATE catering
        SET bihun_goreng = NULL;
    ELSEIF OLD.daftar_menu = 'kerupuk_udang' THEN
        UPDATE catering
        SET kerupuk_udang = NULL;
    ELSEIF OLD.daftar_menu = 'ice_cream' THEN
        UPDATE catering
        SET ice_cream = NULL;
    ELSEIF OLD.daftar_menu = 'pudding' THEN
        UPDATE catering
        SET pudding = NULL;
    ELSEIF OLD.daftar_menu = 'buah_iris' THEN
        UPDATE catering
        SET buah_iris = NULL;
    ELSEIF OLD.daftar_menu = 'es_teh' THEN
        UPDATE catering
        SET es_teh = NULL;
    ELSEIF OLD.daftar_menu = 'minuman_bersoda' THEN
        UPDATE catering
        SET minuman_bersoda = NULL;
    ELSEIF OLD.daftar_menu = 'daging_ayam_sapi' THEN
        UPDATE catering
        SET daging_ayam_sapi = NULL;
    END IF;
END
$$
DELIMITER ;

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
(1, 'Wahyu', 'Marsha Lenathea', 'oscariqbal@students.amikom.ac.id', '08999999999', 'Blotan'),
(2, 'Iqbal', 'Stephanie Floriska', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(3, 'Tyok', 'Flora Shafiqa Riyadi', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(4, 'Sahid', 'Kathrina Irene Indarto Putri', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(5, 'Satria ', 'Pevita Pearce', 'oscariqbal75@gmail.com', '0895321554375', 'Blotan'),
(6, 'Dhika', 'Citra Tiara Mustika', 'oscariqbal75@gmail.com', '895321554375', 'Blotan');

--
-- Triggers `customers`
--
DELIMITER $$
CREATE TRIGGER `after_customer_insert` AFTER INSERT ON `customers` FOR EACH ROW BEGIN
    INSERT INTO notifications (id_customer, message, sent_at)
    VALUES (NEW.id_customer, CONCAT('Welcome, ', NEW.nama_pria, '! Thank you for registering.'), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_customer_update` AFTER UPDATE ON `customers` FOR EACH ROW BEGIN
    INSERT INTO customer_log (
        id_customer,
        old_nama_pria, new_nama_pria,
        old_nama_wanita, new_nama_wanita,
        old_email, new_email,
        old_nomor_hp, new_nomor_hp,
        old_alamat, new_alamat,
        update_time
    )
    VALUES (
        OLD.id_customer,
        OLD.nama_pria, NEW.nama_pria,
        OLD.nama_wanita, NEW.nama_wanita,
        OLD.email, NEW.email,
        OLD.nomor_hp, NEW.nomor_hp,
        OLD.alamat, NEW.alamat,
        NOW()
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_customer_update` BEFORE UPDATE ON `customers` FOR EACH ROW BEGIN
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_log`
--

CREATE TABLE `customer_log` (
  `id_log` int NOT NULL,
  `id_customer` int DEFAULT NULL,
  `old_nama_pria` varchar(255) DEFAULT NULL,
  `new_nama_pria` varchar(255) DEFAULT NULL,
  `old_nama_wanita` varchar(255) DEFAULT NULL,
  `new_nama_wanita` varchar(255) DEFAULT NULL,
  `old_email` varchar(255) DEFAULT NULL,
  `new_email` varchar(255) DEFAULT NULL,
  `old_nomor_hp` varchar(20) DEFAULT NULL,
  `new_nomor_hp` varchar(20) DEFAULT NULL,
  `old_alamat` text,
  `new_alamat` text,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_log`
--

INSERT INTO `customer_log` (`id_log`, `id_customer`, `old_nama_pria`, `new_nama_pria`, `old_nama_wanita`, `new_nama_wanita`, `old_email`, `new_email`, `old_nomor_hp`, `new_nomor_hp`, `old_alamat`, `new_alamat`, `update_time`) VALUES
(1, 1, 'Wahyu', 'Wahyu', 'Marsha Lenathea', 'Marsha Lenathea', 'oscariqbal75@gmail.com', 'oscariqbal@students.amikom.ac.id', '08888888888', '08888888888', 'Blotan', 'Blotan', '2024-07-22 16:31:31'),
(2, 1, 'Wahyu', 'Wahyu', 'Marsha Lenathea', 'Marsha Lenathea', 'oscariqbal@students.amikom.ac.id', 'oscariqbal@students.amikom.ac.id', '08888888888', '08999999999', 'Blotan', 'Blotan', '2024-07-24 10:22:16');

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
  `deskripsi_mua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id_notification` int NOT NULL,
  `id_customer` int DEFAULT NULL,
  `message` text,
  `sent_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id_notification`, `id_customer`, `message`, `sent_at`) VALUES
(1, 6, 'Welcome, Dhika! Thank you for registering.', '2024-07-22 16:30:35');

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

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `before_order_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE count INT DEFAULT 0;
    SELECT COUNT(*) INTO count FROM customers WHERE id_customer = NEW.id_customer;
    IF count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer ID does not exist';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_mua`
--

CREATE TABLE `pemesanan_mua` (
  `mua_id` int NOT NULL,
  `nama_mua` varchar(25) DEFAULT NULL,
  `deskripsi_mua` varchar(25) DEFAULT NULL,
  `tanggal_pesan` date NOT NULL,
  `harga` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemesanan_mua`
--

INSERT INTO `pemesanan_mua` (`mua_id`, `nama_mua`, `deskripsi_mua`, `tanggal_pesan`, `harga`) VALUES
(1, 'Citra', 'MUA Tradisional', '2024-07-21', '5000500'),
(2, 'Tiara', 'MUA Modern', '2024-07-22', '8000000');

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
(6, 'venue', 'Layanan Venue Satria Wijaya WO', 'Available', '0895321554375'),
(7, 'Artis', 'Layanan Artis Satria Wijaya WO', 'Unavailable', '0895321554375'),
(8, 'buffet', 'Layanan Buffet Satria Wijaya WO', 'Unavailable', '0895321554375'),
(9, 'Tarian Adat', 'Layanan Tarian Adat Nikahan Satria Wijaya WO', 'Available', '0882551004685');

--
-- Triggers `services`
--
DELIMITER $$
CREATE TRIGGER `before_service_delete` BEFORE DELETE ON `services` FOR EACH ROW BEGIN
    DECLARE catering_count INT;
    DECLARE decoration_count INT;
    DECLARE mc_count INT;
    DECLARE mua_count INT;
    DECLARE soundsystem_count INT;
    DECLARE venue_count INT;

    SELECT COUNT(*) INTO catering_count FROM catering WHERE id_service = OLD.id_service;
    SELECT COUNT(*) INTO decoration_count FROM decoration WHERE id_service = OLD.id_service;
        SELECT COUNT(*) INTO mc_count FROM mc WHERE id_service = OLD.id_service;
    SELECT COUNT(*) INTO mua_count FROM mua WHERE id_service = OLD.id_service;
    SELECT COUNT(*) INTO soundsystem_count FROM soundsystem WHERE id_service = OLD.id_service;
    SELECT COUNT(*) INTO venue_count FROM venue WHERE id_service = OLD.id_service;

    IF catering_count > 0 OR decoration_count > 0 OR mc_count > 0 OR mua_count > 0 OR soundsystem_count > 0 OR venue_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete services because there are associated records in other tables.';
    END IF;
END
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_customers`
-- (See below for the actual view)
--
CREATE TABLE `v_customers` (
`id_customer` int
,`nama_pria` varchar(100)
,`nama_wanita` varchar(100)
,`email` varchar(100)
,`nomor_hp` varchar(15)
,`alamat` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_customers_vertical_view`
-- (See below for the actual view)
--
CREATE TABLE `v_customers_vertical_view` (
`nama_pria` varchar(100)
,`nama_wanita` varchar(100)
,`alamat` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nested_test`
-- (See below for the actual view)
--
CREATE TABLE `v_nested_test` (
`id_service` int
,`nama_service` varchar(100)
,`deskripsi_service` text
,`ketersediaan` varchar(50)
,`kontak_support` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nested_v`
-- (See below for the actual view)
--
CREATE TABLE `v_nested_v` (
`id_service` int
,`nama_service` varchar(100)
,`deskripsi_service` text
,`ketersediaan` varchar(50)
,`kontak_support` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nested_view`
-- (See below for the actual view)
--
CREATE TABLE `v_nested_view` (
`id_service` int
,`nama_service` varchar(100)
,`deskripsi_service` text
,`ketersediaan` varchar(50)
,`kontak_support` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_service`
-- (See below for the actual view)
--
CREATE TABLE `v_service` (
`id_service` int
,`nama_service` varchar(100)
,`deskripsi_service` text
,`ketersediaan` varchar(50)
,`kontak_support` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `v_customers`
--
DROP TABLE IF EXISTS `v_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_customers`  AS SELECT `customers`.`id_customer` AS `id_customer`, `customers`.`nama_pria` AS `nama_pria`, `customers`.`nama_wanita` AS `nama_wanita`, `customers`.`email` AS `email`, `customers`.`nomor_hp` AS `nomor_hp`, `customers`.`alamat` AS `alamat` FROM `customers` WHERE (`customers`.`id_customer` = '3') ;

-- --------------------------------------------------------

--
-- Structure for view `v_customers_vertical_view`
--
DROP TABLE IF EXISTS `v_customers_vertical_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_customers_vertical_view`  AS SELECT `customers`.`nama_pria` AS `nama_pria`, `customers`.`nama_wanita` AS `nama_wanita`, `customers`.`alamat` AS `alamat` FROM `customers` WHERE (`customers`.`id_customer` = '3') ;

-- --------------------------------------------------------

--
-- Structure for view `v_nested_test`
--
DROP TABLE IF EXISTS `v_nested_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nested_test`  AS SELECT `v_service`.`id_service` AS `id_service`, `v_service`.`nama_service` AS `nama_service`, `v_service`.`deskripsi_service` AS `deskripsi_service`, `v_service`.`ketersediaan` AS `ketersediaan`, `v_service`.`kontak_support` AS `kontak_support` FROM `v_service` WHERE (`v_service`.`ketersediaan` = 'Unavailable')WITH LOCAL CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_nested_v`
--
DROP TABLE IF EXISTS `v_nested_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nested_v`  AS SELECT `v_service`.`id_service` AS `id_service`, `v_service`.`nama_service` AS `nama_service`, `v_service`.`deskripsi_service` AS `deskripsi_service`, `v_service`.`ketersediaan` AS `ketersediaan`, `v_service`.`kontak_support` AS `kontak_support` FROM `v_service` WHERE (`v_service`.`ketersediaan` = 'Unavailable') ;

-- --------------------------------------------------------

--
-- Structure for view `v_nested_view`
--
DROP TABLE IF EXISTS `v_nested_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nested_view`  AS SELECT `v_service`.`id_service` AS `id_service`, `v_service`.`nama_service` AS `nama_service`, `v_service`.`deskripsi_service` AS `deskripsi_service`, `v_service`.`ketersediaan` AS `ketersediaan`, `v_service`.`kontak_support` AS `kontak_support` FROM `v_service` WHERE (`v_service`.`ketersediaan` = 'Unavailable')WITH LOCAL CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_service`
--
DROP TABLE IF EXISTS `v_service`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_service`  AS SELECT `services`.`id_service` AS `id_service`, `services`.`nama_service` AS `nama_service`, `services`.`deskripsi_service` AS `deskripsi_service`, `services`.`ketersediaan` AS `ketersediaan`, `services`.`kontak_support` AS `kontak_support` FROM `services` ;

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
-- Indexes for table `catering_list`
--
ALTER TABLE `catering_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `customer_log`
--
ALTER TABLE `customer_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_customer` (`id_customer`);

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
  ADD KEY `id_mua_type` (`id_mua_type`),
  ADD KEY `index_mua` (`nama_mua`,`deskripsi_mua`);

--
-- Indexes for table `mua_type`
--
ALTER TABLE `mua_type`
  ADD PRIMARY KEY (`id_mua_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `id_customer` (`id_customer`);

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
-- Indexes for table `pemesanan_mua`
--
ALTER TABLE `pemesanan_mua`
  ADD PRIMARY KEY (`mua_id`,`tanggal_pesan`),
  ADD KEY `index_pemesanan_mua` (`mua_id`,`tanggal_pesan`);

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
-- AUTO_INCREMENT for table `catering_list`
--
ALTER TABLE `catering_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_log`
--
ALTER TABLE `customer_log`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id_notification` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `customer_log`
--
ALTER TABLE `customer_log`
  ADD CONSTRAINT `customer_log_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`);

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
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`);

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
