-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2025 at 04:19 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baumata`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$5avYGM9kC0RlSSOiVCKQl.ltNyrE9vOzROqvWgDRiSSgsVM7GghBC'),
(2, 'ray', '$2y$10$CgyXopB7ehxYGYU63zhvV.dMu0oe.PqzOwZo0WDpJ/rwD8rQdl6f.'),
(3, 'user', '$2y$10$qv9m4fMuIoAgzyWIw0j/k.q1pfc8lw55653IiIw5M7X2QYRxK6Bd6');

-- --------------------------------------------------------

--
-- Table structure for table `beda_nama`
--

CREATE TABLE `beda_nama` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `agama` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `alamat` text,
  `nama_dokumen` varchar(255) DEFAULT NULL,
  `nama_salah` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beda_nama`
--

INSERT INTO `beda_nama` (`id`, `nama`, `jenis_kelamin`, `umur`, `agama`, `pekerjaan`, `alamat`, `nama_dokumen`, `nama_salah`, `tanggal`, `status`, `tanggal_cetak`) VALUES
(1, 'Febiana Kulla', 'Perempuan', 22, 'Kristen Protestan', 'Mahasiswa', 'f', '11111111111111111111111111111', '1111111111111111111111111111', '2025-03-11', 'tercetak', NULL),
(2, 'ferdinand Aryan Bulu', 'Laki-laki', 22, 'katholik', 'pelajar/mahasiswa', 'aaaaaaaa', 'ferdinand Aryan Bulu', 'ferdinand Aryan Bula', '2025-03-11', 'tercetak', NULL),
(3, 'ferdinand Aryan Bulu', 'Laki-laki', 22, 'kristen protestan', 'pelajar/mahasiswa', 'w', 'ferdinand Aryan Bulu', 'ferdinand Aryan Bula', '2025-03-11', 'tercetak', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beda_nik`
--

CREATE TABLE `beda_nik` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `umur` int(11) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `nik_benar` varchar(20) NOT NULL,
  `nik_salah` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beda_nik`
--

INSERT INTO `beda_nik` (`id`, `nama`, `jenis_kelamin`, `umur`, `agama`, `pekerjaan`, `alamat`, `nik_benar`, `nik_salah`, `tanggal`, `status`, `tanggal_cetak`) VALUES
(1, 'Celine A. Bulan', 'Perempuan', 22, 'Kristen Protestan', 'Mahasiswa', 'ww', '1111111111111111', '1111111111111111', '2025-03-11', 'tercetak', NULL),
(2, 'Celine A. Bulan', 'Perempuan', 22, 'Kristen Protestan', 'Mahasiswa', 'ww', '1111111111111111', '1111111111111111', '2025-03-11', 'tercetak', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_penduduk`
--

CREATE TABLE `data_penduduk` (
  `id` int(11) NOT NULL,
  `nomor_urut` int(11) DEFAULT NULL,
  `kk` int(11) DEFAULT NULL,
  `dusun` varchar(255) DEFAULT NULL,
  `rt` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `ttl` varchar(100) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `status_perkawinan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_penduduk`
--

INSERT INTO `data_penduduk` (`id`, `nomor_urut`, `kk`, `dusun`, `rt`, `nama_lengkap`, `ttl`, `jenis_kelamin`, `agama`, `pendidikan`, `pekerjaan`, `status_perkawinan`) VALUES
(1, 1, 1, '3', '9', 'YESAYA ATOLLO', 'UPUNKIU, 17-11-1972', 'L', 'KRISTEN', 'SMA', 'BURUH PETANI', 'KAWIN'),
(2, 2, 3, '3', '9', 'MARDI YARDI BILISTOLEN', 'BESMARAK, 12-08-1976', 'P', '', 'SMA', 'IBU RUMAH TANGGA', 'KAWIN'),
(3, 3, 3, '3', '9', 'GLEDIANA JUBLINA ATOLLO', 'BETUN BELU, 04-07-2005', 'P', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(4, 4, 3, '3', '9', 'ADE JULIO ATOLLO', 'UPUNKIU, 25-07-2007', 'L', '', 'SMP', 'BELUM BEKERJA', ''),
(5, 5, 3, '3', '9', 'YOLANDA ATOLLO', 'UPUNKIU, 03-09-2010', 'P', '', 'SD', 'BELUM BEKERJA', ''),
(6, 6, 3, '3', '9', 'ANGGRENI ATOLLO', 'UPUNKIU, 04-07-2013', 'P', '', 'SD', 'BELUM BEKERJA', ''),
(7, 7, 3, '3', '9', 'ACOLNARUF ATOLLO', 'KUPANG, 16-06-2017', 'L', '', 'TK', '', ''),
(8, 2, 1, '3', '9', 'ESTER ATOLLO', 'BAUMATA, 28-11-1974', 'P', 'KRISTEN', 'SMA', 'PETANI BERKEBUN', ''),
(9, 2, 3, '3', '9', 'ALFONS IGNATIUS ATOLLO', 'BETUN, 01-08-2004', 'L', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(10, 3, 1, '3', '9', 'JERMIAS ATOLLO', 'UPUNKIU, 06-07-1961', 'L', 'KRISTEN', '', 'PETANI BERKEBUN', 'KAWIN'),
(11, 2, 3, '3', '9', 'MARICE NANTU', 'NEKETUNA, 05-03-1972', 'P', '', '', 'IBU RUMAH TANGGA', 'KAWIN'),
(12, 3, 3, '3', '9', 'APOLOS BERNABAS ATOLLO', 'UPUNKIU, 08-07-1999', 'L', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(13, 4, 3, '3', '9', 'NOH SOLEMAN ATOLLO', 'UPUNKIU, 21-03-2001', 'L', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(14, 5, 3, '3', '9', 'ADELIA HENDERINA ATOLLO', 'UPUNKIU, 29-04-2004', 'P', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(15, 6, 3, '3', '9', 'MERLENI ATOLLO', 'UPUNKIU, 29-05-2006', 'P', '', 'SMP', 'PELAJAR/MAHASISWA', ''),
(16, 4, 1, '3', '9', 'STEFANUS S. ATOLLO', 'UPUNKIU, 23-02-1978', 'L', 'KRISTEN', 'SMA', 'KARYAWAN SWASTA', 'KAWIN'),
(17, 2, 3, '3', '9', 'NURLITA Y. ATOLLO TAOPAN', 'UDAMANU, 16-11-1983', 'P', '', 'SMA', 'IBU RUMAH TANGGA', 'KAWIN'),
(18, 3, 3, '3', '9', 'CRISTIENIK ATOLLO', 'KUPANG, 13-03-2007', 'P', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(19, 4, 3, '3', '9', 'CHARLES A. ATOLLO', 'PENFUI, 16-10-2011', 'L', '', 'SMP', 'PELAJAR/MAHASISWA', ''),
(20, 5, 1, '3', '9', 'KOSTAN ATOLLO', '', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(21, 2, 3, '3', '9', 'ORPA ATOLLO NABEN', '', 'P', '', 'SD', 'IBU RUMAH TANGGA', 'KAWIN'),
(22, 3, 3, '3', '9', 'MUSA ATOLLO', '', 'L', '', 'SMP', 'PELAJAR/MAHASISWA', ''),
(23, 4, 3, '3', '9', 'OTNIEL ATOLLO', '', 'L', '', 'SMA', 'PELAJAR/MAHASISWA', ''),
(24, 5, 3, '3', '9', 'ASNAT ATOLLO', '', 'P', '', 'SARJANA', 'PELAJAR/MAHASISWA', ''),
(108, 16, 1, '3', '9', 'YUSUF MANUNEL', 'UPUNKIU, 18-01-1984', 'L', 'KRISTEN', 'SLTP', 'TANI', 'KAWIN'),
(109, 2, 3, '3', '9', 'BLANDINA MARIANA MAMO', 'BAUMATA, 10-08-1986', 'P', 'KRISTEN', 'SLTA', 'PENJAHIT', 'KAWIN'),
(110, 3, 3, '3', '9', 'FANISTHA PHILIA DELVIA MANUNEL', 'KUPANG, 19-08-2017', 'P', 'KRISTEN', 'SD', 'SISWI SD', 'BELUM KAWIN'),
(111, 4, 3, '3', '9', 'JAYLLEN JUNYARTHA MANUNEL', 'KUPANG, 04-06-2020', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM BEKERJA', 'BELUM KAWIN'),
(112, 17, 1, '3', '9', 'ESAU MANUNEL', 'OEKASE, 25-09-1958', 'L', 'KRISTEN', '', 'PETANI', 'KAWIN'),
(113, 2, 3, '3', '9', 'NELCI KATNESI', 'BAUMATA, 15-06-1963', 'P', 'KRISTEN', '', 'IRT', 'KAWIN'),
(114, 3, 3, '3', '9', 'FELPINA MANUNEL', 'BAUMATA, 08-02-1982', 'P', 'KRISTEN', 'SD', 'SWASTA', 'BELUM KAWIN'),
(115, 4, 3, '3', '9', 'YOSUA MARKUS MANUNEL', 'BAUMATA, 03-01-2001', 'L', 'KRISTEN', 'SLTA', 'SWASTA', 'BELUM KAWIN'),
(116, 18, 1, '3', '9', 'ABRAHAM SABOTH', 'OELNASI, 13-04-1948', 'L', 'KRISTEN', 'SR', 'PETANI', 'KAWIN'),
(117, 2, 3, '3', '9', 'SUINGLI SABOTH', 'OELNASI, 19-10-1979', 'L', 'KRISTEN', 'SLTP', 'TUKANG KAYU', 'BELUM KAWIN'),
(118, 3, 3, '3', '9', 'DARSONI SABOTH', 'OELNASI,24-11-1991', 'L', 'KRISTEN', 'SLTA', 'TUKANG KAYU', 'BELUM KAWIN'),
(119, 4, 3, '3', '9', 'GUSRIDA PAULINA SABOTH', 'FENUN, 27-06-1997', 'P', 'KRISTEN', 'PERGURUAN TINGGI', 'BELUM BEKERJA', 'BELUM KAWIN'),
(120, 5, 3, '3', '9', 'KENI LOKA SABOTH', 'FENUN, 25-08-2002', 'L', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(121, 19, 1, '3', '9', 'KETSIA DUNGGUN SABOTH', 'OELNASI, 13-08-1982', 'P', 'KRISTEN', 'SLTP', 'PETANI', 'KAWIN'),
(122, 2, 3, '3', '9', 'KENI RAMAEL DUNGGUN', 'TARUS, 27-03-2008', 'L', 'KRISTEN', 'SLTP', 'SISWA', 'BELUM KAWIN'),
(123, 3, 3, '3', '9', 'ARSAS AQUINO DUNGGUN', 'NASIPANAF, 21-08-2009', 'L', 'KRISTEN', 'SLTP', 'SISWA', 'BELUM KAWIN'),
(124, 4, 3, '3', '9', 'YUSUS HONOK S SABOTH', 'BAUMATA, 05-02-2015', 'L', 'KRISTEN', 'SD', 'SISWA', 'BELUM KAWIN'),
(125, 20, 1, '3', '9', 'DAUD MANU', 'FENUN, 25-04-1987', 'L', 'KRISTEN', 'SLTP', 'PETANI', 'KAWIN'),
(126, 2, 3, '3', '9', 'APRIANA BAIT', 'ALOR, 12-04-1989', 'P', 'KRISTEN', 'SLTA', 'IRT', 'KAWIN'),
(127, 3, 3, '3', '9', 'BEOY ITAMAR DEVITANIA MANU', 'KUPANG, 11-01-2013', 'P', 'KRISTEN', 'SD', 'BELUM BEKERJA', 'BELUM KAWIN'),
(128, 4, 3, '3', '9', 'GILBERTH FANDONITUS MANU', 'BAUMATA, 27-10-2015', 'L', 'KRISTEN', 'SD', 'BELUM BEKERJA', 'BELUM KAWIN'),
(129, 5, 3, '3', '9', 'AGUNG JUMANDRO MANU', 'BAUMATA', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM BEKERJA', 'BELUM KAWIN'),
(130, 21, 1, '3', '9', 'ALEXANDER MANU', 'UPUNKIU, 30-08-1964', 'L', 'KRISTEN', '', 'PETANI', 'KAWIN'),
(131, 2, 3, '3', '9', 'MARSALINA MANU KEBA', 'UPUNKIU, 14-03-1956', 'P', 'KRISTEN', '', 'IRT', 'KAWIN'),
(132, 3, 3, '3', '9', 'YOSUA MANU', 'UPUNKIU, 15-05-1991', 'L', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(133, 4, 3, '3', '9', 'BLANDINA MANU', 'UPUNKIU, 13-10-1993', 'P', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(134, 5, 3, '3', '9', 'SAMUEL MANU', 'BAUMATA, 05-09-1997', 'L', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(135, 6, 3, '3', '9', 'NOLDI WELMINCE MANU', 'BAUMATA, 08-11-1997', 'P', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(136, 7, 3, '3', '9', 'SEVER LINUS MANU', 'BAUMATA, 01-10-1999', 'L', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(137, 8, 3, '3', '9', 'TESALONIKA MANU', 'KUPANG, 03-02-2003', 'P', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', 'BELUM KAWIN'),
(138, 22, 1, '3', '9', 'ANIA CAROLIN MARIA PATTIWAELLAPIA', 'KUPANG, 09-08-1946', 'P', 'KRISTEN', 'SLTA', 'IRT', 'KAWIN'),
(139, 2, 3, '3', '9', 'ANACIA FEBRIANA NOPENANU', 'PENFUI, 06-02-1972', 'P', 'KRISTEN', 'SLTA', 'SWASTA', 'BELUM KAWIN'),
(140, 3, 3, '3', '9', 'FERDINAN EDUARD NOPENANU', 'PENFUI, 16-02-1976', 'L', 'KRISTEN', 'SLTA', 'SWASTA', 'BELUM KAWIN'),
(141, 1, 1, '2', '6', 'MUSA HUMAU', 'FENUN, 05-08-1971', 'L', 'KRISTEN', 'SLTP', 'PETANI', 'KAWIN'),
(142, 2, 2, '2', '6', 'ANIKA HUMAU LOPO', 'FENUN, 04-04-1980', 'P', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(143, 3, 2, '2', '6', 'ALDRIS ALJEN HUMAU', 'FENUN, 03-04-2002', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'BELUM KAWIN'),
(144, 4, 2, '2', '6', 'MARFIL DIKI HUMAU', 'FENUN, 07-03-2004', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(145, 5, 2, '2', '6', 'RYANTY YOHANIA HUMAU', 'FENUN, 19-07-2007', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(146, 6, 2, '2', '6', 'ARYT HUMAU', 'FENUN, 03-08-2010', 'L', 'KRISTEN', 'SLTP', '', 'BELUM KAWIN'),
(147, 2, 1, '2', '6', 'MARTHEN HUMAU', 'FENUN, 25-11-1976', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(148, 2, 2, '2', '6', 'ELISABETH HUMAU BOIS', 'FATUBENO, 19-12-1978', 'P', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(149, 3, 2, '2', '6', 'AIFA YOHANIS HUMAU', 'FENUN, 11-12-2009', 'L', 'KRISTEN', 'SLTP', '', 'BELUM KAWIN'),
(150, 3, 1, '2', '6', 'ELKANA HUMAU', 'FENUN, 11-07-1954', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(151, 2, 2, '2', '6', 'YULITA HUMAU NABUASA', 'BENLUFU, 08-03-1966', 'P', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(152, 3, 2, '2', '6', 'YESRI TAMAR HUMAU', 'FENUN, 30-06-1996', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(153, 4, 2, '2', '6', 'ELFIANA HUMAU', 'FENUN,13-12-2000', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(154, 5, 2, '2', '6', 'APLIANDO HERMES BENU', 'KUPANG, 25-04-2015', 'L', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(155, 4, 1, '2', '6', 'YESKIEL KASE', 'FENUN, 22-07-1959', 'L', 'KRISTEN', 'SD', 'PETANI', ''),
(156, 2, 2, '2', '6', 'SEPRIANUS KASE', 'PENFUI, 05-09-1993', 'L', 'KRISTEN', 'SMA', 'SWASTA', ''),
(157, 3, 2, '2', '6', 'MEGA DIANA KASE', 'FENUN, 10-12-1995', 'P', 'KRISTEN', 'S1', '', ''),
(158, 4, 2, '2', '6', 'NATALIA KASE', 'UEL, 16-11-1989', 'P', 'KRISTEN', 'SMA', '', ''),
(159, 5, 1, '2', '6', 'JERMIA HUMAU', 'FENUN, 21-01-1959', 'L', 'KRISTEN', '', 'PETANI', 'KAWIN'),
(160, 2, 2, '2', '6', 'MIRYAN HUMAU NENO', 'UPUNKIU, 04-01-1975', 'P', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(161, 3, 2, '2', '6', 'RIVAN MARKUS HUMAU', 'FENUN, 13-08-1996', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(162, 4, 2, '2', '6', 'SELMI RISKA HUMAU', 'FENUN, 06-07-1999', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(163, 5, 2, '2', '6', 'MAGPRILANI COLE HUMAU', 'YOKYAKARTA, 29-04-2018', 'P', 'KRISTEN', '', '', ''),
(164, 6, 1, '2', '6', 'INYONG ROBINSON KORE', 'BATUPUTI, 15-02-1967', 'L', 'KRISTEN', 'SLTA', 'ABRI', 'KAWIN'),
(165, 2, 2, '2', '6', 'HANA ELISABETH NGGEOK KORE', 'KUPANG, 07-09-1965', 'P', 'KRISTEN', 'SLTA', 'PNS', 'KAWIN'),
(166, 3, 2, '2', '6', 'FENDY ELPHINSON KORE', 'KUPANG, 04-05-1992', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(167, 4, 2, '2', '6', 'CLARA ANASTAYSA KORE', 'KUPANG, 27-03-1994', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(168, 5, 2, '2', '6', 'REINHARD RICHARD KORE', 'KUPANG, 02-07-1996', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(169, 6, 2, '2', '6', 'RIVAN KORE', 'KUPANG, 27-11-1998', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(170, 7, 2, '2', '6', 'RENALDY B. KORE', 'KUPANG, 25-04-2001', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(171, 8, 2, '2', '6', 'RISTO KORE', 'KUPANG, 04-01-2003', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(172, 9, 2, '2', '6', 'RATU STEPHANY KORE', 'KUPANG, 30-01-2006', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(173, 7, 1, '2', '6', 'DEVAN HERMOGENES KAREL', 'UEL, 24-12-1987', 'L', 'KRISTEN', 'SLTA', 'WIRASWASTA', 'KAWIN'),
(174, 2, 2, '2', '6', 'ADRIANA KAREL NAIBESI', 'OELTUA, 09-02-1992', 'P', 'KRISTEN', 'SLTA', 'IRT', 'KAWIN'),
(175, 3, 2, '2', '6', 'GHERALDO DETRYLIO KAREL', 'BAUMATA, 10-11-2014', 'L', 'KRISTEN', 'SD', '', 'BELUM KAWIN'),
(176, 4, 2, '2', '6', 'ARDHYSM DETRYLIO KAREL', 'KUPANG, 19-01-2018', 'L', 'KRISTEN', 'SD', '', 'BELUM KAWIN'),
(177, 5, 2, '2', '6', 'TALITHA MARSHA TRYDELIA KAREL', 'BAUMATA, 25-10-2019', 'P', 'KRISTEN', '', '', 'BELUM KAWIN'),
(178, 8, 1, '2', '6', 'YAKOBA TEFA', 'DEPUNU, 24-09-1974', 'P', 'KRISTEN', 'SLTA', 'IRT', 'BELUM KAWIN'),
(179, 2, 2, '2', '6', 'ARIYANTO TEFA', 'FENUN, 21-10-1991', 'L', 'KRISTEN', 'SLTA', '', 'BELUM KAWIN'),
(180, 3, 2, '2', '6', 'MERCI PRETILIA TEFA', 'FENUN, 28-02-2004', 'P', 'KRISTEN', 'SMA', 'PELAJAR', 'BELUM KAWIN'),
(181, 9, 1, '2', '6', 'SUPRYADI SUHARDJANA', 'BAUMATA, 14-09-1973', 'L', 'KRISTEN', 'S1', 'PNS', 'KAWIN'),
(182, 2, 2, '2', '6', 'SAPTA T. SUHARDJANA', 'BAUMATA, 12-05-2007', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(183, 2, 2, '2', '6', 'ANDREW P. SUHARDJANA', 'BAUMATA, 26-09-2008', 'L', 'KRISTEN', 'SLTA', '', 'BELUM KAWIN'),
(184, 10, 1, '2', '6', 'EBENHIZAR BETTI', 'SOE, 29-10-1965', 'L', 'KRISTEN', 'SLTA', 'PETANI', 'KAWIN'),
(185, 2, 2, '2', '6', 'KATERINA BETTI- HEJI', 'BAUMATA, 17-11-1972', 'P', 'KRISTEN', 'SLTP', 'IRT', 'KAWIN'),
(186, 3, 2, '2', '6', 'TRIFENI HERAWATI BETTI', 'BAUMATA, 17-03-2000', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(187, 4, 2, '2', '6', 'SARLIN GLORIA BETTI', 'BAUMATA, 02-03-2006', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(188, 11, 1, '2', '6', 'NELCI TEFA NO\'E', 'OE, HAU, 03-05-1942', 'P', 'KRISTEN', '', 'PETANI', 'KAWIN'),
(189, 12, 1, '2', '6', 'JAMES JEFERSON TALLO', 'BAUMATA, 29-07-1983', 'L', 'KRISTEN', 'SLTA', 'PNS', 'KAWIN'),
(190, 2, 2, '2', '6', 'ERNI YOHANA TALLO ATTO', 'NUSAKLAIN, 28-10-1980', 'P', 'KRISTEN', 'DIPLOMA', 'PNS', 'KAWIN'),
(191, 3, 2, '2', '6', 'EUNIKE ANGELICA NATASALOM', 'KUPANG, 26-12-2002', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(192, 4, 2, '2', '6', 'ADJUVAN KURNIANGURU TALLO', 'BAUMATA, 17-04-2012', 'L', 'KRISTEN', 'SD', '', 'BELUM KAWIN'),
(193, 5, 2, '2', '6', 'JAYSEN BENJAMIN TALLO', 'BAUMATA, 19-02-2015', 'L', 'KRISTEN', '', '', 'BELUM KAWIN'),
(194, 6, 2, '2', '6', 'JAYRHA CELINE PUTRI TALLO', 'KUPANG, 05-10-2016', 'P', 'KRISTEN', '', '', 'BELUM KAWIN'),
(195, 13, 1, '2', '6', 'YEDIT JEFERSON BETTI', 'BAUMATA, 17-06-1994', 'L', 'KRISTEN', 'SLTA', 'WIRASWASTA', 'BELUM KAWIN'),
(196, 14, 1, '2', '6', 'RENO KORE', 'FENUN, 17-05-1982', 'L', 'KRISTEN', 'SLTP', 'SWASTA', 'KAWIN'),
(197, 2, 2, '2', '6', 'YUNITA KORE TANEBETH', 'POSNURI, 25-06-1984', 'P', 'KRISTEN', 'SLTA', 'IRT', 'KAWIN'),
(198, 3, 2, '2', '6', 'BRINET AUREL KORE', 'FENUN, 10-07-2008', 'P', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(199, 4, 2, '2', '6', 'VELLOVE KORE', 'FENUN, 27-11-2012', 'P', 'KRISTEN', 'SD', '', 'BELUM KAWIN'),
(200, 5, 2, '2', '6', 'JORNADE VERELL KORE', 'KUPANG, 30-11-2020', 'L', 'KRISTEN', '', '', 'BELUM KAWIN'),
(201, 15, 1, '2', '6', 'KRISTIN M. TALLO', 'BAUMATA, 17--1990', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(202, 2, 2, '2', '6', 'SRI DEWI A. TALLO', 'BAUMATA, 08-04-1994', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(203, 3, 2, '2', '6', 'FERIYANA NENO', 'BAUMATA, 18-02-1988', 'P', 'KRISTEN', 'S1', '', 'BELUM KAWIN'),
(204, 16, 1, '2', '6', 'YAFRET KORE', 'BATUPUTIH, 04-01-1960', 'L', 'KRISTEN', 'SLTA', 'PETANI', 'KAWIN'),
(205, 2, 2, '2', '6', 'KRISTIN W. KORE', 'POWOROGO, 09-09-1965', 'P', 'KRISTEN', 'SLTA', 'PETANI', 'KAWIN'),
(206, 3, 2, '2', '6', 'ALFIAN KORE', 'FENUN, 19-10-1990', 'L', 'KRISTEN', 'SMA', '', 'KAWIN'),
(207, 4, 2, '2', '6', 'PRIMA ISNANTO KORE', 'FENUN, 17-02-1998', 'L', 'KRISTEN', 'SMA', '', 'BELUM KAWIN'),
(208, 17, 1, '2', '6', 'FRANSISKUS B. NURAK', 'WAINAKE, 10-10-1986', 'L', 'KATOLIK', 'S1', 'HONORER', 'KAWIN'),
(209, 2, 2, '2', '6', 'FLORIDA M. LENDE', 'WAIKABUBAK, 17-02-1986', 'P', 'KATOLIK', 'S1', 'PNS', 'KAWIN'),
(210, 3, 2, '2', '6', 'GABRIEL BAYAN NURAK', 'KUPANG, 14-05-2010', 'L', 'KATOLIK', 'SMP', '', 'BELUM KAWIN'),
(211, 4, 2, '2', '6', 'MARCELO ARON NURAK', 'KUPANG, 10-09-2015', 'L', 'KATOLIK', 'SD', '', 'BELUM KAWIN'),
(212, 18, 1, '2', '6', 'SYEM HUMAU', 'FENUN, 03-09-1966', 'L', 'KRISTEN', 'SD', 'PETANI', 'BELUM KAWIN'),
(213, 19, 1, '2', '6', 'BASTIAN HUMAU', 'KUATNANA, 27-11-1978', 'L', 'KRISTEN', 'SLTA', 'PNS', 'KAWIN'),
(214, 2, 2, '2', '6', 'BECI LIDYA NOMATE', 'KALABAHI, 14-05-1984', 'P', 'KRISTEN', 'DIPLOMA', 'PNS', 'KAWIN'),
(215, 3, 2, '2', '6', 'KRISTIANO KUSI HUMAU', 'KUPANG, 13-02-2015', 'L', 'KRISTEN', 'SD', '', 'BELUM KAWIN'),
(216, 1, 1, '4', '11', 'ABRAHAM HANO', '', 'L', 'KRISTEN', '', '', ''),
(217, 2, 4, '4', '11', 'ANGGANI HANNO-LIU', '', 'P', 'KRISTEN', '', '', ''),
(218, 1, 4, '4', '11', 'ALEXANDER HONIN', 'OELNAOH, 27-04-1963', 'L', 'KATOLIK', 'SD', '', 'KAWIN'),
(219, 2, 4, '4', '11', 'YONIMA HONIN-SAKAU', 'KOPU, 30-06-1964', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(220, 3, 4, '4', '11', 'PITER HONIN', 'OELNOAH, 15-06-1987', 'L', 'KATOLIK', 'SLTA', '', ''),
(221, 4, 4, '4', '11', 'ELIAS HONIN', 'OELNOAH, 01-09-1993', 'L', 'KATOLIK', 'SLTA', '', ''),
(222, 5, 4, '4', '11', 'SIMTI DEBORA HONIN', 'OELNOAH, 09-12-1997', 'P', 'KATOLIK', 'SLTA', '', ''),
(223, 6, 4, '4', '11', 'ABIUT HONIN', 'OELNOAH, 30-11-2004', 'L', 'KATOLIK', 'SD', '', ''),
(224, 7, 4, '4', '11', 'PUTRI HONIN', '', 'P', 'KATOLIK', '', '', ''),
(225, 1, 4, '4', '11', 'DORKAS KONIS', 'KOPU, 07-12-1957', 'P', 'KRISTEN', '', '', ''),
(226, 2, 4, '4', '11', 'DAUD KONIS', 'OELNOAH, 26-12-1982', 'L', 'KRISTEN', '', '', ''),
(227, 3, 4, '4', '11', 'YUMIMA KONIS', 'OELNOAH, 24-06-1985', 'P', 'KRISTEN', '', '', ''),
(228, 4, 4, '4', '11', 'HAFLI KONIS', 'OELNOAH, 23-10-1990', 'L', 'KRISTEN', '', '', ''),
(229, 5, 4, '4', '11', 'OBAJA KONIS', 'OELNOAH, 05-10-1987', 'L', 'KRISTEN', '', '', ''),
(230, 6, 4, '4', '11', 'MELKIANUS KONIS', 'OELNOAH, 24-03-1993', 'L', 'KRISTEN', '', '', ''),
(231, 1, 4, '4', '11', 'FERDINAN KONIS', 'OELNOAH, 25-02-1962', 'L', 'KRISTEN', 'SD', '', 'KAWIN'),
(232, 2, 4, '4', '11', 'MARGARITA KONIS', 'OELNOAH, 05-03-1977', 'P', 'KRISTEN', 'SD', '', 'KAWIN'),
(233, 3, 4, '4', '11', 'NMARDI Y. KONIS', 'OELNOAH, 22-07-2000', 'L', 'KRISTEN', 'SLTP', '', ''),
(234, 4, 4, '4', '11', 'ELMUS Y. KONIS', 'OELNOAH, 02-07-2005', 'L', 'KRISTEN', 'SD', '', ''),
(235, 1, 4, '4', '11', 'FREDERIKA KANIS', 'OELNOAH, 02-02-1953', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(236, 2, 4, '4', '11', 'MILKA MASU', 'OELNOAH, 10-10-1976', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(237, 3, 4, '4', '11', 'DOMINGGUS KONIS', 'OELNOAH, 20-12-1984', 'L', 'KATOLIK', 'SD', '', ''),
(238, 4, 4, '4', '11', 'PAULUS SEIPITU', 'OELNOAH, 05-02-1990', 'L', 'KATOLIK', 'SD', '', ''),
(239, 5, 4, '4', '11', 'HOFNI A. MASU', 'OELNOAH, 23-09-2003', 'L', 'KATOLIK', 'SD', '', ''),
(240, 6, 1, '4', '11', 'FERDINAN HANO', '', 'L', 'PROTESTAN', '', '', ''),
(241, 2, 4, '4', '11', 'YESKIAL HANO', '', 'P', 'PROTESTAN', '', '', ''),
(242, 3, 4, '4', '11', 'YUBLINA HANO', '', 'L', 'PROTESTAN', '', '', ''),
(243, 4, 4, '4', '11', 'YERMIAS HANO', '', 'L', 'PROTESTAN', '', '', ''),
(244, 5, 4, '4', '11', 'YANE HANO', '', 'P', 'PROTESTAN', '', '', ''),
(245, 6, 4, '4', '11', 'ROSIANA HANO', '', 'P', 'PROTESTAN', '', '', ''),
(246, 7, 4, '4', '11', 'NIKSON HANO', '', 'L', 'PROTESTAN', '', '', ''),
(247, 8, 4, '4', '11', 'APLONIA HANO', '', 'P', 'PROTESTAN', '', '', ''),
(248, 1, 4, '4', '11', 'FRANS CUNFIN', 'OBEN, 05-02-1980', 'L', 'KATOLLIK', 'SD', '', 'KAWIN'),
(249, 2, 4, '4', '11', 'FELPINA CUNFIN', '', 'P', 'KATOLLIK', 'SD', '', 'KAWIN'),
(250, 3, 4, '4', '11', 'KLARISAN CUNFIN', 'OBEN, 18-11-2009', '', 'KATOLLIK', '', '', ''),
(251, 4, 4, '4', '11', 'SOFIANA JULITA', 'OBEN, 06-07-2013', '', 'KATOLLIK', '', '', ''),
(252, 1, 4, '4', '11', 'FELPINA HANO', 'OELNOAH, 18-02-1959', 'L', 'PROTESTAN', 'SD', '', 'KAWIN'),
(253, 2, 4, '4', '11', 'MARTIS HANO', 'OELNOAH, 23-03-1985', 'P', 'PROTESTAN', 'SD', '', ''),
(254, 3, 4, '4', '11', 'DAVID HANO', 'OELNOAH, 04-12-1989', 'P', 'PROTESTAN', 'SD', '', ''),
(255, 1, 4, '4', '11', 'JAKOB RUKU', 'TUNBEUN, 08-01-1959', 'L', 'PROTESTAN', 'SLTA', '', 'KAWIN'),
(256, 2, 4, '4', '11', 'ELISABET TIMUNENO', 'NEFO, 15-11-1959', 'P', 'PROTESTAN', 'PT', '', 'KAWIN'),
(257, 3, 4, '4', '11', 'TRESY W. RUKU', 'BONEN, 10-09-1992', 'P', 'PROTESTAN', 'PT', '', ''),
(258, 4, 4, '4', '11', 'DULY Y. RUKU', 'BONEN, 05-09-1995', 'P', 'PROTESTAN', 'PT', '', ''),
(259, 5, 4, '4', '11', 'ADISENO RUKU', 'BONEN, 05-10-1998', 'L', 'PROTESTAN', 'PT', '', ''),
(260, 10, 1, '4', '11', 'LORENS HANO', '', 'L', 'KATOLIK', 'SD', '', ''),
(261, 2, 4, '4', '11', 'ELISABET NEBNENO', '', 'P', 'KATOLIK', 'SD', '', ''),
(262, 3, 4, '4', '11', 'AMINADAB HANO', '', 'L', 'KATOLIK', 'SD', '', ''),
(263, 4, 4, '4', '11', 'SUSANA HANO', '', 'P', 'KATOLIK', 'SD', '', ''),
(264, 5, 4, '4', '11', 'ANDONIA HANO', '', 'P', 'KATOLIK', 'SD', '', ''),
(265, 6, 4, '4', '11', 'YUNUS HANO', '', 'L', 'KATOLIK', 'SD', '', ''),
(266, 7, 4, '4', '11', 'FEBIANA HANO', '', 'P', 'KATOLIK', 'SD', '', ''),
(267, 8, 4, '4', '11', 'JEMI HANO', '', 'L', 'KATOLIK', 'SD', '', ''),
(268, 9, 4, '4', '11', 'SIMON HANO', '', 'L', 'KATOLIK', 'SD', '', ''),
(269, 1, 4, '4', '11', 'MARKUS OEMATAN', 'OBEN, 01-03-1964', 'L', 'KATOLIK', 'SD', '', ''),
(270, 2, 4, '4', '11', 'MARGARITA OEMATAN', 'BONEN, 17-05-1964', 'P', 'KATOLIK', 'SD', '', ''),
(271, 3, 4, '4', '11', 'YANDRI OEMATAN', 'OBEN, 14-01-1987', 'P', 'KATOLIK', '', '', ''),
(272, 4, 4, '4', '11', 'DANIEL OEMATAN', 'OBEN, 25-12-1993', 'L', 'KATOLIK', '', '', ''),
(273, 5, 4, '4', '11', 'NAFRIT OEMATAN', 'OBEN, 16-12-2007', 'L', 'KATOLIK', '', '', ''),
(274, 1, 4, '4', '11', 'MIKAEL NENO', 'NAIKNENAS, 31-12-1953', 'L', 'KATOLIK', 'PT', '', ''),
(275, 2, 4, '4', '11', 'ROSALINDA BE G.H', 'TUA MAMORAN, 28-08-1958', 'P', 'KATOLIK', 'SLTA', '', ''),
(276, 1, 4, '4', '11', 'NAEMA KANIS FUTBO', '', 'L', 'KATOLIK', 'BH', '', ''),
(277, 2, 4, '4', '11', 'YAKOBIS FUTBO', 'BANOHA, 20-01-1972', 'P', 'KATOLIK', 'SD', '', ''),
(278, 3, 4, '4', '11', 'YOHANS FUTBO', 'BANOHA, 16-08-1976', 'P', 'KATOLIK', 'SD', '', ''),
(279, 4, 4, '4', '11', 'DORKAS FUTBO', 'BANOHA, 21-12-1982', 'P', 'KATOLIK', 'SD', '', ''),
(280, 5, 4, '4', '11', 'LISA RIANTI FUTBO', 'OELNOAH, 08-08-2003', 'P', 'KATOLIK', 'SD', '', ''),
(281, 1, 4, '4', '11', 'NIKOLAS BAHAS', 'OELNOA, 12-11-1943', 'L', 'PROTESTAN', 'SD', '', 'KAWIN'),
(282, 2, 4, '4', '11', 'SARAH BAHAS', 'BIKOLAN, 01-08-1952', 'P', 'PROTESTAN', 'BH', '', 'KAWIN'),
(283, 3, 4, '4', '11', 'YERMIAS BANOA', 'OELNOA, 10-01-1982', 'L', 'PROTESTAN', 'SD', '', ''),
(284, 4, 4, '4', '11', 'DEFTIANIS KONIS', 'OELNOA, 12-12-2008', 'L', 'PROTESTAN', '', '', ''),
(285, 15, 1, '4', '11', 'ORPA LALUS', 'BINILAKA, 10-10-1949', 'P', 'PROTESTAN', '', '', ''),
(286, 2, 4, '4', '11', 'HENDERINA LALUS', 'OBEN, 16-07-1976', 'P', 'PROTESTAN', '', '', ''),
(287, 3, 4, '4', '11', 'MARTINUS LALUS', 'OBEN, 05-03-1984', 'L', 'PROTESTAN', '', '', ''),
(288, 4, 4, '4', '11', 'YOHANA LALUS', 'OBEN, 11-07-1992', 'P', 'PROTESTAN', '', '', ''),
(289, 5, 4, '4', '11', 'YUBLINA LALUS', 'OBEN, 21-01-1999', 'P', 'PROTESTAN', '', '', ''),
(290, 6, 4, '4', '11', 'SIMSON LALUS', 'OBEN, 10-08-2002', 'L', 'PROTESTAN', '', '', ''),
(291, 7, 4, '4', '11', 'YUSTIN LALUS', '', 'P', 'PROTESTAN', '', '', ''),
(292, 8, 4, '4', '11', 'YASTI LALUS', '', 'P', 'PROTESTAN', '', '', ''),
(293, 16, 1, '4', '11', 'PETRUS BANOA', 'OELNOA, 21-02-1972', 'L', 'PROTESTAN', 'SD', '', 'KAWIN'),
(294, 2, 4, '4', '11', 'YURENS HANOBLINA BANAO', 'OELNO, 27-06-1998', 'P', 'PROTESTAN', 'SLTP', '', ''),
(295, 17, 1, '4', '11', 'SOLEMAN KONIS', '', 'L', 'PROTESTAN', 'SD', '', ''),
(296, 2, 4, '4', '11', 'ADRIANA KONIS', '', 'P', 'PROTESTAN', 'SD', '', ''),
(297, 3, 4, '4', '11', 'PAULUS KONIS', '', 'L', 'PROTESTAN', 'SLTA', '', ''),
(298, 4, 4, '4', '11', 'ABIUT KONIS', '', 'L', 'PROTESTAN', 'SLTP', '', ''),
(299, 5, 4, '4', '11', 'ELIAS KONIS', '', 'L', 'PROTESTAN', 'SD', '', ''),
(300, 18, 1, '4', '11', 'SIMON KONIS', 'OELNOAH, 13-09-1977', 'L', 'PROTESTAN', 'SLTP', '', 'KAWIN'),
(301, 2, 4, '4', '11', 'YANCE KONIS HENOK', 'HAIMATA, 08-07-1983', 'P', 'PROTESTAN', 'SD', '', 'KAWIN'),
(302, 3, 4, '4', '11', 'ROY PETER KONIS', 'OELNOAH, 10-11-2006', 'L', 'PROTESTAN', 'SD', '', ''),
(303, 4, 4, '4', '11', 'METI JELITA KONIS', 'OELNOAH, 08-05-2009', 'P', 'PROTESTAN', 'SD', '', ''),
(304, 19, 1, '4', '11', 'STEFANUS KONIS', 'OELNOAH, 09-09-1959', 'L', 'PROTESTAN', 'DO', '', 'KAWIN'),
(305, 2, 4, '4', '11', 'MARSALINA KONIS', 'FATUTIAPI, 26-03-1965', 'P', 'PROTESTAN', 'SD', '', 'KAWIN'),
(306, 3, 4, '4', '11', 'LORENS HANO', 'OELNOAH, 06-07-1988', 'P', 'PROTESTAN', 'SD', '', ''),
(307, 4, 4, '4', '11', 'YUSUF KONIS', 'OELNOAH, 25-07-1997', 'L', 'PROTESTAN', 'SD', '', ''),
(308, 5, 4, '4', '11', 'MAXI KONIS', 'OELNOAH, 17-05-1999', 'L', 'PROTESTAN', 'SLTP', '', ''),
(309, 20, 1, '4', '11', 'SEMOEL HANO', 'OELNOAH, 01-09-1956', 'L', 'PROTESTAN', 'SD', '', ''),
(310, 2, 4, '4', '11', 'OBEFFINA HANO', 'KOPU, 13-10-1957', 'P', 'PROTESTAN', 'SD', '', ''),
(311, 3, 4, '4', '11', 'NEKODEMUS HANO', 'OELNOAH, 20-05-1992', '', 'PROTESTAN', 'PT', '', ''),
(312, 4, 4, '4', '11', 'KORNALIUS HANO', 'OELNOAH, 18-02-1999', 'L', 'PROTESTAN', 'SLTP', '', ''),
(313, 5, 4, '4', '11', 'DARIUS HANO', 'OELNOA, 05-12-1989', '', 'PROTESTAN', 'SD', '', ''),
(314, 21, 1, '4', '11', 'SAUL KONIS', 'OELNOAH, 09-09-1948', 'L', 'PROTESTAN', 'SD', '', 'KAWIN'),
(315, 2, 4, '4', '11', 'ADOLFINA KONIS', 'OELNOAH, 15-08-1956', 'P', 'PROTESTAN', 'SD', '', 'KAWIN'),
(316, 3, 4, '4', '11', 'OCIAS KONIS', 'OELNOAH, 19-06-1979', 'L', 'PROTESTAN', 'SLTP', '', ''),
(317, 4, 4, '4', '11', 'SARLOTA KONIS', 'OELNOAH, 05-09-1987', 'P', 'PROTESTAN', 'SD', '', ''),
(318, 5, 4, '4', '11', 'YOSINA KONIS', 'OELNOAH, 05-01-1990', 'P', 'PROTESTAN', 'SLTP', '', ''),
(319, 6, 4, '4', '11', 'MESAK KONIS', 'OELNOAH, 15-05-1994', 'L', 'PROTESTAN', 'SLTA', '', ''),
(320, 7, 4, '4', '11', 'YOLIFEN KONIS', 'OELNOAH, 11-06-2001', 'L', 'PROTESTAN', 'SLTP', '', ''),
(321, 8, 4, '4', '11', 'CRISTIN G. KONIS', 'OELNOAH, 28-12-2008', 'P', '', 'SD', '', ''),
(322, 22, 1, '4', '11', 'SEM KONIS', '', 'L', 'KATOLIK', 'SLTA', '', ''),
(323, 2, 4, '4', '11', 'JENI KONIS', '', 'P', 'KATOLIK', 'SLTA', '', ''),
(324, 3, 4, '4', '11', 'ELBERT KONIS', '', 'P', 'KATOLIK', 'SD', '', ''),
(325, 4, 4, '4', '11', 'RIZKY KONIS', '', 'L', 'KATOLIK', '', '', ''),
(326, 23, 1, '4', '11', 'YESKIEL HONIN', 'OELNOAH, 14-06-1973', 'L', 'KATOLIK', 'SLTA', '', 'KAWIN'),
(327, 2, 4, '4', '11', 'MILKA HONIN', 'FENUN, 03-03-1979', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(328, 3, 4, '4', '11', 'OBILIAM HONIN', 'OELNOAH, 18-10-2008', 'L', 'KATOLIK', '', '', ''),
(329, 4, 4, '4', '11', 'JENIFER HONIN', 'OELNOAH, 15-01-2010', 'P', 'KATOLIK', '', '', ''),
(330, 24, 1, '4', '11', 'THOMAS OEMATAN', 'OBEN, 13-03-1940', 'L', 'KATOLIK', 'SD', '', 'KAWIN'),
(331, 2, 4, '4', '11', 'MARIA A. OEMATAN', 'OBEN, 18-04-1974', 'P', 'KATOLIK', 'SD', '', ''),
(332, 3, 4, '4', '11', 'DARIUS OEMATAN', 'OBEN, 21-02-1997', 'L', 'KATOLIK', 'SLTP', '', ''),
(333, 4, 4, '4', '11', 'SONYAFITA OEMATAN', 'OBEN, 04-09-2005', 'P', 'KATOLIK', 'SD', '', ''),
(334, 25, 1, '4', '11', 'YERMIAS BAITANU', 'OBEN, 11-06-1972', 'L', 'KATOLIK', 'SD', '', 'KAWIN'),
(335, 2, 4, '4', '11', 'MADA TAKESAN', 'KAPAN, 12-03-1979', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(336, 3, 4, '4', '11', 'LORENSIUS BAITANU', 'OBEN, 28-09-2004', 'L', 'KATOLIK', 'SD', '', ''),
(337, 4, 4, '4', '11', 'YAKOB BAITANU', 'OBEN, 11-06-2008', 'L', 'KATOLIK', '-', '', ''),
(338, 5, 4, '4', '11', 'GARADUS AMNAHAS', 'OBEN, 16-08-1998', 'L', 'KATOLIK', 'SD', '', ''),
(339, 6, 4, '4', '11', 'RAIMONDUS BAITANU', 'OBEN, 22-02-2006', 'L', 'KATOLIK', 'SD', '', ''),
(340, 7, 4, '4', '11', 'ARIANTO BAITANU', 'OBEN, 08-08-2013', 'L', 'KATOLIK', 'SD', '', ''),
(341, 26, 1, '4', '11', 'YOHANIS OLIN', 'OBEN, 08-01-1983', 'L', 'KATOLIK', 'SD', '', 'KAWIN'),
(342, 2, 4, '4', '11', 'ORPA OLIN BAIS', 'KAPAN, 10-10-1983', 'P', 'KATOLIK', 'SD', '', 'KAWIN'),
(343, 3, 4, '4', '11', 'YOHANA OLIN', 'OBEN, 31-12-2008', 'P', 'KATOLIK', '-', '', ''),
(344, 27, 1, '4', '11', 'YOHANES TANEO', 'PANA, 01-01-1961', 'L', 'PROTESTAN', '', '', ''),
(345, 2, 4, '4', '11', 'YOSINA TANEO', 'PANA, 18-02-1969', 'P', 'PROTESTAN', '', '', ''),
(346, 3, 4, '4', '11', 'NAOMI TANEO', 'OBEN, 24-11-1999', 'P', 'PROTESTAN', '', '', ''),
(347, 4, 4, '4', '11', 'YUSTINA TANEO', 'OBEN, 27-07-2002', 'P', 'PROTESTAN', '', '', ''),
(348, 5, 4, '4', '11', 'ROBI T. TANEO', 'OBEN, 19-01-2005', 'L', 'PROTESTAN', '', '', ''),
(349, 6, 4, '4', '11', 'ARYANTO TANEO', 'OBEN, 02-04-2007', 'L', 'PROTESTAN', '', '', ''),
(350, 28, 1, '4', '11', 'YULIANA HANO', 'OBEN, 16-06-1958', 'P', 'KATOLIK', '', '', ''),
(351, 2, 4, '4', '11', 'AGUSTINA CUNFIN', 'OBEN, 05-08-1983', 'P', 'KATOLIK', '', '', ''),
(352, 3, 4, '4', '11', 'SIMON CUNFIN', 'OBEN, 05-01-1996', 'L', 'KATOLIK', '', '', ''),
(353, 4, 4, '4', '11', 'PETRUS CUNFIN', 'OBEN, 28-03-2004', 'L', 'KATOLIK', '', '', ''),
(354, 5, 4, '4', '11', 'ROSA CUNFIN', 'OBEN, 07-10-2006', 'P', 'KATOLIK', '', '', ''),
(540, 1, 1, '2', '4', 'SIMSON NABEN', 'FENUN, 25-11-1967', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(541, 2, 2, '2', '4', 'YOHANA NABEN .H', 'NISA, 09-06-1972', 'P', NULL, 'SD', 'IRT', 'KAWIN'),
(542, 3, 3, '2', '4', 'ARBET NABEN', 'FENUN, 14-07-1994', 'L', NULL, NULL, NULL, NULL),
(543, 4, 4, '2', '4', 'JAKSON A. NABEN', 'FENUN, 03-06-1997', 'L', NULL, 'SARJANA', NULL, NULL),
(544, 5, 1, '2', '4', 'MARTHEN ATOLLO', 'BAUMATA, 27-03-1957', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(545, 6, 2, '2', '4', 'OKTOVIANA M.A. ATOLLO', 'BAUMATA, 30-10-1970', 'P', NULL, 'SD', 'IRT', 'KAWIN'),
(546, 7, 3, '2', '4', 'ELIAS ATOLLO', 'BAUMATA, 04-07-1987', 'L', NULL, 'SD', NULL, NULL),
(547, 8, 4, '2', '4', 'THERESIA ATTOLO', 'BAUMATA, 10-01-1992', 'P', NULL, 'SARJANA', NULL, NULL),
(548, 9, 5, '2', '4', 'HILDA ATOLLO', 'BAUMATA, 27-09-1994', 'P', NULL, 'SARJANA', 'HONOR GURU', NULL),
(549, 10, 6, '2', '4', 'SEMI YACOB ATOLLO', 'BAUMATA, 27-03-1997', 'L', NULL, 'SMA', 'OJEK', NULL),
(550, 11, 7, '2', '4', 'NOVEM G. ATOLLO', 'BAUMATA, 14-11-2001', 'L', NULL, 'PT', NULL, NULL),
(551, 12, 8, '2', '4', 'ANDRA J. ATOLLO', 'BAUMATA, 13-06-2007', 'L', NULL, 'SMP', NULL, NULL),
(552, 13, 1, '2', '4', 'MARTHA AHAS-KEDAFI', 'BAUMATA, 17-07-1947', 'P', 'KATHOLIK', 'SMP', NULL, NULL),
(553, 14, 2, '2', '4', 'YOHANIS AHAS', 'MANGGARAI, 10-01-1971', 'L', NULL, 'SARJANA', 'PNS', 'KAWIN'),
(554, 15, 3, '2', '4', 'HELENA MARIA', 'KUPANG, 26-04-1981', 'P', NULL, 'SARJANA', 'PNS', 'KAWIN'),
(555, 16, 1, '2', '4', 'LORENS LAKAT', 'FENUN, 01-07-1938', 'L', 'KRISTEN', 'BH', 'PETANI', 'KAWIN'),
(556, 17, 2, '2', '4', 'TAROCI LAKAT-OLLA', 'FENUN, 04-04-1954', 'P', NULL, 'SD', 'IRT', 'KAWIN'),
(557, 18, 1, '2', '4', 'YONATHAN LAKAT', 'FENUN, 09-06-1977', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(558, 19, 2, '2', '4', 'MARTHA DEBRINA TNEH', 'NEUMUKE, 14-05-1978', 'P', NULL, 'SMA', 'IRT', 'KAWIN'),
(559, 20, 1, '2', '4', 'YUNUS FOBIA', 'TTS, 30-06-1975', 'L', 'KRISTEN', 'SMA', 'WIRASWASTA', 'KAWIN'),
(560, 21, 2, '2', '4', 'FINCE Y. FOBIA .T', 'TTS, 29-09-1975', 'P', NULL, 'SD', 'IRT', 'KAWIN'),
(561, 22, 3, '2', '4', 'YUNINGSIH M. FOBIA', 'TTS, 08-07-1999', 'P', NULL, 'SARJANA', NULL, NULL),
(562, 23, 4, '2', '4', 'JUANYTO N. FOBIA', 'TTS, 07-06-2003', 'L', NULL, 'PT', NULL, NULL),
(563, 24, 5, '2', '4', 'ARYO A. FOBIA', 'TTS, 29-04-2009', 'L', NULL, 'SMP', NULL, NULL),
(564, 25, 6, '2', '4', 'ORENYTA FOBIA', 'TTS, 28-10-2011', 'P', NULL, 'SMP', NULL, NULL),
(565, 26, 7, '2', '4', 'JULYO O. FOBIO', 'TTS, 24-07-2013', 'L', NULL, 'SD', NULL, NULL),
(566, 7, 1, '2', '4', 'ANDREAS KOLO', 'KEFA, 17-12-1965', 'L', 'KATHOLIK', 'SD', 'PETANI', 'KAWIN'),
(567, 8, 2, '2', '4', 'VERONIKA KOLO-NINO', 'KEFA, 24-04-1971', 'P', NULL, 'SD', NULL, 'KAWIN'),
(568, 9, 3, '2', '4', 'MARIA F.D. KOLO', 'KUPANG, 09-11-1993', 'P', NULL, 'SARJANA', NULL, NULL),
(569, 10, 4, '2', '4', 'DANIEL KOLO', 'KUPANG, 20-08-1997', 'L', NULL, 'SMA', NULL, NULL),
(570, 11, 5, '2', '4', 'ANTONIUS KOLO', 'KUPANG, 26-11-1999', 'L', NULL, 'SMA', NULL, NULL),
(571, 12, 6, '2', '4', 'GREGORIUS KOLO', 'KUPANG, 02-01-2006', 'L', NULL, 'SMA', NULL, NULL),
(572, 13, 7, '2', '4', 'RIYANTUS KOLO', 'KUPANG, 07-11-2008', 'L', NULL, 'SMP', NULL, NULL),
(573, 14, 1, '2', '4', 'ROBERT A. SOLE', 'TTS, 05-07-1978', 'L', 'KRISTEN', 'SARJANA', 'PNS', 'KAWIN'),
(574, 15, 2, '2', '4', 'SERLI S. SOLE .B', 'LASIANA, 24-07-1981', 'P', NULL, 'SMA/SARJANA', 'BIDAN', 'KAWIN'),
(575, 16, 3, '2', '4', 'ROLLYIN M. SOLE', 'KUPANG, 01-06-2008', 'P', NULL, 'PT', NULL, NULL),
(576, 17, 4, '2', '4', 'SAMUEL JK. SOLE', 'KUPANG, 24-10-2008', 'L', NULL, 'SMP', NULL, NULL),
(577, 18, 5, '2', '4', 'JOHANIS A. SOLE', 'KUPANG, 01-11-2012', 'L', NULL, 'SD', NULL, NULL),
(578, 19, 1, '2', '4', 'YOHANIS KOROH', 'BABAU, 12-06-1950', 'L', 'KRISTEN', 'SMA', 'PENSIUN', 'KAWIN'),
(579, 20, 2, '2', '4', 'KHATERINA KOROH . BERIBE', 'PENFUI, 03-03-1963', 'P', NULL, 'SD', NULL, 'KAWIN'),
(580, 21, 3, '2', '4', 'JEMY V. KOROH', 'KUPANG, 09-12-1982', 'L', NULL, 'SARJANA', 'KARYAWAN BANDARA', NULL),
(581, 22, 4, '2', '4', 'MARIA HELEN KOROH', 'BAJAWA, 18-08-1982', 'P', 'KATHOLIK', 'SARJANA', 'BIDAN', NULL),
(582, 23, 5, '2', '4', 'CHARLY F. KOROH', 'KUPANG, 17-12-2009', 'L', NULL, 'SMP', NULL, NULL),
(583, 24, 6, '2', '4', 'ANDRYEL Y. KOROH', 'KUPANG, 27-11-2012', 'L', NULL, 'SD', NULL, NULL),
(584, 25, 7, '2', '4', 'SANDRYNA KOROH', 'BAUMATA, 29-04-2004', 'P', NULL, 'SMA', NULL, NULL),
(585, 26, 1, '2', '4', 'ZAKARIAS NABEN', 'FENUN, 08-09-1972', 'L', 'KRISTEN', 'SMA', 'PETANI', 'KAWIN'),
(586, 27, 2, '2', '4', 'MARLENI NABEN . T', 'FENUN, 21-12-1979', 'P', NULL, 'SD', NULL, 'KAWIN'),
(587, 28, 3, '2', '4', 'ROY SILVIANUS NABEN', 'KUPANG, 19-09-2002', 'L', NULL, 'SMA', NULL, NULL),
(588, 29, 4, '2', '4', 'JUAN ANDREAS NABEN', 'KUPANG, 26-01-2005', 'L', NULL, 'BH', NULL, NULL),
(589, 30, 5, '2', '4', 'BELLVANIA E. NABEN', 'KUPANG, 13-04-2022', 'P', NULL, NULL, NULL, NULL),
(590, 11, 1, '2', '4', 'SIMON PIT\'AY', 'OELBUBUK, 24-04-1978', 'L', 'KRISTEN', 'SARJANA', 'PNS', 'KAWIN'),
(591, 12, 2, '2', '4', 'WENNY PIT\'AY-KOROH', 'PENFUI, 23-08-1980', 'P', NULL, 'SARJANA', 'WIRASWASTA', 'KAWIN'),
(592, 13, 3, '2', '4', 'GLANEZTA PIT\'AY', 'KUPANG, 03-08-2020', 'L', NULL, NULL, NULL, NULL),
(593, 14, 1, '2', '4', 'SERAN RONYALDUS', 'PALEMBANG, 27-02-1958', 'L', 'KATHOLIK', 'SMA', 'PENSIUN', 'KAWIN'),
(594, 15, 2, '2', '4', 'NAOMI HANING', 'KUPANG, 10-10-1969', 'P', 'KATHOLIK', 'SD', NULL, 'KAWIN'),
(595, 16, 3, '2', '4', 'ROMLI A. SERAN', 'KUPANG, 15-08-1990', 'L', 'KATHOLIK', 'SMA', 'KARYAWAN BANDARA', NULL),
(596, 17, 4, '2', '4', 'LISNA THERESIA SERAN', 'KUPANG, 14-01-1997', 'P', 'KATHOLIK', 'PT', NULL, NULL),
(597, 18, 5, '2', '4', 'MARIA C.C SERAN', 'KUPANG, 17-07-2000', 'P', 'KATHOLIK', 'PT', NULL, NULL),
(598, 19, 6, '2', '4', 'NATSYA Y.C SERAN', 'KUPANG, 15-01-2008', 'P', 'KATHOLIK', 'SMP', NULL, NULL),
(599, 20, 1, '2', '4', 'BERTHOLOMEOS MAMO', 'FENUN, 14-07-1962', 'L', 'KRISTEN', 'BH', 'PETANI', 'KAWIN'),
(600, 21, 2, '2', '4', 'RAHEL MAMO MESSE', 'BILAMUN, 07-11-1965', 'P', 'KRISTEN', 'SD', NULL, 'KAWIN'),
(601, 22, 3, '2', '4', 'RETOR JOY MAMO', 'FENUN, 17-07-1990', 'L', 'KRISTEN', 'SMA', NULL, NULL),
(602, 23, 4, '2', '4', 'ERNA A. MAMO', 'FENUN, 01-01-1993', 'P', 'KRISTEN', 'SMA', NULL, NULL),
(603, 24, 5, '2', '4', 'SEN S. MAMO', 'FENUN, 12-01-1997', 'L', 'KRISTEN', 'SMA', NULL, NULL),
(604, 25, 6, '2', '4', 'YUNA WELMI MAMO', 'FENUN, 19-03-2000', 'P', 'KRISTEN', 'PT', NULL, NULL),
(605, 26, 1, '2', '4', 'MARKUS HUMAU', 'OELTUA, 21-03-1971', 'L', 'KRISTEN', 'SD', 'PETANI', NULL),
(606, 27, 2, '2', '4', 'BACEBA HUMAU', 'FENUN, 13-09-1977', 'P', 'KRISTEN', 'SD', NULL, NULL),
(607, 28, 3, '2', '4', 'DURHANS HUMAU', 'FENUN, 01-01-1983', 'L', 'KRISTEN', 'SD', NULL, NULL),
(608, 29, 1, '2', '4', 'HELENA PALURUAN', 'RAUTEPAO, 11-01-1950', 'P', 'ISLAM', 'SMA', 'PENSIUN', NULL),
(609, 30, 1, '2', '4', 'ALFONSUS FINIT', 'BINONI, 23-01-1987', 'L', 'KRISTEN', 'SMA', 'TUKANG BANGUNAN', 'KAWIN'),
(610, 31, 2, '2', '4', 'HERLI MATELDA MAMO', 'FENUN, 29-10-1987', 'P', 'KRISTEN', 'SMA', NULL, 'KAWIN'),
(611, 32, 3, '2', '4', 'ANJELI G. FINIT', 'BAUMATA, 19-07-2014', 'P', 'KRISTEN', 'SD', NULL, NULL),
(612, 33, 1, '2', '4', 'YANTO LEO', 'BINONI, 05-03-1986', 'L', 'KRISTEN', 'SMP', 'TUKANG BANGUNAN', 'KAWIN'),
(613, 34, 2, '2', '4', 'NOVILIA LEO MAMO', 'MANEFU, 28-11-1986', 'P', 'KRISTEN', 'SMP', NULL, 'KAWIN'),
(614, 35, 3, '2', '4', 'MARTHIN A. LEO', 'FENUN, 27-03-2010', 'L', 'KRISTEN', 'SMP', NULL, NULL),
(615, 36, 4, '2', '4', 'LHODIANA LEO', 'FENUN, 25-05-2015', 'P', 'KRISTEN', 'SD', NULL, NULL),
(616, 37, 1, '2', '4', 'PITER M. KOROH', 'LAOS, 12-11-1987', 'L', 'KRISTEN', 'SMA', 'PNS', 'KAWIN'),
(617, 38, 2, '2', '4', 'EDEL TRUDIS M. KOROH', 'REGO, 26-06-1985', 'P', 'KRISTEN', 'SMA', NULL, 'KAWIN'),
(618, 39, 3, '2', '4', 'A. BRAM KOROH', 'LAOS, 24-04-2011', 'L', 'KRISTEN', 'SD', NULL, NULL),
(619, 40, 4, '2', '4', 'INDRI S. KORO', 'BAUMATA, 11-08-2014', 'P', 'KRISTEN', 'SD', NULL, NULL),
(620, 41, 5, '2', '4', NULL, 'BAUMATA, 29-07-2022', 'L', 'KRISTEN', 'BH', NULL, NULL),
(621, 42, 1, '2', '4', 'YOHANES HUMAU', 'ODANISA, 14-06-1963', 'L', 'PROTESTAN', 'SMA', 'TANI', 'KAWIN'),
(622, 43, 2, '2', '4', 'ADDVINA HUMAU', NULL, 'P', 'PROTESTAN', 'SD', NULL, 'KAWIN'),
(623, 44, 3, '2', '4', 'SIMON SEUBELAN', 'WINI, 08-10-1994', 'L', 'PROTESTAN', 'SMA', NULL, NULL),
(624, 45, 4, '2', '4', 'YANI R HUMAU', 'KUPANG, 31-01-2000', 'P', 'PROTESTAN', 'P.T', NULL, NULL),
(625, 46, 5, '2', '4', 'RUT HUMAU', 'KUPANG', 'P', 'PROTESTAN', 'BH', NULL, NULL),
(626, 47, 1, '2', '4', 'MARICE HUMAU', 'FENUN, 01-05-1967', 'L', 'PROTESTAN', 'BH', 'PETANI', NULL),
(627, 48, 2, '2', '4', 'LIES A HUMAU', 'FENUN, 24-04-1989', 'P', 'PROTESTAN', 'SARJANA/S1', NULL, NULL),
(628, 49, 3, '2', '4', 'SEFNAT HUMAU', 'FENUN, 23-09-1992', 'P', 'PROTESTAN', 'SMA', NULL, NULL),
(629, 50, 4, '2', '4', 'YUFRIT HUMAU', 'FENUN, 29-07-2001', 'L', 'PROTESTAN', 'SMA', NULL, NULL),
(630, 51, 5, '2', '4', 'DESRY. Y LODIA HUMAU', 'FENUN, 16-12-2009', 'P', 'PROTESTAN', 'SMP', NULL, NULL),
(631, 52, 1, '2', '4', 'NIMROD MAMO', 'FENUN, 12-09-1994', 'L', 'PROTESTAN', 'BH', 'PETANI', 'KAWIN'),
(632, 53, 2, '2', '4', 'MARIA MAMO - HUMAU', 'MANEFU, 07-03-1965', 'P', 'PROTESTAN', 'SD', NULL, 'KAWIN'),
(633, 54, 3, '2', '4', 'YENI. E MAMO', 'MANEFU, 24-06-1988', 'P', 'PROTESTAN', 'SMA', NULL, NULL),
(634, 55, 4, '2', '4', 'MERLYN MAMO', 'FENUN, 03-05-2004', 'P', 'PROTESTAN', 'SMA', NULL, NULL),
(635, 56, 5, '2', '4', 'JITRO. F MAMO', 'FENUN, 17-10-2006', 'L', 'PROTESTAN', 'SMP', NULL, NULL),
(636, 57, 6, '2', '4', 'RAUNEL MAMO', 'FENUN, 13-03-2009', 'L', 'PROTESTAN', 'SMP', NULL, NULL),
(637, 58, 7, '2', '4', 'GIBRAN.J MAMO', 'FENUN, 06-06-2016', 'L', 'PROTESTAN', 'TK', NULL, NULL),
(638, 59, 1, '2', '4', 'ADRIANUS S. BERIBE', 'FENUN, 21-04-1973', 'L', 'KATHOLIK', 'SMP', 'WIRASWASTA', 'KAWIN'),
(639, 60, 2, '2', '4', 'METALIA B. SERAN', 'OELATSALA, 08-08-1974', 'P', 'KATHOLIK', 'SMA', NULL, 'KAWIN'),
(640, 61, 3, '2', '4', 'IMELDA M. BERIBE', 'KUPANG, 31-05-2000', 'P', 'KATHOLIK', 'SMA', NULL, NULL),
(641, 62, 4, '2', '4', 'INDRA Y. BERIBE', 'KUPANG, 18-05-2005', 'L', 'KATHOLIK', 'SMA', NULL, NULL),
(642, 63, 5, '2', '4', 'FRANSISKA S. BERIBE', 'KUPANG, 05-03-2015', 'P', 'KATHOLIK', 'SD', NULL, NULL),
(643, 64, 6, '2', '4', 'RITA FEROHIKA BERIBE', 'KUPANG, 22-05-2018', 'P', 'KATHOLIK', 'TK', NULL, NULL),
(644, 65, 1, '2', '4', 'YULIUS RENO', 'FENUN, 06-06-1958', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(645, 66, 2, '2', '4', 'SARAH SUSANA N. TENEBETH', 'FENUN, 06-09-1965', 'P', 'PROTESTAN', 'SD', NULL, 'KAWIN'),
(646, 67, 3, '2', '4', 'DESET RENO', 'FENUN, 17-12-1994', 'P', 'PROTESTAN', 'SARJANA/S1', NULL, NULL),
(647, 68, 4, '2', '4', 'DEFANTI RENO', 'FENUN, 27-12-1996', 'P', 'PROTESTAN', 'SARJANA/S1', NULL, NULL),
(648, 69, 5, '2', '4', 'ESTON RENO', 'FENUN, 04-06-1998', 'L', 'PROTESTAN', 'PT', NULL, NULL),
(649, 70, 6, '2', '4', 'MERY RENO', 'FENUN, 31-05-2000', 'P', 'PROTESTAN', 'SD', NULL, NULL),
(650, 71, 7, '2', '4', 'VIKTOR LALUS', 'MANEFU, 26-10-1993', 'L', 'PROTESTAN', 'SMA', NULL, NULL),
(651, 72, 1, '2', '4', 'NIMROD HUMAU', 'FENUN, 21-06-1980', 'L', 'PROTESTAN', 'SMP', 'PETANI', 'KAWIN'),
(652, 73, 2, '2', '4', 'YOHANSE LUBALU', 'OESAO, 21-12-1981', 'P', 'PROTESTAN', 'SMA', NULL, 'KAWIN'),
(653, 74, 3, '2', '4', 'D\'CINDRY HUMAU', 'OESAO, 22-12-2009', 'L', 'PROTESTAN', 'SMP', NULL, NULL),
(654, 75, 4, '2', '4', 'BRAIN BOAS HUMAU', 'KUPANG, 27-12-2014', 'P', 'PROTESTAN', 'SD', NULL, NULL),
(655, 76, 1, '2', '4', 'ABIA RENOSABAN', '04-04-70', 'L', 'PROTESTAN', 'SMA', 'WIRASWASTA', 'KAWIN'),
(656, 77, 2, '2', '4', 'SALOMIT RINI', '04-11-76', 'P', 'PROTESTAN', 'SMA', NULL, 'KAWIN'),
(657, 78, 3, '2', '4', 'AERYLIN F. RENOSABAN', 'KUPANG, 03-05-2016', 'P', 'PROTESTAN', 'SD', NULL, NULL),
(658, 79, 1, '2', '4', 'DENI R. HUMAU', 'KUAFEU, 29-12-1983', 'L', 'PROTESTAN', 'SMP', 'PETANI', 'KAWIN'),
(659, 80, 2, '2', '4', 'NURHAYATI HUMAU', 'OELKA, 11-11-1988', 'P', 'PROTESTAN', 'SMA', NULL, 'KAWIN'),
(660, 81, 1, '2', '4', 'MIKAEL RIRO', 'KEFA, 23-29-1979', 'L', 'KATHOLIK', NULL, NULL, NULL),
(661, 82, 1, '2', '4', 'HENDRIK MAMO', 'FENUN, 10-10-1973', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(662, 83, 2, '2', '4', 'ELISABETH NINO', 'KEFA, 16-05-1970', 'P', 'PROTESTAN', 'SD', NULL, 'KAWIN'),
(663, 84, 3, '2', '4', 'MARLIFEN MAMO', 'BAUMATA, 01-03-2011', 'L', 'PROTESTAN', 'SD', NULL, NULL),
(664, 85, 4, '2', '4', 'ADYTIO FILIPUS MAMO', 'KUPANG, 06-02-2016', 'L', 'PROTESTAN', 'SD', NULL, NULL),
(665, 86, 1, '2', '4', 'MARTHA MAMO-SEKEFU', 'BELO, 06-12-1930', 'P', 'PROTESTAN', 'BH', 'PETANI', NULL),
(666, 87, 2, '2', '4', 'ESTER MAMO', 'FENUN, 26-10-1960', 'P', 'PROTESTAN', 'BH', NULL, NULL),
(667, 88, 3, '2', '4', 'BARNABAS MAMO', 'FENUN', 'L', 'PROTESTAN', 'BH', NULL, NULL),
(668, 89, 1, '2', '4', 'KAMILUS SUMADI', 'BLITAR, 14-07-1953', 'L', 'KATHOLIK', 'SD', 'PETANI', 'KAWIN'),
(669, 90, 2, '2', '4', 'THERESIA SUMADI. B', 'BAUMATA, 11-10-1960', 'P', 'KATHOLIK', 'SD', NULL, 'KAWIN'),
(670, 91, 3, '2', '4', 'FRANSISKUS B. SANTOSO', 'BAUMATA, 18-04-1985', 'L', 'KATHOLIK', 'SMP', NULL, NULL),
(671, 92, 1, '2', '4', 'KRISTIANTO WALUYA', 'BAUMATA, 12-02-1991', 'L', 'KATHOLIK', 'SMA', 'WIRASWASTA', 'KAWIN'),
(672, 95, 1, '2', '4', 'BENYAMIN LELTAKAEB', 'TTU, 19-12-1973', 'L', 'KATOLIK', 'SMA', 'SWASTA', 'SAH'),
(673, 96, 2, '2', '4', 'IRMINA SURDARNI', 'MAGELANG, 08-03-1977', 'P', 'KATOLIK', 'SMA', NULL, 'SAH'),
(674, 97, 3, '2', '4', 'SILVIUS A. LELTAKEB', 'KUPANG, 11-01-2002', 'L', 'KATOLIK', 'SMA', NULL, NULL),
(675, 98, 4, '2', '4', 'FELIX A. LELTAKAEB', 'KUPANG, 23-05-2005', 'L', 'KATOLIK', 'SMK', NULL, NULL),
(676, 99, 5, '2', '4', 'LEONARDO A. LELTAKAEB', 'KUPANG, 29-11-2011', 'L', 'KATOLIK', 'SMP', NULL, NULL),
(677, 100, 1, '2', '4', 'GOIDO TAUS', 'TTU, 31-05-1974', 'L', 'KATOLIK', 'SD', 'SWASTA', NULL),
(678, 101, 2, '2', '4', 'YOHANES G. TAUS', 'TTU, 09-12-2002', 'L', 'KATOLIK', 'PT', NULL, NULL),
(679, 102, 3, '2', '4', 'MARIA M. TAUS', 'TTU, 06-08-2005', 'P', 'KATOLIK', 'SMA', NULL, NULL),
(680, 103, 1, '2', '4', 'HENDRIKUS BORA', 'SUMBA, 15-05-1985', 'L', 'KATOLIK', 'SMA', 'SWASTA', NULL),
(681, 104, 2, '2', '4', 'BETTI A. NALLE', 'ROTE, 23-04-1982', 'P', 'KATOLIK', 'SMA', NULL, NULL),
(682, 105, 3, '2', '4', 'AFLIANA F. D. BORA', 'KUPANG, 03-09-2014', 'P', 'KATOLIK', 'SD', NULL, NULL),
(683, 106, 1, '2', '4', 'YUSUF NABEN', 'FENUN, 20-08-1976', 'L', 'KRISTEN', 'SD', 'PETANI', 'SAH'),
(684, 107, 2, '2', '4', 'ADRIANA NABEN', 'FENUN, 15-04-1985', 'P', 'KRISTEN', 'SD', NULL, 'SAH'),
(685, 108, 1, '2', '4', 'THOMAS HUMAU', 'BAUMATA, 22-12-1976', 'L', 'KRISTEN', 'BH', 'PETANI', 'SAH'),
(686, 109, 2, '2', '4', 'SUSANA MAMO', 'FENUN, 19-09-1950', 'P', 'KRISTEN', 'SD', NULL, 'SAH'),
(687, 110, 3, '2', '4', 'MONIKA I. HUMAU', 'FENUN, 01-11-1999', 'P', 'KRISTEN', 'SMA', NULL, NULL),
(688, 111, 1, '2', '4', 'DORATEA SUNI', 'LELOGAMA, 09-01-1983', 'P', 'KATOLIK', 'SMP', 'SWASTA', NULL),
(689, 112, 2, '2', '4', 'MARSELINO Y.R. TOLEU', 'KEFA, 24-03-2005', 'L', 'KATOLIK', 'SMA', NULL, NULL),
(690, 113, 3, '2', '4', 'VEBRONIA TOLEU', 'KUPANG, 26-02-2011', 'P', 'KATOLIK', 'SD', NULL, NULL),
(691, 114, 4, '2', '4', 'FRANSISKO JULIO TOLEU', 'KUPANG, 26-06-2015', 'L', 'KATOLIK', 'SD', NULL, NULL),
(692, 115, 1, '2', '4', 'BENYAMIN HUMAU', 'SUNGKAEN, 05-04-1942', 'L', 'KRISTEN', 'SR', 'PETANI', 'SAH'),
(693, 116, 2, '2', '4', 'ANDRIANA HUMAU-NUBAN', 'SAPUS, 17-04-1961', 'P', 'KRISTEN', 'SR', NULL, 'SAH'),
(694, 117, 3, '2', '4', 'KRITOFEL HUMAU', 'FENUN, 15-12-1992', 'L', 'KRISTEN', 'SMA', 'TNI', NULL),
(695, 118, 4, '2', '4', 'MELISA E. NUBAN', 'FENUN, 03-05-2000', 'P', 'KRISTEN', 'PT', NULL, NULL),
(696, 119, 1, '2', '4', 'ZAKARIAS W.S. MUDIM', 'SULAMU, 22-09-1984', 'L', 'ISLAM', 'SMK', 'WIRASWASTA', 'SAH'),
(697, 120, 2, '2', '4', 'FATIMAH F. ABUBAKAR', 'KUPANG', 'P', 'ISLAM', 'S1', 'GURU', 'SAH'),
(698, 121, 1, '2', '4', 'HERONIMUS KSAKEL', 'MULAN KER', 'L', 'KATOLIK', 'D4', 'SWASTA', 'SAH'),
(699, 122, 2, '2', '4', 'MARIA REGOLINDOO KOLO', 'OEMOFA', 'P', 'KATOLIK', 'D4', 'PNS', 'SAH'),
(700, 123, 3, '2', '4', 'THOMPSON I.T. KLOBOR', 'MAUMERE', 'L', 'KATOLIK', NULL, NULL, NULL),
(701, 124, 4, '2', '4', 'NATHALIA T. KLOBOR', 'LEMBATA', 'P', 'KATOLIK', NULL, NULL, NULL),
(702, 125, 5, '2', '4', NULL, 'BAUMATA', 'L', 'KATOLIK', NULL, NULL, NULL),
(703, 126, 6, '2', '4', NULL, 'KUPANG', 'L', 'KATOLIK', NULL, NULL, NULL),
(704, 127, 1, '2', '4', 'YUSTINUS KOLO', 'BANAIN, 14-01-1971', 'L', 'KATOLIK', 'SMP', 'SWASTA', 'SAH'),
(705, 128, 2, '2', '4', 'YASINTA EKO', 'KEFA, 23-09-1988', 'P', 'KATOLIK', 'SMP', NULL, 'SAH'),
(706, 129, 3, '2', '4', 'IMELDA KOLO', 'KEFA, 17-05-2012', 'P', 'KATOLIK', 'SD', NULL, NULL),
(707, 130, 4, '2', '4', 'VELIS ALIANDO KOLO', 'KUPANG, 10-07-2018', 'L', 'KATOLIK', 'BH', NULL, NULL),
(708, 131, 1, '2', '4', 'MAXIM MILIAM P. NABEN', 'KUPANG, 14-02-1988', 'L', 'KATOLIK', 'SMA', 'SWASTA', 'SAH'),
(709, 132, 2, '2', '4', 'VINSENSIA BANI', 'FATUNENO, 03-08-1990', 'P', 'KATOLIK', 'SD', NULL, 'SAH'),
(710, 133, 3, '2', '4', 'MARSELINO J. NABEN', 'KUPANG, 28-07-2013', 'L', 'KATOLIK', 'SD', NULL, NULL),
(711, 134, 1, '2', '4', 'FLORIANUS MAMO', 'EBAN, 04-05-1981', 'L', 'KATOLIK', NULL, NULL, NULL),
(712, 135, 2, '2', '4', 'BERNADETA SUNI', 'BANAIN, 08-10-1988', 'P', 'KATOLIK', NULL, NULL, NULL),
(713, 136, 3, '2', '4', 'DAMITA BRILIANA N. MAMO', 'NAPAN, 26-09-2013', 'P', 'KATOLIK', NULL, NULL, NULL),
(714, 137, 1, '2', '4', 'JOSEP LEONARDY AHAS', '22-09-1968', 'L', 'KATOLIK', 'S2', 'DOSEN', 'SAH'),
(715, 138, 2, '2', '4', 'FRANSISKA ASTUTY LAGAR', '27-05-1979', 'P', 'KATOLIK', 'S1', NULL, 'SAH'),
(716, 139, 3, '2', '4', 'PETRUS REOLINO AHAS', '02-03-2000', 'L', 'KATOLIK', 'PT', NULL, NULL),
(717, 140, 4, '2', '4', 'ROTASIUS RANGKOLINO AHAS', '17-10-2006', 'L', 'KATOLIK', 'SMA', NULL, NULL),
(718, 141, 1, '2', '4', 'LAURENSIUS LELTAKAEB', NULL, 'L', 'KATOLIK', NULL, 'PETANI', NULL),
(719, 142, 2, '2', '4', 'MARIA DEDE BULU', NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(720, 143, 3, '2', '4', NULL, NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(721, 144, 4, '2', '4', NULL, NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(722, 145, 1, '2', '4', 'GERADU LELTAKAEB', '05-03-1983', 'L', 'KATOLIK', 'SMP', 'SWASTA', 'SAH'),
(723, 146, 2, '2', '4', 'ERMALINA NABEN', '11-09-1985', 'P', 'KATOLIK', 'SMP', NULL, 'SAH'),
(724, 147, 3, '2', '4', 'MARIA V. LELTAKAEB', '08-09-2020', 'P', 'KATOLIK', NULL, NULL, NULL),
(725, 148, 4, '2', '4', 'VIRIDIANA Y. LELTAKAEB', NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(726, 131, 1, '2', '4', 'MAXIM MILIAM P. NABEN', 'KUPANG, 14-02-1988', 'L', 'KATOLIK', 'SMA', 'SWASTA', 'SAH'),
(727, 132, 2, '2', '4', 'VINSENSIA BANI', 'FATUNENO, 03-08-1990', 'P', 'KATOLIK', 'SD', NULL, 'SAH'),
(728, 133, 3, '2', '4', 'MARSELINO J. NABEN', 'KUPANG, 28-07-2013', 'L', 'KATOLIK', 'SD', NULL, NULL),
(729, 134, 1, '2', '4', 'FLORIANUS MAMO', 'EBAN, 04-05-1981', 'L', 'KATOLIK', NULL, NULL, NULL),
(730, 135, 2, '2', '4', 'BERNADETA SUNI', 'BANAIN, 08-10-1988', 'P', 'KATOLIK', NULL, NULL, NULL),
(731, 136, 3, '2', '4', 'DAMITA BRILIANA N. MAMO', 'NAPAN, 26-09-2013', 'P', 'KATOLIK', NULL, NULL, NULL),
(732, 137, 1, '2', '4', 'JOSEP LEONARDY AHAS', '22-09-1968', 'L', 'KATOLIK', 'S2', 'DOSEN', 'SAH'),
(733, 138, 2, '2', '4', 'FRANSISKA ASTUTY LAGAR', '27-05-1979', 'P', 'KATOLIK', 'S1', NULL, 'SAH'),
(734, 139, 3, '2', '4', 'PETRUS REOLINO AHAS', '02-03-2000', 'L', 'KATOLIK', 'PT', NULL, NULL),
(735, 140, 4, '2', '4', 'ROTASIUS RANGKOLINO AHAS', '17-10-2006', 'L', 'KATOLIK', 'SMA', NULL, NULL),
(736, 141, 1, '2', '4', 'LAURENSIUS LELTAKAEB', NULL, 'L', 'KATOLIK', NULL, 'PETANI', NULL),
(737, 142, 2, '2', '4', 'MARIA DEDE BULU', NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(738, 143, 3, '2', '4', NULL, NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(739, 144, 4, '2', '4', NULL, NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(740, 145, 1, '2', '4', 'GERADU LELTAKAEB', '05-03-1983', 'L', 'KATOLIK', 'SMP', 'SWASTA', 'SAH'),
(741, 146, 2, '2', '4', 'ERMALINA NABEN', '11-09-1985', 'P', 'KATOLIK', 'SMP', NULL, 'SAH'),
(742, 147, 3, '2', '4', 'MARIA V. LELTAKAEB', '08-09-2020', 'P', 'KATOLIK', NULL, NULL, NULL),
(743, 148, 4, '2', '4', 'VIRIDIANA Y. LELTAKAEB', NULL, 'P', 'KATOLIK', NULL, NULL, NULL),
(744, 148, 1, '2', '4', 'SHONSI ADU', 'KUPANG, 01-08-1988', 'L', 'KRISTEN', 'SMU', 'POLRI', 'SAH'),
(745, 149, 2, '2', '4', 'YAYO F. MUDAK', 'KUPANG, 03-02-1988', 'P', 'KRISTEN', 'S1', 'PNS', 'SAH'),
(746, 150, 3, '2', '4', 'JIHAN P. ADU', 'CAMPLONG, 17-07-2008', 'P', 'KRISTEN', 'SMP', NULL, NULL),
(747, 151, 4, '2', '4', 'IMANUEL F. ADU', 'WAEPANA, 05-02-2014', 'L', 'KRISTEN', 'SD', NULL, NULL),
(748, 152, 5, '2', '4', 'REZKY T. ADU', 'BAUMATA, 09-07-2019', 'L', 'KRISTEN', 'BS', NULL, NULL),
(749, 153, 1, '2', '4', 'BERNADUS HUMAU', 'FENUN, 25-12-19', 'L', 'KRISTEN', 'SD', 'PETANI', 'SAH'),
(750, 154, 2, '2', '4', 'EMIRENSIANA KOLO', 'BANAIN, 13-09-19', 'P', 'KRISTEN', 'SERJANA', NULL, 'SAH'),
(751, 155, 3, '2', '4', 'ADELINO HUMAU', 'BAUMATA, 02-08-2017', 'L', 'KRISTEN', 'TK', NULL, NULL),
(752, 156, 4, '2', '4', 'FRENDY J. HUMAU', 'KUPANG, 18-02-2022', 'L', 'KRISTEN', 'BS', NULL, NULL),
(753, 158, 1, '2', '4', 'JEMRIS BENU', 'TUANFANU, 30-01-1986', 'L', 'KRISTEN', 'SMA', 'PNS', 'SAH'),
(754, 159, 2, '2', '4', 'ELSA PAKMENI', 'KUPANG, 12-01-1988', 'P', 'KRISTEN', 'SMK', 'SWASTA', 'SAH'),
(755, 160, 3, '2', '4', 'CHINTA JEHANSYAH BENU', 'KUPANG, 29-08-2011', 'P', 'KRISTEN', 'SD', NULL, NULL),
(756, 161, 4, '2', '4', 'ERAS ISRAEL JUANSYAH BENU', 'KUPANG, 20-03-2014', 'L', 'KRISTEN', 'SD', NULL, NULL),
(757, 162, 1, '2', '4', 'TRIANUS YESSE-Y.BASTIAN', 'KEFA, 05-07-1983', 'L', 'KATOLIK', 'S1', NULL, 'SAH'),
(758, 163, 2, '2', '4', 'MARIA IRMINA SENGKOEN', '28-10-1987', 'P', 'KATOLIK', 'D3', NULL, 'SAH'),
(759, 164, 1, '2', '4', 'SALTIAL RINI', 'KUPANG, 21-11-1960', 'L', 'KRISTEN', 'SMA', 'PENSIUN POLRI', 'SAH'),
(760, 165, 2, '2', '4', 'SETIA RINI-R', 'TUAL, 01-01-1966', 'P', 'KRISTEN', 'SMU', NULL, 'SAH'),
(761, 166, 1, '2', '4', 'AGUSTINUS NGGUMI', NULL, NULL, 'KATOLIK', NULL, NULL, 'SAH'),
(762, 167, 2, '2', '4', 'CLARA BUYANAYA', NULL, NULL, 'KATOLIK', NULL, NULL, 'SAH'),
(763, 168, 1, '2', '4', 'THOMAS LAPE ANUNUT', 'OETUTU, 18-11-1984', 'L', 'KATOLIK', 'SMA', 'TUKANG BATU', 'SAH'),
(764, 169, 2, '2', '4', 'YOHANA GORA', 'PUNUUU, 01-06-1991', 'P', 'KATOLIK', 'SMA', NULL, NULL),
(765, 170, 3, '2', '4', 'APRILIA SCOLASTIKA ANUNUT', 'KUPANG, 06-04-2014', 'P', 'KATOLIK', 'SD', NULL, NULL),
(766, 171, 4, '2', '4', 'SIGISMUN MELANDRO ANUNUT', 'KUPANG, 03-06-2018', 'L', 'KATOLIK', 'BS', NULL, NULL),
(767, 172, 1, '2', '4', 'ARNOLUS ANUNUT', 'OETULU, 18-07-1986', 'L', 'KATOLIK', 'SLTA', 'SWASTA', 'SAH'),
(768, 173, 2, '2', '4', 'APRIANA Y.L. FALLO', 'TTU, 27-08-1991', 'P', 'KATOLIK', 'SMA', NULL, NULL),
(770, 1, 1, '1', '2', 'ALFRED D.S SELAN', '25-04-1976', 'L', 'KRISTEN', NULL, NULL, NULL),
(771, 2, 1, '2', '1', 'SUHARTINI S.S. RAHARJO', '14-04-1982', 'P', 'KRISTEN', NULL, NULL, NULL),
(772, 3, 1, '2', '1', 'SAMUEL J.I. TIMO', '04-09-2002', 'L', 'KRISTEN', NULL, NULL, NULL),
(773, 4, 1, '2', '1', 'NENI J.T. TIMO', '28-10-2007', 'P', 'KRISTEN', NULL, NULL, NULL),
(774, 2, 2, '1', '2', 'ROLY S.Y. TABELAK', '27-05-1967', 'L', 'KRISTEN', 'SLTA', 'KARYAWAN SWASTA', 'KAWIN'),
(775, 2, 2, '1', '2', 'HARITIN H. TABELAK', '27-02-1977', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(776, 3, 2, '1', '2', 'WILIEM TABELAK', '27-08-2012', 'L', 'KRISTEN', NULL, NULL, NULL),
(777, 3, 3, '1', '2', 'SOFIA TANOF TO', '25-09-1967', 'P', 'KRISTEN', NULL, NULL, 'CERAI MATI'),
(778, 2, 3, '1', '2', 'FOTI SONIA TANOF', '21-02-1998', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(779, 3, 3, '1', '2', 'HELENA A. TANOF', '22-08-2007', 'P', 'KRISTEN', NULL, NULL, NULL),
(780, 4, 4, '1', '2', 'JOHAN B. BOLI', '15-07-1964', 'L', 'KRISTEN', 'SLTA', 'PNS', NULL);
INSERT INTO `data_penduduk` (`id`, `nomor_urut`, `kk`, `dusun`, `rt`, `nama_lengkap`, `ttl`, `jenis_kelamin`, `agama`, `pendidikan`, `pekerjaan`, `status_perkawinan`) VALUES
(781, 2, 4, '1', '2', 'SEPRIANA N. BOLI-TANOF', '16-09-1965', 'P', 'KRISTEN', 'SLTP', 'IRT', NULL),
(782, 3, 4, '1', '2', 'RICO ALEXANDER BOLI', '14-01-1990', 'L', 'KRISTEN', 'DIPLOMA IV STRATA I', 'KARYAWAN SWASTA', NULL),
(783, 4, 4, '1', '2', 'PATIK K. BOLI', '02-06-1992', 'L', 'KRISTEN', 'SLTA', 'KARYAWAN SWASTA', NULL),
(784, 5, 5, '1', '2', 'BIMUN A. BOLI', '30-04-1998', 'P', 'KRISTEN', 'DIPLOMA III SARJANA MUDA', 'KARYAWAN SWASTA', NULL),
(785, 5, 5, '1', '2', 'YOSINA TABELAK.A', '10-04-1935', 'P', 'KRISTEN', NULL, NULL, NULL),
(786, 2, 5, '1', '2', 'ESTER Y. TABELAK', '27-07-1956', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(787, 3, 5, '1', '2', 'THIMEN A. TABELAK', '17-04-1974', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(788, 6, 1, '1', '2', 'JEFRI OTNIEL TANOF', 'BAUMATA,08-07-1993', 'L', 'KRISTEN', NULL, NULL, 'CERAI MATI'),
(789, 7, 1, '1', '2', 'EPSIN E. TLONAN TANOF', 'BAUMATA,09-04-1963', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(790, 2, 1, '2', '1', 'YOSINA W. TLONAN', 'BAUMATA,10-01-1982', 'P', 'KRISTEN', NULL, NULL, NULL),
(791, 3, 1, '2', '1', 'ZAKARIAS TLONAN', 'KUPANG,15-01-2007', 'L', 'KRISTEN', NULL, NULL, NULL),
(792, 4, 1, '2', '1', 'KARSONI TLONAN', 'KUPANG,30-07-2011', 'P', 'KRISTEN', NULL, NULL, NULL),
(793, 5, 1, '2', '1', 'DECI ALEXA TLONAN', 'KUPANG,21-06-2012', 'P', 'KRISTEN', NULL, NULL, NULL),
(794, 6, 1, '2', '1', NULL, 'BAUMATA,02-06-2014', 'P', 'KRISTEN', NULL, NULL, NULL),
(795, 7, 1, '2', '1', 'YANDES ROHI LOBO', 'BONE,10-01-2010', 'L', 'KRISTEN', NULL, NULL, NULL),
(796, 8, 1, '1', '2', 'THOBIAS YULIANUS A. TANOF', 'KUPANG,27-10-1976', 'L', 'KRISTEN', 'SMA', NULL, 'KAWIN'),
(797, 2, 1, '2', '1', 'AFRIANA A. B. TANOF', 'BALI,09-04-1982', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(798, 3, 1, '2', '1', 'CHALVIN Z. TANOF', 'BALI,22-05-2003', 'L', 'KRISTEN', NULL, NULL, NULL),
(799, 9, 1, '1', '2', 'SEMRI H. KANAJARA', 'DENPASAR,12-09-1965', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(800, 2, 1, '2', '1', 'APRILIA Y.T. TABELAK', 'KUPANG,24-04-2001', 'P', 'KRISTEN', NULL, NULL, NULL),
(801, 10, 1, '1', '2', 'EDWIN WILIDOM TABELAK', 'BAUMATA, 15-12-1991', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(802, 2, 1, '2', '1', 'IMELDA NDOEN', 'TELUK UMA,01-10-1991', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(803, 3, 1, '2', '1', 'ADRIEL EMRICK TABELAK', 'KUPANG,03-06-2019', 'L', 'KRISTEN', NULL, NULL, NULL),
(804, 4, 1, '2', '1', 'ALDRICH D.C. TABELAK', 'KUPANG,21-04-2015', 'L', 'KRISTEN', NULL, NULL, NULL),
(805, 11, 1, '1', '2', 'NORDIN BOLI', 'ALOR,28-12-1955', 'L', 'KRISTEN', 'SD', NULL, NULL),
(806, 2, 1, '2', '1', 'RONAL S.A. TABELAK', 'DENPASAR,17-01-1992', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(807, 12, 1, '1', '2', 'SAUL BOLI', 'KUPANG,20-06-1979', 'L', 'KRISTEN', 'SLTA', 'KARYAWAN SWASTA', 'KAWIN'),
(808, 2, 1, '2', '1', 'MELI BERKANS', NULL, 'P', 'KRISTEN', 'SLTA', 'IRT', NULL),
(809, 13, 1, '1', '2', 'WELI SUSANA BOLI', 'LARANTUKA,06-01-1970', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(810, 2, 1, '2', '1', 'SANLY ZAHETA BOLI', 'KUPANG,03-03-2017', 'P', 'KRISTEN', NULL, NULL, NULL),
(811, 14, 1, '1', '2', 'JANTJE SEPRIANUS BUTO', 'PENFUI,27-09-1978', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(812, 2, 1, '2', '1', 'MARSYA ANUGRAH BUTO', 'KUPANG,28-05-2014', 'P', 'KRISTEN', NULL, NULL, NULL),
(813, 15, 1, '1', '2', 'DAUD GILBARD TABELAK', 'KOTA BES,22-08-1999', 'L', 'KRISTEN', NULL, NULL, NULL),
(814, 2, 1, '2', '1', 'MARIANA K.E. TABELAK', 'KUPANG,22-03-2004', 'P', 'KRISTEN', NULL, NULL, NULL),
(815, 3, 1, '2', '1', 'CLIRORD DE.B.N. TABELAK', 'KUPANG,25-05-2006', 'L', 'KRISTEN', NULL, NULL, NULL),
(816, 16, 1, '1', '2', 'ZAINAL ARIFIN', 'MUNA,31-12-1966', 'L', 'ISLAM', NULL, NULL, NULL),
(817, 17, 1, '1', '2', 'HABEL FANGGIDAE', 'BABAU,10-08-1963', 'L', 'KRISTEN', 'STRATA II', NULL, 'KAWIN'),
(818, 2, 1, '2', '1', 'SARAH FANGGIDAE .T', 'BAUMATA,22-11-1963', 'P', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(819, 3, 1, '2', '1', 'DEBY SUSAN FANGGIDAE', 'BAUMATA,07-01-1989', 'P', 'KRISTEN', 'DIPLOMA III', NULL, NULL),
(820, 18, 1, '1', '2', 'EFA A. SUSANA TUAN', 'BAUMATA,28-01-1965', 'P', 'KRISTEN', 'SLTA', 'IRT', 'KAWIN'),
(821, 19, 1, '1', '2', 'MAXI PAULUS LUDJI', 'BAUMATA,24-05-1988', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(822, 2, 1, '2', '1', 'MEGA KRISTIANI NEOLAKA', 'OELBUBUK,30-03-1988', 'P', 'KRISTEN', 'PENDETA', NULL, 'KAWIN'),
(823, 3, 1, '2', '1', 'SAMANTHA H. LUDJI', 'KUPANG,08-09-2017', 'P', 'KRISTEN', NULL, NULL, NULL),
(824, 20, 1, '1', '2', 'FERDINANDUS KERI', 'MOKEASA,14-05-1987', NULL, 'KATOLIK', 'DIPLOMA IV STRATA I', 'KARYAWAN HONORER', 'KAWIN'),
(825, 2, 1, '2', '1', 'YETI YULIANA LUDJI', 'BAUMATA,22-01-1984', NULL, 'KATOLIK', 'SLTA', 'KARYAWAN SWASTA', 'KAWIN'),
(826, 3, 1, '2', '1', 'FRANCESCO MEGIYANTO KERI', 'KUPANG,02-04-2017', NULL, 'KATOLIK', NULL, NULL, NULL),
(827, 4, 1, '2', '1', 'BRIGITA ELHYANA KERI', 'KUPANG,13-02-2019', NULL, 'KATOLIK', NULL, NULL, NULL),
(828, 21, 1, '1', '2', 'SOFIA TABELAK NAINITI', 'BAUMATA,06-02-1936', 'P', NULL, NULL, NULL, NULL),
(829, 22, 1, '1', '2', 'MATIAS TALOIM', 'NENOTES,10-05-1984', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(830, 2, 1, '2', '1', 'REGINA MALAFU', 'OETFO,14-08-1989', 'P', 'KRISTEN', 'SD', NULL, 'KAWIN'),
(831, 3, 1, '2', '1', 'YEHESKIAL TALOIM', 'OETFO,04-07-2014', 'L', 'KRISTEN', NULL, NULL, NULL),
(832, 23, 1, '1', '2', 'LAURENS AMNAHAS', 'OEHANI,04-08-1936', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(833, 2, 1, '2', '1', 'PAULINA AMNAHAS BOIS', 'RAKNAMO,20-10-2019', 'P', 'KRISTEN', NULL, NULL, NULL),
(834, 3, 1, '2', '1', 'YACOB AMNAHAS', NULL, 'L', 'KRISTEN', NULL, NULL, NULL),
(835, 24, 1, '1', '2', 'SUSANA DORTIA TUAN TANOF', 'BAUMATA,09-09-1945', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(836, 25, 1, '1', '2', 'LENY MARSELINA SABAN', 'OELEKSALA,19-11-1979', 'P', 'KRISTEN', 'SLTA', NULL, 'CERAI MATI'),
(837, 2, 1, '2', '1', 'WIRATAMA J.A. BALBESI', 'KUPANG,19-08-2005', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(838, 3, 1, '2', '1', 'BENDELINA K. BALBESI', 'BAUMATA,13-11-2011', 'P', 'KRISTEN', NULL, NULL, NULL),
(839, 4, 1, '2', '1', 'JENAYE B.C. BALBESI', 'BAUMATA,06-03-2014', 'P', 'KRISTEN', NULL, NULL, NULL),
(840, 26, 1, '1', '2', 'ROBINSON K. BALBESI', 'KUPANG,16-12', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(841, 2, 1, '2', '1', 'YACOBA N.S.U. TENIS', 'BAJAWA,23-10-1984', 'P', 'KRISTEN', NULL, NULL, NULL),
(842, 3, 1, '2', '1', 'GARTH ALEXANDER BALBESI', 'KUPANG,11-08-2015', 'L', 'KRISTEN', NULL, NULL, NULL),
(843, 27, 1, '1', '2', 'PITER K. BALBESI', 'NAIT,07-12-1979', 'L', 'KRISTEN', 'SLTA', 'KARYAWAN SWASTA', 'KAWIN'),
(844, 2, 1, '2', '1', 'AGUSTINA ARIANCE HUKA', 'NAIT,07-08-1976', 'P', 'KRISTEN', 'SLTA', 'IRT', NULL),
(845, 3, 1, '2', '1', 'HENDRA Y.A. BALBESI', 'NAIT,02-04-2001', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(846, 4, 1, '2', '1', 'NINO DAUD BALBESI', 'NAIT,08-02-2006', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(847, 5, 1, '2', '1', 'CRISTIN AUREL BALBESI', 'BAUMATA,14-12-2013', 'P', 'KRISTEN', NULL, NULL, NULL),
(848, 28, 1, '1', '2', 'MATIAS MATHEOS OTEPAH', 'BAUMATA,18-10-1948', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(849, 2, 1, '2', '1', 'AGUSTINA OTEPAH', 'NEKETUKA,24-08-1957', 'P', 'KRISTEN', NULL, 'IRT', 'KAWIN'),
(850, 3, 1, '2', '1', 'MESI NOVITA OTEPAH', 'BAUMATA,13-11-2001', 'P', 'KRISTEN', NULL, NULL, NULL),
(851, 29, 1, '1', '2', 'RUBEN TUNGGA', 'ROTE,30-11-1970', 'L', 'KRISTEN', NULL, 'PETANI', 'KAWIN'),
(852, 2, 1, '2', '1', 'ARANCI Y.A. TANOF', 'BAUMATA,26-04-1972', 'P', 'KRISTEN', 'SLTP', NULL, NULL),
(853, 3, 1, '2', '1', 'MIKAEL BENARID TUNGGA', 'BAUMATA,27-10-2001', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(854, 30, 1, '1', '2', 'ARIANDI BELTASAR BOLI', 'BAUMATA,04-02-1986', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(855, 2, 1, '2', '1', 'AMIN O.F. LY', 'KUPANG,11-10-', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(856, 3, 1, '2', '1', 'GLORIA HAOMI BOLI', 'KUPANG,18-02-2018', 'P', 'KRISTEN', NULL, NULL, NULL),
(857, 31, 1, '1', '2', 'HENDRIK MESAK TLONAN', 'KUPANG,18-07-1981', 'L', 'KRISTEN', 'SLTA', 'WIRASWASTA', 'KAWIN'),
(858, 2, 1, '2', '1', 'NELCY ADOLFINA TLONAN B', 'KUPANG,28-01-1983', 'P', 'KRISTEN', 'SLTA', 'IRT', NULL),
(859, 3, 1, '2', '1', 'HEDRI E.B.I. TLONAN', 'KUPANG,14-06-2010', 'L', 'KRISTEN', NULL, NULL, NULL),
(860, 4, 1, '2', '1', 'GABRIELA CARLA TLONAN', 'KUPANG,26-09-2014', 'P', 'KRISTEN', NULL, NULL, NULL),
(861, 5, 1, '2', '1', 'MAJESTHY GRAFIELA TLONAN', 'KUPANG,24-11-2017', 'P', 'KRISTEN', NULL, NULL, NULL),
(862, 6, 1, '2', '1', 'ECHANSON R. TLONAN', 'KUPANG,28-01-', 'P', 'KRISTEN', NULL, NULL, NULL),
(863, 32, 1, '1', '2', 'NOH TOMASI TABELAK', 'BAUMATA,03-11-1962', 'L', 'KRISTEN', 'SLTA', 'PNS', 'KAWIN'),
(864, 2, 1, '2', '1', 'YOHANA TUNISI', 'BANDUNG,08-02-1961', 'P', 'KRISTEN', 'SLTP', 'IRT', NULL),
(865, 3, 1, '2', '1', 'LAURENS TABELAK', 'BAUMATA,15-08-2006', 'L', 'KRISTEN', NULL, NULL, NULL),
(866, 33, 1, '1', '2', 'PAULUS TABELAK', 'BAUMATA,12-02-1971', 'L', 'KRISTEN', NULL, NULL, NULL),
(867, 2, 1, '2', '1', 'CRISTINA M. TABELAK', 'KUPANG,11-12-2003', 'P', 'KRISTEN', NULL, NULL, NULL),
(868, 3, 1, '2', '1', 'BAYU CAROLUS TABELAK', 'KUPANG,09-07-2018', 'L', 'KRISTEN', NULL, NULL, NULL),
(869, 34, 1, '1', '2', 'THOBIAS MESAK TABELAK', 'BAUMATA,23-05-1981', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(870, 2, 1, '2', '1', 'MARIYATI AHMAD', 'BANDUNG,19-08-1981', 'P', 'KRISTEN', NULL, NULL, NULL),
(871, 3, 1, '2', '1', 'MESI ALEXSANDRO TABELAK', 'KUPANG,06-03-2012', 'L', 'KRISTEN', NULL, NULL, NULL),
(872, 4, 1, '2', '1', 'GABRIELA TABELAK', 'KUPANG,08-04-2016', 'P', 'KRISTEN', NULL, NULL, NULL),
(873, 5, 1, '2', '1', 'MICHAEL YU. A. TABELAK', 'KUPANG,24-12-2018', 'L', 'KRISTEN', NULL, NULL, NULL),
(874, 35, 1, '1', '2', 'ABIA FINCO NINO', 'HAUNOBENOK,30-06-', 'L', 'KRISTEN', 'SLTA', NULL, NULL),
(875, 2, 1, '2', '1', 'YEANE HEBERTINA L. TABELAK', 'BANDUNG,13-10-1987', 'P', 'KRISTEN', NULL, NULL, NULL),
(876, 3, 1, '2', '1', 'JESTU ENOVRED NINO', 'KUPANG,26-11-2014', 'L', 'KRISTEN', NULL, NULL, NULL),
(877, 4, 1, '2', '1', 'ANTON NINO', 'TTS,22-06-1994', 'L', 'KRISTEN', NULL, NULL, NULL),
(878, 5, 1, '2', '1', 'DELEROY A. L FUNAI', 'KUOANG,10-12-2017', 'L', 'KRISTEN', NULL, NULL, NULL),
(879, 6, 1, '2', '1', 'LISTON A. NINO', 'HAUNOBENOK,09-08', 'L', 'KRISTEN', NULL, NULL, NULL),
(880, 7, 1, '2', '1', 'ANTON R NINO', 'HAUNOBENOK,22-06', 'L', 'KRISTEN', NULL, NULL, NULL),
(881, 36, 1, '1', '2', 'BENY FUNAI', 'OLETSALA, 07-12-1987', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(882, 2, 1, '2', '1', 'YESKY K.Y. TABELAK', 'KUPANG,02-10-1990', 'P', 'KRISTEN', NULL, NULL, NULL),
(883, 3, 1, '2', '1', 'DEWULAN A.L.FUNAI', 'KUPANG,30-08-2011', 'P', 'KRISTEN', NULL, NULL, NULL),
(884, 4, 1, '2', '1', 'ALDIRO DE JANSON FUNAI', 'KUPANG,24-07-2019', 'L', 'KRISTEN', NULL, NULL, NULL),
(885, 37, 1, '1', '2', 'JEMI BAKO', 'OELELI,18-02-1983', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(886, 2, 1, '2', '1', 'PITRONELA NINO', 'HAUNOBENAK,03-06-1985', 'P', 'KRISTEN', NULL, NULL, NULL),
(887, 3, 1, '2', '1', 'DWI EUNGSI BAKO', 'HAUNOBENAK,03-06-1985', 'L', 'KRISTEN', NULL, NULL, NULL),
(888, 4, 1, '2', '1', 'RESA NENEG BAKO', NULL, 'L', 'KRISTEN', NULL, NULL, NULL),
(889, 38, 1, '1', '2', 'ABRAHAM NIANDER BALBESI', 'BAUMATA, 22-09-1969', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(890, 2, 1, '2', '1', 'DURSIL ISA', 'OEBELO, 10-02-1960', 'P', 'KRISTEN', NULL, NULL, NULL),
(891, 3, 1, '2', '1', 'KARTINI BALBESI', 'OEPURA, 21-04-1995', 'P', 'KRISTEN', NULL, NULL, NULL),
(892, 4, 1, '2', '1', 'OKTAFIANUS P. BALBESI', 'OEPURA,24-10-1955', 'L', 'KRISTEN', NULL, NULL, NULL),
(893, 39, 1, '1', '2', 'DANIEN HUMAU', 'MANEFU, 18-12-1979', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(894, 2, 1, '2', '1', 'EVA BOIMAU', 'BAKI, 16-12-1984', 'P', 'KRISTEN', 'SLTA', NULL, NULL),
(895, 3, 1, '2', '1', 'FEBRIANTO HUMAU', 'POLO, 23-02-2007', 'L', 'KRISTEN', NULL, NULL, NULL),
(896, 4, 1, '2', '1', 'STENLY N. HUMAU', 'BAUMATA, 08-03-2011', 'L', 'KRISTEN', NULL, NULL, NULL),
(897, 5, 1, '2', '1', 'JONATAN HUMAU', 'BAUMATA, 27-05-2017', 'L', 'KRISTEN', NULL, NULL, NULL),
(898, 40, 1, '1', '2', 'ABRAHAM OTEPAH', 'FAIN, 15-08-1966', 'L', 'KRISTEN', 'SLTA', 'PETANI', 'KAWIN'),
(899, 2, 1, '2', '1', 'DEFROSA PUTRI OETPAH', NULL, 'P', 'KRISTEN', NULL, NULL, NULL),
(900, 3, 1, '2', '1', 'ABIGAIL KAIRANI OETPAH', 'BAUMATA, 29-08-2015', 'P', 'KRISTEN', NULL, NULL, NULL),
(901, 4, 1, '2', '1', 'DANIEL ALEXANDER OETPAH', 'BAUMATA, 05-05-2017', 'L', 'KRISTEN', NULL, NULL, NULL),
(902, 5, 1, '2', '1', 'AYUNI FERDERIKA OETPAH', 'BAUMATA, 27-05-2017', 'P', 'KRISTEN', NULL, NULL, NULL),
(903, 41, 1, '1', '2', 'CORNELIUS OLLA', 'OETUA,28-02-1966', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(904, 2, 1, '2', '1', 'SETIAWATI RAHAYU', 'MOJOKERTO,17-07-1980', 'P', 'KRISTEN', NULL, NULL, NULL),
(905, 3, 1, '2', '1', 'GILBERT JOSUA OLLA', 'KUPANG, 24-03-2001', 'L', 'KRISTEN', NULL, NULL, NULL),
(906, 4, 1, '2', '1', 'IMANUEL MELIN OLLA', 'KUPANG, 19-05-2005', 'L', 'KRISTEN', NULL, NULL, NULL),
(907, 5, 1, '2', '1', 'RAINER BERIC OLLA', 'KUPANG, 11-11-2010', 'L', 'KRISTEN', NULL, NULL, NULL),
(908, 42, 1, '1', '2', 'NOVI BALSESI', 'BAUMATA,20-11-1987', 'P', 'KRISTEN', NULL, NULL, 'KAWIN'),
(909, 2, 1, '2', '1', 'RAY VACHELA BALSESI', 'OEBUFU,04-03-2016', 'L', 'KRISTEN', NULL, NULL, NULL),
(910, 43, 1, '1', '2', 'OSCAR ANTONIUS PALE', 'OELTUA, 12-06-1983', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(911, 2, 1, '2', '1', 'YENI ADRIANA', 'TERNATE, 18-07-1985', 'P', 'KRISTEN', NULL, NULL, NULL),
(912, 3, 1, '2', '1', 'ZION S.D. PALE', 'KUPANG, 23-08-2004', 'P', 'KRISTEN', NULL, NULL, NULL),
(913, 44, 1, '1', '2', 'YACOBDOMINGGUS TUNBONAT', 'OELEKAM,28-07-1979', 'L', 'KRISTEN', 'DIPLOMA VI/STRATA 1', NULL, 'KAWIN'),
(914, 2, 1, '2', '1', 'SARCY TUNBONAT BILAUT', 'NENUP,05-08-1974', 'P', 'KRISTEN', 'DIPLOMA III/S.M,DA', NULL, NULL),
(915, 3, 1, '2', '1', 'CARLA VANESA TUNBONAT', 'KUPANG ,19-05-2009', 'P', 'KRISTEN', NULL, NULL, NULL),
(916, 4, 1, '2', '1', 'CARLOS ALBERTO TUNBONAS', 'KUPANG, 04-06-2011', 'L', 'KRISTEN', NULL, NULL, NULL),
(917, 5, 1, '2', '1', 'LASRY YULIANA LUNGI', 'KEFA, 31-07-1997', 'P', 'KRISTEN', 'SLTA SEDERAJAT', NULL, NULL),
(918, 45, 1, '1', '2', 'YACOB HUMAU', 'BAUMATA, 06-05-1978', 'L', 'KRISTEN', NULL, NULL, NULL),
(919, 2, 1, '2', '1', 'MATHILDA APRIANI OEMATAN', 'NOELBAKI, 24-04-1980', 'P', 'KRISTEN', NULL, NULL, NULL),
(920, 3, 1, '2', '1', 'HONER ALEXANDER HUMAU', 'NOELBAKI,11-07-2007', 'L', 'KRISTEN', NULL, NULL, NULL),
(921, 4, 1, '2', '1', 'WILIEM ISAK HUMAU', 'KUPANG, 30-12-2005', 'L', 'KRISTEN', NULL, NULL, NULL),
(922, 46, 1, '1', '2', 'DAUD BAHI', 'OELTUA, 06-12-1964', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(923, 2, 1, '2', '1', 'SILFRAN ELFREDOM BANI', 'KUPANG, 21-09-2000', 'L', 'KRISTEN', NULL, NULL, NULL),
(924, 3, 1, '2', '1', 'JANWAR EFRET BAHI', 'KUPANG,22-01-2004', 'L', 'KRISTEN', NULL, NULL, NULL),
(925, 4, 1, '2', '1', 'SEMI ALFRED BAHI', 'KUPANG, 11-09-2016', 'L', 'KRISTEN', NULL, NULL, NULL),
(926, 47, 1, '1', '2', 'MORDIKAI DAE', 'KUPANG,08-03-1977', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(927, 2, 1, '2', '1', 'SUSAN M. OLLA', 'KUPANG, 12-12-1982', 'P', 'KRISTEN', NULL, NULL, NULL),
(928, 3, 1, '2', '1', 'LAURA DAE', 'KUPANG, 10-11-2006', 'P', 'KRISTEN', NULL, NULL, NULL),
(929, 4, 1, '2', '1', 'JOIS DAE', 'KUOANG, 04-06-2013', 'L', 'KRISTEN', NULL, NULL, NULL),
(930, 48, 1, '1', '2', 'LEONARDUS OLLA', 'OELTUA, 01-01-1956', 'L', 'KATOLIK', 'SLTA', NULL, 'KAWIN'),
(931, 2, 1, '2', '1', 'YOANA EMILIA BALBESI', 'BAUMATA, 06-05-1978', 'P', 'KATOLIK', NULL, NULL, NULL),
(932, 3, 1, '2', '1', 'FERGELIA 0LLA', 'BAUMATA, 24-09-1996', 'P', 'KATOLIK', NULL, NULL, NULL),
(933, 49, 1, '1', '2', 'LODIA OLLA', 'BAUMATA, 06-12-1981', 'P', NULL, 'SLTA', NULL, NULL),
(934, 2, 1, '2', '1', 'FEMLY OLLA', 'BAUMATA, 14-02-2003', 'P', NULL, 'SLTA', NULL, NULL),
(935, 50, 1, '1', '2', 'OLIVIA YULIANA OLLA', 'BAUMATA, 13-07-1985', 'P', 'KATOLIK', NULL, NULL, NULL),
(936, 2, 1, '2', '1', 'DEDY ALVANDY OLLA', 'BAUMATA, 16-12-2011', 'L', 'KATOLIK', NULL, NULL, NULL),
(937, 51, 1, '1', '2', 'TJUK WINARTI', 'SURABAYA, 09-04-1962', 'P', 'PROTESTAN', 'SLTP', NULL, 'CERAI MATI'),
(938, 2, 1, '2', '1', 'EDWAR KRISTIAN GIRI', 'BAUMATA, 09-01-2000', 'L', NULL, 'SLTA', NULL, NULL),
(939, 3, 1, '2', '1', 'ADRIAN LEONARDO GIRI', '14-08-1985', 'L', NULL, 'SLTA', NULL, NULL),
(940, 2, 1, '2', '1', 'RISA SUMIRJA AMTARAN', 'BAUMATA, 09-01-2001', 'P', NULL, NULL, NULL, NULL),
(941, 3, 1, '2', '1', 'ORTINEL LAURENS AMTARAN', 'BAUMATA, 15-09-1993', 'L', NULL, NULL, NULL, NULL),
(942, 4, 1, '2', '1', 'BERTHA AMTARAN', 'KUPANG, 01-02-2010', 'P', NULL, NULL, NULL, NULL),
(943, 5, 1, '2', '1', 'THOBIAS NOVENDRA AMTARAN', 'BAUMATA, 10-11-2013', 'L', NULL, NULL, NULL, NULL),
(944, 54, 1, '1', '2', 'KORNELIUS KRAENG', 'BAOPUKANG, 23-05-1959', 'L', 'KATOLIK', 'DIPLOMA IV STRATA 1', 'GURU', 'KAWIN'),
(945, 2, 1, '2', '1', 'SRI PRASETIAWATI', 'KALIJATI, 03-09-1964', 'P', NULL, NULL, 'IRT', NULL),
(946, 3, 1, '2', '1', 'FLORENTINA L. ANGGRAINI', 'JAKARTA, 01-06-2002', 'P', NULL, NULL, NULL, NULL),
(947, 55, 1, '1', '2', 'YANWAR Y. BOBOY', 'LASIANA, 17-01-1993', 'L', 'PROTESTAN', NULL, NULL, 'KAWIN'),
(948, 2, 1, '2', '1', 'YUCE Y. AMTARAN', 'LASIANA, 08-02-1994', 'P', NULL, NULL, NULL, NULL),
(949, 3, 1, '2', '1', 'JEFRIEL BOBOY', 'KUPANG, 21-01-2012', 'L', NULL, NULL, NULL, NULL),
(950, 4, 1, '2', '1', 'KINAN BOBOY', NULL, 'P', NULL, NULL, NULL, NULL),
(951, 56, 1, '1', '2', 'RIBKA AMNAHAS', 'BAUMATA, 13-08-1970', 'P', 'PROTESTAN', 'TIDAK SEKOLAH', 'IRT', NULL),
(952, 57, 1, '1', '2', 'DEDI DAVIN MANDALA', 'ROTE, 05-06-1988', 'L', 'PROTESTAN', 'SLTA', 'WIRASWASTA', 'KAWIN'),
(953, 2, 1, '2', '1', 'NETHA MERIANI AMNAHAS', 'BAUMATA, 10-03-1991', 'P', NULL, 'SLTA', 'IRT', NULL),
(954, 3, 1, '2', '1', 'PRIYADNO RISKY MANDALA', 'BAUMATA, 28-05-2013', 'L', NULL, NULL, NULL, NULL),
(955, 4, 1, '2', '1', 'RAHMADTIO MIKHAEL MANDALA', 'KUPANG, 16-11-2015', 'L', NULL, NULL, NULL, NULL),
(956, 59, 1, '1', '2', 'YOKSEN AMNAHAS', 'BAUMATA, 23-07-1980', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(957, 2, 1, '2', '1', 'FIKTORIA TABELAK', 'NAIMATA, 22-10-1982', 'P', 'PROTESTAN', 'SD', 'IRT', NULL),
(958, 3, 1, '2', '1', 'ALDIO AMNAHAS', 'BAUMATA, 23-08-2004', 'L', 'PROTESTAN', 'SLTA', NULL, NULL),
(959, 4, 1, '2', '1', 'JEFRI ADWIN AMNAHAS', 'BAUMATA, 18-01-2007', 'L', 'PROTESTAN', NULL, NULL, NULL),
(960, 5, 1, '2', '1', 'RIANDI NIKIN AMNAHAS', 'BAUMATA, 02-10-2013', 'L', 'PROTESTAN', NULL, NULL, NULL),
(961, 6, 1, '2', '1', 'IMANUEL AMNAHAS', 'BAUMATA, 27-05-2016', 'L', 'PROTESTAN', NULL, NULL, NULL),
(962, 60, 1, '1', '2', 'FERDI AMNAHAS', 'BAUMATA, 11-02-1963', 'L', 'PROTESTAN', 'SD', NULL, 'KAWIN'),
(963, 2, 1, '2', '1', 'ADOLFINA AMNAHAS', 'OELEKAM, 06-04-1979', 'P', 'PROTESTAN', NULL, NULL, NULL),
(964, 3, 1, '2', '1', 'MARIA ALFRIDO AMNAHAS', 'OELEKAM, 29-12-2007', 'P', 'PROTESTAN', NULL, NULL, NULL),
(965, 4, 1, '2', '1', 'TRESELDA AMNAHAS', 'KUPANG, 12-05-2017', 'P', 'PROTESTAN', NULL, NULL, NULL),
(966, 5, 1, '2', '1', 'TRISILDA AMNAHAS', 'KUPANG, 12-05-2017', 'P', 'PROTESTAN', NULL, NULL, NULL),
(967, 61, 1, '1', '2', 'YULIANUS ALEXANDER AMNAHAS', 'BAUMATA, 12-07-1974', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(968, 2, 1, '2', '1', 'YACOBA BACENA SERAN', 'TARUS, 18-08-1978', 'P', 'PROTESTAN', 'SD', 'IRT', NULL),
(969, 3, 1, '2', '1', 'RIVALDI CRISTIAN SERAN', 'TARUS, 03-07-2009', 'L', 'PROTESTAN', NULL, NULL, NULL),
(970, 62, 1, '1', '2', 'ADRIANUS RIVALDO AMNAHAS', 'BAUMATA, 13-04-1997', 'L', 'PROTESTAN', 'SLTA', NULL, 'KAWIN'),
(971, 63, 1, '1', '2', 'MELKISEDEK TUALAKA', 'FATUAT, 07-07-1967', 'L', 'PROTESTAN', NULL, NULL, 'KAWIN'),
(972, 2, 1, '2', '1', 'BLANDINA TAKAIN', 'OELTUA, 08-06-1966', 'P', 'PROTESTAN', NULL, NULL, NULL),
(973, 3, 1, '2', '1', 'TERESKEYA TUALAKA', 'KUPANG, 09-02-2009', 'P', 'PROTESTAN', NULL, NULL, NULL),
(974, 64, 1, '1', '2', 'SEMUEL TUALAKA', 'FATUAT, 23-11-1963', 'L', 'PROTESTAN', 'DIPLOMA IV STRATA I', 'WIRASWASTA', 'KAWIN'),
(975, 2, 1, '2', '1', 'HILDA E.J NUBATONIS', '09-12-1967', 'P', 'PROTESTAN', 'DIPLOMA IV STRATA I', 'PNS', NULL),
(976, 3, 1, '2', '1', 'SEMRI A. TUALAKA', 'FATUAT, 14-09-1980', 'P', 'PROTESTAN', 'DIPLOMA IV STRATA I', NULL, NULL),
(977, 4, 1, '2', '1', 'SRI SUVITA S. TUALAKA', 'FATUAT, 25-05-1984', 'P', 'PROTESTAN', NULL, NULL, NULL),
(978, 5, 1, '2', '1', 'THEODORA M. C. TUALAKA', 'KUPANG, 21-03-1991', 'P', 'PROTESTAN', 'SLTA', NULL, NULL),
(979, 6, 1, '2', '1', 'THEODORA ELLESIA TUALAKA', 'KUPANG, 30-04-1996', 'P', 'PROTESTAN', 'DIPLOMA IV STRATA I', NULL, NULL),
(980, 7, 1, '2', '1', 'ELISA S. IMANUEL TUALAKA', 'KUPANG, 08-09-1998', 'L', 'PROTESTAN', 'SLTA', NULL, NULL),
(981, 8, 1, '2', '1', 'CITRA IMANUEL TUALAKA', 'KUPANG, 23-05-2000', 'L', 'PROTESTAN', NULL, NULL, NULL),
(982, 65, 1, '1', '2', 'Christofel Finit', 'Kupang, 19-10-1966', 'L', 'Kristen', 'SLTA', 'PNS', 'Kawin'),
(983, 2, 1, '2', '1', 'Afliana Tefbana', 'TTS, 11-04-1968', 'P', 'Kristen', 'SLTA', 'IRT', 'Kawin'),
(984, 66, 1, '1', '2', 'Ari Arnoldus Finit', 'Kupang, 12-03-1989', 'L', 'Kristen', NULL, NULL, 'Kawin'),
(985, 2, 1, '2', '1', 'Elisabeth Kero', 'Ngalupolo, 27-02-1993', 'P', 'Kristen', NULL, NULL, 'Kawin'),
(986, 3, 1, '2', '1', 'Richard Lorens L Finit', 'Kupang, 30-11-2011', 'L', 'Kristen', NULL, NULL, NULL),
(987, 4, 1, '2', '1', 'Rendy Nicholaus G Finit', 'Kupang, 10-12-2017', 'L', 'Kristen', NULL, NULL, NULL),
(988, 67, 1, '1', '2', 'Yuan Yandres Finit', 'Kupang, 14-06-1994', 'L', 'Kristen', 'SD', NULL, 'Kawin'),
(989, 2, 1, '2', '1', 'Supriana Anlik', 'Biseng, 05-09-1992', 'P', 'Kristen', 'SLTA', NULL, 'Kawin'),
(990, 3, 1, '2', '1', 'Riski Imanuel Finit', 'Kupang, 18-08-2015', 'L', 'Kristen', NULL, NULL, NULL),
(991, 68, 1, '1', '2', 'Ivantri M Finit', 'Kupang, 19-05-1991', 'L', 'Kristen', 'SLTA', 'Wiraswasta', 'Kawin'),
(992, 2, 1, '2', '1', 'Adriana Sakau', 'Kopu, 02-08-1984', 'P', 'Kristen', 'SLTA', 'Karyawan Swasta', 'Kawin'),
(993, 3, 1, '2', '1', 'Vika Esa Sani Finit', 'Kupang, 06-08-2014', 'L', 'Kristen', NULL, NULL, NULL),
(994, 69, 1, '1', '2', 'Yohanis Bai', '13-06-1966', 'L', 'Kristen', 'SD', NULL, 'Kawin'),
(995, 2, 1, '2', '1', 'Yohana Meto', 'Baumata, 27-07-1967', 'P', 'Kristen', 'SD', NULL, 'Kawin'),
(996, 3, 1, '2', '1', 'Rosita Bai', 'Baumata, 07-10-2003', 'P', 'Kristen', 'SLTA', NULL, NULL),
(997, 70, 1, '1', '2', 'Dani A Bai', 'Baumata, 08-08-1994', 'L', 'Kristen', 'SLTA', NULL, 'Kawin'),
(998, 2, 1, '2', '1', 'Tabita Mesakh', 'Tarus, 28-04-1989', 'P', 'Kristen', NULL, NULL, NULL),
(999, 71, 1, '1', '2', 'Piter Meto', 'Baumata, 06-04-1964', 'L', 'Kristen', NULL, NULL, NULL),
(1000, 72, 1, '1', '2', 'Ariance Ba\'u', 'Tarus, 05-04-1977', 'P', 'Kristen', 'SLTA', 'Cerai Mati', NULL),
(1001, 2, 1, '2', '1', 'Betshi Amelia Mese', 'Kupang, 21-07-1998', 'P', 'Kristen', 'SLTA', NULL, 'Kawin'),
(1002, 3, 1, '2', '1', 'Nimsi Delaya Mese', 'Baumata, 16-06-2001', 'P', 'Kristen', NULL, NULL, NULL),
(1003, 4, 1, '2', '1', 'Marsena S Mese', 'Kupang, 10-05-2005', 'P', 'Kristen', NULL, NULL, NULL),
(1004, 73, 1, '1', '2', 'Yokran Dominggus Lopo', 'Nununamat, 02-10-1979', 'L', 'Kristen', NULL, NULL, NULL),
(1005, 2, 1, '2', '1', 'Leti Lili', 'Alor, 17-08-1981', 'P', 'Kristen', NULL, NULL, NULL),
(1006, 3, 1, '2', '1', 'Wenang J Lopo', 'Kupang, 17-05-2009', 'L', 'Kristen', NULL, NULL, NULL),
(1007, 4, 1, '2', '1', 'Joldri Rian Lopo', 'Kupang, 17-07-2014', 'L', 'Kristen', NULL, NULL, NULL),
(1008, 5, 1, '2', '1', 'Jeni Indrawati Lopo', 'Baumata, 10-01-2016', 'P', 'Kristen', NULL, NULL, NULL),
(1009, 6, 1, '2', '1', 'Koresti Maria Lopo', 'Baumata, 14-09-2017', 'P', 'Kristen', NULL, NULL, NULL),
(1010, 74, 1, '1', '2', 'Martinus N Nenobais', 'Noenoni, 11-03-1976', 'L', 'Kristen', 'SLTA', NULL, 'Kawin'),
(1011, 2, 1, '2', '1', 'Agustina Ta Nenobais', 'Ende, 14-08-1976', 'P', 'Kristen', 'SLTP', NULL, 'Kawin'),
(1012, 3, 1, '2', '1', 'Novianti K Nenobais', 'Oesapa, 30-11-1998', 'P', 'Kristen', 'SLTP', NULL, NULL),
(1013, 4, 1, '2', '1', 'Roni Antonio Nenobais', 'Oesapa, 06-11-2000', 'L', 'Kristen', 'Belum tamat', NULL, NULL),
(1014, 5, 1, '2', '1', 'Nino Estefanus Nenobais', 'Noenoni, 21-08-2002', 'L', NULL, 'Belum tamat', NULL, NULL),
(1015, 6, 1, '2', '1', 'Voni Rodolina Nenobais', 'Oesapa, 21-08-2005', 'P', 'Kristen', 'Belum tamat', NULL, NULL),
(1016, 7, 1, '2', '1', 'Sarina Aprilia Nenobais', 'Kupang, 12-04-2012', 'P', 'Kristen', NULL, NULL, NULL),
(1017, 75, 1, '1', '2', 'Erna Sari D Andani', 'Banyuwangi, 07-12-1985', 'P', 'Kristen', 'SLTP Sederajat', NULL, 'Cerai mati'),
(1018, 2, 1, '2', '1', 'Aprilia E C Nitbani', 'Noenoni, 13-04-2006', 'P', 'Kristen', NULL, NULL, NULL),
(1019, 3, 1, '2', '1', 'Efraim Nitbani', 'Noenoni, 14-11-1984', 'L', 'Kristen', 'SLTP', NULL, NULL),
(1020, 76, 1, '1', '2', 'Sami Klomanghitis', 'Kupang, 03-09-1986', 'L', 'Kristen', 'Diploma IV Strata I', 'Karyawan Swasta', 'Kawin'),
(1021, 2, 1, '2', '1', 'Elsadian Taimenas', 'Oben, 26-02-1988', 'P', 'Kristen', 'Strata II', 'Dosen', 'Kawin'),
(1022, 3, 1, '2', '1', 'Andrew I G Klomanghitis', 'Kupang, 18-02-2015', 'L', 'Kristen', NULL, NULL, NULL),
(1023, 4, 1, '2', '1', 'Daniela A Klomanghitis', 'Kupang, 17-11-2018', 'P', 'Kristen', NULL, NULL, NULL),
(1024, 77, 1, '1', '2', 'Ronald Bastian Bano', 'Soba, 21-09-1992', 'L', 'Kristen', 'SLTA', NULL, 'Kawin'),
(1025, 2, 1, '2', '1', 'Dolfin Friance Anin', NULL, 'P', 'Kristen', 'SLTA', NULL, 'Kawin'),
(1026, 3, 1, '2', '1', 'Narasya Ayunda Bano', NULL, 'P', 'Kristen', 'Belum sekolah', NULL, NULL),
(1027, 78, 1, '1', '2', 'Daud Tunliu', 'Noenoni, 11-12-1958', 'L', 'Kristen', 'SLTA Sederajat', 'Sopir', 'Kawin'),
(1028, 2, 1, '2', '1', 'Roba Welmince Saefatu', 'Noenoni, 06-03-1983', 'P', 'Kristen', 'Tamat SD', NULL, 'Kawin'),
(1029, 3, 1, '2', '1', 'Iren Dalmi Tunliu', 'Potok, 18-11-2006', 'P', 'Kristen', 'Belum sekolah', NULL, NULL),
(1030, 4, 1, '2', '1', 'Astika M Saefatu', 'Potok, 27-04-2008', 'P', 'Kristen', NULL, NULL, NULL),
(1031, 5, 1, '2', '1', 'Marten Tunliu', 'Oesapa, 15-03-1987', 'L', 'Kristen', NULL, NULL, NULL),
(1032, 79, 1, '1', '2', 'Daniel Tamelan', 'Oenopu, 14-09-1975', 'L', 'Kristen', 'SLTA Sederajat', 'Sopir', 'Kawin'),
(1033, 2, 1, '2', '1', 'Yohana Puai', 'Bolan, 26-06-1984', 'P', 'Kristen', 'Tamat SD', NULL, 'Kawin'),
(1034, 3, 1, '2', '1', 'Riskyamus Tamelan', 'Kupang, 22-02-2007', 'P', 'Kristen', 'Belum sekolah', NULL, NULL),
(1035, 4, 1, '2', '1', 'Anri Marsoni Tamelan', 'Kupang, 22-01-2008', 'P', 'Kristen', NULL, NULL, NULL),
(1036, 5, 1, '2', '1', 'Cindy Sonia Tamelan', 'Kupang, 17-04-2010', 'L', 'Kristen', NULL, NULL, NULL),
(1037, 80, 1, '1', '2', 'Yusak Tamelan', 'Oenopu, 15-06-1983', 'L', 'Kristen', 'SD', 'Buruh', 'Kawin'),
(1038, 2, 1, '2', '1', 'Nurna Ningsi Benu', 'Basmuti, 13-09-1985', 'P', 'Kristen', 'SLTA Sederajat', NULL, 'Kawin'),
(1039, 3, 1, '2', '1', 'Enjel M Tamelan', 'Kupang, 09-06-2009', 'P', 'Kristen', 'Belum tamat SD', NULL, NULL),
(1040, 4, 1, '2', '1', 'Rivaldi Tamelan', 'Kupang, 10-02-2012', 'L', 'Kristen', NULL, NULL, NULL),
(1041, 5, 1, '2', '1', 'Melsi Yunice Tamelan', 'Kupang, 22-05-2017', 'P', 'Kristen', NULL, NULL, NULL),
(1042, 81, 1, '1', '2', 'Mikael Taloim', 'Nenosnaen, 16-03-1983', 'L', 'Kristen', 'SLTA', 'Tukang', 'Kawin'),
(1043, 2, 1, '2', '1', 'Sefernika Seran', 'Laenleten, 16-09-1992', 'P', 'Kristen', 'SLTA', NULL, 'Kawin'),
(1044, 3, 1, '2', '1', 'Marjhon A R Taloim', 'Kupang, 02-06-2012', 'L', 'Kristen', NULL, NULL, NULL),
(1045, 4, 1, '2', '1', 'Ronaldo Arjuna Taloim', 'Kupang, 07-07-2014', 'L', 'Kristen', NULL, NULL, NULL),
(1046, 5, 1, '2', '1', 'Jhiorji Miselo Taloim', 'Kupang, 14-01-2017', 'L', 'Kristen', NULL, NULL, NULL),
(1047, 82, 1, '1', '2', 'Yunus Toh', 'Soe, 26-08-1981', 'L', 'Kristen', 'SD', NULL, NULL),
(1048, 2, 1, '2', '1', 'Dwi Panca Wati Faot', 'Loli, 22-05-1992', 'P', 'Kristen', 'SD', NULL, NULL),
(1049, 3, 1, '2', '1', 'Novita Yoland Toh', 'Polen, 23-11-2016', 'P', 'Kristen', NULL, NULL, NULL),
(1050, 4, 1, '2', '1', 'Jhon Damaina Toh', 'Polen, 28-11-2018', 'L', 'Kristen', NULL, NULL, NULL),
(1051, 83, 1, '1', '2', 'Nikodemus Selan', 'Soe, 16-11-1969', 'L', 'Kristen', 'Tamat SD', NULL, NULL),
(1052, 2, 1, '2', '1', 'Dikson Nenobais', 'Soe, 18-12-1977', 'L', 'Kristen', NULL, NULL, NULL),
(1053, 3, 1, '2', '1', 'Yuliana Siki', 'Kefamenanu, 14-04-1979', 'P', 'Katolik', NULL, NULL, NULL),
(1054, 4, 1, '2', '1', 'Aksamina Nau', 'Soe, 18-04-1983', 'P', 'Katolik', 'Tamat SD', NULL, NULL),
(1055, 5, 1, '2', '1', 'Maria Olivia Selan', 'Kupang, 16-10-1999', 'P', 'Kristen', 'SLTP', NULL, NULL),
(1056, 6, 1, '2', '1', 'Maria N L Selan', 'Kupang, 26-03-2007', 'P', 'Kristen', NULL, NULL, NULL),
(1057, 7, 1, '2', '1', 'Adela Apriyana Selan', 'Naeoni, 23-04-2005', 'P', 'Katolik', NULL, NULL, NULL),
(1058, 8, 1, '2', '1', 'Caecilia F A Selan', 'Naeoni, 20-08-2011', 'P', 'Katolik', NULL, NULL, NULL),
(1059, 84, 1, '1', '2', 'Defri A Betty', 'Danite, 30-12-1994', 'L', 'Kristen', 'SLTP', 'Nelayan', NULL),
(1060, 2, 1, '2', '1', 'Ori Kamlasi', 'Nunpana, 03-10-1993', 'P', 'Kristen', 'SLTA', NULL, NULL),
(1061, 3, 1, '2', '1', 'Oeden Kamlasi', 'Nunukiti, 22-10-2015', 'L', 'Kristen', NULL, NULL, NULL),
(1062, 85, 1, '1', '2', 'MARTINUS NENOBAIS', 'NOENONI, 20-05-1987', 'L', 'KRISTEN', 'SLTP', 'MAHASISWA', 'BELUM KAWIN'),
(1063, 2, 1, '2', '1', 'ENIKA TON', 'KELLE, 12-09-1990', 'P', 'KRISTEN', 'SLTP', NULL, NULL),
(1064, 3, 1, '2', '1', 'OLIVIA OKI NENOBAIS', 'KUANFATU, 17-10-2017', 'P', 'KRISTEN', 'PELAJAR', NULL, NULL),
(1065, 4, 1, '2', '1', 'NARDO G. NENOBAIS', 'KUPANG, 9-11-2017', 'L', 'KRISTEN', NULL, NULL, NULL),
(1066, 86, 1, '1', '2', 'SULI Y.D. ASBANU', 'NOENONI, 21-01-1989', 'L', 'KRISTEN', 'SLTP', 'NELAYAN', NULL),
(1067, 2, 1, '2', '1', 'BARBALINA NITBANI', 'NEONI, 16-02-1989', 'P', 'KRISTEN', 'SLTP', NULL, NULL),
(1068, 3, 1, '2', '1', 'SIU JULIANTI ASBANU', 'KUPANG, 25-07-2013', 'L', 'KRISTEN', NULL, NULL, NULL),
(1069, 4, 1, '2', '1', 'DANIEL JOVANCA ASBANU', 'KUPANG, 13-12-2019', 'L', 'KRISTEN', NULL, NULL, NULL),
(1070, 87, 1, '1', '2', 'YUSAK FATU', 'SOE, 13-06-1986', 'L', 'KRISTEN', 'SD', 'WIRASWASTA', NULL),
(1071, 2, 1, '2', '1', 'EMILIANA TLAAN', 'KEFA, 26-05-1987', 'P', 'KRISTEN', 'SD', NULL, NULL),
(1072, 3, 1, '2', '1', 'ELISABETH FATU', 'KUPANG, 06-08-2010', 'P', 'KRISTEN', NULL, NULL, NULL),
(1073, 4, 1, '2', '1', 'PRISKA FATU', 'KUPANG, 20-07-2013', 'P', 'KRISTEN', NULL, NULL, NULL),
(1074, 88, 1, '1', '2', 'YORAM TANESI', 'BESAKOP, 02-06-1981', 'L', 'KRISTEN', 'SD', NULL, 'KAWIN'),
(1075, 2, 1, '2', '1', 'SUFIA NOMLENI', 'NONOMEO, 17-02-1984', 'P', 'KRISTEN', 'SD', NULL, NULL),
(1076, 3, 1, '2', '1', 'YOFRI J. TANESI', 'KUPANG, 06-07-2015', 'P', 'KRISTEN', NULL, NULL, NULL),
(1077, 4, 1, '2', '1', 'OKRAN SAPUTRA TANESI', 'KUPANG, 02-10-2021', 'L', 'KRISTEN', NULL, NULL, NULL),
(1078, 89, 1, '1', '2', 'YOHANIS MANGUR', 'NELIENG, 25-08-1991', 'L', NULL, NULL, NULL, NULL),
(1079, 2, 1, '2', '1', 'FERIANA DAUL', 'LAMAS, 16-02-1997', 'P', NULL, NULL, NULL, NULL),
(1080, 90, 1, '1', '2', 'ERNA SARI DUWI ANDANI', 'BANYUWANGI, 07-12-1985', 'P', 'KRISTEN', 'SLTP', NULL, 'CERAI MATI'),
(1081, 2, 1, '2', '1', 'APRILIA EVI KRISTIN NITBANI', 'NOENONI, 13-04-2006', 'P', 'KRISTEN', NULL, NULL, NULL),
(1082, 3, 1, '2', '1', 'EFRAIM NITBANI', 'NOENONI, 14-11-1984', 'L', 'KRISTEN', NULL, NULL, NULL),
(1083, 91, 1, '1', '2', 'ANTON REDUAYU', 'HAUNOBENAK, 22-06-1994', 'L', 'KRISTEN', 'SLTA', NULL, 'KAWIN'),
(1084, 2, 1, '2', '1', 'PRISKILIA BETTY', 'OEFENU, 30-05-1997', 'P', 'KRISTEN', 'SD', NULL, NULL),
(1085, 3, 1, '2', '1', 'MORGAN ELKANA NINO', 'KUPANG, 25-03-2022', 'L', 'KRISTEN', NULL, NULL, NULL),
(1086, 92, 1, '1', '2', 'MEKSIN M. BANO', 'SOBA, 09-11-1985', 'L', 'KRISTEN', NULL, NULL, 'KAWIN'),
(1087, 2, 1, '2', '1', 'PALERIA DEMA OWA', 'NANGA, 08-08-1988', 'P', 'KRISTEN', NULL, NULL, NULL),
(1088, 3, 1, '2', '1', 'JUAN ALEXANDER GOU BANO', 'ENDE, 24-01-2014', 'L', 'KRISTEN', NULL, NULL, NULL),
(1089, 4, 1, '2', '1', 'TONI EDISON BATINARO', 'TOOBAUN, 07-07-2002', 'L', 'KRISTEN', NULL, NULL, NULL),
(1090, 93, 1, '1', '1', 'ABRAHAM TAKAIN, SPD', 'OEPAHA, 16-05-1966', 'L', 'KRISTEN', 'AKADEMI/DIPLOMA III/S.MUDA', 'PNS', 'KAWIN'),
(1091, 2, 1, '1', '1', 'FERONIKA ESTER RAOSALINA TAKAIN', 'OELTUA, 07-02-1974', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'IRT', 'KAWIN'),
(1092, 3, 1, '1', '1', 'NELMA INDRANI TAKAIN', 'KORO\'OT, 05-09-2004', 'P', 'KRISTEN', 'BELUM TAMAT/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1093, 4, 1, '1', '1', 'ELSAN ALFREDO TAKAIN', 'NEKMESE, 28-05-2006', 'L', 'KRISTEN', 'BELUM TAMAT/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1094, 5, 1, '1', '1', 'MAHUI DEMIRA TAKAIN', 'NEKMESE, 23-03-2009', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1095, 94, 1, '1', '2', 'ADELA APRIANA SELAN', 'KUPANG, 23-04-2005', 'P', 'KRISTEN', 'BELUM TAMAT SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1096, 2, 1, '2', '1', 'MARIA NINGSIH LAVEDA SELAN', 'NOENONI, 26-03-2007', 'P', 'KATHOLIK', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1097, 3, 1, '2', '1', 'CAECILIA FERLIS AGUINO SELAN', 'NOENONI, 28-08-2011', 'P', 'KATHOLIK', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1098, 4, 1, '2', '1', 'MARIA OLIFIA SELAN', 'KUPANG, 16-10-1999', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1099, 95, 1, '1', '2', 'ROJALINU ALESU SILLA', 'DILI, 27-10-1997', 'L', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'TUKANG LAS/PANDAI BESI', 'BELUM KAWIN'),
(1100, 2, 1, '2', '1', 'MARIA OLIFIA SELAN', 'KUPANG, 16-10-1999', 'P', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'KARYAWAN SWASTA', 'BELUM KAWIN'),
(1101, 3, 1, '2', '1', 'AGATA FEBRISIA ALESU', 'KUPANG, 08-02-2024', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1102, 96, 1, '1', '2', 'RODINA WELMINCE SAEFATU', 'NOENONI, 06-03-1983', 'P', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'IRT', 'BELUM KAWIN'),
(1103, 2, 1, '2', '1', 'FRANS TUNLIU', 'KUPANG, 26-02-2020', 'L', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1104, 3, 1, '2', '1', 'MARTHEN TUNLIU', 'OESAPA, 15-03-1987', 'L', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'PETANI/PEKEBUN', 'BELUM KAWIN'),
(1105, 97, 1, '1', '2', 'YUNUS LUDJI', 'KUPANG, 07-12-1958', 'L', 'KRISTEN', 'SLTP/SEDERAJAT', 'PETANI/PEKEBUN', 'KAWIN'),
(1106, 2, 1, '2', '1', 'EFA ANA SUSANA TUAN', 'BAUMATA, 28-01-1965', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'IRT', 'KAWIN'),
(1107, 3, 1, '2', '1', 'GUNAR EPA FRODITUS MISSA', 'BAUMATA, 02-10-1985', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1108, 1, 1, '2', '7', 'MOSES PEHA', 'WAINGAPU, 10-10-1967', 'L', 'PROTESTAN', 'SLTA', 'SWASTA', NULL),
(1115, 2, 1, '2', '7', 'THERSIA HUMAU', 'NEKETUKA, 08-08-1958', 'P', 'PROTESTAN', NULL, 'TANI', NULL),
(1117, 3, 1, '2', '7', 'SEMRI FALLO', 'SOE, 19-09-1980', 'L', 'PROTESTAN', 'SLTP', 'TANI', NULL),
(1120, 4, 1, '2', '7', 'SIMON. A HUMAU', 'NISA, 08-04-1985', 'L', 'PROTESTAN', 'SLTA', 'TANI', NULL),
(1123, 5, 1, '2', '7', 'SIMON LALUS', 'FENUN, 24-08-1976', 'L', 'PROTESTAN', 'SD', 'TANI', NULL),
(1127, 6, 1, '2', '7', 'EFRAIM NABEN', 'BAUMATA, 28-12-1974', 'L', 'PROTESTAN', 'SLTA', 'PNS', NULL),
(1132, 7, 1, '2', '7', 'TITUS LAKAT', 'MANAFU, 16-06-1964', 'L', 'PROTESTAN', 'SD', 'TANI', NULL),
(1138, 8, 1, '2', '7', 'MUHAMMAD RIZAL AMBRAN ROSNA', 'KUPANG, 19-11-1978', 'L', 'ISLAM', 'SARJANA', 'SWASTA', NULL),
(1145, 9, 1, '2', '7', 'ELISABETH GIRI AMBRAN', 'KUPANG, 27-08-1952', 'P', 'ISLAM', 'SLTA', 'PNS', NULL),
(1147, 10, 1, '2', '7', 'RISAL RUSNAH', 'KUPANG, 17-07-1960', 'L', 'ISLAM', 'SLTA', 'SWASTA', NULL),
(1150, 11, 1, '2', '7', 'GETRIDA LALUS-TUAN', 'BELO, 01-07-1930', 'P', 'PROTESTAN', 'BH', 'TANI', NULL),
(1154, 12, 1, '2', '7', 'OKTAVIANUS LALUS', 'BAUMATA, 25-10-1973', 'L', 'PROTESTAN', 'SLTA', 'TANI', NULL),
(1158, 13, 1, '2', '7', 'RUDY.N.F.O NUBATONIS', 'PENFUI, 19-05-1969', 'L', 'PROTESTAN', 'SLTA', 'SWASTA', NULL),
(1164, 14, 1, '2', '7', 'NELCI NUBATONIS', 'KUPANG, 27-04-1948', 'P', 'PROTESTAN', 'SD', 'SWASTA', NULL),
(1166, 15, 1, '2', '7', 'TAROCI HUMAU-AMHEKA', 'BOKON, 13-08-1952', 'P', 'PROTESTAN', 'SLTP', 'TANI', NULL),
(1167, 16, 1, '2', '7', 'YOHANIS HUMAU', '23-07-1970', 'L', 'PROTESTAN', 'SLTA', 'SWASTA', NULL),
(1173, 17, 1, '2', '7', 'BALTASAR SASI', 'KEFA, 23-10-1982', 'L', 'KATHOLIK', 'SLTA', 'SWASTA', NULL),
(1176, 18, 1, '2', '7', 'BERNADUS OEBESI', 'KEFA, 05-05-1947', 'L', 'KATHOLIK', 'SD', 'PENSIUNAN', NULL),
(1182, 19, 1, '2', '7', 'DAUD.J.F TARIGAN', 'KAMPUNG BARU, 01-12-1973', 'L', 'PROTESTAN', 'SLT', 'SWASTA', NULL),
(1187, 20, 1, '2', '7', 'AYUB LALUS', 'FENUN, 20-08-1985', 'L', 'PROTESTAN', 'SD', 'TANI', NULL),
(1192, 21, 1, '2', '7', 'YACOB ATOLO', 'OESAO, 19-04-1970', 'L', 'PROTESTAN', 'SD', 'TANI', NULL),
(1198, 22, 1, '2', '7', 'HENDRIK.F ELUAMA', 'MANULAI, 25-04-1954', 'L', 'PROTESTAN', 'SLTP', 'PENSIUNAN', NULL),
(1203, 23, 1, '2', '7', 'LODIA LULU TUAN', 'BELO, 12/11/1936', 'P', 'PROTESTAN', 'TS', 'TANI', NULL),
(1204, 24, 1, '2', '7', 'BENEDIKTUS TPOI', 'KEFA, 24/07/1967', 'L', 'KATOLIK', 'SD', 'SWASTA', NULL),
(1209, 25, 1, '2', '7', 'SEMI BALSASAR NOBRIHAS', 'BAUN, 18/09/1963', 'L', 'PROTESTAN', 'SERJANA', 'PNS', NULL),
(1213, 26, 1, '2', '7', 'FINSENSIUS FEKA', 'KEFA, 28/12/1979', 'L', 'KATOLIK', 'SD', 'TANI', NULL),
(1219, 27, 1, '2', '7', 'SILPA NABEN', NULL, 'P', 'PROTESTAN', NULL, NULL, NULL),
(1220, 28, 1, '2', '7', 'ALBERTUS KAPITAN', 'KEFA, 16/08/1974', 'L', 'KATOLIK', 'SD', NULL, NULL),
(1228, 29, 1, '2', '7', 'DOMINGGUS ATULE', 'OEKUSI, 18/12/1983', 'L', 'KATOLIK', 'DO', 'TANI', NULL),
(1232, 30, 1, '2', '7', 'AMBROSIUS TALAN', 'KEFA, 07/11/1981', 'L', 'KATOLIK', 'SD', 'SWASTA', NULL),
(1235, 31, 1, '2', '7', 'ARIANTO ADRIANUS TATUIN', 'KUPANG, 12/01/1978', 'L', 'KATOLIK', 'SARJANA', 'PNS', NULL),
(1241, 32, 1, '2', '7', 'ANSELNUS ABI', 'KEFA, 27/11/1967', 'L', 'KATOLIK', 'SD', 'SWASTA', NULL),
(1249, 33, 1, '2', '7', 'SIMON ONI SON', 'KEFA, 27/02/1978', 'L', 'KATOLIK', 'SLTP', 'SWASTA', NULL),
(1255, 34, 1, '2', '7', 'MADE N. B. ANDAYANA', 'BALI, 23/10/1970', 'L', 'HINDU', 'SD', NULL, NULL),
(1260, 35, 1, '2', '7', 'ANTONIUS ABI', 'BANAIN, 10/08/1975', 'L', 'KATOLIK', 'SD', NULL, NULL),
(1263, 36, 1, '2', '7', 'AGUSTINUS NAHAK', 'TUABANA, 07/07/1974', 'L', 'PROTESTAN', 'SLTA', 'PNS', NULL),
(1266, 37, 1, '2', '7', 'RAYMUNDUS ANUNUT', 'KEFA, 10/10/1965', 'L', 'KATOLIK', 'SLTP', 'TANI', NULL),
(1271, 38, 1, '2', '7', 'LAZARUR FEKA', 'KEFA, 09/11/1969', 'L', 'KATOLIK', 'SD', 'SWASTA', NULL),
(1277, 39, 1, '2', '7', 'FOLKES LENGGU', NULL, 'L', 'PROTESTAN', 'SLTA', 'SWASTA', NULL),
(1283, 40, 1, '2', '7', 'NIKOLAS OBESI', 'BAUMATA, 17/05/1974', 'L', 'KATOLIK', 'SLTA', 'SWASTA', NULL),
(1286, 42, 1, '2', '7', 'PETRUS MATUFINA', 'KEFA, 01/09/1982', 'L', 'KATOLIK', 'SARJANA', 'SWASTA', NULL),
(1289, 43, 1, '2', '7', 'VALENTINUS KENDJAM', 'OELNEKE, 10/12/1978', 'L', 'KATOLIK', 'SLTP', 'TANI', NULL),
(1292, 44, 1, '2', '7', 'MARTHEN BATMALO', 'BELU, 17/10/1966', 'L', 'PROTESTAN', 'SLTA', 'PNS', NULL),
(1298, 45, 1, '2', '7', 'MARIANUS WEDO', 'WUDU, 25/05/1982', 'L', 'KATOLIK', 'SARJANA', 'PNS', NULL),
(1303, 47, 1, '2', '7', 'YOHANIS N. BANO', 'KEFA, 10/09/1962', 'L', 'KATOLIK', 'SLTP', 'SWASTA', NULL),
(1315, 49, 1, '2', '7', 'SOLEMAN HUMAU', 'FENUN, 07/06/1971', 'L', 'PROTESTAN', 'SLTA', 'PETANI', NULL),
(1321, 51, 1, '2', '7', 'RUBEN Y. BENGNGU', 'KUPANG, 19/8/1976', 'L', 'PROTESTAN', 'SLTA', 'SWASTA', 'KAWIN'),
(1325, 52, 1, '2', '7', 'MELKIANUS D. BENGNGU', 'KUPANG, 30/09/1978', 'L', 'PROTESTAN', 'SLTP', NULL, NULL),
(1326, 53, 1, '2', '7', 'ISAKH PATTIWAELLLAPIA', 'BAUMATA, 27/09/1966', 'L', 'PROTESTAN', 'SMP', 'SWASTA', 'KAWIN'),
(1331, 1, 1, '5', '13', 'MARSELINUS NENOHAY', 'KUPANG, 18-03-1991', 'L', 'PROTESTAN', NULL, 'TANI', 'KAWIN'),
(1332, 2, 5, '5', '13', 'LUISA', 'KUPANG, 09-01-1991', 'P', 'PROTESTAN', 'SD', 'IRT', 'Belum Menikah'),
(1333, 3, 5, '5', '13', 'MICHELE NAFTALI NENOHAY', 'PAPUA BARAT, 16-01-2013', 'L', 'PROTESTAN', 'SD', 'petani', 'Belum Menikah'),
(1334, 4, 1, '5', '13', 'YACOB OLLA', 'OELNOAH, 25-06-1983', 'L', 'PROTESTAN', 'SLTA', 'WIRASWASTA', 'KAWIN'),
(1335, 5, 2, '5', '13', 'YULIN ANITA NORMA TUAN', 'BELLO, 26-07-1984', 'P', 'PROTESTAN', 'SLTA', 'KARYAWAN HONORER', 'KAWIN'),
(1336, 6, 3, '5', '13', 'YAYAN MANUELA OLLA', 'KUPANG, 29-03-2020', 'P', 'PROTESTAN', 'BS', NULL, NULL),
(1337, 7, 1, '5', '13', 'WELEM BAKKER', 'LARAT, 16-09-1980', 'L', 'PROTESTAN', 'SLTA', 'POLRI', 'KAWIN'),
(1338, 8, 2, '5', '13', 'JULIANA JANARIO', 'LOSPALOS, 03-03-1992', 'P', 'PROTESTAN', 'SLTA', 'IRT', 'KAWIN'),
(1339, 9, 3, '5', '13', 'FRANSISCO KORENTIAN BAKKER', 'KUPANG, 12-04-2003', 'L', 'PROTESTAN', 'BS', 'BS', NULL),
(1340, 10, 1, '5', '13', 'YONATHAN SONBAI', 'NETEN, 17-12-1981', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1341, 11, 2, '5', '13', 'SIPORA SEPRIANA BONES', 'OELBION, 13-09-1987', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1342, 12, 3, '5', '13', 'KESYA KYSANDA SONBAI', 'CAMPLONG, 19-06-2013', 'P', 'PROTESTAN', 'TS', NULL, NULL),
(1343, 13, 4, '5', '13', 'PUTRY GRASELLA SONBAI', 'NETEN, 09-03-2015', 'P', 'PROTESTAN', 'TS', NULL, NULL),
(1344, 1, 1, '5', '13', 'MIKAEL NOME', 'BONEN, 12-03-1980', 'L', 'PROTESTAN', 'TAMAT SD', 'PETANI', 'KAWIN'),
(1345, 2, 5, '5', '13', 'DELVIANA ITA OBE', 'BONEN, 23-12-1990', 'P', 'PROTESTAN', 'TAMAT SD', 'IRT', 'Belum Menikah'),
(1346, 3, 5, '5', '13', 'MARLOV ADITIA NOME', 'FATUNAPI, 23-03-2013', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'petani', 'Belum Menikah'),
(1347, 4, 5, '5', '13', 'SERLI NOME', 'BAUMATA, 04-09-2018', 'P', 'PROTESTAN', 'BS', 'petani', 'Belum Menikah'),
(1348, 5, 1, '5', '13', 'JONI ARCHILAUS NOME', 'FATUNAPI, 06-04-1973', 'L', 'PROTESTAN', 'TAMAT SD', 'PETANI', 'KAWIN'),
(1349, 6, 2, '5', '13', 'AFLIANA TAIMENAS', 'BAKIN, 24-04-1983', 'P', 'PROTESTAN', 'TAMAT SD', 'IRT', 'KAWIN'),
(1350, 7, 3, '5', '13', 'OSKAR NOME', 'FATUNAPI, 01-10-2002', 'L', 'PROTESTAN', 'TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1351, 8, 4, '5', '13', 'OESEMI NOME', 'FATUNAPI, 04-10-2005', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1352, 9, 5, '5', '13', 'TALIA OGILVI NOME', 'KUPANG, 19-10-2016', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'TIDAK KERJA', NULL),
(1353, 10, 6, '5', '13', 'IVANA YUNITA NOME', 'KUPANG, 17-01-2019', 'P', 'PROTESTAN', 'BS', 'TIDAK KERJA', NULL),
(1354, 11, 1, '5', '13', 'MARSELINA V. NAIS', 'KOPU, 01-01-1944', 'P', 'PROTESTAN', NULL, 'PETANI', 'CERAI MATI'),
(1355, 12, 1, '5', '13', 'FREDIK OLLA', 'FATUNAPI, 27-02-1966', 'L', 'PROTESTAN', 'TS', 'PETANI', 'KAWIN'),
(1356, 13, 2, '5', '13', 'YULIANA BURENI', 'NUBRAEN, 06-07-1966', 'P', 'PROTESTAN', 'TD', 'IRT', 'KAWIN'),
(1357, 14, 3, '5', '13', 'FRANSINA OLLA', 'BAUMATA, 31-08-1993', 'P', 'PROTESTAN', 'SLTA', 'KARYAWAN HONORER', NULL),
(1358, 15, 4, '5', '13', 'FENCI YANI OLLA', 'FATUNAPI, 19-09-1998', 'P', 'PROTESTAN', 'SLTA', NULL, NULL),
(1360, 11, 1, '5', '13', 'SIMSON NOME', 'BONEN, 09-09-1975', 'L', 'PROTESTAN', 'TD', 'PETANI', 'KAWIN'),
(1361, 12, 2, '5', '13', 'YULIANA EKSI MERNI LOPO', 'O\'AEM, 23-01-1981-OELEKAM', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1362, 13, 1, '5', '13', 'YAKOBTH NOME', 'BONEN, 05-01-1979', 'P', 'PROTESTAN', 'SD', 'PETANI', NULL),
(1363, 14, 2, '5', '13', 'YUNITA RUTHNIANI NOME', 'BAUMATA, 16-06-2019', 'P', 'PROTESTAN', 'TS', NULL, NULL),
(1364, 15, 1, '5', '13', 'OKTOVIANUS NOME', 'FATUNAPI, 24-10-1977', 'L', 'PROTESTAN', 'SD', 'BURU TANI', 'KAWIN'),
(1365, 16, 2, '5', '13', 'MARIA MAKDALINA DEPASI ATOLA', 'OELTUA, 01-05-1976', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1366, 22, 1, '5', '13', 'PAULINA FENAIS', 'FATUNAPI, 07-11-1952', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'IRT', 'BELUM KAWIN'),
(1367, 23, 1, '5', '13', 'DAMARIS MASU', 'BONEN, 28-12-1958', 'P', 'PROTESTAN', 'SD', 'IRT', 'CERAI MATI'),
(1368, 24, 2, '5', '13', 'RODI SONBAI', 'NETEN, 03-01-1995', 'P', 'PROTESTAN', 'SLTA', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1369, 25, 3, '5', '13', 'BERNATH SONBAI', 'NEKEN, 02-02-1997', 'L', 'PROTESTAN', 'SLTP', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1370, 26, 1, '5', '13', 'FERDINAN NOME', 'FATUNAPI, 07-02-1965', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1371, 27, 2, '5', '13', 'YUSTINA LOPO', 'SUNGKAEN, 15-06-1976', 'P', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1372, 28, 3, '5', '13', 'YOFAN BENITRIUS NOME', 'SUNGKAEN, 28-07-2005', 'L', 'PROTESTAN', 'SLTA', 'IRT', 'BELUM KAWIN'),
(1373, 29, 4, '5', '13', 'ELDA MARLIANCE NOME', 'FATUNAPI, 10-04-2007', 'P', 'PROTESTAN', 'SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1374, 30, 5, '5', '13', 'YETRI FEBRIANI NOME', 'FATUNAPI, 26-04-2009', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1375, 31, 6, '5', '13', 'MERI YIZLIA NOME', 'BAUMATA, 20-05-2014', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1376, 17, 1, '5', '13', 'FRANT JIE SAKAU', 'BONEN, 01-04-1942', 'P', 'PROTESTAN', 'BELUM SEKOLAH', 'IRT', 'KAWIN'),
(1377, 18, 1, '5', '13', 'ANATCI YULIANA HONIN', 'OELNOAH, 26-07-1961', 'P', 'PROTESTAN', 'TIDAK SEKOLAH', 'PETANI', 'KAWIN'),
(1378, 19, 2, '5', '13', 'FELIPUS OLLA', 'NETEN, 12-02-1991', 'L', 'PROTESTAN', 'SLTP', 'PELAJAR/MAHASISWA', NULL),
(1379, 20, 3, '5', '13', 'NITANAEL OLLA', 'NETEN, 08-11-1993', 'L', 'PROTESTAN', 'TAMAT SD', 'TIDAK KERJA', NULL),
(1380, 21, 4, '5', '13', 'BATSEBA OLLA', 'NETEN, 27-01-1996', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1381, 22, 5, '5', '13', 'DELMINCE BENDELINA OLLA', 'NETEN, 26-06-1999', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1382, 24, 1, '5', '13', 'PETRUS SONBAI', 'BAUN,02-07-1985', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'PETANI', 'KAWIN'),
(1383, 25, 2, '5', '13', 'FRIANCE SUSANA PANATIBANA', 'FATUMALELAT, 22-02-1982', 'P', 'PROTESTAN', 'SLTP', 'IRT', 'KAWIN'),
(1384, 28, 1, '5', '13', 'YULIANA SONBAI', 'BONEN, 15-07-1960', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'IRT', 'BELUM KAWIN'),
(1385, 29, 2, '5', '13', 'ANTONETA SONBAI', 'BONEN, 02-08-1988', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'TIDAK KERJA', 'BELUM KAWIN'),
(1386, 30, 1, '5', '13', 'MARTHA HUMAU', 'FENUN, 12-05-1958', 'P', 'PROTESTAN', 'BELUM SEKOLAH', 'IRT', 'KAWIN'),
(1387, 31, 2, '5', '13', 'MELKIANUS SONBAI', 'FENUN, 21-05-1983', 'L', 'PROTESTAN', 'SLTP', 'WIRASWASTA', NULL),
(1388, 32, 3, '5', '13', 'AGUSTINUS SONBAI', 'NETEN, 28-08-1989', 'L', 'PROTESTAN', 'SD', 'TIDAK KERJA', NULL),
(1389, 33, 4, '5', '13', 'NOLDI MARIANA SONBAI', 'NETEN, 11-12-1997', 'P', 'PROTESTAN', 'SLTA', 'PELAJAR/MAHASISWA', NULL),
(1390, 34, 5, '5', '13', 'FINSEN ARIANTO SONBAI', 'NETEN, 05-02-2023', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1391, 35, 1, '5', '13', 'KORNELIS SONBAI', 'BONEN, 01-01-1946', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1392, 36, 2, '5', '13', 'YULIANA SONBAI - ALBATA', 'KOLHUA, 18-11-1953', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1393, 23, 1, '5', '13', 'AGUSTINUS SONBAI', 'NETEN, 20-08-1981', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1394, 24, 2, '5', '13', 'ORANCE NENOTEK', 'NENOTES, 10-10-1984', 'P', 'PROTESTAN', 'SLTA', 'IRT', 'KAWIN'),
(1395, 25, 3, '5', '13', 'ORLANDO ARNOLUS SONBAI', 'BONEN, 09-10-2011', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1396, 26, 4, '5', '13', 'DEDE RESLIANA SONBAI', 'BONEN, 24-10-2016', 'P', 'PROTESTAN', 'BS', 'TIDAK KERJA', NULL),
(1397, 27, 1, '5', '13', 'MATHEOS SONBA\'I', 'MABUN, 11-05-1957', 'L', 'PROTESTAN', 'TIDAK SEKOLAH', 'PETANI', 'KAWIN'),
(1398, 28, 2, '5', '13', 'FIKTORIA LOPO', 'BONEN OELEKAM, 06-02-1958', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1399, 29, 1, '5', '13', 'MARSELINA SONBAI', 'MABUN, 09-09-1963', 'L', 'PROTESTAN', 'TIDAK SEKOLAH', 'IRT', 'BELUM KAWIN'),
(1400, 30, 2, '5', '13', 'HERMAN SONBAI', 'MABUN, 11-03-1977', 'P', 'PROTESTAN', 'SLTP', 'WIRASWASTA', 'BELUM KAWIN'),
(1401, 31, 3, '5', '13', 'JOHANA SONBAI', 'MABUN, 18-07-1978', 'P', 'PROTESTAN', 'SLTP', 'WIRASWASTA', 'BELUM KAWIN'),
(1402, 32, 4, '5', '13', 'JUNIYOLINDA SONBAI', 'MABUN, 09-06-2006', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1403, 33, 1, '5', '13', 'DORKAS SONBA\'I', 'BONEN, 05-01-1969', 'P', 'PROTESTAN', 'SD', 'IRT', 'CERAI MATI'),
(1404, 34, 2, '5', '13', 'DESI YUNITA SALKERY', 'BONEN, 11-11-1992', 'P', 'PROTESTAN', 'SLTA', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1405, 35, 3, '5', '13', 'MARSEL FRENGKI SALKERY', 'MABUN, 02-03-1999', 'L', 'PROTESTAN', 'SLTA', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1406, 36, 4, '5', '13', 'ANTONIUS BENYAMIN SONBAI', 'BONEN, 05-02-2004', 'L', 'PROTESTAN', 'SLTP', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1407, 37, 5, '5', '13', 'BENDELINA SONBAI', 'MABUN, 14-11-2010', 'P', 'PROTESTAN', 'SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1408, 38, 1, '5', '13', 'DAVID SONBAI', 'BONEN KOPU, 20-12-1960', 'L', 'PROTESTAN', 'TIDAK SEKOLAH', 'PETANI', 'KAWIN'),
(1409, 39, 2, '5', '13', 'SELFINA BAITANU', 'KUANKISEN, 11-09-1964', 'P', 'PROTESTAN', 'TIDAK SEKOLAH', 'IRT', 'KAWIN'),
(1410, 40, 3, '5', '13', 'YANGRI BAITANU', 'KUANKISEN, 27-01-1988', 'L', 'PROTESTAN', 'SD', 'BURU TANI', NULL),
(1411, 41, 4, '5', '13', 'YOHANES RAFLES SONBAI', 'KUANKISEN, 28-06-1996', 'L', 'PROTESTAN', 'SD', 'PETERNAK', NULL),
(1412, 42, 5, '5', '13', 'THERESIA MAILDA KAROLINA SONBAI', 'BONEN KOPU, 25-03-2000', 'P', 'PROTESTAN', 'SLTP', 'BELUM KERJA', NULL),
(1413, 43, 6, '5', '13', 'MARLINCE TRIFANTI SONBAI', 'SUNGKAEN, 31-03-2000', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'BELUM KERJA', NULL),
(1414, 28, 1, '5', '13', 'ABRAHAM SONBAI', 'BONEN, 04-06-1987', 'L', 'PROTESTAN', 'SD', 'PETANI', 'KAWIN'),
(1415, 29, 2, '5', '13', 'WIHELMINA FENI', 'FLORES, 10-02-1990', 'P', 'PROTESTAN', 'SD', 'IRT', 'KAWIN'),
(1416, 30, 3, '5', '13', 'BERLA SUSANA SONBAI', 'SENENU, 24-04-2011', 'P', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1417, 31, 4, '5', '13', 'ALFEN PUTRA SONBAI', 'MABUN, 06-01-2016', 'L', 'PROTESTAN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1418, 32, 1, '5', '13', 'SOLEMAN SONBAI', 'BONEN, 05-08-1974', 'L', 'PROTESTAN', 'SLTP', 'PETANI', 'KAWIN'),
(1419, 33, 2, '5', '13', 'ADOLFINA HONIN', 'BONEN, 30-08-1977', 'P', 'PROTESTAN', 'SLTP', 'IRT', 'KAWIN'),
(1420, 34, 3, '5', '13', 'SEPTIASMAWE SONBAI', 'BONEN, 20-09-1996', 'P', 'PROTESTAN', 'SLTA', 'PELAJAR/MAHASISWA', NULL),
(1421, 35, 4, '5', '13', 'DEBORA ELVIWANTI SONBAI', 'BONEN, 28-07-2000', 'P', 'PROTESTAN', 'SLTP', 'PELAJAR/MAHASISWA', NULL),
(1422, 36, 5, '5', '13', 'OLIVIANA SONBAI', 'BONEN, 08-20-2003', 'P', 'PROTESTAN', 'TAMAT SD', 'PELAJAR/MAHASISWA', NULL),
(1423, 37, 1, '5', '13', 'NELCI SONBAI', 'MABUN, 12-11-1980', 'P', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'IRT', 'BELUM KAWIN'),
(1424, 38, 2, '5', '13', 'JINO SONBAI', 'MABUN, 12-01-2011', 'L', 'KRISTEN', 'BELUM TAMAT SD/ SEDERAJAT', 'PELAJAR/MAHASISWA', NULL),
(1425, 39, 3, '5', '13', 'SONIA SONBAI', 'MABUN, 13-11-2016', 'P', 'KRISTEN', 'BELUM TAMAT SD/ SEDERAJAT', 'PELAJAR/MAHASISWA', NULL);
INSERT INTO `data_penduduk` (`id`, `nomor_urut`, `kk`, `dusun`, `rt`, `nama_lengkap`, `ttl`, `jenis_kelamin`, `agama`, `pendidikan`, `pekerjaan`, `status_perkawinan`) VALUES
(1426, 40, 1, '5', '13', 'TABITA SONBAI', 'BONEN, 27-09-1972', 'P', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'IRT', 'BELUM KAWIN'),
(1427, 41, 2, '5', '13', 'NYONGKI A. BONES', 'MABUN, 06-10-1997', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', NULL),
(1428, 42, 3, '5', '13', 'SOFIA AMELIA SONBAI', 'BONEN, 15-09-2001', 'P', 'KRISTEN', 'SLTP/SEDERAJAT', 'BELUM/TIDAK BEKERJA', NULL),
(1429, 43, 1, '5', '13', 'NAHUM SONBAI', 'MABUN, 10-11-1981', 'L', 'KRISTEN', 'BELUM TAMAT SD/ SEDERAJAT', 'BURUH TANI/PEKEBUN', 'KAWIN'),
(1430, 44, 2, '5', '13', 'NOFIANTI LALUS', 'FATUFORA, 19-11-1985', 'P', 'KRISTEN', 'BELUM TAMAT SD/ SEDERAJAT', 'IRT', 'KAWIN'),
(1431, 45, 3, '5', '13', 'FERNANDO SONBAI', 'BAUMATA, 24-02-2010', 'L', 'KRISTEN', 'BELUM TAMAT SD/ SEDERAJAT', 'PELAJAR/MAHASISWA', NULL),
(1432, 46, 4, '5', '13', 'MALFIN SONBAI', 'BAUMATA, 01-05-2018', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', NULL),
(1433, 1, 1, '5', '12', 'BERTA SAKAUBONES', 'KOPU,02-01-1951', 'P', 'KRISTEN', NULL, 'PETANI', NULL),
(1434, 2, 5, '4', '12', 'MARKIUL SAKAU', 'KOPU,16-05-1978', 'P', 'KRISTEN', 'SD', 'PETANI', 'Belum Menikah'),
(1437, 5, 1, '5', '12', 'KAREL SAKAU', 'KOPU, 1922', 'L', 'KRISTEN', NULL, 'PETANI', NULL),
(1438, 6, 1, '5', '12', 'ALEXSANDER SAKAU', 'KOPU,28-08-1978', 'L', 'KRISTEN', 'SLTA', 'SWASTA', NULL),
(1439, 7, 2, '5', '12', 'MAKLOMM SAKAU', 'MANGGRAI,17-08-1978', 'P', 'KRISTEN', 'SD', 'SWASTA', NULL),
(1440, 9, 2, '5', '12', 'MAKOM SAKA', 'KOPU,20-01-1982', 'P', 'KRISTEN', 'SD', NULL, NULL),
(1441, 10, 3, '5', '12', 'CHRISTIAN ASMANI', 'KOPU,01-04-2008', 'L', 'KRISTEN', 'SD', 'TANI', NULL),
(1442, 11, 4, '5', '12', 'RONALDINO ASMANI', 'KOPU,11-03=2009', 'P', 'KRISTEN', 'SLTA', 'SWASTA', NULL),
(1443, 13, 2, '5', '12', 'GASPER SAKAU', 'KOPU,09-07-1993', 'L', 'KRISTEN', 'SD', 'TANI', NULL),
(1444, 14, 3, '5', '12', 'ONGKI SAKAU', 'KOPU,27-08-2002', 'L', 'KRISTEN', 'SD', 'TANI', NULL),
(1445, 16, 2, '5', '12', 'THRESIA LINGU', 'SUMBA,22-02-1982', 'P', 'KRISTEN', NULL, NULL, NULL),
(1446, 17, 3, '5', '12', 'MAIKEL L.KALAEL', NULL, 'L', 'KRISTEN', 'SLTP', 'TANI', NULL),
(1447, 7, 1, '5', '12', 'ENOS SAKAU', 'MABUN,10-11-1938', 'L', 'KRISTEN', 'TIDAK SEKOLAH', 'TANI', NULL),
(1448, 8, 2, '5', '12', 'AFAUANA SAKAU BISTOLEN', 'KOLHUA,09-04-1984', 'P', 'KRISTEN', 'TIDAK SEKOLAH', 'TANI', NULL),
(1449, 9, 3, '5', '12', 'WELMINCE SAKAU', 'KOLHUA,20-03-1983', 'P', 'KRISTEN', 'SLTA', 'TANI', NULL),
(1450, 10, 1, '5', '12', 'NOH SAKAU', 'KOPU,21-11-1960', 'L', 'KRISTEN', NULL, 'PETANI', NULL),
(1451, 11, 2, '5', '12', 'YUNYANA SAKAU SONBAI', 'KOPU,04-06-1966', 'P', 'KRISTEN', NULL, 'IRT', NULL),
(1452, 12, 3, '5', '12', 'RUDI T SAKAU', 'KOPU,31-12-1996', 'L', 'KRISTEN', 'SD', 'SWASTA', NULL),
(1453, 13, 4, '5', '12', 'SILVESTER SAKAU', 'KOPU,02-09-1999', 'L', 'KRISTEN', 'SLTA', 'SWASTA', NULL),
(1454, 14, 5, '5', '12', 'KALEB SAKAU', 'KOPU,13-11-2001', 'L', 'KRISTEN', 'SR', 'PETANI', NULL),
(1455, 15, 6, '5', '12', 'JEFRI SAKAU', 'KOPU,07-04-2004', 'L', 'KRISTEN', 'SLTP', 'TUKANG KAYU', NULL),
(1456, 16, 1, '5', '12', 'ABJATAR SAKAU', 'KOPU,03-08-1957', 'L', 'KRISTEN', 'TIDAK SEKOLAH', 'TUKANG KAYU', NULL),
(1457, 17, 2, '5', '12', 'NAEMA S TUNBONAT', 'DAF,30-11-1964', 'P', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1458, 18, 3, '5', '12', 'MAKLAM SAKAU', 'KOPU,14-03-1986', 'L', 'KRISTEN', NULL, 'BELUM BEKERJA', NULL),
(1459, 19, 4, '5', '12', 'LUKAS SAKAU', 'KOPU,14-07-1992', 'L', 'KRISTEN', 'SLTA', 'PETANI', NULL),
(1460, 20, 5, '5', '12', 'DIVAT P SAKAU', 'KOPU,21-02-2001', 'L', 'KRISTEN', 'SLTA', 'SISWA', NULL),
(1461, 21, 1, '5', '12', 'JAKOB J SAKAU', 'NETEN, 02-01-1973', 'L', 'KRISTEN', 'SLTP', 'SISWA', NULL),
(1462, 22, 2, '5', '12', 'OKTAVIANA ARIANCE SAKAU', 'NETEN,14-10-1973', 'P', 'KRISTEN', 'SD', 'SISWA', NULL),
(1463, 23, 3, '5', '12', 'PONTI Y SAKAU', 'NETEN,26-02-1997', 'L', 'KRISTEN', 'SLTA', 'PETANI', NULL),
(1464, 24, 4, '5', '12', 'YUSLIANDA SAKAU', 'NETEN,17-07-1999', 'L', 'KRISTEN', 'SLTP', 'IRT', NULL),
(1465, 25, 5, '5', '12', 'YUDIT SAKAU', 'NETEN,30-07-2001', 'P', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1466, 26, 6, '5', '12', 'CHEYA NORITA SAKAU', 'NETEN,25-11-2001', 'P', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1467, 11, 1, '5', '12', 'JULIANUS SAKAU', 'KOPU,11-03-1952', 'L', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1468, 12, 2, '5', '12', 'MARGARITA SAKAU LOPO', 'KOPU,06-03-1952', 'P', 'KRISTEN', 'SD', 'PETANI', NULL),
(1469, 13, 3, '5', '12', 'LORENSIUS SAKAU', 'KOPU,06-03-1986', 'L', 'KRISTEN', 'SLTA', 'IRT', NULL),
(1470, 14, 4, '5', '12', 'NEHEMIA SAKAU', 'KOPU,14-11-1989', 'L', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1471, 15, 5, '5', '12', 'NELCI SUZANA SAKAU', 'KOPU,23-12-1995', 'P', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', NULL),
(1472, 16, 6, '5', '12', 'ELUAS SAKAU', 'KOPU,08-01-2003', 'L', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1473, 17, 1, '5', '12', 'EKLOPAS SAKAU', 'KOPU,11-10-1985', 'P', 'KRISTEN', 'SD', 'BELUM BEKERJA', NULL),
(1474, 18, 2, '5', '12', 'NEVEN SKENLOP', 'SUNKAEN,01-05-1984', 'L', 'KRISTEN', 'SLTP', 'BELUM BEKERJA', NULL),
(1475, 19, 3, '5', '12', 'RIKI SAKAU', 'SUNKAEN,29-08-2006', 'L', 'KRISTEN', 'SLTA', 'BELUM BEKERJA', NULL),
(1476, 20, 4, '5', '12', 'CLORISA EKSANDRA SAKAU', 'SUNKAEN,05-09-2012', 'P', 'KRISTEN', 'SLTA', 'IRT', NULL),
(1477, 21, 1, '5', '12', 'YULIANA SAKAU', 'KOPU,31-03-1976', 'P', 'KATOLIK', 'SD', 'SWASTA', NULL),
(1478, 22, 2, '5', '12', 'RIAN BURENI', 'KOPU,08-02-1965', 'L', 'KATOLIK', 'SLTA', 'SWASTA', NULL),
(1479, 23, 3, '5', '12', 'FRITS HERSON SAKAU', 'KOPU,26-06-2000', 'L', 'KATOLIK', 'SLTP', NULL, NULL),
(1480, 24, 1, '5', '12', 'YAKOBUS SAKAU', 'KOPU,07-07-1967', 'L', 'KRISTEN', 'TIDAK SEKOLAH', NULL, NULL),
(1481, 25, 2, '5', '12', 'AGUSTINUS SAKAU', 'KOPU,08-02-1996', 'L', 'KRISTEN', 'TIDAK SEKOLAH', NULL, NULL),
(1482, 26, 1, '5', '12', 'YEFTA SAKAU', '32-11-1983', 'L', NULL, 'PETANI', NULL, NULL),
(1483, 27, 2, '5', '12', 'SOFIA LAKA', '20-09-96', 'P', NULL, NULL, NULL, NULL),
(1484, 28, 3, '5', '12', 'BOI SAKAU', NULL, 'L', NULL, NULL, NULL, NULL),
(1485, 29, 1, '5', '12', 'JESKIEL SAKAU', 'KOPU,20-06-1983', 'L', 'KRISTEN', 'SD', 'PETANI', NULL),
(1486, 30, 2, '5', '12', 'PETRONEL SAKAU NOME', 'FATUNAPI,03-06-1987', 'P', 'KRISTEN', 'SD', 'IRT', NULL),
(1487, 31, 3, '5', '12', 'OFIR YERIOT SAKAU', 'KOPU,29,10-2007', 'L', 'KRISTEN', 'TK', NULL, NULL),
(1488, 32, 4, '5', '12', 'APRIANA RIVANDI SAKAU', 'KOPU,04-04-2014', 'L', 'KRISTEN', NULL, NULL, NULL),
(1489, 33, 1, '5', '12', 'ESTER KALAEL', 'KOPU,30-03-1975', 'P', 'KRISTEN', 'SD', 'IRT', NULL),
(1490, 34, 2, '5', '12', 'ZET KALAEL', 'KOPU,14-10-1998', 'L', 'KRISTEN', 'SARJANA MUDA', 'KARYAWAN SWASTA', NULL),
(1491, 35, 1, '5', '12', 'YOEL SAKAU', 'BINILAKA,23-01-1992', 'L', 'KRISTEN', 'SLTA', 'KARYAWAN HONOR', NULL),
(1492, 36, 2, '5', '12', 'DESRY HUMAU', 'MANEFU,17-12-1992', 'P', 'KRISTEN', 'STRA', 'IRT', NULL),
(1493, 37, 1, '5', '12', 'LUKAS SAKAU', 'KOPU,16-07-1993', 'L', 'KRISTEN', 'STRA', 'KARIYAWAN SWASTA', NULL),
(1494, 38, 2, '5', '12', 'YUNITA SANAUNU', 'TUAMESE,10-01-1990', 'P', 'KRISTEN', 'STRA', 'KARIYAWAN SWASTA', NULL),
(1495, 39, 3, '5', '12', 'AURISTEAL SANETA HELY SAKAU', 'KUPANG,01-08-2023', 'P', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM SEKOLAH', NULL),
(1496, 40, 1, '5', '12', 'METUSALAK E.I.BANUNU', 'SOE,26-02-1977', 'L', 'KRISTEN', 'SLTA', 'PEGAWAI', NULL),
(1497, 41, 2, '5', '12', 'BERTHA DAMELDA BANOET', 'KIUBAAT,30-01-1980', 'P', 'KRISTEN', 'STRA', 'PEGAWAI', NULL),
(1498, 42, 3, '5', '12', 'MEOSEFAN BANUNU', 'SOE,29-03-1999', 'L', 'KRISTEN', 'SLTA', 'PELAJAR', NULL),
(1499, 43, 4, '5', '12', 'OPA JULIANUS BANUNU', 'SOE,28-12-2001', 'L', 'KRISTEN', 'SLTP', 'BELUM SEKOLAH', NULL),
(1500, 44, 5, '5', '12', 'SURTADEN BANUNU', 'SOE,08-10-2003', 'L', 'KRISTEN', 'SLTP', 'PELAJAR', NULL),
(1501, 45, 6, '5', '12', 'DEWI YOLINDI BANUNU', 'SOE,08-07-2005', 'P', 'KRISTEN', 'SLTP', 'PELAJAR', NULL),
(1502, 46, 7, '5', '12', 'DESTIANA BANUNU', 'SOE,09-12-2015', 'P', 'KRISTEN', 'BELUM SEKOLAH', 'TIDAK SEKOLAH', NULL),
(1503, 37, 1, '5', '12', 'DELILAH SAKAU', 'BINILAKA,24-05-1986', 'P', 'KRISTEN', 'SD', 'PETANI', NULL),
(1504, 38, 2, '5', '12', 'EUNUKE DOMINIQUE SAKAU', 'NETEN,15-07-2007', 'P', 'KRISTEN', 'BELUM TAMAT', 'PETANI', NULL),
(1505, 39, 3, '5', '12', 'NADAYA KRISTINIA STEVANIA S', 'NETEN,20-11-2009', 'P', 'KRISTEN', 'TIDAK SEKOLAH', 'PETANI', NULL),
(1506, 40, 4, '5', '12', 'ALEXANDER SANDRO SAKAU', 'NETEN,03-09-2011', 'L', 'KRISTEN', 'TIDAK SEKOLAH', 'PETANI', NULL),
(1507, 41, 5, '5', '12', 'ALLAN NOVEN THORILUS SAKAU', 'NETEN,21-01-2014', 'L', 'KRISTEN', 'TIDAK SEKOLAH', 'PETANI', NULL),
(1508, 42, 6, '5', '12', 'AGSON THOMAS SAKAU', 'NETEN,06-08-2007', 'L', 'KRISTEN', 'SD', 'PETANI', NULL),
(1509, 43, 7, '5', '12', 'REVEN THOMI SAKAU', 'NETEN,30-12-2012', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'PETANI', NULL),
(1510, 44, 1, '5', '12', 'MUSA KEBA', 'NETEN,24-03-1979', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BURUH TANI/PERKEBUNAN', NULL),
(1511, 45, 2, '5', '12', 'MEFI PERHATINI BENU', 'MANUTAPEN,18-05-1992', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'IRT', NULL),
(1512, 46, 3, '5', '12', 'KERENHAPUKH SAVELIADELIA K', 'TAKARI,22-01-2014', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', NULL),
(1513, 47, 4, '5', '12', 'KARLA BERITHANIA KEBA', 'KUPANG,10-01-2020', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', NULL),
(1514, 48, 5, '5', '12', 'KRISENCIA ARUMI KEBA', 'KUPANG,08-03-2021', 'P', 'KRISTEN', 'TIDAK/BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', NULL),
(1515, 49, 1, '5', '12', 'KORNELIUS SAKAU', 'KOPU,12-10-1950', 'L', 'KRISTEN', 'TIDAK SEKOLAH', 'BURUH TANI', NULL),
(1516, 50, 2, '5', '12', 'SERTA BONES', 'BIILAKA,02-01-1951', 'P', 'KRISTEN', 'TIDAK SEKOLAH', 'IRT', NULL),
(1517, 51, 3, '5', '12', 'OBET SAKAU', 'KOPU,09-10-1975', 'L', 'KRISTEN', 'TAMAT SD', 'BELUM/TIDAK BEKERJA', NULL),
(1518, 52, 4, '5', '12', 'MARKIUL SAKAU', 'KOPU,16-05-1978', 'L', 'KRISTEN', 'TAMAT SD', 'BELUM/TIDAK BEKERJA', NULL),
(1519, 53, 5, '5', '12', 'BENYAMIN SAKAU', 'KOPU,03-05-1989', 'L', 'KRISTEN', 'TAMAT SD', 'BELUM/TIDAK BEKERJA', NULL),
(1619, 1, 1, '1', '1', 'JACOBA HUMAU, S.PD', '1958-10-20', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'PENSIUN', 'CERAI MATI'),
(1620, 2, 1, '1', '1', 'SARLOTA PAULINA TABELAK', '1995-01-17', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1621, 3, 1, '1', '1', 'YOSUA DAUD TABELAK', '1996-01-22', 'L', 'KRISTEN', 'SLTP/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1622, 4, 1, '1', '1', 'YENNI ROSMALIA KORASSA', '1987-01-01', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1623, 1, 2, '1', '1', 'YOHANES LUDJI', '1962-06-26', 'L', 'KRISTEN', 'SLTP/SEDERAJAT', 'PETANI/BERKEBUN', 'KAWIN TERCATAT'),
(1624, 2, 2, '1', '1', 'FRANSINA TANEBETH', '1965-02-15', 'P', 'KRISTEN', 'SD/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1625, 3, 2, '1', '1', 'LUKAS HENDRIK LUDJI', '1997-11-18', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1626, 4, 2, '1', '1', 'MERLIN YOVITA LUDJI', '2001-05-24', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1627, 1, 3, '1', '1', 'PRIYANTY LUDJI', '1996-02-22', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'PNS', 'BELUM KAWIN'),
(1628, 1, 4, '1', '1', 'TONY OLIVIANUS MANAFE', '1979-04-08', 'L', 'KRISTEN', 'DIPLOMA I/II', 'PNS', 'KAWIN TERCATAT'),
(1629, 2, 4, '1', '1', 'YUNY SUHARDJANA', '1981-06-04', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1630, 3, 4, '1', '1', 'CHRISTA ISABELLA MANAFE', '2004-01-25', 'P', 'KRISTEN', 'SLTA/SMA', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1631, 4, 4, '1', '1', 'KAYROS GABRIEL MANAFE', '2023-12-23', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1632, 1, 5, '1', '1', 'YORIM ELKANA NESIMNASI', '1979-06-15', 'L', 'KRISTEN', 'AKADEMI/DIII/SARJANA MUDA', 'PNS', 'KAWIN TERCATAT'),
(1633, 2, 5, '1', '1', 'YUHARNI ENIKA REFLENI TIMO', '1993-02-15', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1634, 3, 5, '1', '1', 'ARVALTISYEN MAHER GIDEON NESIMNASI', '2013-02-14', 'L', 'KRISTEN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1635, 4, 5, '1', '1', 'AVIO MERLINA NESIMNASI', '2014-05-21', 'P', 'KRISTEN', 'BELUM TAMAT SD', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1636, 5, 5, '1', '1', 'ADVEND HALLAND NESIMNASI', '2024-12-06', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1637, 6, 5, '1', '1', 'KARENHAPUKH NESIMNASI', '1991-10-30', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'TUKANG JAHIT', 'BELUM KAWIN'),
(1638, 7, 5, '1', '1', 'KRISDA RUMLIANI BANAMTUAN', '1995-09-03', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1639, 1, 6, '1', '1', 'SOLI TAROTJI TABELAK', '1993-06-09', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'WIRASWASTA', 'BELUM KAWIN'),
(1640, 1, 7, '1', '1', 'ESTER YULIANA LUBALU', '1995-07-05', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1641, 1, 8, '1', '1', 'DARIUS MARTEN SUKARSONO', '1959-09-30', 'L', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'WIRASWASTA', 'KAWIN TERCATAT'),
(1642, 2, 8, '1', '1', 'MARSELINA Y. AMTARAN', '1968-04-27', 'P', 'KRISTEN', 'TAMAT SD/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1643, 3, 8, '1', '1', 'OTNIEL SUKARSONO', '2002-10-27', 'L', 'KRISTEN', 'BELUM TAMAT SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1644, 4, 8, '1', '1', 'KACY WELMINCE SUKARSONO', '2003-05-30', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1645, 1, 9, '1', '1', 'NADAB MICHAEL LALUS', '1955-11-09', 'L', 'KRISTEN', 'SLTP/SEDERAJAT', 'PETANI/BERKEBUN', 'KAWIN TERCATAT'),
(1646, 2, 9, '1', '1', 'YUDITH PAULINA', '1957-01-21', 'P', 'KRISTEN', 'SLTP/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1647, 3, 9, '1', '1', 'ANDRIYANI MARIA LALUS', '1982-05-29', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1648, 1, 10, '1', '1', 'ADMAN MOSES LALUS', '1984-07-25', 'L', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'WIRASWASTA', 'KAWIN TERCATAT'),
(1649, 2, 10, '1', '1', 'DINA YOSIDA NAAT', '1982-04-19', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'KARYAWAN HONORER', 'KAWIN TERCATAT'),
(1650, 3, 10, '1', '1', 'MICHAEL HENDRIK LALUS', '2016-07-12', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1651, 4, 10, '1', '1', 'AYUB DANIEL LALUS', '2018-01-08', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1688, 1, 1, '1', '1', 'AYUB I. P LALUS', '1964-04-15', 'L', 'Kristen', 'SLTP/SEDERAJAT', 'Wiraswasta', 'Kawin'),
(1689, 2, 1, '1', '1', 'ESTER M. LALUS NOPENANU', '1968-05-07', 'P', 'Kristen', 'Diploma I/II', 'Guru', 'Kawin'),
(1690, 3, 1, '1', '1', 'AIMI M. K. LALUS', '2001-01-29', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1691, 4, 1, '1', '1', 'ISCHAK ISASCHAR LALUS', '1968-12-10', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Wiraswasta', 'Kawin'),
(1692, 5, 1, '1', '1', 'HARYATI', '1981-06-16', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin'),
(1693, 6, 1, '1', '1', 'KEVIN MANUEL LALUS', '2002-07-03', 'L', 'Kristen', 'SLTP/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1694, 7, 1, '1', '1', 'CHAEZAR IBRAHIM LALUS', '2009-07-11', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1695, 8, 1, '1', '1', 'HARIS IGUSTO LALUS', '2014-08-17', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1696, 9, 1, '1', '1', 'BENYAMIN APOLOS LALUS', '1949-10-26', 'L', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'Pendeta', 'Kawin'),
(1697, 10, 1, '1', '1', 'CHATARINA SASTRIANA THONAK', '1955-06-16', 'P', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'Pendeta', 'Kawin'),
(1698, 11, 1, '1', '1', 'EKA NURANI DEBORA LALUS', '1985-08-17', 'P', 'Kristen', 'Diploma IV/Strata I', 'Guru', 'Belum Kawin'),
(1699, 12, 1, '1', '1', 'TETUS JOHNUEL LALUS', '1989-05-04', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1700, 13, 1, '1', '1', 'JOEL TETUS LALUS', '2019-03-16', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1701, 14, 1, '1', '1', 'HALUN YUSTI TSE', '1990-06-10', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1702, 15, 1, '1', '1', 'ROSALIN SOLUKH', '1974-01-30', 'P', 'Kristen', 'SLTP/SEDERAJAT', 'Mengurus Rumah Tangga', 'Cerai Mati'),
(1703, 16, 1, '1', '1', 'VECI MARNI LALUS', '1996-03-07', 'P', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'Wiraswasta', 'Belum Kawin'),
(1704, 17, 1, '1', '1', 'ANGGILIA YOVITA LALUS', '1997-08-23', 'P', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'Wiraswasta', 'Belum Kawin'),
(1705, 18, 1, '1', '1', 'TUCE OKTOVIANUS BALLBESY', '1979-10-17', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Karyawan Swasta', 'Kawin'),
(1706, 19, 1, '1', '1', 'CHRISTA DWI YULIA GIRI', '1993-07-13', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin'),
(1707, 20, 1, '1', '1', 'KEZYA CHARMELITANY EMMA BALLBESY', '2012-01-24', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1708, 21, 1, '1', '1', 'KEANE ALBERT YANRES BALLBESY', '2018-03-13', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1709, 22, 1, '1', '1', 'KANAYA SRI AGUSTINE BALLBESY', '2022-05-03', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1710, 23, 1, '1', '1', 'THOMAS MATA', '1992-12-02', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1711, 24, 1, '1', '1', 'MARINA SEPTIYASI MATA', '2010-09-02', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1712, 25, 1, '1', '1', 'SARLI DJENI LOPO', '1967-09-03', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Guru', 'Cerai Mati'),
(1713, 26, 1, '1', '1', 'ATIN SABAN, A.Md. LLAJ', '1957-07-26', 'L', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'PNS', 'Kawin'),
(1714, 27, 1, '1', '1', 'IVONNY CHRISTIN PELLO', '1988-06-08', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin'),
(1715, 28, 1, '1', '1', 'ZIVANA VANNIA MAYA SABAN', '2016-06-30', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1716, 29, 1, '1', '1', 'ELVANNO MAHENDRA RADHIKA SABAN', '2019-12-06', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1717, 30, 1, '1', '1', 'CLAYRE RAVEND SABAN', '2021-12-04', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1718, 31, 1, '1', '1', 'ANDRE SANI THIMUTIUS TABELAK, S.Pd', '1983-11-25', 'L', 'Kristen', 'Diploma IV/Strata I', 'Karyawan Honorer', 'Kawin'),
(1719, 32, 1, '1', '1', 'FERDERIKA LODA NANGI, S.Pd', '1985-06-16', 'P', 'Kristen', 'Diploma IV/Strata I', 'Karyawan Honorer', 'Kawin'),
(1720, 33, 1, '1', '1', 'GLEN ADERA DARMANS TABELAK', '2013-10-19', 'L', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1721, 34, 1, '1', '1', 'SEAN BRIAN APOLOS TABELAK', '2017-12-17', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1722, 35, 1, '1', '1', 'ASTREE JESIKA PAULIN TABELAK', '2020-01-09', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1723, 36, 1, '1', '1', 'BENYAMIN LUJI', '1966-06-24', 'L', 'Kristen', 'Diploma IV/Strata I', 'PNS', 'Kawin'),
(1724, 37, 1, '1', '1', 'JANE BELANDINA KAUSE', '1970-01-07', 'P', 'Kristen', 'Diploma IV/Strata I', 'PNS', 'Kawin'),
(1725, 38, 1, '1', '1', 'ELDA SHINTYANI LUJI', '2003-11-10', 'P', 'Kristen', 'Belum Tamat Sekolah', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1726, 39, 1, '1', '1', 'BENI LUCKFRAN LUJI', '2008-06-21', 'L', 'Kristen', 'Belum Tamat Sekolah', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1727, 11, 1, '1', '1', 'YANCE KAROLINA LALUS', 'BIPOLO, 21-01-1951', 'P', 'Kristen', 'TAMAT SD/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin Tercatat'),
(1728, 12, 1, '1', '1', 'EMA YAKOBA LALUS', 'BAUMATA, 05-05-1964', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Mengurus Rumah Tangga', 'Belum Kawin'),
(1729, 13, 1, '1', '1', 'ESTER APLONIA LALUS', 'BAUMATA, 25-04-1968', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Karyawan Swasta', 'Belum Kawin'),
(1730, 14, 1, '1', '1', 'ERWIN DARMANTO SUKARSONO', 'BAUMATA, 02-02-1970', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Buruh Harian Lepas', 'Belum Kawin'),
(1731, 15, 1, '1', '1', 'JHON FANGGIDAE', 'ROTE, 11-10-1976', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Petani/Berkebun', 'Kawin Tercatat'),
(1732, 16, 1, '1', '1', 'NELCI KOIB', 'LELOGAMA, 24-07-1986', 'P', 'Kristen', 'SLTP/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin Tercatat'),
(1733, 17, 1, '1', '1', 'KHATRIN FANGGIDAE', 'LELOGAMA, 30-11-2006', 'P', 'Kristen', 'SLTP/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1734, 18, 1, '1', '1', 'GEORGE FANGGIDAE', 'KUPANG, 09-01-2018', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1735, 19, 1, '1', '1', 'GLENN FRANS FANGGIDAE', 'KUPANG, 14-03-2020', 'L', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1736, 20, 1, '1', '1', 'IGNATIUS YERMI', 'BAUMATA, 08-05-1975', 'L', 'Kristen', 'SLTP/SEDERAJAT', 'Petani/Berkebun', 'Kawin Tercatat'),
(1737, 21, 1, '1', '1', 'AGRIPINA KEDATI', 'BAUMATA, 07-01-1972', 'P', 'Katholik', 'TAMAT SD/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin Tercatat'),
(1738, 22, 1, '1', '1', 'YUNI YULIA BUTO', 'BAUMATA, 25-07-2002', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1739, 23, 1, '1', '1', 'FERI AGUSTINUS BUTO', 'BAUMATA, 25-02-2004', 'L', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1740, 24, 1, '1', '1', 'FRENGKI KIA', 'KUPANG, 23-01-1991', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1741, 25, 1, '1', '1', 'CHRISTIAN AMTARAN', 'BAUMATA, 27-12-1953', 'L', 'Kristen', 'Belum Sekolah', 'Petani/Berkebun', 'Belum Kawin'),
(1742, 26, 1, '1', '1', 'IMANUEL DAVID MESSAKH', 'OETETA, 02-11-1985', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Tukang Las/Pandai Besi', 'Kawin Tercatat'),
(1743, 27, 1, '1', '1', 'MARIA ROSARIO MANEHET', 'SOE, 09-10-1991', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin Tercatat'),
(1744, 28, 1, '1', '1', 'PAULUS DAVID MESSAKH', 'OETETA, 05-09-2010', 'L', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1745, 29, 1, '1', '1', 'MARGARETA PUTRI AURELIA MESSAKH', 'KUPANG, 11-12-2012', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1746, 30, 1, '1', '1', 'ANGELLA REVITA MESSAKH', 'KUPANG, 26-01-2015', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1747, 31, 1, '1', '1', 'FELICIA ISABELLA MESSAKH', 'KUPANG, 08-03-2022', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1748, 32, 1, '1', '1', 'LAASAR JOHANIS AMTARAN', 'BAUMATA, 11-11-1959', 'L', 'Kristen', 'SLTP/SEDERAJAT', 'Petani/Berkebun', 'Kawin Tercatat'),
(1749, 33, 1, '1', '1', 'ADOLFINA MAU', 'ALOR, 08-04-1984', 'P', 'Kristen', 'TAMAT SD/SEDERAJAT', 'Mengurus Rumah Tangga', 'Kawin Tercatat'),
(1750, 34, 1, '1', '1', 'MELINDA YUSTISIA AMTARAN', 'KUPANG, 06-05-2003', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1751, 35, 1, '1', '1', 'YUNANDA YAKOMINA AMTARAN', 'BAUMATA, 03-07-2004', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1752, 36, 1, '1', '1', 'ADRIANA JELLI AMTARAN', 'BAUMATA, 29-04-2007', 'P', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1753, 37, 1, '1', '1', 'YUSUF AGUSTINUS M. OILADANG', 'ALOR, 28-03-1967', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Petani/Berkebun', 'Kawin Tercatat'),
(1754, 38, 1, '1', '1', 'DELTJE APRIANY PATI', 'KUPANG, 15-04-1966', 'P', 'Kristen', 'Diploma I/II', 'Guru', 'Kawin Tercatat'),
(1755, 39, 1, '1', '1', 'PUTRI SEMAYA LEPERNIA OILADANG', 'KUPANG, 08-02-1996', 'P', 'Kristen', 'Akademi/DIII/Sarjana Muda', 'Karyawan Swasta', 'Belum Kawin'),
(1756, 40, 1, '1', '1', 'SAHADEWA SALMON YUSUF OILADANG', 'KUPANG, 20-07-2006', 'L', 'Kristen', 'SLTP/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1757, 41, 1, '1', '1', 'AZHEEQA NATHALNIELA RACHEL OILADANG', 'ALOR, 22-06-2019', 'P', 'Kristen', 'Belum Sekolah', 'Belum/Tidak Bekerja', 'Belum Kawin'),
(1758, 42, 1, '1', '1', 'FILMON EDUARD SABU', 'SOE, 04-02-1962', 'L', 'Kristen', 'TAMAT SD/SEDERAJAT', 'Wiraswasta', 'Kawin Tercatat'),
(1759, 43, 1, '1', '1', 'TEROCI GETRIDA NENOSONO', 'BAUMATA, 01-06-1965', 'P', 'Kristen', 'SLTA/SEDERAJAT', 'PNS', 'Kawin Tercatat'),
(1760, 44, 1, '1', '1', 'RONALD LUKAS SABU', 'KUPANG, 04-06-1995', 'L', 'Kristen', 'SLTA/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1761, 45, 1, '1', '1', 'RANDY SABU', 'KUPANG, 19-10-1998', 'L', 'Kristen', 'TAMAT SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1762, 46, 1, '1', '1', 'RALDY YESUA SABU', 'KUPANG, 04-10-2001', 'L', 'Kristen', 'Belum Tamat SD/SEDERAJAT', 'Pelajar/Mahasiswa', 'Belum Kawin'),
(1763, 31, 1, '1', '1', 'YAKOBA LALUS', 'BAUMATA, 16-07-1987', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'KARYAWAN SWASTA', 'JANDA'),
(1764, 32, 1, '1', '1', 'CALVIN S.M. TALNONI', '', 'L', 'KRISTEN', 'SMP', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1765, 32, 2, '1', '1', 'ELISA MANAFE', 'BAUMATA, 03-08-1970', 'L', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'PNS', 'KAWIN TERCATAT'),
(1766, 32, 2, '1', '1', 'MARIA G. MANAFE-LEKI', '', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'WIRASWASTA', 'KAWIN TERCATAT'),
(1767, 32, 3, '1', '1', 'DEDI LEKI', '', 'L', 'KRISTEN', 'SMP', 'PNS', 'BELUM KAWIN'),
(1768, 33, 1, '1', '1', 'LEPANG LELIANA BOLI', 'BAUMATA, 13-09-1968', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PENSIUN', 'CERAI MATI'),
(1769, 34, 1, '1', '1', 'ELSAR MANAFE', 'BAUMATA, 29-08-1992', 'L', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'TENAGA KONTRAK', 'KAWIN TERCATAT'),
(1770, 34, 2, '1', '1', 'KEVY LISTIANI F. TANEO', 'KUPANG, 14-08-1992', 'P', 'KRISTEN', 'STRATA II', 'IRT', 'KAWIN TERCATAT'),
(1771, 34, 3, '1', '1', 'DAVID DANIEL MANAFE', 'BAUMATA, 18-04-2015', 'L', 'KRISTEN', 'SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1772, 34, 4, '1', '1', 'FIDELA ELSAHRA MANAFE', 'BAUMATA, 24-08-2018', 'P', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1773, 35, 1, '1', '1', 'DOMINGGUS GABRIEL LUDJI', 'BAUMATA, 07-05-1962', 'L', 'KRISTEN', 'TAMAT SD/ SEDERAJAT', 'WIRASWASTA', 'KAWIN TERCATAT'),
(1774, 35, 2, '1', '1', 'ROSALINA BERIBE', 'PENFUI, 14-07-1960', 'P', 'KRISTEN', 'TAMAT SD/ SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1775, 35, 3, '1', '1', 'BRED YULIUS LUDJI', 'KUPANG, 30-01-2004', 'L', 'KRISTEN', 'BELUM TAMAT SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1776, 36, 1, '1', '1', 'ALFRED YERRI MBATU', 'PULUTHIE, 09-04-1972', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'TUKANG BATU', 'KAWIN TERCATAT'),
(1777, 36, 2, '1', '1', 'WARI YUSNALITA MARTANIA AMTARAN', 'BAUMATA, 25-06-1975', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1778, 36, 3, '1', '1', 'OSU ALEXANDRO MBATU', 'BAUMATA, 12-05-1997', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1779, 36, 4, '1', '1', 'ALWAN HENDRO MBATU', 'PULUTHIE, 31-01-1999', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1780, 36, 5, '1', '1', 'WANNI ANITA MBATU', 'KUPANG, 31-01-2004', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1781, 36, 6, '1', '1', 'ARDY MBATU', 'PULUTHIE, 30-06-2005', 'L', 'KRISTEN', 'SLTP/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1782, 36, 7, '1', '1', 'ALFAN YAWAN MBATU', 'BAUMATA, 31-01-2015', 'L', 'KRISTEN', 'TAMAT SD/ SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1783, 36, 8, '1', '1', 'FEDY GRAFANSA MBATU', 'PULUTHIE, 28-02-2006', 'L', 'KRISTEN', 'BELUM TAMAT SD/SEDERAJAT', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1784, 37, 1, '1', '1', 'NOVITA WORI HANA', 'TANAMANANG, 06-11-1998', 'P', 'KRISTEN', 'TAMAT SD/ SEDERAJAT', 'PETANI/BERKEBUN', 'BELUM KAWIN'),
(1785, 38, 1, '1', '1', 'SURYANTO B. SUKARSONO', 'BAUMATA, 18-04-1988', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', '', 'KAWIN TERCATAT'),
(1786, 38, 2, '1', '1', 'SARNI JANIATI PANIE', 'ROTE, 27-01-1991', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'IRT', 'KAWIN TERCATAT'),
(1787, 38, 3, '1', '1', 'MARFEL SILVIO A. SUKARSONO', 'ROTE, 14-03-2012', 'L', 'KRISTEN', 'SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1788, 38, 4, '1', '1', 'OKTOVIANUS DAVID SUKARSONO', '', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1789, 38, 5, '1', '1', 'SANDY SAMUEL SUKARSONO', '', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1790, 39, 1, '1', '1', 'JEKSON ODIN AMTARAN', 'BAUMATA, 02-10-1960', 'L', 'KRISTEN', 'SMP/SEDERAJAT', 'PETANI/BERKEBUN', 'KAWIN TERCATAT'),
(1791, 39, 2, '1', '1', 'ALRINDA YULIANA TANOF', 'BELU, 16-10-1960', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', '', 'BELUM KAWIN'),
(1792, 39, 3, '1', '1', 'ADRIANA JELLI AMTARAN', 'BAUMATA, 29-04-2007', 'P', 'KRISTEN', 'SMP', '', 'BELUM KAWIN'),
(1793, 40, 1, '1', '1', 'ALEXANDRO JOHARDI NEOLAKA', 'BAUMATA, 08-06-1992', 'L', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'KARYAWAN SWASTA', 'KAWIN TERCATAT'),
(1794, 40, 2, '1', '1', 'SERLI MARLINDA SANDA', 'OELKA, 02-09-1993', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1795, 40, 3, '1', '1', 'GRATIELA ALEXANDRIA NEOLAKA', 'KUPANG, 25-06-2013', 'P', 'KRISTEN', 'SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1796, 41, 1, '1', '1', 'LEONIDAS L. NENOSONO', 'BAUMATA, 08-11-1969', 'L', 'KRISTEN', 'SLTA/SEDERAJAT', 'PETANI/BERKEBUN', 'KAWIN TERCATAT'),
(1797, 41, 2, '1', '1', 'FONI NENOSONO - AMTARAN', 'BAUMATA, 28-03-1973', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1798, 41, 3, '1', '1', 'BILL O. NENOSONO', 'BAUMATA, 18-10-1992', 'L', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'TENAGA KONTRAK', 'BELUM KAWIN'),
(1799, 41, 4, '1', '1', 'EUNIKE E. NENOSONO', 'BAUMATA, 18-06-2001', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1800, 41, 5, '1', '1', 'THESALONIKA NENOSONO', 'BAUMATA, 05-11-2002', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1801, 41, 6, '1', '1', 'BARTO P. NENOSONO', 'BAUMATA, 14-07-2011', 'L', 'KRISTEN', 'SD/SEDERAJAT', 'PELAJAR/MAHASISWA', 'BELUM KAWIN'),
(1802, 42, 1, '1', '1', 'EMALIKA ELYMANAFE - ADUWAJU', 'SUMBA, 20-04-1961', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'PENSIUN', 'JANDA'),
(1803, 42, 2, '1', '1', 'DESY M. ELYMANAFE', 'KUPANG, 03-12-1995', 'P', 'KRISTEN', 'DIPLOMA IV/STRATA I', 'PEKERJA SWASTA', ''),
(1804, 43, 1, '1', '1', 'BENE BATAN NENOSONO', 'BAUMATA, 22-10-1995', 'L', 'KRISTEN', 'BELUM TAMAT SD/SEDERAJAT', 'BURUH HARIAN LEPAS', 'KAWIN TERCATAT'),
(1805, 43, 2, '1', '1', 'LISBETH KAROLINA ISMAU', 'KUPANG, 14-11-1995', 'P', 'KRISTEN', 'SLTA/SEDERAJAT', 'MENGURUS RUMAH TANGGA', 'KAWIN TERCATAT'),
(1806, 43, 3, '1', '1', 'NADA ALEEZAFIA NENOSONO', 'KUPANG, 05-05-2018', 'P', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1807, 43, 4, '1', '1', 'MIKE LUDWIG NENOSONO', 'KUPANG, 15-04-2021', 'L', 'KRISTEN', 'BELUM SEKOLAH', 'BELUM/TIDAK BEKERJA', 'BELUM KAWIN'),
(1808, 1, 1, '1', '3', 'NAOMI TANEBETH - M', 'BILAMUN, 14-06-1948', 'P', 'KRISTEN', 'SD', 'IRT', 'JANDA'),
(1809, 2, 1, '1', '3', 'YOSUA TANEBETH', 'POSNURI, 06-04-1981', 'L', 'KRISTEN', 'SMP', 'SWASTA', 'KAWIN'),
(1810, 2, 1, '1', '3', 'NOVIWANTI TANEBETH', 'OEHANI, 02-01-1990', 'P', 'KRISTEN', 'SMP', 'IRT', 'KAWIN'),
(1811, 3, 1, '1', '3', 'RANI ANJANI TANEBETH', 'OELTUA, 24-05-2009', 'P', 'KRISTEN', 'SD', '', ''),
(1812, 4, 1, '1', '3', 'PRIYONA ASWEN TANEBETH', 'POSNURI, 11-02-2013', 'L', 'KRISTEN', 'SD', '', ''),
(1813, 5, 1, '1', '3', 'MELFIN ELROI D. TANEBETH', 'BAUMATA, 05-05-2017', 'L', 'KRISTEN', 'BELUM SEKOLAH', '', ''),
(1814, 6, 1, '1', '3', 'FIONA JELITA TANEBETH', 'POSNURI, 21-02-2019', 'P', 'KRISTEN', 'BELUM SEKOLAH', '', ''),
(1815, 1, 1, '1', '3', 'ANTONIUS BAITANU', 'POSNURI, 11-05-1981', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1816, 2, 1, '1', '3', 'NOVIYANTI K. BAITANU-U', 'NAIBONAT, 05-11-1985', 'P', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1817, 3, 1, '1', '3', 'PETRO YANDINALD BAITANU', 'PUKDALE, 13-02-10', 'L', 'KRISTEN', 'SD', '', ''),
(1818, 4, 1, '1', '3', 'NITANAEL TANEBETH', 'FENUN, 14-11-1955', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1819, 5, 1, '1', '3', 'YARET R. TANEBETH', 'POSNURI, 05-07-2002', 'L', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1820, 6, 1, '1', '3', 'YORAM TASAE', 'FATUNAINIFU, 20-06-1980', 'L', 'KRISTEN', 'SD', '', ''),
(1821, 1, 1, '1', '3', 'OKTOVIANUAS TALLO', 'BOKONG, 28-10-1975', 'L', 'KRISTEN', 'SMA', 'WIRAUSAHA', 'KAWIN'),
(1822, 2, 1, '1', '3', 'RAHEL R.E. TALLO-V', 'OELPUAH, 27-08-1981', 'P', 'KRISTEN', 'S1', 'PNS', 'KAWIN'),
(1823, 3, 1, '1', '3', 'PETRUS TANEBETH', 'FAIN, 21-02-1962', 'L', 'KRISTEN', 'TS', 'PETANI', 'KAWIN'),
(1824, 4, 1, '1', '3', 'YANCE M. TANEBETH', 'MANEFU, 06-07-1968', 'P', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1825, 5, 1, '1', '3', 'YUFRI A - TANEBETH', 'FAIN, 18-06-1997', 'L', 'KRISTEN', 'S1', '', ''),
(1826, 6, 1, '1', '3', 'SANDY A. TANEBETH', 'FAIN, 24-09-2004', 'L', 'KRISTEN', 'SMA', '', ''),
(1827, 7, 1, '1', '3', 'PEGINTO S.T. TANEBETH', 'FAIN, 05-08-2007', 'L', 'KRISTEN', 'SMP', '', ''),
(1828, 1, 1, '1', '3', 'CHRISKAR T. BENU', 'MUKEANA, 18-10-1991', 'L', 'KRISTEN', 'S1', 'SWASTA', 'KAWIN'),
(1829, 2, 1, '1', '3', 'ASRI S BENU-T', 'BAUMATA, 30-05-1995', 'P', 'KRISTEN', 'S1', 'IRT', 'KAWIN'),
(1830, 3, 1, '1', '3', 'GLEND C. C. BENU', 'KUPANG, 14-12-2018', 'L', 'KRISTEN', '', '', ''),
(1831, 1, 1, '1', '3', 'ADOLFINA BAITANU-K', 'OELEKANA, 30-04-1954', 'P', 'KRISTEN', 'SD', 'IRT', 'JANDA'),
(1832, 2, 1, '1', '3', 'SAMSON J. BAITANU', 'POSNURI, 30-09-1988', 'L', 'KRISTEN', 'SMA', 'SWASTA', ''),
(1833, 1, 1, '1', '3', 'YAKOMINA TANEBETH-B', 'BILDAES, 16-07-1953', 'P', 'KRISTEN', 'SD', 'IRT', 'JANDA'),
(1834, 1, 1, '1', '3', 'MELKIANUS TANEBETH', 'POSNURI, 13-03-1982', 'L', 'KRISTEN', 'SMP', 'PETANI', 'KAWIN'),
(1835, 2, 1, '1', '3', 'OKTOVINCE TANEBETH-T', 'OEBAKU, 30-10-1987', 'P', 'KRISTEN', 'SMP', 'IRT', 'KAWIN'),
(1836, 3, 1, '1', '3', 'GRACELLA M. TANEBETH', 'OELBAKI, 13-03-2014', 'P', 'KRISTEN', '', '', ''),
(1837, 4, 1, '1', '3', 'CHRISTIAN YAKOB TANEBETH', 'BAUMATA, 24-03-2018', 'L', 'KRISTEN', '', '', ''),
(1838, 11, 1, '1', '3', 'YOHANIS SFUNIT', 'SUTUAL, 04-04-1973', 'L', 'KRISTEN', 'SMA', 'PETANI', 'KAWIN'),
(1839, 2, 1, '1', '3', 'YUSTREDA SFUNIT-E', 'OESAPA, 11-06-1980', 'P', 'KRISTEN', 'SMP', 'IRT', 'KAWIN'),
(1840, 3, 1, '1', '3', 'MERLIN B. SFUNIT', 'BAUMATA, 03-05-2001', 'P', 'KRISTEN', 'PT', '', ''),
(1841, 4, 1, '1', '3', 'YACOB YOHANIS SFUNIT', 'BAUMATA, 14-11-2010', 'L', 'KRISTEN', 'SD', '', ''),
(1842, 12, 1, '1', '3', 'YENNY A. MANAFE-BIRE KAHO', 'KUPANG, 16-06-1962', 'P', 'KRISTEN', 'SMP', 'PNS', 'JANDA'),
(1843, 2, 1, '1', '3', 'FANNY E. MANAFE', 'KUPANG, 17-09-1997', 'P', 'KRISTEN', 'PT', 'SWASTA', ''),
(1844, 3, 1, '1', '3', 'MEISY F. MANAFE', 'KUPANG, 25-02-2001', 'P', 'KRISTEN', 'PT', '', ''),
(1845, 13, 1, '1', '3', 'BLANDINA Y.Y. ELUAMA-S', 'OESAPA, 05-01-1959', 'P', 'KRISTEN', 'SD', 'IRT', 'JANDA'),
(1846, 2, 1, '1', '3', 'WILHEIN T.M. ELUAMA', 'BAUMATA,30-05-1993', 'L', 'KRISTEN', 'SMA', 'SWASTA', ''),
(1847, 3, 1, '1', '3', 'GRESNALIA ELUAMA', 'OESAPA, 11-05-1998', 'P', 'KRISTEN', 'SMA', 'SWASTA', ''),
(1848, 4, 1, '1', '3', 'IBRAHIM H. ELUAMA', 'KUPANG, 03-06-2020', 'L', 'KRISTEN', '', '', ''),
(1849, 14, 1, '1', '3', 'EDHY A.N. ELUAMA', 'BAUMATA, 08-11-1984', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1850, 2, 1, '1', '3', 'BELANDINA ELUAMA - A', 'UPUNKIU, 14-01-1983', 'P', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1851, 3, 1, '1', '3', 'ISTERINA L. ELUAMA', 'KUPANG, 14-07-2017', 'P', 'KRISTEN', '', '', ''),
(1852, 15, 1, '1', '3', 'ABDON NABEN', 'SOE, 19-08-1976', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1853, 2, 1, '1', '3', 'FLORINCE NABEN-NOMENI', 'TOBU, 04-02-1980', 'P', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1854, 3, 1, '1', '3', 'FENNY M, NABEN', 'KUPANG, 14-02-2007', 'P', 'KRISTEN', 'SMP', '', ''),
(1855, 16, 1, '1', '3', 'ARYANTO PINIS', 'KAPAN, 14-01-1989', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1856, 2, 1, '1', '3', 'YETI M. PINIS-NITBANI', 'NEONONI, 07-06-1989', 'P', 'KRISTEN', 'SMP', 'IRT', 'KAWIN'),
(1857, 3, 1, '1', '3', 'DESTI M, PINIS', 'BAUMATA, 23-12-2012', 'P', 'KRISTEN', 'SD', '', ''),
(1858, 4, 1, '1', '3', 'NOVELA AMOREYZA PINIS', 'BAUMATA, 22-11-2018', 'P', 'KRISTEN', '', '', ''),
(1859, 5, 1, '1', '3', 'FELICIA MISELA PINIS', '', 'P', 'KRISTEN', '', '', ''),
(1860, 17, 1, '1', '3', 'ZEM DAUD GIRI', 'BA\'A, 16-09-1978', 'L', 'KRISTEN', 'S1', 'SWASTA', 'KAWIN'),
(1861, 2, 1, '1', '3', 'SONYA ANIKA GIRI-T', 'POSMURI,17-04-1983', 'P', 'KRISTEN', 'SMA', 'IRT', 'KAWIN'),
(1862, 3, 1, '1', '3', 'TRESNA A. Z. GIRI', 'BAUMATA, 10-11-2004', 'P', 'KRISTEN', 'SMA', '', ''),
(1863, 4, 1, '1', '3', 'THEMY L.F.Z. GIRI', 'KUPANG, 10-05-2008', 'L', 'KRISTEN', 'SMP', '', ''),
(1864, 5, 1, '1', '3', 'THREEZILDA A.Z. GIRI', 'POSNURI, 29-06-2014', 'L', 'KRISTEN', '', '', ''),
(1865, 18, 1, '1', '3', 'ABRAHAM TANEBETH', 'POSNURI, 14-04-1988', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1866, 2, 1, '1', '3', 'RATI G. TANEBETH-H', 'MANEFU, 19-01-1984', 'P', 'KRISTEN', 'SMA', 'IRT', 'KAWIN'),
(1867, 1, 1, '1', '3', 'AMEIRA C.F. TANEBETH', 'POSNURI, 19-05-2015', 'P', 'KRISTEN', '', '', ''),
(1868, 1, 1, '1', '3', 'ADELARDO C.E. TANEBETH', 'BAUMATA, 12-11-2016', 'L', 'KRISTEN', '', '', ''),
(1869, 19, 1, '1', '3', 'DAUD TANEBETH', 'FAIN, 04-12-1960', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(1870, 2, 1, '1', '3', 'LODIANA TANEBETH-H', 'NOELBAKI, 17-07-1965', 'P', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1871, 3, 1, '1', '3', 'THIMOTIUS TANEBETH', 'NOELBAKI, 06-01-1989', 'L', 'KRISTEN', 'S1', '', ''),
(1872, 4, 1, '1', '3', 'SUSAN M. TANEBETH', 'NOELBAKI, 10-07-1994', 'P', 'KRISTEN', 'S2', '', ''),
(1873, 5, 1, '1', '3', 'LORENSA A. TANEBETH', 'FAIN, 25-08-1998', 'P', 'KRISTEN', 'S3', '', ''),
(1874, 21, 1, '1', '3', 'YULIANA TANEBETH-A', 'FENUN 20-06-1957', 'P', 'KRISTEN', 'SD', 'IRT', 'JANDA'),
(1875, 2, 1, '1', '3', 'MARSEL Y. TANEBETH', 'FAIN, 12-03-1983', 'L', 'KRISTEN', 'SMA', 'SWASTA', ''),
(1876, 3, 1, '1', '3', 'ANGGELINA TANEBETH', 'FAIN, 29-05-1991', 'P', 'KRISTEN', 'S1', '', ''),
(1877, 4, 1, '1', '3', 'JEFRY A. TANEBETH', 'FAIN, 04-09-1997', 'L', 'KRISTEN', 'SMA', 'TNI', ''),
(1878, 22, 1, '1', '3', 'YAKOB YOHANIS TANEBETH', 'BAUMATA, 24-01-1979', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'KAWIN'),
(1879, 2, 1, '1', '3', 'DOMINIKA TANEBETH-S', 'OELURAI, 18-11-1980', 'P', 'KRISTEN', 'SMA', 'IRT', 'KAWIN'),
(1880, 3, 1, '1', '3', 'TRESA P.M. TANEBETH', 'BAUMATA, 26-07-2004', 'P', 'KRISTEN', 'SMA', '', ''),
(1881, 4, 1, '1', '3', 'SELMA E. TANEBETH', 'BAUMATA, 24-01-2007', 'P', 'KRISTEN', 'SMP', '', ''),
(1882, 5, 1, '1', '3', 'MICHELA C. E. TANEBETH', 'BAUMATA, 22-07-2010', 'P', 'KRISTEN', 'SD', '', ''),
(1883, 6, 1, '1', '3', 'KYRIE YADAH TANEBETH', '', 'P', 'KRISTEN', '', '', ''),
(1884, 23, 1, '1', '3', 'OKTAFIANUS J. TANEBETH', 'FAIN, 25-10-1973', 'L', 'KRISTEN', 'SMP', 'PETANI', 'KAWIN'),
(1885, 2, 1, '1', '3', 'MARIA G. I. TANEBETH-U', 'DENPASAR, 31-05-1975', 'P', 'KRISTEN', 'S1', 'SWASTA', 'KAWIN'),
(1886, 24, 1, '1', '3', 'LORENS TANEBETH', 'FATUKANUTU, 1932', 'L', 'KRISTEN', 'TS', 'PETANI', 'KAWIN'),
(1887, 2, 1, '1', '3', 'MARIA M. TANEBETH', 'FAIN, 14-04-1975', 'P', 'KRISTEN', 'SMP', 'SWASTA', 'KAWIN'),
(1888, 25, 1, '1', '3', 'YERMIAS HUMAU', 'FAIN, 18-05-1971', 'L', 'KRISTEN', 'SMA', 'PETANI', 'KAWIN'),
(1889, 2, 1, '1', '3', 'MARIA HUMAU-M', 'BAUN, 27-05-1970', 'P', 'KRISTEN', 'TS', 'IRT', 'KAWIN'),
(1890, 3, 1, '1', '3', 'EKA W. HUMAU', 'FAIN, 13-05-1998', 'P', 'KRISTEN', 'SMA', '', ''),
(1891, 4, 1, '1', '3', 'YOHANA HUMAU', 'FAIN, 22-03-2004', 'P', 'KRISTEN', 'SMA', '', ''),
(1892, 26, 1, '1', '3', 'NIKODEMUS TANEBETH', 'NEKEMOLO, 18-11-1957', 'L', 'KRISTEN', 'TS', 'PETANI', ''),
(1893, 27, 1, '1', '3', 'NOH S. TANEBETH', 'FAIN, 21-09-1963', 'L', 'KRISTEN', 'PT', 'PNS', 'KAWIN'),
(1894, 2, 1, '1', '3', 'SELFINA O. TANEBETH-S', 'ALOR, 19-09-1968', 'P', 'KRISTEN', 'SMA', 'PNS', 'KAWIN'),
(1895, 3, 1, '1', '3', 'SONYA E. TANEBETH', 'KUPANG, 27-03-1996', 'P', 'KRISTEN', 'PT', '', ''),
(1896, 4, 1, '1', '3', 'AMANDA S. E. TANEBETH', 'KUPANG, 07-06-1999', 'P', 'KRISTEN', 'PT', '', ''),
(1897, 5, 1, '1', '3', 'FELISIA B.W. TANEBETH', 'KUPANG, 24-02-2010', 'P', 'KRISTEN', 'SD', '', ''),
(1898, 28, 1, '1', '3', 'DEKY TANEBETH', 'BAUMATA, 22-12-1978', 'L', 'KRISTEN', 'S1', 'POLRI', 'KAWIN'),
(1899, 2, 1, '1', '3', 'REGINA TANEBETH-B', 'SOE, 21-04-1972', 'P', 'KRISTEN', 'SMA', 'PNS', 'KAWIN'),
(1900, 3, 1, '1', '3', 'NAIJOF Z.L.T. TANEBETH', 'BAUMATA, 20-12-2007', 'L', 'KRISTEN', 'SMP', '', ''),
(1901, 4, 1, '1', '3', 'VETNAY T.B.M. TANEBETH', 'BAUMATA, 15-03-2009', 'P', 'KRISTEN', 'SD', '', ''),
(1902, 5, 1, '1', '3', 'REBECA K.B.L. TANEBETH', 'KUPANG, 13-10-2015', 'P', 'KRISTEN', '', '', ''),
(1903, 29, 1, '1', '3', 'YORIS S. SO\'UK', 'ROTE, 26-07-1975', 'L', 'KRISTEN', 'SD', 'PETANI', 'KAWIN'),
(1904, 2, 1, '1', '3', 'ESTER SO\'UK-T', 'FENUN, 12-11-1972', 'P', 'KRISTEN', 'SMP', 'IRT', 'KAWIN'),
(1905, 3, 1, '1', '3', 'JIMI E. SO\'UK', 'FAIN, 28-07-1997', 'L', 'KRISTEN', 'SMA', 'SWASTA', ''),
(1906, 4, 1, '1', '3', 'JENET A. SO\'UK', 'FAIN, 23-06-2003', 'P', 'KRISTEN', 'SMP', '', ''),
(1907, 5, 1, '1', '3', 'JOVAN P. SO\'UK', 'FAIN, 19-06-2006', 'L', 'KRISTEN', 'SD', '', ''),
(1908, 30, 1, '1', '3', 'YAKOB SINE', 'NAIMATA, 23-05-1965', 'L', 'KRISTEN', 'SD', 'SWASTA', 'KAWIN'),
(1909, 2, 1, '1', '3', 'NONCI SINE - H', 'OEIKA, 02-11-1973', 'P', 'KRISTEN', 'SD', 'IRT', 'KAWIN'),
(1910, 3, 1, '1', '3', 'ROLLY P. SINE', 'OEIKA, 01-04-1995', 'L', 'KRISTEN', 'SMA', 'POLRI', ''),
(1911, 4, 1, '1', '3', 'INTAN SINE', 'BAUMATA, 11-02-2013', 'P', 'KRISTEN', 'SD', '', ''),
(1912, 1, 3, '3', '8', 'LEONAR KEBA', '1966-11-10', 'L', 'KRISTEN', 'SMA', 'PETANI', 'Menikah'),
(1913, 2, 3, '3', '8', 'AKSAMINA KEBA MAMO', '1972-05-18', 'P', 'KRISTEN', 'SMP', 'IRT', 'Menikah'),
(1914, 3, 3, '3', '8', 'MERRY E. KEBA', '1992-05-10', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1915, 4, 3, '3', '8', 'SELFI CHRISTIAN KEBA', '1994-02-17', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1916, 5, 3, '3', '8', '', '', 'K', '', '', '', ''),
(1917, 6, 3, '3', '8', 'CORNELIA KEBA', '1959-08-19', 'P', 'KRISTEN', '', 'PETANI', 'Janda/Duda'),
(1918, 7, 3, '3', '8', 'VIKTORIA KEBA', '1971-10-18', 'P', 'KRISTEN', '', 'PETANI', 'Belum Menikah'),
(1919, 8, 3, '3', '8', '', '', '', '', '', '', ''),
(1920, 9, 3, '3', '8', 'DIANA KEBA RIHI', '', 'P', 'KRISTEN', '', '', ''),
(1921, 10, 3, '3', '8', 'MARGARITA KEBA', '19XX-08-12', 'P', 'KRISTEN', '', 'TANI', 'Tidak Kawin'),
(1922, 11, 3, '3', '8', 'ANTOMETA KEBA', '1981-02-19', 'P', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(1923, 12, 3, '3', '8', 'LODIA KEBA', '1986-01-19', 'P', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(1924, 13, 3, '3', '8', 'YAB KEBA', '1994-04-04', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1925, 14, 3, '3', '8', 'ATRIS KEBA', '1999-08-26', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1926, 15, 3, '3', '8', '', '', 'K', 'SMA', '', '', ''),
(1927, 16, 3, '3', '8', 'LAFASAR ATOLLO', '1947-05-16', 'L', 'KRISTEN', '', 'TANI', 'Menikah'),
(1928, 17, 3, '3', '8', 'MARIA ATOLLO', '1956-03-15', 'P', 'KRISTEN', '', 'IRT', 'Menikah'),
(1929, 18, 3, '3', '8', 'FERDINAN ATOLLO', '1986-02-16', 'L', 'KRISTEN', 'SMA', '', 'Menikah'),
(1930, 19, 3, '3', '8', 'MARILIN KASE', '', 'P', 'KRISTEN', '', '', 'Menikah'),
(1931, 20, 3, '3', '8', 'PITUS ATOLLO', '1952-12-06', 'L', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(1932, 21, 3, '3', '8', 'RAHEL ATOLLO', '1962-04-16', 'P', 'KRISTEN', 'SD', 'IRT', 'Menikah'),
(1933, 22, 3, '3', '8', 'SEPRIANI ATOLLO', '1995-06-28', 'L', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1934, 23, 3, '3', '8', 'ADEIKE MESAKH', '1975-06-01', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1935, 24, 3, '3', '8', 'CHRISTIAN IREINSINI', '1993-04-01', 'L', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1936, 25, 3, '3', '8', 'ARNOL R. MESAKH', '1995-06-16', 'L', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1937, 26, 3, '3', '8', 'DEVI Y. MESAKH', '1999-03-26', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1938, 27, 3, '3', '8', 'CAROLUS KOSENG', '1966-06-11', 'L', 'KATOLIK', 'PT', 'PNS', 'Menikah'),
(1939, 28, 3, '3', '8', 'AGUSTINA WIJAYANTI', '1969-08-17', 'P', 'KATOLIK', 'PT', 'PNS', 'Menikah'),
(1940, 29, 3, '3', '8', 'VINCENTIA K. MAHARANI', '2002-06-22', 'P', 'KATOLIK', 'PT', '', 'Belum Menikah'),
(1941, 30, 3, '3', '8', 'MARIA K.P. NARWASTI', '2003-08-14', 'P', 'KATOLIK', 'PT', '', 'Belum Menikah'),
(1942, 31, 3, '3', '8', 'ELKANA HUMAU', '1975-10-24', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'Menikah'),
(1943, 32, 3, '3', '8', 'ERNITIA Y.A. HUMAU BIRE', '1975-06-24', 'P', 'KRISTEN', 'SD', '', 'Menikah'),
(1944, 33, 3, '3', '8', 'JOERGHI HUMAU', '2003-07-05', 'L', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1945, 34, 3, '3', '8', 'ELIAS Y. HUMAU', '2009-08-05', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1946, 35, 3, '3', '8', 'ESA J.HUMAU', '2006-11-20', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1947, 11, 3, '3', '8', 'ISAK HENUKH', '1971-08-01', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'Menikah'),
(1948, 12, 3, '3', '8', 'MAGDALENA HENUKH', '1973-12-03', 'P', 'KRISTEN', 'D3', 'IRT', 'Menikah'),
(1949, 13, 3, '3', '8', 'ANANDA HENUKH', '2006-08-21', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1950, 14, 3, '3', '8', 'TIO HENUKH', '2008-12-10', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1951, 15, 3, '3', '8', 'TONI HENUKH', '', 'L', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(1952, 16, 3, '3', '8', 'GERMINTO NALLE', '1966-06-16', 'L', 'KRISTEN', 'SD', 'SWASTA', 'Menikah'),
(1953, 17, 3, '3', '8', 'PAULINA R.S. NALLE', '1975-09-17', 'P', 'KRISTEN', 'SD', 'IRT', 'Menikah'),
(1954, 18, 3, '3', '8', 'FEBRIANTI NALLE', '1979-02-20', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1955, 19, 3, '3', '8', 'MAIDIN T. NALLE', '1996-05-27', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1956, 20, 3, '3', '8', 'NISRON A. NALLE', '1999-05-13', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1957, 21, 3, '3', '8', 'SELRY D. NALLE', '2001-11-29', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1958, 22, 3, '3', '8', 'ARNALDO G. NALLE', '2003-11-28', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1959, 23, 3, '3', '8', 'OLIVIA Y. NALLE', '2005-08-14', 'P', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1960, 24, 3, '3', '8', 'VIRA M. NALLE', '2008-02-17', 'P', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1961, 25, 3, '3', '8', 'PAULUS LAKAT', '1976-11-16', 'L', 'KRISTEN', 'SMP', 'PETANI', 'Menikah'),
(1962, 26, 3, '3', '8', 'YENSI LAKAT SELAN', '1982-07-30', 'P', 'KRISTEN', 'SMA', 'IRT', 'Menikah'),
(1963, 27, 3, '3', '8', 'OKRINES GARCIANO LAKAT', '2010-10-29', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1964, 28, 3, '3', '8', 'CHERI KRISTENSA LAKAT', '2017-06-14', 'P', 'KRISTEN', 'TK', '', 'Belum Menikah'),
(1965, 29, 3, '3', '8', 'EVELIN VALERIA LAKAT', '2018-09-13', 'P', 'KRISTEN', '', '', 'Belum Menikah'),
(1966, 30, 3, '3', '8', 'YAKOB MANUEL', '1961-09-15', 'L', 'KRISTEN', 'BH', 'PETANI', 'Menikah'),
(1967, 31, 3, '3', '8', 'ADOLFINA MANUEL KATNESI', '1965-08-17', 'P', 'KRISTEN', 'BH', 'IRT', 'Menikah'),
(1968, 32, 3, '3', '8', 'YALBER VINSEN MANUEL', '1994-01-13', 'L', 'KRISTEN', 'D3', '', 'Belum Menikah'),
(1969, 34, 3, '3', '8', 'ESI DEBORA MANUEL', '2002-01-06', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1970, 35, 3, '3', '8', 'PETRUS SAKO OEBENU', '1976-02-17', 'L', 'KATOLIK', 'SMA', 'PNS', 'Menikah'),
(1971, 36, 3, '3', '8', 'JOHANA A. OEBENU KOL', '1980-07-17', 'P', 'KATOLIK', 'D2', 'IRT', 'Menikah'),
(1972, 37, 3, '3', '8', 'VEREN S. OBENU', '2011-09-28', 'P', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(1973, 38, 3, '3', '8', '', '', 'L', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(1974, 39, 3, '3', '8', 'DIRGAHAYU', '', 'L', 'KATOLIK', '', '', 'Belum Menikah'),
(1975, 40, 3, '3', '8', 'MARGARETHA ATOLLO', '1954-03-06', 'P', 'KRISTEN', 'BH', 'PETANI', 'Janda'),
(1976, 41, 3, '3', '8', 'APRIANA ATOLLO', '', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1977, 42, 3, '3', '8', 'NOFIRANA ATOLLO', '1995-11-17', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1978, 43, 3, '3', '8', 'ARLENCI MANANEN', '1965-10-10', 'P', 'KRISTEN', 'SD', 'PETANI', 'Tidak Kawin'),
(1979, 44, 3, '3', '8', 'WEMINCE MANINCE', '1980-03-19', 'P', 'KRISTEN', 'SD', '', 'Tidak Kawin'),
(1980, 45, 3, '3', '8', 'ELISABET MANANEN', '1997-06-15', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1981, 46, 3, '3', '8', 'EKA PUTRA', '1998-06-01', 'L', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1982, 47, 3, '3', '8', 'OBERLENS CALVIN SABOT', '1973-10-02', 'L', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(1983, 48, 3, '3', '8', 'APONIA MANANEL SABOT', '1976-11-18', 'P', 'KRISTEN', 'SD', 'IRT', 'Menikah'),
(1984, 49, 3, '3', '8', 'SONYA B.C. SABOT', '1997-06-30', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1985, 50, 3, '3', '8', 'YUNUS R.A. SABOT', '2000-05-10', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1986, 51, 3, '3', '8', 'APRIYANI SABOT', '2003-04-03', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(1987, 52, 3, '3', '8', 'NALDO K. SABOT', '2008-11-18', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1988, 53, 3, '3', '8', 'WILHELMUS WANGGE', '1979-11-12', 'L', 'KATOLIK', 'SMA', 'SWASTA', 'Menikah'),
(1989, 54, 3, '3', '8', 'PAULINA RATREGIVES', '1984-06-06', 'P', 'KATOLIK', 'SMA', 'IRT', 'Menikah'),
(1990, 55, 3, '3', '8', 'NIKODEMUS AMBTARAN', '1967-03-06', 'L', 'KRISTEN', 'SMA', 'SWASTA', 'Menikah'),
(1991, 56, 3, '3', '8', 'DIANA S. AMTARAN', '1973-12-13', 'P', 'KRISTEN', 'S3', 'PNS', 'Menikah'),
(1992, 57, 3, '3', '8', 'NINDY P.E. AMTARAN', '1996-10-09', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1993, 58, 3, '3', '8', 'NINDA P.Y. AMTARAN', '1999-11-20', 'P', 'KRISTEN', 'PT', '', 'Belum Menikah'),
(1994, 59, 3, '3', '8', 'RAFLY F.B. N. AMTARAN', '2008-12-13', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1995, 60, 3, '3', '8', 'FREDIK MANUEL', '1956-02-17', 'L', 'KRISTEN', 'BH', 'PETANI', 'Menikah'),
(1996, 61, 3, '3', '8', 'FRASINA MANUEL HUMAU', '1963-01-29', 'P', 'KRISTEN', 'SD', 'IRT', 'Menikah'),
(1997, 62, 3, '3', '8', 'YERMIAS MANUEL', '1989-01-19', 'L', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(1998, 63, 3, '3', '8', 'VERONIKA MANUEL', '1986-08-12', 'P', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(1999, 64, 3, '3', '8', 'STEFEN M. MANUEL', '2003-11-12', 'L', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(2000, 65, 3, '3', '8', 'NAOMI MARGARETHA MANUEL', '2013-11-12', 'P', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(2001, 66, 3, '3', '8', 'MATELDA LIM', '1987-07-01', 'P', 'KATOLIK', 'S1', 'SWASTA', 'Menikah'),
(2002, 67, 3, '3', '8', 'ERNA MARIA LIM', '1997-06-06', 'P', 'KATOLIK', 'PT', '', 'Belum Menikah');
INSERT INTO `data_penduduk` (`id`, `nomor_urut`, `kk`, `dusun`, `rt`, `nama_lengkap`, `ttl`, `jenis_kelamin`, `agama`, `pendidikan`, `pekerjaan`, `status_perkawinan`) VALUES
(2003, 68, 3, '3', '8', 'DAUD MANUEL', '1963-12-13', 'L', 'KRISTEN', 'BH', 'PETANI', 'Menikah'),
(2004, 69, 3, '3', '8', 'SELFIANA MANEUL ATOLLO', '1978-10-04', 'P', 'KRISTEN', 'SD', 'IRT', 'Menikah'),
(2005, 70, 3, '3', '8', 'SHERLY N. MANUEL', '2003-05-10', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(2006, 71, 3, '3', '8', 'EUNIKE C. MANUEL', '2005-10-29', 'P', 'KRISTEN', 'SMA', '', 'Belum Menikah'),
(2007, 72, 3, '3', '8', 'EBEN S. MANUEL', '2008-12-05', 'L', 'KRISTEN', 'SMP', '', 'Belum Menikah'),
(2008, 73, 3, '3', '8', 'RIDOLF WADU NETTU', '1959-02-02', 'L', 'KRISTEN', 'PENSIUN', '', 'Menikah'),
(2009, 74, 3, '3', '8', 'NAOMI W. NETTU', '1962-11-13', 'P', 'KRISTEN', 'IRT', '', 'Menikah'),
(2010, 75, 3, '3', '8', 'ERNI S. NETTU', '1999-03-13', 'P', 'KRISTEN', '', '', 'Belum Menikah'),
(2011, 76, 3, '3', '8', 'ZANEES A. NETTU', '2001-11-07', 'L', 'KRISTEN', '', '', 'Belum Menikah'),
(2012, 77, 3, '3', '8', 'SREFANUS F. ANUNUT', '1981-08-28', 'L', 'KATOLIK', 'SD', 'PETANI', 'Menikah'),
(2013, 78, 3, '3', '8', 'KRISTINA ANUNUT', '1982-10-11', 'P', 'KATOLIK', 'SMP', 'IRT', 'Menikah'),
(2014, 79, 3, '3', '8', 'GERALDO C. T. ANUNUT', '2007-06-20', 'L', 'KATOLIK', 'SMP', '', 'Belum Menikah'),
(2015, 80, 3, '3', '8', 'IGNESTA V. A. ANUNUT', '2008-12-31', 'P', 'KATOLIK', 'SMP', '', 'Belum Menikah'),
(2016, 81, 3, '3', '8', 'GRASINYA ASE ANUNUT', '2010-08-11', 'P', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2017, 82, 3, '3', '8', 'ANDREAS TPOY', '1974-11-16', 'L', 'KATOLIK', 'SD', 'PETANI', 'Menikah'),
(2018, 83, 3, '3', '8', 'PETRONELA TPOY BANA', '1975-01-07', 'P', 'KATOLIK', 'SD', 'IRT', 'Menikah'),
(2019, 84, 3, '3', '8', 'YOHANIS TPOY', '2000-12-05', 'L', 'KATOLIK', 'SMA', '', 'Belum Menikah'),
(2020, 85, 3, '3', '8', 'MARGARETA TPOY', '2002-03-16', 'P', 'KATOLIK', 'SMA', '', 'Belum Menikah'),
(2021, 86, 3, '3', '8', 'AGUSTINUS SUNI', '1979-12-05', 'L', 'KATOLIK', 'SD', 'SWASTA', 'Menikah'),
(2022, 87, 3, '3', '8', 'FINES SUNI', '1982-11-02', 'P', 'KATOLIK', 'SD', 'IRT', 'Menikah'),
(2023, 88, 3, '3', '8', 'DERTIANA S. SUNI', '2002-11-07', 'P', 'KATOLIK', 'SMA', '', 'Belum Menikah'),
(2024, 89, 3, '3', '8', 'MARGRETA J. SUNI', '2004-06-12', 'P', 'KATOLIK', 'SMA', '', 'Belum Menikah'),
(2025, 90, 3, '3', '8', 'DIMITRIO A. SUNI', '2008-10-19', 'L', 'KATOLIK', 'SMP', '', 'Belum Menikah'),
(2026, 91, 3, '3', '8', 'SUSANTI D. TANEO', '2003-03-28', 'P', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(2027, 92, 3, '3', '8', 'SIMON KEFI', '1975-01-01', 'L', 'KATOLIK', 'SD', 'SWASTA', 'Menikah'),
(2028, 93, 3, '3', '8', 'YASINTA METAN KEFI', '1985-03-08', 'P', 'KATOLIK', 'SD', 'IRT', 'Menikah'),
(2029, 94, 3, '3', '8', 'MAKSIMUS A. KEFI', '2002-03-17', 'L', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2030, 95, 3, '3', '8', 'APRILIA S. KEFI', '2003-04-08', 'P', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2031, 96, 3, '3', '8', 'ALESANDRA KEFI', '2005-03-06', 'P', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2032, 97, 3, '3', '8', 'MARLON F. KEFI', '2007-05-24', 'L', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2033, 98, 3, '3', '8', 'MARIA A. KEFI', '2014-04-20', 'P', 'KATOLIK', 'SD', '', 'Belum Menikah'),
(2034, 99, 4, '4', '10', 'YEFTA ALLYAN BAHAS', '1983-08-09', 'L', 'KRISTEN', '', 'PNS', 'Menikah'),
(2035, 100, 4, '4', '10', 'ROSALINA BAHAS EMBAR', '1986-08-23', 'P', 'KRISTEN', '', '', 'Menikah'),
(2036, 101, 4, '4', '10', 'ELISABETH BAHAS', '2007-08-10', 'P', 'KRISTEN', 'SD', '', 'Belum Menikah'),
(2037, 102, 4, '4', '10', 'DANIEL BARIA', '1976-12-10', 'L', '', '', 'PETANI', ''),
(2038, 103, 4, '4', '10', 'LUSIA LIPAS SAIN', '1982-12-21', 'P', '', '', '', ''),
(2039, 104, 4, '4', '10', 'YOHANA D. UN. BARIA', '2000-11-26', 'P', '', '', '', ''),
(2040, 105, 4, '4', '10', 'APRIANA BARIA', '2003-04-21', 'P', '', '', '', ''),
(2041, 106, 4, '4', '10', 'FREDEL BARIA', '2005-02-11', 'L', '', '', '', ''),
(2042, 107, 4, '4', '10', 'MAHEN SOSE', '1964-03-01', 'L', '', '', 'PETANI', ''),
(2043, 108, 4, '4', '10', 'MARIA SOSE', '1964-04-22', 'P', '', '', '', ''),
(2044, 109, 4, '4', '10', 'NITHANEL SOSE', '1990-11-20', 'L', '', '', 'WIRASWASTA', ''),
(2045, 110, 4, '4', '10', 'DESI M. SOSE', '1993-12-26', 'P', '', '', '', ''),
(2046, 111, 4, '4', '10', 'ADI TRI PUTRA SOSE', '2003-08-09', 'L', '', '', '', ''),
(2047, 112, 4, '4', '10', 'DENITHA A. SOSE', '2006-04-16', 'P', '', '', '', ''),
(2048, 113, 4, '4', '10', 'DANIEL SOSE', '1987-12-17', 'L', '', '', '', ''),
(2049, 114, 4, '4', '10', 'BERNADUS', '1939-03-13', 'L', '', '', 'PETANI', ''),
(2050, 115, 4, '4', '10', 'AYUB NAIBAHAS', '1964-08-27', 'L', '', '', 'PETANI', ''),
(2051, 116, 4, '4', '10', 'FRANSINA NAIBAHAS', '1967-02-02', 'P', '', '', '', ''),
(2052, 117, 4, '4', '10', 'OBED NEGO NAIBAHAS', '1992-10-08', 'L', '', '', '', ''),
(2053, 118, 4, '4', '10', 'ABDON NAIBAHAS', '1995-08-25', 'L', '', '', '', ''),
(2054, 119, 4, '4', '10', 'MERIANAS NAIBAHAS', '2000-05-14', 'P', '', '', '', ''),
(2055, 120, 4, '4', '10', 'ARBETH NAIBAHAS', '2003-04-12', 'L', '', '', '', ''),
(2056, 121, 4, '4', '10', 'YOSAFATH NAIBAHAS', '2006-07-05', 'L', '', '', '', ''),
(2057, 122, 4, '4', '10', 'HELENA NAIBAHAS', '1934-08-18', 'L', '', '', 'PETANI', ''),
(2058, 123, 4, '4', '10', 'DELFIANA NAIBAHAS', '1996-12-27', 'P', '', '', '', ''),
(2059, 124, 4, '4', '10', 'SHERLY ISMAU', '1990-07-20', 'P', '', '', '', ''),
(2060, 125, 4, '4', '10', 'DANIEL SAIN', '1958-03-29', 'L', 'KATOLIK', 'SD', 'PETANI', 'Menikah'),
(2061, 126, 4, '4', '10', 'VIKTORIA SAIN', '1960-03-17', 'P', 'KATOLIK', 'SD', 'IRT', 'Menikah'),
(2062, 127, 4, '4', '10', 'DEONISIUS SAIN', '1990-12-01', 'L', 'KATOLIK', 'SLTA', '', ''),
(2063, 128, 4, '4', '10', 'FLORIANUS SAIN', '1993-04-06', 'L', 'KATOLIK', 'SLTA', '', ''),
(2064, 129, 4, '4', '10', 'KANISIUS SAIN', '1998-04-26', 'L', 'KATOLIK', 'SD', '', ''),
(2065, 130, 4, '4', '10', 'ELIISABETH N. SAIN', '2000-11-06', 'P', 'KATOLIK', 'SLTP', '', ''),
(2066, 131, 4, '4', '10', 'ROSA M. SAIN', '1995-12-07', 'P', 'KATOLIK', '', '', ''),
(2067, 132, 4, '4', '10', 'MARTINUS SAIN', '1980-09-12', 'L', 'KATOLIK', '', '', ''),
(2068, 133, 4, '4', '10', 'RIVAN SAIN', '2010-02-08', 'L', 'KATOLIK', '', '', ''),
(2069, 134, 4, '4', '10', 'YONAS NAIBAHAS', '1961-01-05', 'L', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(2070, 135, 4, '4', '10', 'DORSINA NAIBAHAS', '1962-12-24', 'P', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(2071, 136, 4, '4', '10', 'YERSON NAIBAHAS', '1990-07-30', 'L', 'KRISTEN', 'SD', 'PETANI', ''),
(2072, 137, 4, '4', '10', 'YESKIEL NAIBAHAS', '1996-07-27', 'L', 'KRISTEN', 'SLTA', '', ''),
(2073, 138, 4, '4', '10', 'NAHUM NAIBAHAS', '1998-11-20', 'L', 'KRISTEN', 'SLTA', '', ''),
(2074, 139, 4, '4', '10', 'ASRI E. NAIBAHAS', '2004-12-04', 'P', 'KRISTEN', 'SD', '', ''),
(2075, 140, 4, '4', '10', 'HENDRIKUS LAKA', '1954-02-01', 'L', 'KATOLIK', '', 'PETANI', 'Menikah'),
(2076, 141, 4, '4', '10', 'ANTONIA LAKA', '1996-08-02', 'P', 'KATOLIK', '', 'PETANI', 'Menikah'),
(2077, 142, 4, '4', '10', 'KATARINA LAKA', '1989-11-27', 'P', 'KATOLIK', '', 'PETANI', ''),
(2078, 143, 4, '4', '10', 'YAKOBUS LAKA', '1991-11-28', 'L', 'KATOLIK', '', 'PETANI', ''),
(2079, 144, 4, '4', '10', 'VINSENSIUS LAKA', '1995-10-27', 'L', 'KATOLIK', '', '', ''),
(2080, 145, 4, '4', '10', 'KASIMIRUS LAKA', '1998-03-04', 'L', 'KATOLIK', '', '', ''),
(2081, 146, 4, '4', '10', 'TOMAS TALAN', '2001-04-08', 'L', 'KATOLIK', '', '', ''),
(2082, 147, 4, '4', '10', 'NORMAN NAIBAHAS', '1979-11-16', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2083, 148, 4, '4', '10', 'WELMINCE NAIBAHAS TO', '1984-05-28', 'P', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2084, 149, 4, '4', '10', 'NURNIA NAIBAHAS', '2010-11-23', 'P', 'KRISTEN', '', '', ''),
(2085, 150, 4, '4', '10', 'KRISTOFEL NAIBAHAS', '2015-05-13', 'L', 'KRISTEN', '', '', ''),
(2086, 151, 4, '4', '10', 'VIKTOR S. NAIBAHAS', '', 'L', '', '', '', ''),
(2087, 152, 4, '4', '10', 'YUNITA NAIBAHAS', '', 'P', '', '', '', ''),
(2088, 153, 4, '4', '10', 'YOEL NAIBAHAS', '1968-07-19', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2089, 154, 4, '4', '10', 'AGUSTINA NAIBAHAS', '1972-08-16', 'P', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2090, 155, 4, '4', '10', 'DAUD NAIBAHAS', '1999-12-25', 'L', 'KRISTEN', '', '', ''),
(2091, 156, 4, '4', '10', 'OSO MONIKA NAIBAHAS', '2005-10-13', 'P', 'KRISTEN', '', '', ''),
(2092, 157, 4, '4', '10', 'MAKE A. NAIBAHAS', '2014-05-19', 'L', 'KRISTEN', '', '', ''),
(2093, 158, 4, '4', '10', 'FELIPUS NAIBAHAS', '1939-02-02', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2094, 159, 4, '4', '10', 'BEA NAIBAHAS-BANAO', '1935-05-15', 'P', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2095, 160, 4, '4', '10', 'YULIANUS NAIBAHAS', '1959-07-07', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2096, 161, 4, '4', '10', 'SEM CH NAIBAHAS', '1979-09-30', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2097, 162, 4, '4', '10', 'ASER NAIBAHAS', '1981-04-19', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2098, 163, 4, '4', '10', 'COSTAN NAIBAHAS', '1945-04-13', 'L', '', 'PETANI', '', ''),
(2099, 164, 4, '4', '10', 'NAOMI NAIBAHAS', '1949-11-15', 'P', '', '', '', ''),
(2100, 165, 4, '4', '10', 'MARGARITHA NAIBAHAS', '1983-10-09', 'P', '', '', '', ''),
(2101, 166, 4, '4', '10', 'MELSYA ABIGAIL BANI', '2014-02-05', 'P', '', '', '', ''),
(2102, 167, 4, '4', '10', 'TOMAS NAIBAHAS', '1936-04-04', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2103, 168, 4, '4', '10', 'YANCE NAIBAHAS', '1969-06-14', 'P', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2104, 169, 4, '4', '10', 'NAOMI NAIBAHAS', '1976-11-14', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2105, 170, 4, '4', '10', 'NIKSON NAIBAHAS', '1984-11-08', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2106, 171, 4, '4', '10', 'PETRUS SAIN', '1984-11-08', 'L', '', '', '', ''),
(2107, 172, 4, '4', '10', 'MARIA SAIN NIFU', '1985-04-06', 'P', '', '', '', ''),
(2108, 173, 4, '4', '10', 'FRANSISKA A. SAIN', '2010-11-27', 'P', '', '', '', ''),
(2109, 174, 4, '4', '10', 'FERDI AMNAHAS', '1968-02-16', 'L', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(2110, 175, 4, '4', '10', 'ADOLFINA SOSE', '1987-04-08', 'P', 'KRISTEN', 'SD', 'PETANI', 'Menikah'),
(2111, 176, 4, '4', '10', 'MARIA A. AMNAHAS', '2007-12-29', 'P', 'KRISTEN', 'SD', '', ''),
(2112, 177, 4, '4', '10', 'DIANA M. SOSE', '1968-03-07', 'P', 'KRISTEN', '', 'PETANI', ''),
(2113, 178, 4, '4', '10', 'MERI P. BABSUNI', '1997-05-09', 'P', 'KRISTEN', '', '', ''),
(2114, 179, 4, '4', '10', 'SEMI SOSE', '2004-09-26', 'L', 'KRISTEN', '', '', ''),
(2115, 180, 4, '4', '10', 'MELKIANUS SOSE', '2007-11-03', 'L', 'KRISTEN', '', '', ''),
(2116, 181, 4, '4', '10', 'NINUS CH NAIBAHAS', '1956-11-30', 'P', '', '', '', ''),
(2117, 182, 4, '4', '10', 'MARTHASE N. BILAUT', '1960-10-19', 'P', '', '', '', ''),
(2118, 183, 4, '4', '10', 'AMINADAB NAIBAHAS', '1986-04-04', 'L', '', '', '', ''),
(2119, 184, 4, '4', '10', 'BERTHOLOMEOS NAIBAHAS', '1990-12-05', 'L', '', '', '', ''),
(2120, 185, 4, '4', '10', 'YONATHAN NAIBAHAS', '1996-01-05', 'L', '', '', '', ''),
(2121, 186, 4, '4', '10', 'SAMUEL NAIBAHAS', '1973-09-13', 'L', 'KRISTEN', '', 'PNS', 'Menikah'),
(2122, 187, 4, '4', '10', 'YAKOBA NAIBAHAS', '1979-01-13', 'P', 'KRISTEN', '', 'PNS', 'Menikah'),
(2123, 188, 4, '4', '10', 'MARFIN NAIBAHAS', '2009-03-31', 'L', 'KRISTEN', '', '', ''),
(2124, 189, 4, '4', '10', 'JITRO J. NAIBAHAS', '2011-03-27', 'L', 'KRISTEN', '', '', ''),
(2125, 190, 4, '4', '10', 'NOVIATY NAIBAHAS', '2014-11-13', 'P', 'KRISTEN', '', '', ''),
(2126, 191, 4, '4', '10', 'NOVELAWATY NAIBAHAS', '2014-11-13', 'P', 'KRISTEN', '', '', ''),
(2127, 192, 4, '4', '10', 'STEFANUS NAIBAHAS', '1959-09-20', 'L', 'KRISTEN', '', 'PETANI', ''),
(2128, 193, 4, '4', '10', 'DORKAS NAIBAHAS', '1970-12-18', 'P', 'KRISTEN', '', 'PETANI', ''),
(2129, 194, 4, '4', '10', 'MARIA NAIBAHAS', '1988-03-20', 'P', 'KRISTEN', '', '', ''),
(2130, 195, 4, '4', '10', 'PITER NAIBAHAS', '1990-02-25', 'L', 'KRISTEN', 'MAHASISWA', '', ''),
(2131, 196, 4, '4', '10', 'YUNUS NAIBAHAS', '1990-02-25', 'L', 'KRISTEN', 'MAHASISWA', '', ''),
(2132, 197, 4, '4', '10', 'MELKISEDEK NAIBAHAS', '2005-05-14', 'L', 'KRISTEN', 'MAHASISWA', '', ''),
(2133, 198, 4, '4', '10', 'DEBORA NAIBAHAS', '1996-06-12', 'P', 'KRISTEN', '', '', ''),
(2134, 199, 4, '4', '10', 'WELMINCE Y. SAIN SAKAIN', '1972-01-20', 'P', '', '', '', ''),
(2135, 200, 4, '4', '10', 'SERVASIUS A. SAIN', '1992-09-13', 'L', '', '', '', ''),
(2136, 201, 4, '4', '10', 'DOMINIKUS SAIN', '1998-04-16', 'L', '', '', '', ''),
(2137, 202, 4, '4', '10', 'FABIANUS SAIN', '2006-02-01', 'L', '', '', '', ''),
(2138, 203, 4, '4', '10', 'RAIMUNDUS SAIN', '2009-01-07', 'L', '', '', '', ''),
(2139, 204, 4, '4', '10', 'DIANA M. SAIN', '2012-03-23', 'P', '', '', '', ''),
(2140, 205, 4, '4', '10', 'ROBERTUS M. SAIN', '1894-03-27', 'L', '', '', '', ''),
(2141, 206, 4, '4', '10', 'THERESIA SAIN', '1931-04-05', 'P', 'KATOLIK', '', 'PETANI', 'Menikah'),
(2142, 207, 4, '4', '10', 'YOFRI O. BAUN', '1994-06-20', 'L', 'KATOLIK', '', 'PETANI', ''),
(2143, 208, 4, '4', '10', 'YENI T. BAUN', '1996-01-06', 'P', 'KATOLIK', '', '', ''),
(2144, 209, 4, '4', '10', 'PASKALIS BAUN', '1970-03-20', 'L', 'KATOLIK', '', '', ''),
(2145, 210, 4, '4', '10', 'DAFID SAIN', '1960-12-25', 'L', '', '', '', ''),
(2146, 211, 4, '4', '10', 'YULIANA SAIN', '1960-07-05', 'P', '', '', '', ''),
(2147, 212, 4, '4', '10', 'MARTA SAIN', '1991-11-11', 'P', '', '', '', ''),
(2148, 213, 4, '4', '10', 'YOHANIS SAIN', '1995-06-30', 'L', '', '', '', ''),
(2149, 214, 4, '4', '10', 'ANITHA SAIN', '1998-08-24', 'P', '', '', '', ''),
(2150, 215, 4, '4', '10', 'NATASYA J. HUMAU', '2012-06-07', 'P', '', '', '', ''),
(2151, 216, 4, '4', '10', 'DESANDRI L. HUMAU', '2014-06-12', 'P', '', '', '', ''),
(2152, 217, 4, '4', '10', 'ELISABETH N. SAIN', '2000-06-11', 'P', '', '', '', ''),
(2153, 218, 4, '4', '10', 'AUSTIN R. SAIN', '2011-02-08', 'P', '', '', '', ''),
(2154, 219, 4, '4', '10', 'SIDEN TO', '2012-09-14', 'L', '', '', '', ''),
(2155, 220, 4, '4', '10', 'RINTO TO', '2014-12-20', 'L', '', '', '', ''),
(2156, 221, 4, '4', '10', 'YOWANGGA LAKA', '2013-05-29', 'L', '', '', '', ''),
(2157, 222, 4, '4', '10', 'NAHUM NAIBAHAS', '1998-11-20', 'L', 'KRISTEN', 'SLTA', 'WIRASWASTA', 'Menikah'),
(2158, 223, 4, '4', '10', 'SHINDI OSKALIN TOUMELUK', '2001-09-02', 'P', 'KRISTEN', 'SLTA', 'IRT', 'Menikah'),
(2159, 224, 4, '4', '10', 'ALVARISKHY FELIPUS NAIBAHAS', '2004-02-08', 'L', 'KRISTEN', '', '', ''),
(2160, 225, 4, '4', '10', 'NOH SOSE', '1973-11-11', 'L', 'KRISTEN', '', 'PETANI', 'Menikah'),
(2161, 226, 4, '4', '10', 'YOKSEN RUKU', '1974-01-30', 'P', 'KRISTEN', '', 'IRT', 'Menikah'),
(2162, 227, 4, '4', '10', 'SUSILIA MUNITCA SOSE', '2006-04-16', 'P', 'KRISTEN', '', '', 'Belum Menikah'),
(2163, 228, 4, '4', '10', 'WESLEY NOVANTO SOSE', '2009-01-03', 'L', 'KRISTEN', '', '', 'Belum Menikah');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_surat`
--

CREATE TABLE `dokumen_surat` (
  `id` int(11) NOT NULL,
  `jenis_surat` varchar(255) NOT NULL,
  `deskripsi` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `template_surat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen_surat`
--

INSERT INTO `dokumen_surat` (`id`, `jenis_surat`, `deskripsi`, `created_at`, `template_surat`) VALUES
(1, 'Surat Keterangan Domisili', NULL, NULL, 'form_domisili.php'),
(2, 'Surat Keterangan Tidak Mampu', NULL, NULL, 'form_tidakmampu.php'),
(3, 'Surat Keterangan Usaha', NULL, NULL, 'form_usaha.php'),
(4, 'Surat Keterangan Beda NIK', NULL, NULL, 'form_beda_nik.php'),
(5, 'Surat Keterangan Beda Nama', NULL, NULL, 'form_beda_nama.php'),
(6, 'Surat Keterangan Kematian', NULL, NULL, 'form_kematian.php');

-- --------------------------------------------------------

--
-- Table structure for table `dusun`
--

CREATE TABLE `dusun` (
  `id` int(11) NOT NULL,
  `nama_dusun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dusun`
--

INSERT INTO `dusun` (`id`, `nama_dusun`) VALUES
(1, 'Dusun 1'),
(2, 'Dusun 2'),
(3, 'Dusun 3'),
(4, 'Dusun 4'),
(5, 'Dusun 5');

-- --------------------------------------------------------

--
-- Table structure for table `kematian`
--

CREATE TABLE `kematian` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `umur` int(11) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `hari_tgl` varchar(50) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `penyebab` text NOT NULL,
  `tanggal_surat` date NOT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kematian`
--

INSERT INTO `kematian` (`id`, `nama`, `jenis_kelamin`, `ttl`, `umur`, `agama`, `pekerjaan`, `alamat`, `hari_tgl`, `tempat`, `penyebab`, `tanggal_surat`, `status`, `tanggal_cetak`) VALUES
(1, 'Celine Arnalia Bulan', 'Perempuan', 'Kupang, 06 Agustus 2002', 22, 'kristen protestan', 'pelajar/mahasiswa', 'd', 'sekian', 'rs', 'sakit', '2025-03-11', 'tercetak', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `NomorUrut` int(11) NOT NULL,
  `NomorKK` varchar(20) DEFAULT NULL,
  `Dusun` varchar(50) DEFAULT NULL,
  `RT` varchar(10) DEFAULT NULL,
  `NamaLengkap` varchar(100) DEFAULT NULL,
  `TTL` date DEFAULT NULL,
  `JenisKelamin` enum('P','L') DEFAULT NULL,
  `Agama` varchar(50) DEFAULT NULL,
  `Pendidikan` varchar(50) DEFAULT NULL,
  `Pekerjaan` varchar(50) DEFAULT NULL,
  `StatusPerkawinan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rt`
--

CREATE TABLE `rt` (
  `id` int(11) NOT NULL,
  `nomor_rt` varchar(10) NOT NULL,
  `id_dusun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rt`
--

INSERT INTO `rt` (`id`, `nomor_rt`, `id_dusun`) VALUES
(1, 'RT 01', 1),
(2, 'RT 02', 1),
(3, 'RT 03', 1),
(4, 'RT 04', 2),
(5, 'RT 05', 2),
(6, 'RT 06', 2),
(7, 'RT 07', 2),
(8, 'RT 08', 3),
(9, 'RT 09', 3),
(10, 'RT 10', 4),
(11, 'RT 11', 4),
(12, 'RT 12', 5),
(13, 'RT 13', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sktm`
--

CREATE TABLE `sktm` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `umur` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `maksud` text NOT NULL,
  `tanggal_surat` date NOT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sktm`
--

INSERT INTO `sktm` (`id`, `nama`, `umur`, `jenis_kelamin`, `pekerjaan`, `agama`, `alamat`, `maksud`, `tanggal_surat`, `status`, `tanggal_cetak`) VALUES
(1, 'Bungsu R. Balukh', 22, 'Laki-laki', 'Mahasiswa', 'Kristen Protestan', 'Ba\'a', '...', '2025-03-11', 'tercetak', NULL),
(2, 'Bungsu R. Balukh', 22, 'Laki-laki', 'Mahasiswa', 'Kristen Protestan', 'Ba\'a', 'untuk ...', '2025-03-11', 'tercetak', NULL),
(3, 'Bungsu R. Balukh', 22, 'Laki-laki', 'Mahasiswa', 'Kristen Protestan', 'Ba\'a', 'untuk ...', '2025-03-11', 'tercetak', NULL),
(4, 'Celine A. Bulan', 22, 'Perempuan', 'Mahasiswa', 'Kristen Protestan', 'a', 'aa', '2025-03-19', 'tercetak', NULL),
(5, 'Celine A. Bulan', 22, 'Perempuan', 'Mahasiswa', 'Kristen Protestan', 'a', 'b', '2025-03-19', 'tercetak', NULL),
(6, 'Celine A. Bulan', 22, 'Perempuan', 'Mahasiswa', 'Kristen Protestan', 'a', 'b', '2025-03-19', 'tercetak', NULL),
(7, 'Celine A. Bulan', 22, 'Perempuan', 'Mahasiswa', 'Kristen Protestan', 'a', 'b', '2025-03-19', 'tercetak', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE `statistik` (
  `id` int(11) NOT NULL,
  `dusun` int(11) NOT NULL DEFAULT '0',
  `rt` int(11) NOT NULL DEFAULT '0',
  `penduduk` int(11) NOT NULL DEFAULT '0',
  `laki` int(11) NOT NULL DEFAULT '0',
  `perempuan` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `nama_pemohon` varchar(255) DEFAULT NULL,
  `jenis_surat` varchar(100) DEFAULT NULL,
  `status` enum('draft','siap dicetak','tercetak') DEFAULT 'draft',
  `tanggal_cetak` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_domisili`
--

CREATE TABLE `surat_domisili` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `ttl_umur` varchar(100) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_domisili`
--

INSERT INTO `surat_domisili` (`id`, `nomor_surat`, `nama`, `jenis_kelamin`, `ttl_umur`, `agama`, `pekerjaan`, `alamat`, `tanggal`, `status`, `tanggal_cetak`) VALUES
(1, '001', 'Celine A. Bulan', 'Perempuan', '22', 'Kristen Protestan', 'Mahasiswa', 'm', '2025-03-10', 'tercetak', NULL),
(2, '001', 'Febiana Kulla', 'Perempuan', '22', 'Kristen Protestan', 'Mahasiswa', 'Q', '2025-03-11', 'tercetak', NULL),
(3, '001', 'Celine A. Bulan', 'Perempuan', '22', 'Kristen Protestan', 'Mahasiswa', 'a', '2025-03-19', 'tercetak', NULL),
(4, '001', 'Celine A. Bulan', 'Perempuan', '22', 'Kristen Protestan', 'Mahasiswa', 'a', '2025-03-19', 'tercetak', NULL),
(5, '001', 'Celine A. Bulan', 'Perempuan', '22', 'Kristen protestan', 'Mahasiswa', 'a', '2025-03-19', 'tercetak', NULL),
(6, '001', 'Celine A. Bulan', 'Perempuan', '22', 'Kristen protestan', 'Mahasiswa', 'a', '2025-03-19', 'tercetak', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usaha`
--

CREATE TABLE `usaha` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nama_usaha` varchar(255) NOT NULL,
  `umur` int(11) NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('proses','tercetak') DEFAULT 'proses',
  `tanggal_cetak` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usaha`
--

INSERT INTO `usaha` (`id`, `nama`, `jabatan`, `nama_usaha`, `umur`, `pekerjaan`, `alamat`, `tanggal`, `status`, `tanggal_cetak`) VALUES
(1, 'Febiana Kulla', 'Mahasiswa', 'keripik pedas', 22, 'Mahasiswa', 'kayu putih', '2025-03-06', 'tercetak', NULL),
(2, 'Febiana Kulla', 'Mahasiswa', 'keripik pedas', 22, 'Mahasiswa', 'kayu putih', '2025-03-06', 'tercetak', NULL),
(3, 'Febiana Kulla', 'Mahasiswa', 'keripik pedas', 22, 'Mahasiswa', 'kayu putih', '2025-03-06', 'tercetak', NULL),
(4, 'Geralde Philip Djari', 'Mahasiswa', 'Belut Bakar', 24, 'Mahasiswa', 'Frans Seda', '2025-03-06', 'tercetak', NULL),
(5, 'Geralde Philip Djari', 'Mahasiswa', 'Belut Bakar', 24, 'Mahasiswa', 'frans seda', '2025-03-06', 'tercetak', NULL),
(6, 'aldi baineo', 'mahasiswa', 'kios', 22, 'pelajar/mahasiswa', 'kayu putih', '2025-03-07', 'tercetak', NULL),
(7, 'Ray Lengari', 'mahasiswa', 'Petani', 25, 'petani', 'taebenu', '2025-03-07', 'tercetak', NULL),
(8, 'Claudia Yovi Tey Seran', 'Ibu Desa', 'Jual Babi', 21, 'Jual Babi', 'taebenu', '2025-03-11', 'tercetak', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beda_nama`
--
ALTER TABLE `beda_nama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beda_nik`
--
ALTER TABLE `beda_nik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_penduduk`
--
ALTER TABLE `data_penduduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumen_surat`
--
ALTER TABLE `dokumen_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dusun`
--
ALTER TABLE `dusun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kematian`
--
ALTER TABLE `kematian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`NomorUrut`);

--
-- Indexes for table `rt`
--
ALTER TABLE `rt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dusun` (`id_dusun`);

--
-- Indexes for table `sktm`
--
ALTER TABLE `sktm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistik`
--
ALTER TABLE `statistik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_domisili`
--
ALTER TABLE `surat_domisili`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usaha`
--
ALTER TABLE `usaha`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `beda_nama`
--
ALTER TABLE `beda_nama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `beda_nik`
--
ALTER TABLE `beda_nik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_penduduk`
--
ALTER TABLE `data_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2164;

--
-- AUTO_INCREMENT for table `dokumen_surat`
--
ALTER TABLE `dokumen_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dusun`
--
ALTER TABLE `dusun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kematian`
--
ALTER TABLE `kematian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `NomorUrut` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rt`
--
ALTER TABLE `rt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sktm`
--
ALTER TABLE `sktm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `statistik`
--
ALTER TABLE `statistik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_domisili`
--
ALTER TABLE `surat_domisili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usaha`
--
ALTER TABLE `usaha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rt`
--
ALTER TABLE `rt`
  ADD CONSTRAINT `rt_ibfk_1` FOREIGN KEY (`id_dusun`) REFERENCES `dusun` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
