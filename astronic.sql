-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 19, 2024 at 03:39 PM
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

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addressid`, `ostan`, `shahr`, `address`, `postalcode`, `pelak`, `phone`, `location`, `uid`) VALUES
(1, 'مازندران', 'بابلسر', 'پازوار رو به روی دهکده پارسیان', '4745134163', '479', '01132384061', '', 1),
(2, 'مازندران', 'بابلسر', 'پازوار روستای سرحمام منزل چمسمال', '4745134341', '520', '01132382073', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `tedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `uid`, `spid`, `tedad`) VALUES
(18, 1, 1, 2),
(19, 2, 1, 3),
(20, 2, 2, 3);

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
(1, 'گوشی سامسونگ a55 samsung', 'samsung galaxy a55 246/8', 15000000, 'گلکسی A55 به‌عنوان پریمیوم‌ترین میان‌رده‌ی سال ۲۰۲۴ سامسونگ، با فریم فلزی و تراشه‌ی جدید Exynos 1480 همین شرکت، راهی بازار شده است. دوربین‌های اصلی، اولتراواید و ماکروی A55 نسبت به سال گذشته تغییر یا پیشرفتی نداشته‌اند؛ اما به‌لطف تراشه‌ی جدید، تجربه‌ی عکاسی لذت‌بخش و قابل قبولی ارائه می‌کنند. دوربین اصلی A55،‌ امکان فیلم‌برداری 4K با نرخ ۳۰ فریم‌برثانیه را نیز در اختیار قرار می‌دهد.\n\nدر بخش نمایشگر، گلکسی A55 از پنل OLED با ابعاد ۶٫۶ اینچ (حدود ۰٫۲ اینچ بزرگ‌تر از A54) استفاده می‌کند. نمایشگر، روشنایی و دقت رنگ خوبی ارائه می‌کند؛ اما حاشیه‌های قطور اطراف آن، می‌تواند یکی از نقاط ضعف بزرگ A55 باشد. باتری ۵۰۰۰ میلی‌آمپرساعتی A55، در کاربری‌های روزمره مثل وبگردی، گشتن در شبکه‌های اجتماعی و تماشای ویدیو، تا دو روز کاری نیز کاربر را همراهی خواهد کرد.', 1, 1, 18, '<div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">مدل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">وزن</div><div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div><div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div><div class=\"w-1/2 border-b py-2 font-semibold\"><div class=\"mb-1\">مجهز به حسگر انگشت</div><div>مقاوم در برابر آب</div></div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">حافظه داخلی</div><div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">مقدار رم</div><div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">دوربین&zwnj;های پشت گوشی</div><div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div><div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div></div></div></div><div class=\"w-full flex mb-3\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">سیستم عامل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Android</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div><div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div></div></div></div><div class=\"w-full flex\"><div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div><div class=\"w-2/3\"><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">اندازه</div><div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div></div><div class=\"w-full flex py-2\"><div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div><div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div></div></div></div>'),
(2, 'گوشی a54 سامسونگ', 'samsung galaxy a54 black 128/8', 12000000, 'این گوشی سامسونگ عالی است', 1, 1, 0, '');

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

--
-- Dumping data for table `safaresh`
--

INSERT INTO `safaresh` (`sid`, `uid`, `addressid`, `raveshersalid`, `statusid`, `date`, `mablaq`) VALUES
(1, 1, 1, 1, 4, '2024-06-16', '36500000');

-- --------------------------------------------------------

--
-- Table structure for table `sefareshrow`
--

CREATE TABLE `sefareshrow` (
  `srid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `tedad` int(11) NOT NULL,
  `price` int(20) NOT NULL,
  `total price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sefareshrow`
--

INSERT INTO `sefareshrow` (`srid`, `sid`, `spid`, `tedad`, `price`, `total price`) VALUES
(1, 1, 2, 1, 12500000, 12500000),
(2, 1, 1, 2, 12000000, 24000000);

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
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `ischecked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`tid`, `uid`, `subject`, `message`, `date`, `ischecked`) VALUES
(1, 1, 'تاخیر در تایید پرداخت', 'با سلام و خدا قوت با توجه به پرداختی که 3 روز پیش انجام دادم ولی هنوز سفارش در وضعیت در حال پرداخت قرار دارد.', '2024-06-19 15:38:14', 0);

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
  `cardnumber` varchar(16) DEFAULT NULL,
  `ismodir` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `phonenumber`, `password`, `username`, `email`, `firstname`, `lastname`, `nationalcode`, `cardnumber`, `ismodir`) VALUES
(1, '09031538939', '$2b$12$j0KRHPHukd8BEnQjiRTj2.B3EGousufIFRxrc1zPiWAgRxRlwuTWa', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, '09131131313', '$2b$12$Na1FHzx8itb9SCKOSjJxQeNQbL/3o/0FmaxqangEW2qO2vm6f7DhC', NULL, NULL, NULL, NULL, NULL, NULL, 0);

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
-- Indexes for table `safaresh`
--
ALTER TABLE `safaresh`
  ADD PRIMARY KEY (`sid`);

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
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tid`);

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
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- AUTO_INCREMENT for table `safaresh`
--
ALTER TABLE `safaresh`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sefareshrow`
--
ALTER TABLE `sefareshrow`
  MODIFY `srid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
