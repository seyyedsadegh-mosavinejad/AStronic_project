-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 20, 2024 at 01:01 PM
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
(6, 'مازندران', 'بابلسر', 'پازوار', '8585696986', '12', '01135818569', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d207344.0754333465!2d51.51246693899922!3d35.70774021802187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3f8e00491ff3dcd9%3A0xf0b3697c567024bc!2z2KrZh9ix2KfZhtiMINin2LPYqtin2YYg2KrZh9ix2KfZhtiMINin24zYsdin2YY!5e0!3m2!1sfa!2s!4v1718869348790!5m2!1sfa!2s', 2);

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
(4, 'تبلت'),
(5, 'کنسول بازی'),
(6, 'مانیتور'),
(7, 'کیس'),
(8, 'هنزفری'),
(9, 'مادربرد'),
(10, 'موس و کیبرد');

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
(1, 'گوشی موبایل شیائومی مدل 13T 5G ظرفیت 256 گیگابایت رم 12 گیگابایت', 'Xiaomi 13T Dual SIM 256GB And 12GB RAM Mobile Phone', 26000000, 'شیائومی 13T یکی از گوشی‌های هوشمند میان‌رده این شرکت است که بدون هیچ تعریف اضافی، باید بگوییم که در کنار بهره بردن از قیمتی مقرون به‌صرفه، به مشخصات فنی قدرتمندی مجهز شده است که در برخی از موارد نه تنها چیزی از یک پرچمدار ندارد، بلکه توانایی ارائه عملکرد حتی بهتر را هم دارد. یکی از این مشخصات قدرتمند بدون شک صفحه‌نمایش این گوشی است. صفحه‌نمایش با ابعاد 6.67 اینچ و رزولوشن 1220×2712 پیکسل از نوع امولد که در کنار تمام این مشخصات قدرتمند، با توانایی نمایش 446 پیکسل در هر اینچ، کیفیت تصویر بی‌نظیر و چشم‌نوازی را ارائه می‌کند. نرخ بروزرسانی فوق‌العاده 144 هرتز و حداکثر روشنایی شگفت‌انگیر 2600 نیت (nits) در کنار هم سبب شده‌اند تا عملکرد روان و بدون لگ و همچنین وضوح تصویر بسیار خوبی را حتی زیر تابش مستقیم نور خورشید از این صفحه‌نمایش شاهد باشید. در قسمت پشتی هم یک سنسور دوربین اصلی با رزولوشن 50 مگاپیکسل از نوع عریض در کنار سنسور دوربین 50 مگاپیکسل تله‌فوتو با توانایی زوم دو برابری اپتیکال و سنسور 12 مگاپیکسل فوق‌عریض یا همان ultrawide برای این گوشی در نظر گرفته شده است که تمامی توقعات شما را در عکاسی نور روز و نور شب بر‌آورده می‌کند و باید بدانید که دوربین اصلی توانایی فیلمبرداری 4K را هم دارد. دوربین 20 مگاپیکسل سلفی این گوشی هم در نور روز به‌خوبی از پس اجرای وظایف خودش برمی‌آید می‌توانید روی آن حساب باز کنید. حضور پردازنده قدرتمند و پرچمدار دیمنسیتی 8200 اولترا شرکت مدیاتک هم سبب شده تا شیائومی 13T به‌خوبی و راحتی از پس اجرای بازی‌های سنگین و محبوب بربیاید. باتری با میزان ظرفیت 5000 میلی‌آمپر‌ساعت در کنار فناوری شارژ سریع 67 وات، از دیگر مشخصات در نظر گرفته شده هستند. در مجموع باید با اطمینان بگوییم که اگر به دنبال خرید گوشی میان‌رده‌ای هستید که در کنار قیمتی مقرون به‌صرفه، توانایی رقابت با پرچمداران گران‌قیمت را داشته باشد، بدون شک شیائومی 13T می‌تواند یکی از بهترین انتخاب‌های ممکن برای شما باشد.', 1, 3, 18, '<div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\"><p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">مشخصات کلی</p><div class=\"w-full grow\"><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">ابعاد</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۸.۵×۷۵.۷×۱۶۲.۲ میلی‌متر</p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">وزن</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۹۳ گرم</p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">توضیحات سیم کارت</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">سایز نانو (۸.۸ × ۱۲.۳ میلی‌متر) </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">تعداد سیم کارت</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دو عدد </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">ویژگی‌های کلیدی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">صفحه‌نمایش با نرخ بروزرسانی ۱۴۴ هرتز / \r\nصفحه‌نمایش با حداکثر روشنایی ۲۶۰۰ نیت (nits) </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">زمان معرفی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۶ سپتامبر ۲۰۲۳ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">مدل</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۳T </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">دسته ‌بندی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">‌میان‌رده </p></div></div><div class=\"hidden\"></div></div></div>\r\n<div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\"><p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">پردازنده</p><div class=\"w-full grow\"><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">تراشه</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Mediatek Dimensity ۸۲۰۰ Ultra Chipset </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">پردازنده‌ مرکزی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱x Cortex-A۷۸ + ۳x Cortex-A۷۸ + ۴x Cortex-A۵۵ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">فرکانس پردازنده‌ مرکزی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲.۰ - ۳.۰ - ۳.۱ گیگاهرتز</p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">پردازنده‌ گرافیکی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Mali-G۶۱۰ MC۶ GPU </p></div></div><div class=\"hidden\"></div></div></div>\r\n<div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\"><p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">حافظه</p><div class=\"w-full grow\"><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">حافظه داخلی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۵۶ گیگابایت </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">مقدار RAM</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۲ گیگابایت </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">پشتیبانی از کارت حافظه</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">فاقد پشتیبانی از کارت حافظه </p></div></div><div class=\"hidden\"></div></div></div>\r\n<div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\"><p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">صفحه نمایش</p><div class=\"w-full grow\"><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">فناوری صفحه‌ نمایش</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">AMOLED </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">بازه‌ اندازه صفحه نمایش</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۶.۰ تا ۸.۰ اینچ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">اندازه</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۶.۶۷ اینچ</p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">رزولوشن صفحه نمایش</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۲۲۰×۲۷۱۲ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">تراکم پیکسلی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۴۴۶ پیکسل بر اینچ</p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">نسبت صفحه‌ نمایش به بدنه</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۸۷.۵ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">نسبت تصویر</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۰:۹ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">نوع محافظ صفحه نمایش گوشی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Corning Gorilla Glass ۵ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">سایر قابلیت‌ها</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">رابط کاربری MIUI ۱۴  </p></div></div><div class=\"hidden\"></div></div></div>\r\n<div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\"><p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">ارتباطات</p><div class=\"w-full grow\"><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">شبکه‌های ارتباطی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>۲G </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>۳G </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>۴G </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>۵G </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">شبکه‌های مخابراتی و ارتباطی قابل پشتیبانی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>QZSS </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>Wi-Fi </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>بلوتوث </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">موقعیت نما ( GPS )</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>BDS </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>GALILEO </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>GLONASS </p><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span class=\"rounded-circle bg-neutral-700\"></span>GPS </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">رادیو</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">ندارد </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">نوع Wi-Fi (ورژن)</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Wi-Fi ۸۰۲.۱۱ a/b/g/n/ac/۶, dual-band\r\n </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">بلوتوث</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">A۲DP, LE </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">نسخه بلوتوث</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۵.۴ </p></div></div><div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\"><p class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">درگاه‌های ارتباطی</p><div class=\"border-complete-b py-2 lg:py-3 grow\"><p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">USB Type-C ۲.۰ </p></div></div><div class=\"hidden\"></div></div></div>'),
(2, ' گوشی موبایل اپل مدل iPhone 13 CH A Not Active ظرفیت 128 گیگابایت - رم 4 گیگابایت', 'Apple iPhone 13 CH Dual SIM 128GB And 4GB RAM Mobile Phone - Not Activate', 47000000, 'گوشی موبایل iPhone 13 CH پرچم‌دار جدید شرکت اپل است که با چند ویژگی جدید و دوربین دوگانه روانه بازار شده است. نمایشگر آیفون 13 به پنل Super Retina مجهز ‌شده است تا تصاویر بسیار مطلوبی را به کاربر عرضه کند. این نمایشگر رزولوشن بسیار بالایی دارد؛ به‌طوری‌که در اندازه­‌ی 6.1 اینچی‌اش، حدود 460 پیکسل را در هر اینچ جا داده است. امکان شارژ بی‌‌سیم باتری در این گوشی وجود دارد. تشخیص چهره با استفاده از دوربین جلو دیگر ویژگی است که در آیفون جدید اپل به کار گرفته شده است. از نظر سخت‌‌افزاری این گوشی از تراشه­‌ی جدید A15 بهره می‌برد که دارای 15 میلیارد ترانزیستور است که دارای کنترل گرمای مطلوبی بوده که تا بتواند علاوه بر کارهای معمول، از قابلیت‌های جدید واقعیت مجازی که اپل این روزها روی آن تمرکز خاصی دارد، پشتیبانی کند. به گفته خود شرکت اپل این گوشی دارای سرعتی 50 برابر نسخه 12 خود است. پردازنده دارای ماژولار جدیدی است که مصرف باتری را بسیار پایین‌تر آورده است و شما دارای حفظ باتری بالاتری هستید. اپل در این سری از گوشی‌های iPhone خود پردازنده گرافیکی‌ای را قرار داده که از سری 12 گوشی‌های خود 30 درصد سریع‌تر است و این نویدبخش آن است که شما می‌توانید بازی‌هایی را با گرافیک و MAP سنگین تر و بزرگ‌تر اجرا کنید. یکی از ویژگی‌هایی که در iPhone 13 شاهد هستیم سیستم فیلمبرداری ProRes سینمایی آن است که می تواند انقلابی در فیلمبرداری گوشی‌های موبایل به‌راه انداخته باشد. گوشی‌های نات اکتیو با قرار گرفتن سیم‌کارت‌های داخلی اکتیو می‌شوند و برخلاف مدل اکتیو پلمپ کالا باز نشده است. گوشی‌های اکتیو برند اپل هم به این شکل هستند که به دلیل محدودیت‌های برخی از محصولات اپل برای کشور ایران، در کشور‌های همسایه به‌صورت رسمی با یک بار قرار گرفتن سیم‌کارت، اکتیو شده و پلمپ می‌شوند و باید بدانید که این پروسه هیچ مشکلی در راستای گارانتی کالا به‌همراه ندارد. پارت‌نامبر‌های اروپا و ژاپن و امارات تک سیم‌کارت هستند و پارت‌نامبر‌های مربوط به امارات هم از فیس تایم پشتیبانی نمی‌کنند. پارت‌نامبر JA (ژاپن) هم حتی در حالت سایلنت صدای شاتر عکس قطع نمی‌شود.', 1, 2, 24, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>');
INSERT INTO `products` (`pid`, `title`, `model`, `price`, `description`, `categoryid`, `scid`, `guarantee`, `information`) VALUES
(3, 'گوشی موبایل سامسونگ Galaxy S24 Ultra 5G ظرفیت 256 گیگابایت رم 12 گیگابایت - ویتنام', 'samsung galaxy s24 ultra 5G 265/12', 62000000, 'سامسونگ در تاریخ 17 ژانویه 2024 (مصادف با 27 دی ماه 1402) از گوشی‌های پرچم‌دار جدید خود رونمایی کرد. ظاهراً سامسونگ به دلیل رقابت بالای خود با برند اپل، تصمیم گرفت که این گوشی‌های خود را یک ماه زودتر از هر سال معرفی کند. بزرگ‌ترین عضو مجموعه گوشی‌های سری S24، گوشی Galaxy S24 Ultra نام دارد که طبق ادعای سامسونگ، هوشمندترین گوشی‌ای است که تا به کنون تولید شده است. گوشی گلکسی اس 24 اولترا، که به عنوان جایگزینی شایسته برای گوشی Galaxy S24 Ultra شناخته شده است، در برخی از بخش‌ها پیشرفت‌های خوبی داشته و به خوبی هر چه تمام‌تر توانسته است در نقش یک پرچم‌دار قدرتمند، قد علم کند. استفاده از تراشه اسنپدراگون 8 نسل 3 مخصوص گلکسی، نرم‌افزار به‌روز و جدید با قابلیت‌های چشم‌گیر هوش مصنوعی Galaxy AI، نمایشگر فوق‌العاده باکیفیت و پر نور و بسیاری قابلیت‌های دیگر از جمله مواردی هستند که اغلب کاربران را به خرید این گوش ترغیب کرده و یا حداقل حس کنجکاوی آن‌ها را برانگیخته‌اند.', 1, 1, 18, '<section class=\"lg:mt-4 px-5 lg:px-0 pb-5 styles_PdpProductContent__sectionBorder__39zAX\">\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            مشخصات کلی</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    ابعاد</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۸.۶×۷۹×۱۶۲.۳\r\n                        میلی&zwnj;متر</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    وزن</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۳۳ گرم</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    توضیحات سیم کارت</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">سایز نانو (۸.۸ × ۱۲.۳\r\n                        میلی&zwnj;متر) </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    تعداد سیم کارت</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دو عدد </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    مدل</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Galaxy S۲۴ Ultra </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    دسته &zwnj;بندی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">پرچم&zwnj;دار </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            پردازنده</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    تراشه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Qualcomm Snapdragon ۸\r\n                        Gen ۳ Chipset </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    پردازنده&zwnj; مرکزی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱x Cortex-X۴ + ۳x\r\n                        Cortex-A۷۲۰ + ۲x Cortex-A۷۲۰ + ۲x Cortex-A۵۲۰ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    فرکانس پردازنده&zwnj; مرکزی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۳.۳۹ گیگاهرتز</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    پردازنده&zwnj; گرافیکی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Adreno ۷۵۰ GPU </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            حافظه</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    حافظه داخلی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۵۶ گیگابایت </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    مقدار RAM</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۲ گیگابایت </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    پشتیبانی از کارت حافظه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">فاقد پشتیبانی از کارت\r\n                        حافظه </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            صفحه نمایش</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    فناوری صفحه&zwnj; نمایش</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Dynamic LTPO AMOLED ۲X\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    بازه&zwnj; اندازه صفحه نمایش</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۶.۰ تا ۸.۰ اینچ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    اندازه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۶.۸ اینچ</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    رزولوشن صفحه نمایش</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۱۴۴۰×۳۱۲۰ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    تراکم پیکسلی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۵۰۵ پیکسل بر اینچ</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    نسبت صفحه&zwnj; نمایش به بدنه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۸۹.۱۲ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    سایر قابلیت&zwnj;ها</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">صفحه&zwnj;نمایش با نرخ\r\n                        بروزرسانی ۱۲۰ هرتز </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            ارتباطات</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    شبکه&zwnj;های ارتباطی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>۲G </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>۳G </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>۴G </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>۵G </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    شبکه&zwnj;های مخابراتی و ارتباطی قابل پشتیبانی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>QZSS </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>Wi-Fi </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>بلوتوث </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    موقعیت نما ( GPS )</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>BDS </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>GALILEO </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>GLONASS </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>GPS </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    نوع Wi-Fi (ورژن)</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۸۰۲.۱۱ a, b, g, n, ac,\r\n                        ax, Wi-Fi ۶E; Wi-Fi Direct, Hotspot\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    نسخه بلوتوث</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۵.۳ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    درگاه&zwnj;های ارتباطی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">USB Type-C </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            دوربین</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    دوربین&zwnj;های پشت گوشی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۴ ماژول دوربین </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    رزولوشن دوربین</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">۲۰۰ مگاپیکسل </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    فناوری فوکوس</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">PDAF </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    قابلیت&zwnj;های دوربین</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دارای ۴ حسگر دوربین |\r\n                        دوربین&zwnj;هایی با رزولوشن ۲۰۰+۱۰+۱۰+۱۲ مگاپیکسل\r\n                        - حسگر اول از نوع عریض (Wide)، با رزولوشن ۲۰۰ مگاپیکسل، دریچه&zwnj;ی دیافراگم f/۱.۷، فاصله\r\n                        کانونی لنز ۲۴ میلی&zwnj;متر (Focal Length ۲۴ mm)، ثبت تصاویر با پیکسل&lrm;هایی به سایز ۰.۶\r\n                        میکرومتر (۰.۶µm Pixel Size)، سایز سنسور ۱/۱.۳ اینچ (Sensor Size ۱/۱.۳ Inch)، مجهز به فناوری\r\n                        فوکوس اتوماتیک از نوع PDAF و مجهز به لرزشگیر اپتیکال تصویر (Optical Image Stabilization) و Laser\r\n                        AF /\r\n                        - حسگر دوم از نوع تله&zwnj;فوتو پریسکوپ (Periscope Telephoto) با رزولوشن ۵۰ مگاپیکسل،\r\n                        دریچه&zwnj;ی دیافراگم f/۳.۴، فاصله کانونی لنز ۱۱۱ میلی&zwnj;متر (Focal Length ۱۱۱mm)، مجهز به\r\n                        فناوری فوکوس اتوماتیک از نوع PDAF و مجهز به لرزشگیر اپتیکال تصویر (Optical Image Stabilization)\r\n                        و همراه با زوم اپتیکال ۵ برابر (۵x optical zoom) /\r\n                        - حسگر سوم از نوع تله&zwnj;فوتو (Telephoto) با رزولوشن ۱۰ مگاپیکسل، دریچه&zwnj;ی دیافراگم f/۲.۴،\r\n                        فاصله کانونی لنز ۶۷ میلی&zwnj;متر (Focal Length ۶۷mm)، ثبت تصاویر با پیکسل&lrm;هایی به سایز ۱.۱۲\r\n                        میکرومتر (۱.۱۲µm Pixel Size)، سایز سنسور ۱/۳.۵۲ اینچ (Sensor Size ۱/۳.۵۲ Inch)، مجهز به فناوری\r\n                        فوکوس اتوماتیک از نوع PDAF و مجهز به لرزشگیر اپتیکال تصویر (Optical Image Stabilization) و همراه\r\n                        با زوم اپتیکال ۳ برابر (۳x Optical Zoom) /\r\n                        - حسگر چهارم از نوع فوق&zwnj;عریض (ultrawide) با رزولوشن ۱۲ مگاپیکسل، دریچه&zwnj;ی دیافراگم\r\n                        f/۲.۲، فاصله کانونی لنز ۱۳ میلی&zwnj;متر (Focal Length ۱۳mm)، ثبت تصاویر با پیکسل&lrm;هایی به\r\n                        سایز ۱.۴ میکرومتر (۱.۴µm Pixel Size)، سایز سنسور ۱/۲.۵۵ اینچ (Sensor Size ۱/۲.۵۵ Inch)، مجهز به\r\n                        فناوری فوکوس اتوماتیک دوگانه از نوع PDAF و مجهز به فوق لرزشگیر ویدئو (Super Steady video) و\r\n                        زاویه دید ۱۲۰ درجه /\r\n                        قابلیت عکاسی پانوراما (Panorama)\r\n                        قابلیت عکاسی HDR به&zwnj;صورت خودکار </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    فیلمبرداری</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">رزولوشن ۳۲۴۰ × ۷۶۸۰ و\r\n                        سرعت ۲۴/۳۰ فریم بر ثانیه (۸k@۲۴/۳۰FPS) /\r\n                        رزولوشن ۲۱۶۰ × ۳۸۴۰ و سرعت ۳۰/۶۰/۱۲۰ فریم بر ثانیه (۴K@۳۰/۶۰/۱۲۰FPS) /\r\n                        رزولوشن ۱۰۸۰ × ۱۹۲۰ و سرعت ۳۰/۶۰/۲۴۰/۹۶۰ فریم بر ثانیه (۱۰۸۰p@۳۰/۶۰/۲۴۰/۹۶۰FPS) /\r\n                        stereo sound rec /\r\n                        HDR۱۰+ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    دوربین سلفی</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دارای حسگری با رزولوشن\r\n                        ۱۲ مگاپیکسل از نوع عریض (Wide)، دریچه&zwnj;ی دیافراگم f/۲.۲، فاصله کانونی لنز ۲۶ میلی&zwnj;متر\r\n                        (Focal Length ۲۶ mm)، مجهز به فناوری فوکوس اتوماتیک از نوع PDAF /\r\n                        فیلمبرداری:\r\n                        رزولوشن ۲۱۶۰ × ۳۸۴۰ و سرعت ۳۰/۶۰ فریم بر ثانیه (۴K@۳۰/۶۰FPS)\r\n                        رزولوشن ۱۰۸۰ × ۱۹۲۰ و سرعت ۳۰ فریم بر ثانیه (۱۰۸۰p@۳۰FPS)\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            صدا</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    بلندگو</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">استریو </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    خروجی صدا</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">USB Type-C </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            امکانات نرم افزاری</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    سیستم عامل</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Android </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    نسخه سیستم عامل</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">Android ۱۴ </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    <div class=\"flex flex-col lg:flex-row pb-6 lg:py-4 styles_SpecificationBox__main__JKiKI\">\r\n        <p class=\"w-full lg:ml-12 text-h5 text-neutral-700 shrink-0 mb-3 lg:mb-0 styles_SpecificationBox__title__ql60s\">\r\n            سایر مشخصات</p>\r\n        <div class=\"w-full grow\">\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    حس&zwnj;گرها</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>قطب&zwnj;نما (Compass) </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>شتاب&zwnj;سنج (Accelerometer) </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>مجاورت (Proximity) </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>فشارسنج (Barometer) </p>\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\"><span\r\n                            class=\"rounded-circle bg-neutral-700\"></span>اثرانگشت زیر صفحه نمایش\r\n                        (FingerPrint|Under-Display) </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    مشخصات باتری</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">باتری لیتیوم&zwnj;یونی\r\n                        با ظرفیت ۵۰۰۰ میلی&zwnj;آمپرساعت /\r\n                        قابلیت شارژ سریع با توان ۴۵ وات /\r\n                        پشتیانی از شارژ سریع بی&zwnj;سیم Qi/PMA با توان ۱۵ واتی /\r\n                        قابلیت شارژ بی&zwnj;سیم دستگاه&zwnj;های دیگر (Power Bank/Reverse Wireless Charging) با توان ۴.۵\r\n                        وات </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    اقلام همراه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دفترچه&zwnj; راهنما\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"w-full flex last styles_SpecificationAttribute__valuesBox__gvZeQ\">\r\n                <p\r\n                    class=\"ml-4 text-body-1 text-neutral-500 py-2 lg:py-3 lg:p-2 shrink-0 styles_SpecificationAttribute__value__CQ4Rz\">\r\n                    سایر توضیحات اقلام همراه</p>\r\n                <div class=\"border-complete-b py-2 lg:py-3 grow\">\r\n                    <p class=\"flex items-center w-full text-body-1 text-neutral-900 break-words\">دارای کابل USB-C / فاقد\r\n                        آداپتور شارژر </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"hidden\"></div>\r\n        </div>\r\n    </div>\r\n    \r\n</section>'),
(4, 'گوشی موبایل سامسونگ گلکسی S23 Ultra 5G ظرفیت 512 گیگابایت رم 12 گیگابایت - ویتنام', 'Samsung Galaxy S23 Ultra Dual SIM 512GB And 12GB RAM Mobile Phone - Vietnam', 43000000, '\r\nسامسونگ Galaxy S23 Ultra به‌عنوان گل سرسبد گوشی‌های هوشمند خانواده S23 با بهره بردن از مشخصات فنی قدرتمند معرفی شد. در نگاه اول از نظر طراحی در نظر گرفته شده، سامسونگ Galaxy S23 Ultra به نسبت نسل قبلی یعنی Galaxy S22 Ultra تغییرات زیادی نداشته و تقریبا هر دو گوشی از طراحی مشابهی بهره بردند. اما باید بدانید که Galaxy S23 Ultra به نسبت نسل قبلی، قدرتمند‌تر از همیشه وارد میدان رقابت شده است. در نمای رو‌به‌رویی این گوشی به صفحه‌نمایش شگفت‌انگیز با ابعاد 6.8 اینچ و رزولوشن 1440×3088 پیکسل از نوع Dynamic AMOLED 2X مجهز شده. از جمله قابلیت‌های قدرتمند این صفحه‌نمایش می‌توانیم به توانایی نمایش 501 پیکسل در هر اینچ، نرخ بروزرسانی 120 هرتز و حداکثر روشنایی 1750 نیت (nits) اشاره کنیم. تمام این مشخصات سبب شده‌اند تا صفحه‌نمایش این گوشی، هر‌آنچه که از یک صفحه‌نمایش گوشی پرچمدار توقع دارید را بر‌آورده کند. برای سنسور‌های قسمت پشتی هم سامسونگ دست به تغییر جدیدی زد و این بار سنسور دوربین عریض با رزولوشن 200 مگاپیکسل را برای این گوشی هوشمند در نظر گرفت. سنسوری که بدون هیچ شکی توانایی ارائه عملکرد فوق‌العاده‌ای در نور روز و نور شب دارد. سنسور 10 مگاپیکسل از نوع پریسکوپ‌تله‌فوتو با توانایی زوم 10 برابری اپتیکال در کنار سنسور 10 مگاپیکسل از نوع تله‌فوتو با قابلیت زوم 3 برابری اپتیکال و سنسور 12 مگاپیکسل از نوع فوق عریض (ultrawide)، دیگر سنسور‌های دوربین قسمت پشتی این گوشی را تشکیل می‌دهند. سنسور دوربین عریض این گوشی توانایی ضبط ویدیو با حداکثر کیفیت 8K و سرعت 30 فریم در ثانیه را هم دارد. برای دوربین سلفی، سنسور با رزولوشن 12 مگاپیکسل در نظر گرفته شده که توانایی ضبط ویدیو با حداکثر کیفیت 4K و سرعت 60 فریم در ثانیه را دارد. حضور پردازنده قدرتمند اسنپدراگون 8 نسل دو شرکت کوالکام هم سبب شده تا سامسونگ Galaxy S23 Ultra به‌راحتی هرچه‌ تمام‌تر از پس اجرای بازی‌های سنگین و با‌گرافیک بالا بر‌بیاید. باتری با میزان ظرفیت 5000 میلی‌آمپر‌ساعت و پشتیبانی از فناوری شارژ سریع با توان 45 وات هم از دیگر مشخصات در نظر گرفته شده برای این گوشی هوشمند است. قلم هوشمند S-Pen هم با قابلیت‌های جذاب این گوشی را همراهی می‌کند.', 1, 1, 18, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>'),
(5, 'گوشی موبایل اپل مدل iPhone 12 Pro ZD/A نات اکتیو تک سیم کارت ظرفیت 128 گیگابایت رم 6 گیگابایت', 'Apple iPhone 12 Pro ZD/A Not-Active 128/6GB', 54900000, 'شرکت اپل بالاخره در 13 اکتبر 2020 گوشیهای جدید خانواده آیفون 12 را معرفی کرد و در این میان آیفون 12 پرو مانند دیگر همقطارانش، سیر پیشرفت و تغییر نسل گوشی‌های اپل را به ناگاه دگرگون ساخته و آغازگر تحولی جدید در گوشهای آیفون است.\r\n\r\nبدین ترتیب، با وجود 5G حرفه‌ای برای شبکه اینترنت، بکارگیری تراشه Bionic A14  (که در حال حاضر سریعترین تراشه در بین گوشی‌های هوشمند است) جهش در عکاسی، داشتن صفحه نمایش OLED تخت، استفاده از سپر سرامیکی جهت حفاظت از نمایشگر با چهار برابر عملکرد بهتر در برابر شکستن، و آمادگی اتوماتیک در حالت شب بر روی هر دوربین، بهتر می‌توان مفهوم عبارت فوق را بیان کرد.', 1, 2, 24, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>'),
(6, 'گوشی موبايل شیائومی مدل 14 5G ظرفیت 512 گیگابایت رم 12 گیگابایت', 'Xiaomi 14 5G dual Sim 512GB and 12GB Mobile Phone - Global\r\n', 51900000, 'گوشی موبایل شیائومی 14 به بازارهای جهانی عرضه شد و شیائومی بار ثابت کرد که توانایی زیادی برای تولید انواع گوشی از اقتصادی و میانرده گرفته تا پرچمدار دارد. این گوشی یک پرچمدار بسیار جذاب است که بی‌شک می‌تواند یک رقیب اصلی برای پرچمدارهای برندهای دیگر باشد. طراحی این گوشی شباهت زیادی به شیائومی 13 دارد و بسیار شیک است. با داشتن اندازه جمع و جور 6.36 اینچی این گوشی انتخاب خوبی برای بسیاری از افرادی است که گوشی‌های بزرگ را دوست ندارند. نمایشگر LTPO OLED با حاشیه‌های باریک و وضوح و شفافیت فوق العاده در کنار روشنایی زیاد بسیار کاربردی است و تجربه بصری متمایزی را در اختیار شما قرار می‌دهد. دوربین این گوشی با همکاری برند حرفه‌ای لایکا طراحی شده است و کیفیتی مثال زدنی دارد. از سویی، پردازنده Snapdragon 8 Gen 3 برای این گوشی در نظر گرفته شده است تا در هیچ کاری کم نیاورد و بتواند بدون مشکل، سنگین‌ترین برنامه‌ها و بازی‌ها را اجرا کند. به طور کلی می‌توان گفت که شیائومی در هر بخش گوشی، بهترین خود را ارائه داده است، به طوری که شیائومی 14 یک رقیب واقعی و سر سخت برای پرچمدارهای گرانقیمت دیگر برندها محسوب می‌شود.', 1, 3, 18, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>');
INSERT INTO `products` (`pid`, `title`, `model`, `price`, `description`, `categoryid`, `scid`, `guarantee`, `information`) VALUES
(7, 'گوشی موبايل سامسونگ گلکسی Z Fold 4 5G ظرفیت 512 گیگابایت رم 12 گیگابایت', 'Samsung Galaxy Z Fold4 Dual SIM 512GB And 12GB RAM Mobile Phone', 61800000, 'گوشی z fold4 samsung نسبت به نسل قبلی خود در بسیاری از قسمت‌ها من جمله سخت‌افزار و همچنین نرم‌افزار دارای ارتقا و افزایش بهره‌وری شده است، برای نمونه در قسمت دوربین و کیفیت صفحه نمایش شاهد تغییرات خوبی هستیم. این گوشی در سال 2022 تولید و به بازار عرضه شده، نکته مثبت دیگر در طراحی و تولید این دستگاه تنوع رنگی، کاربرد و قابلیت منحصربفرد آن است. دوربین این دستگاه بسیار شبیه به گوشی s22 پلاس می‌باشد، با این تفاوت که قابلیت زوم خودکار با کیفیت‌تر و دقیق‌تر است.\r\n\r\nقسمت باتری نسبت به نسل قبل تغییری نداشته، البته با توجه به ظرفیت 4400 میلی‌آمپری آن نمی‌توان به عنوان مشکل به آن نگاه کرد. نکته مثبت در قسمت باتری افزایش سرعت شارژ دستگاه است، این مدل از یک شارژر 25 واتی پشتیبانی می‌کند که نسبت به نسل قبلی ارتقا پیدا کرده است. در قسمت نمایشگر و همچنین تراشه بهبودهایی داده شده، که در ادامه به آن خواهیم پرداخت. نکته آخر در  مورد این دستگاه این است که به مانند دیگر مدل‌های گوشی سامسونگ داخل جعبه‌ی آن آداپتور شارژ وجود ندارد که باید به صورت جداگانه تهیه و خریداری شود.', 1, 1, 18, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>'),
(8, 'گوشی موبایل نوکیا مدل 106 2023 دو سیم‌ کارت', 'Nokia 106 2023 Dual SIM Mobile Phone', 1200000, 'گوشی‌های کلاسیک هنوز هم در بین کاربران طرفداران خود را دارند و بدون هیچ تعریف اضافی باید بگوییم که نوکیا در این زمینه، محصولات با‌کیفیتی را روانه بازار کرده است. نوکیا 106 2023 یکی از همین گوشی‌های کلاسیک است. در نمای رو‌به‌رویی این گوشی به صفحه‌نمایش با ابعاد 1.8 اینچ و رزولوشن 120×160 پیکسل رنگی مجهز شده که آیکون‌های و اعلان‌ها را به‌خوبی نمایش می‌دهد. خبری از سنسور دوربین در قسمت پشتی و دوربین سلفی نیست که برای یک گوشی اقتصادی کلاسیک در این بازه قیمتی، کاملا طبیعی است. ابعاد مناسب سبب شده تا فضای چندانی را اشغال نکند و از طرفی وزن سبک 79.4 گرمی این گوشی در استفاده طولانی مدت، خستگی برای دست به‌همراه نخواهد داشت. باتری 1000 میلی‌آمپر‌ساعتی نوکیا 106 2023، همانند اکثر گوشی‌های کلاسیک، به ازای هر بار شارژ صد درصدی، زمان آماده به‌کار بسیار خوبی را ارائه می‌کند و دیگر نیاز به شارژ هر روز نخواهد داشت. پشتیبانی از حافظه جانبی هم فضای ذخیره سازی بیشتری را در اختیارتان قرار می‌دهد. در مجموع اگر به دنبال خرید گوشی اقتصادی هستید که قیمت به نسبت ارزان داشته باشد و در استفاده روزمره عملکرد خوبی را شاهد باشید، نوکیا 106 2023 می‌تواند یکی از بهترین گزینه‌های ممکن برای شما باشد.', 1, 4, 12, '<div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">مشخصات کلی</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مدل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Galaxy S24 Ultra</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">وزن</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">233 گرم</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">تعداد سیم کارت</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">2 عدد</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">ویژگی های خاص</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">\r\n                        <div class=\"mb-1\">مجهز به حسگر انگشت</div>\r\n                        <div>مقاوم در برابر آب</div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">حافظه</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">حافظه داخلی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">256 گیگابایت</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">مقدار رم</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">12 گیگابایت</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">دوربین</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">دوربین‌های پشت گوشی</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">4 ماژول دوربین</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن عکس</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">200 مگاپیکسل</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex mb-3\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">امکانات نرم افزاری</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">نسخه سیستم عامل</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">Android 14</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>\r\n        \r\n        <div class=\"w-full flex\">\r\n            <div class=\"w-1/3 pt-2 font-bold text-red-500 text-lg\">صفحه نمایش</div>\r\n            <div class=\"w-2/3\">\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">اندازه</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">6.8 اینچ</div>\r\n                </div>\r\n\r\n                <div class=\"w-full flex py-2\">\r\n                    <div class=\"w-1/2 text-gray-500\">رزولوشن صفحه نمایش</div>\r\n                    <div class=\"w-1/2 border-b py-2 font-semibold\">3120 x 1440</div>\r\n                </div>\r\n\r\n            </div>\r\n        </div>');

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
(1, 'پست پیشتاز'),
(2, 'تیپاکس'),
(3, 'چاپار'),
(4, 'باربری'),
(5, 'مراجعه حضوری');

-- --------------------------------------------------------

--
-- Table structure for table `safaresh`
--

CREATE TABLE `safaresh` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `address` text NOT NULL,
  `raveshersalid` int(11) NOT NULL,
  `statusid` int(11) NOT NULL,
  `date` date NOT NULL,
  `mablaq` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `safaresh`
--

INSERT INTO `safaresh` (`sid`, `uid`, `address`, `raveshersalid`, `statusid`, `date`, `mablaq`) VALUES
(1, 2, 'مازندران بابلسر رو به روی دهکده پارسیان منزل موسوی نژاد پلاک 479 تلفن 01132384061', 1, 1, '2024-06-16', '36500000');

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
(1, 'منتظر پرداخت'),
(2, 'پرداخت شده'),
(3, 'ارسال شده'),
(4, 'پایان یافته'),
(5, 'لغو شده');

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
(1, 'موبایل سامسونگ', 1),
(2, 'موبایل اپل', 1),
(3, 'موبایل شیائومی', 1),
(4, 'موبایل نوکیا', 1),
(5, 'لپتاپ لنوو', 3),
(6, 'لپتاپ ایسوز', 3),
(7, 'لپتاپ مک', 3),
(8, 'لپتاپ دل', 3),
(9, 'تبلت سامسونگ', 4),
(10, 'تبلت لنوو', 4),
(11, 'پلی استیشن 4', 5),
(12, 'پلی استیشن 5', 5),
(13, 'ایکس باکس', 5),
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
(3, 3, '#212121', 50, 62500000, 'مشکی'),
(4, 3, '#ffeb3b', 25, 62350000, 'زرد'),
(5, 3, '#9c27b1', 15, 63700000, 'بنفش'),
(6, 3, '#9e9e9e', 5, 62800000, 'خاکستری'),
(7, 1, '#2196f3', 3, 26200000, 'آبی'),
(8, 1, '#00e676', 12, 26350000, 'سبز'),
(9, 2, '#212121', 3, 47830000, 'مشکی'),
(10, 2, '#ffffff', 5, 46830000, 'سفید'),
(11, 2, '#ff80ab', 2, 47330000, 'صورتی'),
(12, 4, '#ddc987', 3, 48350000, 'گلبهی'),
(13, 4, '#e61d08', 3, 48150000, 'قرمز'),
(14, 5, '#e2e3de', 5, 61500000, 'نقره ای'),
(15, 5, '#455e6a', 12, 60600000, 'سرمه ای'),
(16, 6, '#212121', 120, 51900000, 'مشکی'),
(17, 7, '#ceaf06', 15, 6180000, 'طلایی'),
(18, 7, '#e61d08', 15, 6160000, 'قرمز'),
(19, 8, '#212121', 5, 1200000, 'مشکی');

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
(1, 1, 'تاخیر در تایید پرداخت', 'با سلام و خدا قوت با توجه به پرداختی که 3 روز پیش انجام دادم ولی هنوز سفارش در وضعیت در حال پرداخت قرار دارد.', '2024-06-19 15:38:14', 0),
(2, 1, 'پرداخت', 'من سفارش شماره 123645 را پرداخت کردم', '2024-06-19 20:14:05', 0),
(3, 2, 'سوال از پشتیبانی', 'dkwndkwd', '2024-06-20 12:47:10', 1),
(4, 2, 'سوال از پشتیبانی', ';kpkspwkw,w', '2024-06-20 12:51:54', 0),
(5, 2, 'سوال از پشتیبانی', 'با سلام عرض خسته نباشید خدمت تیم توسعه سایت آسترونیک\nخواستم بگم سایت مزخرفی دارید.', '2024-06-20 13:13:59', 0);

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
  `birthdate` varchar(50) NOT NULL,
  `cardnumber` varchar(16) DEFAULT NULL,
  `ismodir` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `phonenumber`, `password`, `username`, `email`, `firstname`, `lastname`, `nationalcode`, `birthdate`, `cardnumber`, `ismodir`) VALUES
(1, '09031538939', '$2b$12$ySWcjs9d2lqGFBM2JqNYRulREvoLvQBzNdSP1Bd5D27Mt7bd0saES', '', '', 'سید صادق', 'موسوی نژاد', '4980372147', '8/8/1381', '', 1),
(2, '09131131313', '$2b$12$e9sKYW/XZxSKWsY9nrCf9u.6/DgX1RVo7JdGDJeXWJUev.nu1Jt8G', '', 'alirezamoosapour7777@gmail.com', 'سید صادق', 'موسوی', '4980372185', '21/8/1382', '6037697569466985', 0);

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
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `raveshersals`
--
ALTER TABLE `raveshersals`
  MODIFY `raveshersalid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `statusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `scid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subproduct`
--
ALTER TABLE `subproduct`
  MODIFY `spid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
