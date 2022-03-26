-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2022 at 05:20 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be15cr11_petadoption_ivanmaksimov`
--
CREATE DATABASE IF NOT EXISTS `be15cr11_petadoption_ivanmaksimov` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be15cr11_petadoption_ivanmaksimov`;

-- --------------------------------------------------------

--
-- Table structure for table `adoptions`
--

CREATE TABLE `adoptions` (
  `adpt_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_anim_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adoptions`
--

INSERT INTO `adoptions` (`adpt_id`, `date`, `fk_user_id`, `fk_anim_id`) VALUES
(19, '2022-03-17', 14, 7),
(20, '2022-03-08', 10, 15),
(21, '2022-03-30', 11, 5),
(22, '2022-03-18', 12, 11),
(23, '2022-03-09', 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `anim_id` int(11) NOT NULL,
  `kind` varchar(30) NOT NULL,
  `breed` varchar(30) NOT NULL,
  `sex` varchar(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `size` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `location` varchar(60) NOT NULL,
  `picture` varchar(60) NOT NULL,
  `descript` text NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`anim_id`, `kind`, `breed`, `sex`, `name`, `size`, `age`, `location`, `picture`, `descript`, `status`) VALUES
(1, 'Snake', 'Vipers', 'Female', 'Urfel', 'Medium', 21, 'Lerchenfelder Straße 31 2486 LANDEGG', '623e33e210f1e.jpg', 'Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales.', 'Available'),
(2, 'Cat', 'Cornish Rex', 'Male', 'Tobi', 'Small', 16, 'Lerchenfelder Straße 31 2486 LANDEGG', '623e335d39b0a.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Available'),
(3, 'Dog', 'Golden Retriver', 'Female', 'Lisa', 'Medium', 3, 'Frauentaler Strasse 93 5760 LENZING', '623df7290e4e8.jpg', 'Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick. Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans.', 'Available'),
(4, 'Dog', 'Border Collie', 'Male', 'Back', 'Medium', 4, 'Davidschlag 11 5133 BIERBERG', '623df7cdbbc16.jpg', 'Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick. Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans.', 'Adopted'),
(5, 'Cat', 'Bengal Cat', 'Female', 'Silke', 'Medium', 9, 'Rossmarkt 65 3425 LANGENLEBARN-UNTERAIGEN', '623e1cec1f7f8.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Adopted'),
(6, 'Cat', 'Munichin cat', 'Male', 'Jan', 'Medium', 6, 'Kirchenplatz 9 8332 AUERSBACH', '623e24e55dcfd.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Available'),
(7, 'Dog', 'Britany', 'Male', 'Klaus', 'Medium', 4, 'Schachterlweg 17 8341 PÖLLAU', '623dfb39bea2b.jpg', 'Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick. Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans.', 'Adopted'),
(8, 'Chameleon', 'Veiled Chameleon.', 'Female', 'Karolin', 'Small', 12, 'Horner Strasse 36 9150 RUTTACH', '623e24f6a0ee0.jpg', 'There are over 200 different species of chameleons worldwide, but only a handful of these are commonly kept as pets. Chameleons make unique and beautiful pets, but many require special care and attention in order to be happy and healthy.', 'Available'),
(9, 'Horse', 'Friesian horse', 'Female', 'Leonie', 'Big', 14, 'Grazer Bundesstrasse 15 9122 SCHRECKENDORF', '623e250b160d7.jpg', 'The horse is a domesticated, odd-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.', 'Available'),
(10, 'Dog', 'Siberian Husky', 'Male', 'Bernd', 'Medium', 1, 'Gasteiner Strasse 67 8670 FRESSNITZGRABEN', '623dfd87d9121.jpg', 'Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick. Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans.', 'Available'),
(11, 'Snake', 'Cobra', 'Male', 'Schwab', 'Medium', 25, 'Ziegelgasse 2 8511 GRUBBERG', '623e261b9d894.jpg', 'Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales.', 'Adopted'),
(12, 'Cow', 'Simmental cattle', 'Female', 'Birgit', 'Big', 9, 'Lendplatz 62 4926 HATTING', '623e269ba4b14.jpg', 'Cattle are large, domesticated, cloven-hooved herbivores. They are a prominent modern member of the subfamily Bovinae and the most widespread species of the genus Bos. Adult females are referred to as cows and adult males are referred to as bulls.', 'Available'),
(13, 'Cat', 'Scottish Fold', 'Female', 'Markus', 'Small', 2, 'Favoritenstrasse 1 4251 KÖNIGSAU', '623e270f86f43.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Available'),
(14, 'Rabbit', 'Desert cottontail', 'Female', 'Marie', 'Small', 6, 'Wiener Strasse 74 2024 MAILBERG', '623e28fb8318a.jpg', 'Cattle are large, domesticated, cloven-hooved herbivores. They are a prominent modern member of the subfamily Bovinae and the most widespread species of the genus Bos. Adult females are referred to as cows and adult males are referred to as bulls.', 'Available'),
(15, 'Dog', 'Bedlington', 'Male', 'Wern', 'Medium', 14, 'Ruster Strasse 37 4624 PARZHAM', '623e30c2bce25.jpg', 'Dogs have four legs and make a ', 'Adopted'),
(16, 'Chameleon', 'Pygmy Chameleon', 'Male', 'Prop', 'Small', 11, 'Pachergasse 69 4656 DANZLAU', '623e2a39421e6.jpg', 'There are over 200 different species of chameleons worldwide, but only a handful of these are commonly kept as pets. Chameleons make unique and beautiful pets, but many require special care and attention in order to be happy and healthy.', 'Available'),
(17, 'Cat', 'Turkish Angora', 'Female', 'Christine', 'Small', 17, 'Straden 92 3932 ULLRICHS', '623e2acea8ce9.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Available'),
(18, 'Horse', 'American Quarter ', 'Male', 'Fuerst', 'Big', 5, 'Spiegelsberg 39 2143 ALTHÖFLEIN', '623e2b42761f6.jpg', 'The horse is a domesticated, odd-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.', 'Available'),
(19, 'Snake', 'Ninia', 'Female', 'Juliane', 'Small', 18, 'Ziegelgasse 81 4673 GRUB', '623e2fce7eedc.jpg', 'Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes. Like all other squamates, snakes are ectothermic, amniote vertebrates covered in overlapping scales.', 'Available'),
(20, 'Lizard', 'Agama', 'Male', 'Drech', 'Small', 16, 'Hauptstrasse 27 4725 PRÜNST', '623e3066ad0ca.jpg', 'Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica, as well as most oceanic island', 'Available'),
(21, 'Dog', 'French Buldog', 'Female', 'Uta', 'Medium', 7, 'Archkogl 75 3041 ASPERHOFEN', '623e314703ab7.jpg', 'Dogs have four legs and make a \"bark,\" \"woof,\" or \"arf\" sound. Dogs often chase cats, and most dogs will fetch a ball or stick. Dogs can smell and hear better than humans, but cannot see well in color because they are color blind. Due to the anatomy of the eye, dogs can see better in dim light than humans.', 'Available'),
(22, 'Goat', 'Saanen Goat', 'Female', 'Juli', 'Medium', 3, 'Kornstrasse 76 6500 NIEDERGALLMIGG', '623e31d350b5e.jpg', 'The goat is a domesticated species of goat-antelope typically kept as livestock. It was domesticated from the wild goat of Southwest Asia and Eastern Europe. The goat is a member of the animal family Bovidae and the tribe Caprini, meaning it is closely related to the sheep. There are over 300 distinct breeds of goat.', 'Available'),
(23, 'Cat', 'Snowshoe cat', 'Female', 'Lia', 'Small', 4, 'Stadtplatz 67 3242 RAMSAU', '623e326d0b6d3.jpg', 'he cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the', 'Available'),
(24, 'Rabbit', 'European rabbit', 'Female', 'Kristin', 'Small', 10, 'Ditscheinergasse 80 4656 IN DER AU', '623e32f820b1d.jpg', 'Male rabbits are called bucks; females are called does. An older term for an adult rabbit used until the 18th century is coney (derived ultimately from the Latin cuniculus), while rabbit once referred only to the young animals.', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_date` date NOT NULL,
  `picture` varchar(60) NOT NULL,
  `status` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `f_name`, `l_name`, `birth_date`, `address`, `city`, `country`, `phone`, `email`, `password`, `reg_date`, `picture`, `status`) VALUES
(6, 'Ivan', 'Maksimov', '2022-03-02', 'Raffaelgasse', 'Wien', 'Austria', 2147483647, 'ivan_kratovo@hotmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-03-25', 'avatar.png', 'adm'),
(8, 'Andrea', 'Gruenewald', '2021-11-01', 'Baumgarten 95', 'NIEDERKRAML', 'Austria', 25412545, 'one@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-03-26', '623f0ae86176d.png', 'adm'),
(9, 'Vanessa', 'Keller', '2021-11-04', 'Baumgarten 2', 'Linz', 'Austria', 65412545, 'teo@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-03-26', '623f0b52c118b.png', 'user'),
(10, 'Leon', 'Fischer', '2021-11-01', 'Baumbachstrasse 12', 'WILHERSDORF', 'Austria', 65445545, 'three@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-04-05', '623f0bbea580a.jpg', 'user'),
(11, 'Benjamin', 'Keller', '2021-11-04', 'Kärntner Strasse 11', 'HASLAU', 'Austria', 62232545, 'four@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-04-27', '623f0c0eb4157.png', 'user'),
(12, 'Sara', 'Mayer', '2016-02-02', 'Hausergasse 90', 'WUGGITZ', 'Austria', 62234588, 'five@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-04-15', '623f0c5c39783.png', 'user'),
(13, 'Marco', 'Braun', '2015-09-02', 'Kornstrasse 76', 'NEUSTADTL-UMGEBUNG', 'Austria', 62554588, 'six@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-04-03', '623f0cb285bdd.jpg', 'user'),
(14, 'Marco', 'Gerber', '2014-10-15', 'Grüne Lagune 98', 'STREIMBERG', 'Austria', 62554587, 'seven@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-02-10', '623f0cf476490.jpg', 'user'),
(15, 'Wolfgang', 'Mayer', '2013-11-06', 'Ziegelgasse 21', 'GRUBING', 'Austria', 62458794, 'eight@mail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2022-01-07', '623f0d4fefd70.jpg', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`adpt_id`),
  ADD UNIQUE KEY `fk_anim_id` (`fk_anim_id`) USING BTREE,
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`anim_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `adpt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `anim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `adoptions_ibfk_2` FOREIGN KEY (`fk_anim_id`) REFERENCES `animals` (`anim_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
