-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2012 at 08:45 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `toko3`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(14, 'Baju Gamis'),
(13, 'Baju Formal'),
(15, 'Sepatu Cibaduyut'),
(16, 'Sepatu Kopo');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE IF NOT EXISTS `keranjang` (
  `id_keranjang` int(5) NOT NULL AUTO_INCREMENT,
  `id_product` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_keranjang` date NOT NULL,
  `qty` int(4) NOT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=379 ;

--
-- Dumping data for table `keranjang`
--


-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_pemesan` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'New',
  `jumlah` int(4) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `id_product`, `id_pemesan`, `name`, `email`, `address`, `phone`, `status`, `jumlah`, `tanggal`) VALUES
(66, 34, 'p9b7mgfhp4qb89p92jmimkeke4', 'tian', 'tianlagi@lagi.com', 'kajsd ', 723462432, 'New', 1, '2012-04-15'),
(62, 34, '7et88fvn2u98ppqqn4r4aai486', 'dwi anugrah', 'tian@yahoo.com', 'kjahs dkajsh dkajsh dkjash dkjas dkjash dkjash dkjasdkjas dkj', 239847234, 'New', 1, '2012-04-14'),
(63, 32, '7et88fvn2u98ppqqn4r4aai486', 'dwi anugrah', 'tian@yahoo.com', 'kjahs dkajsh dkajsh dkjash dkjas dkjash dkjash dkjasdkjas dkj', 239847234, 'New', 1, '2012-04-14'),
(64, 33, '7et88fvn2u98ppqqn4r4aai486', 'dwi anugrah', 'tian@yahoo.com', 'kjahs dkajsh dkajsh dkjash dkjas dkjash dkjash dkjasdkjas dkj', 239847234, 'New', 2, '2012-04-14'),
(65, 32, 'p9b7mgfhp4qb89p92jmimkeke4', 'tian', 'tianlagi@lagi.com', 'kajsd ', 723462432, 'New', 1, '2012-04-15'),
(61, 34, '7et88fvn2u98ppqqn4r4aai486', 'asd', 'asd', 'asda', 234234, 'New', 1, '2012-04-14'),
(60, 33, '7et88fvn2u98ppqqn4r4aai486', 'tian', 'dwi', 'asdkjh askj', 239842234, 'New', 1, '2012-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `id_category` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `price`, `image`, `id_category`, `deskripsi`) VALUES
(32, 'Baju Timnas', 90000, '5e314d4cbf3be7f42c724d85ff3f65a1.jpg', 13, 'Ini Baju timnas tapi masuknya ke Baju Formal, haha biarin lah<br>'),
(31, 'Sepatu Dua', 100000, 'sepatu.jpg', 16, 'ini juga sepatu yang bagus hohoho<br>'),
(30, 'Sepatu Keren', 120000, 'cnqy4fkdrymitqaif8hw.jpg', 15, 'ini adalah sepatu asli hehehehe<br>'),
(33, 'Baju Cewe', 200000, '1297307145_165392947_1-Pictures-of--baju-muslimah-trendyBrooch-Baby-headband.jpg', 14, 'ini baju cewe yang saya masukan ke kategori Baju Gamis, hehehe<br>'),
(34, 'Sepatu Cewe', 50000, 'sepat1u.jpg', 15, 'ini adalah sepatu untuk cewe dan semoga bermanfaat,<br>');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `password`, `email`, `level`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@hitamcoklat.com', 'admin');
