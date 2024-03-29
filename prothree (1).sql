-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 03:09 PM
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
-- Database: `prothree`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `Act_id` int(11) NOT NULL,
  `Act_Name` varchar(25) NOT NULL,
  `Act_Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Act_id`, `Act_Name`, `Act_Gender`) VALUES
(100, 'Sudeep', 'M'),
(101, 'Darshan', 'M'),
(102, 'Anushka', 'F'),
(103, 'Punith', 'M'),
(104, 'Katrina', 'F'),
(105, 'Surya', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Dir_id` int(11) NOT NULL,
  `Dir_Name` varchar(25) NOT NULL,
  `Dir_Phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Dir_id`, `Dir_Name`, `Dir_Phone`) VALUES
(1000, 'Jajmouli', '9164922644'),
(1001, 'Steven', '9164024255'),
(1002, 'Hitchcock', '9164024210'),
(1003, 'Munirathna', '9164000000'),
(1004, 'Ramesh', '9164000022');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `Mov_id` int(11) NOT NULL,
  `Mov_Title` varchar(50) NOT NULL,
  `Mov_Year` year(4) NOT NULL,
  `Mov_Lang` varchar(15) NOT NULL,
  `Dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Mov_id`, `Mov_Title`, `Mov_Year`, `Mov_Lang`, `Dir_id`) VALUES
(20, 'Bahubali-1', '2015', 'Telagu', 1000),
(21, 'Bahubali-2', '2018', 'Telagu', 1000),
(22, 'Raj', '2018', 'Kannada', 1001),
(23, 'warhouse', '2010', 'English', 1002),
(24, 'Bhimrav', '1999', 'Telagu', 1000),
(25, 'kantara', '1988', 'Kannada', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `Act_id` int(11) NOT NULL,
  `Mov_id` int(11) NOT NULL,
  `Role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`Act_id`, `Mov_id`, `Role`) VALUES
(100, 22, 'Hero'),
(101, 20, 'Heroien'),
(101, 21, 'Heroien'),
(102, 22, 'Hero'),
(105, 23, 'Hero');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Mov_id` int(11) DEFAULT NULL,
  `Rev_Stars` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Mov_id`, `Rev_Stars`) VALUES
(20, 4),
(20, 3),
(20, 5),
(21, 5),
(21, 3),
(21, 2),
(22, 5),
(22, 5),
(22, 5),
(23, 4),
(23, 2),
(23, 5),
(23, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`Act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Dir_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Mov_id`),
  ADD KEY `Dir_id` (`Dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`Act_id`,`Mov_id`),
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`Dir_id`) REFERENCES `director` (`Dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`Act_id`) REFERENCES `actor` (`Act_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`Mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`Mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
