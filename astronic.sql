-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 15, 2024 at 11:21 AM
-- Server version: 10.6.17-MariaDB-1:10.6.17+maria~ubu2004
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astronic`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `addressid` int(11) NOT NULL,
  `ostan` varchar(150) NOT NULL,
  `shahr` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `postalcode` varchar(20) NOT NULL,
  `pelak` varchar(20) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `location` text NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `tedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `category`) VALUES
(1, 'موبایل'),
(2, 'کامپیوتر'),
(3, 'لپتاپ'),
(4, 'فلش'),
(5, 'هارد'),
(6, 'مانیتور'),
(7, 'کیس'),
(8, 'هنزفری'),
(9, 'مادربرد'),
(10, 'موس و کیبرد'),
(11, 'کنسول بازی');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `guarantee` int(11) NOT NULL,
  `information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `title`, `model`, `price`, `description`, `categoryid`, `scid`, `guarantee`, `information`) VALUES
(1, 'گوشی a55 samsung رنگ آبی', 'samsung galaxy a55 246/8 blue', 15000000, 'این گوشی سامسونگ a 55 است', 1, 1, 0, '<div id=\"p_container2\" class=\"border rounded-lg mb-5 py-3 pl-3\"><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">مدل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">وزن</div><div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div><div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div><div class=\"w-1/2 border-b py-2 font-semibold\"><div class=\"mb-1\">مجهز به حسگر انگشت</div><div>مقاوم در برابر آب</div></div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">حافظه داخلی</div><div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">مقدار رم</div><div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">دوربین&zwnj;های پشت گوشی</div><div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div><div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">سیستم عامل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Android</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div></div></div></div><div class=\"w-full flex\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">اندازه</div><div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div><div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div></div></div></div></div>'),
(2, 'گوشی a56 سامسونگ', 'samsung galaxy a54 black 128/8', 12000000, 'این گوشی سامسونگ عالی است', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `raveshersals`
--

CREATE TABLE `raveshersals` (
  `raveshersalid` int(11) NOT NULL,
  `raveshersal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `raveshersals`
--

INSERT INTO `raveshersals` (`raveshersalid`, `raveshersal`) VALUES
(1, 'پست'),
(2, 'تیپاکس'),
(3, 'باربری'),
(4, 'مراجعه حضوری');

-- --------------------------------------------------------

--
-- Table structure for table `safaresh`
--

CREATE TABLE `safaresh` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  `raveshersalid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `date` date NOT NULL,
  `mablaq` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sefareshrow`
--

CREATE TABLE `sefareshrow` (
  `srid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `tedad` int(11) NOT NULL,
  `price` int(20) NOT NULL,
  `total price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `statusid` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`statusid`, `status`) VALUES
(1, 'پایان یافته'),
(2, 'منتظر پرداخت'),
(3, 'پرداخت شده'),
(4, 'ارسال شده');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `scid` int(11) NOT NULL,
  `subcategory` varchar(200) NOT NULL,
  `categoryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`scid`, `subcategory`, `categoryid`) VALUES
(1, 'موبایل سامسونگ', 0),
(2, 'موبایل اپل', 0),
(3, 'موبایل شیائومی', 0),
(4, 'موبایل نوکیا', 0),
(5, 'لپتاپ لنوو', 0),
(6, 'لپتاپ ایسوز', 0),
(7, 'لپتاپ مک', 0),
(8, 'لپتاپ دل', 0),
(9, 'تبلت سامسونگ', 0),
(10, 'تبلت لنوو', 0),
(11, 'پلی استیشن 4', 0),
(12, 'پلی استیشن 5', 0),
(13, 'ایکس باکس', 0),
(14, 'هارد', 0),
(15, 'رم کامپیوتر', 0),
(16, 'پردازنده', 0),
(17, 'کارت گرافیک', 0),
(18, 'هدفون و هندزفری', 0),
(19, 'لوازم جانبی موبایل', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subproduct`
--

CREATE TABLE `subproduct` (
  `spid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `color` varchar(20) NOT NULL,
  `mojoodi` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `colorname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subproduct`
--

INSERT INTO `subproduct` (`spid`, `pid`, `color`, `mojoodi`, `price`, `colorname`) VALUES
(1, 1, '#157fb1', 5, 12000000, 'آبی'),
(2, 1, '#f2f1ec', 4, 12500000, 'سفید');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `phonenumber` varchar(11) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nationalcode` varchar(10) DEFAULT NULL,
  `cardnumber` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `phonenumber`, `password`, `username`, `email`, `firstname`, `lastname`, `nationalcode`, `cardnumber`) VALUES
(1, '09031538939', '$2b$12$j0KRHPHukd8BEnQjiRTj2.B3EGousufIFRxrc1zPiWAgRxRlwuTWa', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`addressid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `raveshersals`
--
ALTER TABLE `raveshersals`
  ADD PRIMARY KEY (`raveshersalid`);

--
-- Indexes for table `sefareshrow`
--
ALTER TABLE `sefareshrow`
  ADD PRIMARY KEY (`srid`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`scid`);

--
-- Indexes for table `subproduct`
--
ALTER TABLE `subproduct`
  ADD PRIMARY KEY (`spid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `phonenumber` (`phonenumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `raveshersals`
--
ALTER TABLE `raveshersals`
  MODIFY `raveshersalid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sefareshrow`
--
ALTER TABLE `sefareshrow`
  MODIFY `srid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `statusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `scid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subproduct`
--
ALTER TABLE `subproduct`
  MODIFY `spid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
