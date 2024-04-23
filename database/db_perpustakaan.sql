-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Mar 16, 2024 at 11:03 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `kode_anggota` char(10) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL DEFAULT 'foto_default.png',
  `no_telp` char(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jenis_kelamin` int(11) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `kode_anggota`, `nama_anggota`, `foto`, `no_telp`, `email`, `alamat`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`) VALUES
(76, 'A076', 'rahmaitunisa', 'foto_default.png', '089503257800', 'rahmaitunisa@gmail.com', 'Kp.Kebon Cau', 2, 'Tanggerang selatan', '2006-04-22'),
(77, 'A077', 'bilal', 'foto_default.png', '088223611093', 'billalzulias@gmail.com', '', 0, '', '0000-00-00'),
(79, 'A079', 'ama', 'foto_default.png', '089503257800', 'ama@gmail.com', '', 0, '', '0000-00-00'),
(80, 'A080', 'Nabila', 'foto_default.png', '089922776633', 'nabil@gmail.com', '', 0, '', '0000-00-00'),
(81, 'A081', 'amelia yulian', 'foto_default.png', '089765432167', 'ameliayulian@gmail.com', '', 0, '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `aturan_perpustakaan`
--

CREATE TABLE `aturan_perpustakaan` (
  `id` int(11) NOT NULL,
  `waktu_peminjaman` int(11) NOT NULL,
  `maksimal_peminjaman` int(11) NOT NULL,
  `denda_keterlambatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aturan_perpustakaan`
--

INSERT INTO `aturan_perpustakaan` (`id`, `waktu_peminjaman`, `maksimal_peminjaman`, `denda_keterlambatan`) VALUES
(0, 3, 3, 500);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail_peminjaman` int(11) NOT NULL,
  `kode_peminjaman` varchar(10) NOT NULL,
  `kode_pustaka` varchar(10) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` int(11) NOT NULL,
  `jenis_denda` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail_peminjaman`, `kode_peminjaman`, `kode_pustaka`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `jenis_denda`, `denda`) VALUES
(322, '00001', 'P0007', '2024-02-20', '2024-02-23', 2, 1, 500),
(323, '01164', 'P0009', '2024-02-20', '2024-02-20', 2, 0, 0),
(325, '01165', 'P0059', '2024-02-27', '2024-03-16', 2, 1, 7500),
(326, '01167', 'P0057', '2024-02-27', '2024-03-16', 2, 1, 7500),
(327, '01168', 'P0056', '2024-02-27', '2024-03-16', 2, 1, 7500),
(328, '01169', 'P0032', '2024-03-16', '0000-00-00', 1, 0, 0),
(329, '01170', 'P0032', '2024-03-07', '0000-00-00', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `kode_karyawan` char(9) NOT NULL,
  `nip` char(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `email` varchar(30) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `kode_karyawan`, `nip`, `nama_karyawan`, `jk`, `email`, `alamat`, `no_telp`, `foto`) VALUES
(27, 'K001', '2102001', 'Admin', '2', 'admin@gmail.com', 'Jl Kp. Kebon Cau', '089503257800', 'user5.png'),
(38, 'K028', '2402028', 'Rahmaitunisa', '2', 'rahmaitunisa@gmail.com', 'Kp. Kebon Cau', '089503257800', 'foto_default.png'),
(39, 'K039', '2402039', 'amelia yulian', '2', 'amelia@gmail.com', '', '00826563282', 'foto_default.png'),
(40, 'K040', '2402040', 'perisa', '2', 'perisa@gmail.com', '', '08960012345', 'foto_default.png');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pustaka`
--

CREATE TABLE `kategori_pustaka` (
  `id_kategori_pustaka` int(11) NOT NULL,
  `kode_kategori_pustaka` varchar(10) NOT NULL,
  `nama_kategori_pustaka` varchar(50) NOT NULL,
  `gambar_kategori_pustaka` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_pustaka`
--

INSERT INTO `kategori_pustaka` (`id_kategori_pustaka`, `kode_kategori_pustaka`, `nama_kategori_pustaka`, `gambar_kategori_pustaka`) VALUES
(11, 'K001', 'Bisnis', ''),
(12, 'K012', 'Komputer', ''),
(15, 'K015', 'Novel', ''),
(21, 'K021', 'Psikologi', ''),
(22, 'K022', 'Komik', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `kode_peminjaman` varchar(10) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `kode_peminjaman`, `kode_anggota`, `tanggal`) VALUES
(1163, '00001', 'A076', '2024-02-20'),
(1164, '01164', 'A076', '2024-02-20'),
(1166, '01165', 'A076', '2024-02-27'),
(1167, '01167', 'A080', '2024-02-27'),
(1168, '01168', 'A080', '2024-02-27'),
(1169, '01169', 'A081', '2024-02-28'),
(1170, '01170', 'A076', '2024-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `kode_penerbit` varchar(10) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `kode_penerbit`, `nama_penerbit`) VALUES
(3, 'U003', 'Andistar'),
(5, 'U004', 'Elex Media Komputindo'),
(6, 'U006', 'Informatika'),
(7, 'U007', 'Andi'),
(8, 'U008', 'Penebar Plus+'),
(9, 'U009', 'Gramedia Pustaka Utama'),
(10, 'U010', 'Padang Makhsyar Press/Padma'),
(11, 'U011', 'Cable Book'),
(12, 'U012', 'Real Books'),
(13, 'U013', 'Change Publication'),
(15, 'U014', 'Mizan'),
(17, 'U016', 'Kompas'),
(18, 'U018', 'Elex Media Komputindo'),
(19, 'U019', 'Zikrul Hakim'),
(20, 'U020', 'Marjin Kiri'),
(21, 'U021', 'Sahima'),
(23, 'U022', 'Gava Media'),
(24, 'U024', 'Teknosain'),
(25, 'U025', 'Wade Group'),
(26, 'U026', 'Andi Publisher'),
(27, 'U027', 'Graha Ilmu'),
(28, 'U028', 'Tahta Media Group'),
(29, 'U029', 'Dunia Komputer'),
(30, 'U030', 'Sygma Media Inovasi'),
(31, 'U031', 'Flash Books'),
(32, 'U032', 'Fatmah bagis'),
(33, 'U033', 'Grasindo'),
(34, 'U034', 'Motivaksi Inspira'),
(35, 'U035', 'PT. Falcon'),
(36, 'U036', 'Magenta Media Pt'),
(37, 'U037', 'Anak Hebat Indonesia'),
(38, 'U038', 'Elex Media Komputindo'),
(39, 'U039', 'Mediakita'),
(40, 'U040', 'Renebook'),
(41, 'U041', 'Haru Semesta Persada Pt'),
(42, 'U042', 'Checklist'),
(43, 'U043', 'Pt Rajagrafindo Persada'),
(44, 'U044', 'Penguin Random House Usa'),
(45, 'U045', 'Sinar Star Book'),
(46, 'U046', 'm&amp;c!');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `kode_pengguna` char(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `level` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `kode_pengguna`, `username`, `password`, `level`, `status`) VALUES
(37, 'K001', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Karyawan', 1),
(89, 'A076', 'rahma', '827ccb0eea8a706c4c34a16891f84e7b', 'Anggota', 1),
(90, 'A077', 'lall', '202cb962ac59075b964b07152d234b70', 'Anggota', 1),
(92, 'A079', 'amaa', 'e32d2760d2b634d00193b072b4be2119', 'Anggota', 1),
(93, 'K028', 'lal', '698d51a19d8a121ce581499d7b701668', 'Karyawan', 1),
(94, 'A080', 'nabila', '652d3266220e0aacb047d3aa6f51f1b0', 'Anggota', 1),
(95, 'A081', 'ameliaaa', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Anggota', 1),
(96, 'K039', 'amel', '202cb962ac59075b964b07152d234b70', 'Karyawan', 1),
(97, 'K040', 'perisa', '827ccb0eea8a706c4c34a16891f84e7b', 'Karyawan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id_penulis` int(11) NOT NULL,
  `kode_penulis` varchar(10) NOT NULL,
  `nama_penulis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penulis`
--

INSERT INTO `penulis` (`id_penulis`, `kode_penulis`, `nama_penulis`) VALUES
(6, 'P001', 'Didip Diandra'),
(7, 'P007', 'Paul Sloane'),
(8, 'P008', 'Febriana Werdiningsih'),
(9, 'P009', 'Tim Ems'),
(10, 'P010', 'Hendi Hendratman'),
(11, 'P011', 'Madcoms'),
(12, 'P012', 'Rina Dewi Lina,mm.cfp,luf'),
(13, 'P013', 'Yudha Eris Setiawan'),
(14, 'P014', 'Didip Diandra'),
(15, 'P015', 'Agus Mustofa'),
(16, 'P016', 'Afin Murtie'),
(17, 'P017', 'M.nur Aini, M.kes'),
(18, 'P018', 'Ralp Epperson'),
(19, 'P019', 'Steven J. Martin'),
(20, 'P020', 'Tere Liye'),
(23, 'P021', 'Rhenald Kasali'),
(24, 'P024', 'Kaiu Shirai, Posuka Demizu'),
(25, 'P025', 'Kak Adah, Abang Kerel'),
(26, 'P026', 'Agus Sudibyo'),
(27, 'P027', 'Gadisturatea'),
(30, 'P028', 'Bunafit Nugroho'),
(31, 'P031', 'Endang Pujiastuti'),
(32, 'P032', 'Eko Junirianto'),
(33, 'P033', 'Tedi Heriyanto'),
(34, 'P034', 'Hendri Wahyudi'),
(35, 'P035', 'Ade Rizka'),
(36, 'P036', 'I Komang Setia Buana'),
(37, 'P037', 'Riza Zacharias'),
(38, 'P038', 'ENGGAR MAHISWAN'),
(39, 'P039', 'Akhmad darmawan'),
(40, 'P040', 'Herry'),
(41, 'P041', 'Nadzira Shafa'),
(42, 'P042', 'A Fuadi'),
(43, 'P043', 'Laksmi Pamuntjak'),
(44, 'P044', 'Astrid Tito'),
(45, 'P045', 'Durian Sukegawa'),
(46, 'P046', 'Brian Khrisna'),
(47, 'P047', 'Dadan Erlangga'),
(48, 'P048', 'Boy Candra'),
(49, 'P049', 'Asti Musman'),
(50, 'P050', 'Pijar Psikologi'),
(51, 'P051', 'Isnanah'),
(52, 'P052', 'Hector Garcia'),
(53, 'P053', 'Jung Wooyul'),
(54, 'P054', 'Jun Meekyung'),
(55, 'P055', 'Tjahjo Harry Wilopo'),
(56, 'P056', 'Alan Porter'),
(57, 'P057', 'Iman Setiadi'),
(58, 'P058', 'Sumadi Surya Brata'),
(59, 'P059', 'Megan Madison'),
(60, 'P060', 'Lincoln Peice'),
(61, 'P061', 'Gakken'),
(62, 'P062', 'Haqqiya Ara Kalila, dkk.');

-- --------------------------------------------------------

--
-- Table structure for table `profil_aplikasi`
--

CREATE TABLE `profil_aplikasi` (
  `id` int(11) NOT NULL,
  `nama_aplikasi` varchar(30) NOT NULL,
  `nama_pimpinan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `website` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profil_aplikasi`
--

INSERT INTO `profil_aplikasi` (`id`, `nama_aplikasi`, `nama_pimpinan`, `alamat`, `no_telp`, `website`, `logo`) VALUES
(0, 'PERPUS KITA', 'Rahmaitunisa', 'SMK NEGERI 1 CISARUA', '089503257800', '-', 'logoo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pustaka`
--

CREATE TABLE `pustaka` (
  `id_pustaka` int(11) NOT NULL,
  `kode_pustaka` varchar(10) NOT NULL,
  `judul_pustaka` varchar(100) NOT NULL,
  `kategori_pustaka` int(11) NOT NULL,
  `penerbit` int(11) NOT NULL,
  `penulis` int(11) NOT NULL,
  `tahun` char(4) NOT NULL,
  `gambar_pustaka` varchar(100) NOT NULL,
  `halaman` int(11) NOT NULL,
  `dimensi` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `rak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pustaka`
--

INSERT INTO `pustaka` (`id_pustaka`, `kode_pustaka`, `judul_pustaka`, `kategori_pustaka`, `penerbit`, `penulis`, `tahun`, `gambar_pustaka`, `halaman`, `dimensi`, `stok`, `rak`) VALUES
(7, 'P0007', 'How To Be A Brillian Thinker', 11, 3, 7, '2020', 'How To Be A Brillian Thinker.PNG', 230, '-', 11, 'R001'),
(9, 'P0009', 'Pemrograman Android Dalam Sehari', 12, 5, 9, '2015', 'Pemrograman Android Dalam Sehari.PNG', 168, '-', 6, 'R003'),
(10, 'P0010', 'The Magic of Adobe Photoshop Edisi Revisi 2', 12, 6, 10, '2017', 'The Magic of Adobe Photoshop Edisi Revisi 2.PNG', 752, '-', 10, 'ROO3'),
(11, 'P0011', 'Microsoft Visual Basic 6.0 Untuk Pemula', 12, 7, 11, '2008', 'Microsoft Visual Basic 6.0 Untuk Pemula.PNG', 230, '-', 7, 'ROO3'),
(12, 'P0012', 'Bisa Investasi Dengan Gaji', 11, 3, 12, '2016', 'Bisa Investasi Dengan Gaji.PNG', 231, '-', 15, 'R001'),
(13, 'P0013', 'Cara Mudah Buka Bisnis Travel', 11, 9, 13, '2016', 'Cara Mudah Buka Bisnis Travel.PNG', 162, '14 x 21 cm', 5, 'R001'),
(14, 'P0014', 'Strategi Membangun Bisnis Mandiri', 11, 9, 6, '2016', 'Strategi Membangun Bisnis Mandiri.PNG', 129, '-', 8, 'R001'),
(16, 'P0015', 'Dzikir Tauhid', 16, 10, 15, '2006', 'Dzikir Tauhid.PNG', 0, '13 x 20 cm', 7, 'B005'),
(17, 'P0017', 'Hujan', 15, 9, 20, '2016', 'Hujan.PNG', 318, '14 x 21 Cm', 9, 'B006'),
(18, 'P0018', 'Aneka Buah Berkhasiat Obat', 17, 12, 17, '2015', 'Aneka Buah Berkhasiat Obat.PNG', 162, '14 x 20 Cm', 10, 'B006'),
(19, 'P0019', 'Invisible Hand', 20, 13, 18, '2013', 'Invisible Hand.PNG', 492, '-', 10, 'B007'),
(25, 'P0020', 'The Small Big', 11, 9, 19, '2016', 'The Small Big.PNG', 246, '14 x 21 Cm', 9, 'R001'),
(29, 'P0026', 'Self Driving', 11, 15, 23, '2014', 'Self Driving.PNG', 272, '14 x 21 Cm', 10, 'R001'),
(31, 'P0030', 'The Promised Neverland 16', 22, 18, 24, '2021', 'The Promised Neverland 16.PNG', 208, '11 x 17 Cm', 10, 'R009'),
(32, 'P0032', 'Jujutsu Kaisen 1', 22, 3, 24, '2021', 'Jujutsu Kaisen 1.PNG', 0, '11 x 17 Cm', 2, 'R009'),
(33, 'P0033', 'Seri Sweet Ana Salehah 2 Ida & Kecoak', 22, 19, 25, '2019', 'Seri Sweet Ana Salehah  Ida & Kecoak.PNG', 92, '13 x 18 Cm', 4, 'R009'),
(34, 'P0034', 'Demokrasi dan Kedaruratan Memahami Filsafat Politik Giorgio Agamben', 19, 20, 26, '2019', 'Demokrasi dan Kedaruratan Memahami Filsafat Politik Giorgio Agamben.PNG', 0, '14 x 21 Cm', 6, 'R008'),
(35, 'P0035', 'Menjemput Jodoh Impian', 18, 21, 27, '2020', 'Menjemput Jodoh Impian.PNG', 208, '14 x 21 Cm', 4, 'R005'),
(38, 'P0036', 'Pengenalan PHP dan JAVA untuk pemula', 12, 5, 6, '1805', 'java.jpg', 153, '-', 10, 'ROO3'),
(39, 'P0039', 'Aplikasi Pemrograman  Web Dinamis dengan PHP dan MySQL', 12, 23, 30, '2019', 'php sql.jpg', 554, '-', 15, 'ROO3'),
(40, 'P0040', 'Pemograman Web menggunakan Condeigniter 4 dan Bootstrap', 12, 24, 31, '2022', 'boostrap.jpg', 208, '17 x 24', 7, 'ROO3'),
(41, 'P0041', 'PEMROGRAMAN WEB DENGAN FRAMEWORK LARAVEL', 12, 25, 32, '2018', 'q.jpg', 120, '-', 5, 'ROO3'),
(42, 'P0042', 'Pemograman bahasa c++ LINUX', 12, 26, 33, '1609', 'R.jpg', 177, '-', 12, 'ROO3'),
(43, 'P0043', 'Pemrograman Komputer', 12, 27, 34, '2020', 'L.jpg', 160, '17 x 24', 7, 'ROO3'),
(45, 'P0044', 'JAGO PHP', 12, 29, 36, '2014', 'I.jpg', 150, '-', 3, 'ROO3'),
(46, 'P0046', 'BISNIS JALAN LANGIT', 11, 30, 37, '0408', 'dfA.jpg', 392, '15 x 24 cm', 9, 'R001'),
(47, 'P0047', 'BISNIS ANTI EXPIRED', 11, 31, 38, '2017', 'P.jpg', 160, '140x200', 7, 'R001'),
(48, 'P0048', 'Studi kelayakan bisnis', 11, 32, 39, '2023', 'k.jpg', 143, '-', 5, 'R001'),
(49, 'P0049', 'Risiko bisnis', 11, 33, 40, '2015', 'j.jpg', 253, '0.47', 3, 'R001'),
(51, 'P0050', '172 Days', 15, 34, 41, '2107', 'yy.jpg', 241, '14.8 x 20.8 cm', 14, 'B001'),
(52, 'P0052', 'Anak Rantau', 15, 35, 42, '2017', 'hm.jpg', 382, '-', 12, 'B001'),
(53, 'P0053', 'Kekasih Musim Gugur', 15, 9, 43, '0807', 'oh.jpg', 452, '15 x 21 cm', 15, 'B001'),
(54, 'P0054', '1 Kos, 3 Cinta, 7 keberuntungan', 15, 9, 44, '0710', '1.jpg', 312, '-', 9, 'B001'),
(55, 'P0055', 'Pasta Kacang Merah', 15, 9, 45, '0510', 'hh.jpg', 240, '15 x 20 cm', 10, 'B001'),
(56, 'P0056', 'Sisi Tergelap Surga', 15, 9, 46, '1212', 'ooo.jpg', 304, '-', 10, 'B001'),
(57, 'P0057', 'Sekala dan Hantu Tanpa Kepala', 15, 9, 47, '0903', 'ha.jpg', 264, '13 x 20 cm', 10, 'B001'),
(58, 'P0058', 'Senja,Hujan &amp; Cerita Yang Telah Usai', 15, 9, 48, '2805', 'y.jpg', 248, '13 x 19 cm', 9, 'B001'),
(59, 'P0059', 'Kisah yang Pilu untuk Kita yang Ragu', 15, 36, 48, '1911', 'hfkdsj.jpg', 224, '13 x 19 cm', 10, 'B001'),
(60, 'P0060', 'Philosophy of Money', 21, 37, 49, '1507', 'kig.jpg', 242, '14 x 20 cm', 10, 'P001'),
(61, 'P0061', 'Sepi', 21, 38, 50, '1101', 'hhhh.jpg', 272, '14 x 21 cm', 10, 'P001'),
(62, 'P0062', 'I Have Anxiety', 21, 39, 51, '2712', 'dhfiuwq.jpg', 168, '18 x 26 cm', 10, 'P001'),
(63, 'P0063', 'The Ikigai Journey', 21, 40, 52, '0402', 'jhousm.jpg', 289, '14 x 21 cm', 10, 'P001'),
(64, 'P0064', 'Who Are You?', 21, 9, 53, '2206', 'jfytbk.jpg', 232, '13 x 20 cm', 10, 'P001'),
(65, 'P0065', 'Bukan Maksudku Tak Menghargai Diri', 21, 41, 54, '1802', 'jfjtuml;,.jpg', 244, '13 x 19 cm', 10, 'P001'),
(66, 'P0066', 'Habit Is Power', 21, 42, 55, '1002', 'utrilou[.jpg', 190, '14 x 20 cm', 10, 'P001'),
(67, 'P0067', 'Segala Sesuatu Yang Perlu Anda Ketahui Tentang Psikologi', 21, 9, 56, '2903', 'ljiojokl..jpg', 256, '17 x 25', 10, 'P001'),
(68, 'P0068', 'Pendekatan Saintifik Menuju Kebahagiaan', 21, 9, 57, '2004', 'uiij;.jpg', 333, '-', 10, 'P001'),
(69, 'P0069', 'Psikologi Kepribadian', 21, 43, 58, '0309', 'joplutdy.jpg', 362, '-', 10, 'P001'),
(70, 'P0070', 'Yes! No!: A First Conversation About Consent', 22, 44, 59, '2911', 'fhjknmk.jpg', 36, '17 x 19', 10, 'R001'),
(71, 'P0071', 'Big Nate #8: Great Minds Think Alike', 22, 45, 60, '1702', 'hbjkmll.jpg', 224, '15 x 22', 10, 'R009'),
(72, 'P0072', 'Big Nate #19: Goes Bananas!', 22, 45, 60, '1702', 'hmkhyg.jpg', 176, '15 x 22 cm', 10, 'R009'),
(73, 'P0073', 'Big Nate #18: Silent But Deadly', 22, 45, 60, '1702', 'hfdfjkml;.jpg', 176, '15 x 22 cm', 10, 'R009'),
(74, 'P0074', 'Big Nate #14: Thunka, Thunka, Thunka', 22, 45, 60, '1702', 'fuk;uhtr6.jpg', 176, '15 x 22 cm', 10, 'R009'),
(75, 'P0075', 'Belajar dari Komik - Pintar Matematika Buku 1', 22, 46, 61, '0608', 'fujplplds.jpg', 96, '18 x 24 cm', 10, 'R009'),
(76, 'P0076', 'Berkah Membaca Buku', 22, 9, 62, '2304', 'j;klojfdsw.jpg', 96, '14 x 21 cm', 10, 'R009');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD UNIQUE KEY `kode_pelanggan` (`kode_anggota`);

--
-- Indexes for table `aturan_perpustakaan`
--
ALTER TABLE `aturan_perpustakaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail_peminjaman`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `kode_karyawan` (`kode_karyawan`);

--
-- Indexes for table `kategori_pustaka`
--
ALTER TABLE `kategori_pustaka`
  ADD PRIMARY KEY (`id_kategori_pustaka`),
  ADD UNIQUE KEY `kode_kategori_pustaka` (`kode_kategori_pustaka`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD UNIQUE KEY `kode_peminjaman` (`kode_peminjaman`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `profil_aplikasi`
--
ALTER TABLE `profil_aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pustaka`
--
ALTER TABLE `pustaka`
  ADD PRIMARY KEY (`id_pustaka`),
  ADD UNIQUE KEY `kode_pustaka` (`kode_pustaka`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kategori_pustaka`
--
ALTER TABLE `kategori_pustaka`
  MODIFY `id_kategori_pustaka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1171;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id_penulis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `pustaka`
--
ALTER TABLE `pustaka`
  MODIFY `id_pustaka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
