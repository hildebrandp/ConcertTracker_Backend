-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 15, 2024 at 12:45 AM
-- Server version: 10.11.6-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concert_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `ConcertBands`
--

CREATE TABLE `ConcertBands` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL COMMENT 'The name of the band you have seen',
  `genre` text DEFAULT NULL COMMENT 'The music genre of the band (e.g., "Rock," "Pop," "Metal")',
  `origin_country` text DEFAULT NULL COMMENT 'The country the band is from',
  `rating` int(11) DEFAULT NULL COMMENT 'A rating for the band''s performance (e.g., a scale from 1 to 10)',
  `notes` text DEFAULT NULL COMMENT 'A text field for personal notes or memories about the performance',
  `link` text DEFAULT NULL COMMENT 'A link to the Band on Plex',
  `website` text DEFAULT NULL COMMENT 'Link to the bands website'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConcertEvents`
--

CREATE TABLE `ConcertEvents` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `datetime` datetime NOT NULL,
  `venue_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConcertParticipants`
--

CREATE TABLE `ConcertParticipants` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL COMMENT 'The full name of the participant',
  `notes` text DEFAULT NULL COMMENT 'A text field for additional information about the participant (optional)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConcertVenues`
--

CREATE TABLE `ConcertVenues` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL COMMENT 'The name of the venue (e.g., "Madison Square Garden")',
  `address` text DEFAULT NULL COMMENT 'The complete address of the venue',
  `city` text DEFAULT NULL COMMENT 'The city where the venue is located',
  `state` text DEFAULT NULL COMMENT 'The state or region of the venue',
  `country` text DEFAULT NULL COMMENT 'The country where the venue is located',
  `postal_code` int(11) DEFAULT NULL COMMENT 'The postal or ZIP code',
  `type` text DEFAULT NULL COMMENT 'The type of venue (e.g., "arena," "stadium," "theater")',
  `indoor_outdoor` text DEFAULT NULL COMMENT 'Indicates if the venue is indoor, outdoor, or mixed',
  `capacity` int(11) DEFAULT NULL COMMENT 'The seating or standing capacity of the venue',
  `website` text DEFAULT NULL COMMENT 'A URL for the venue''s official website',
  `notes` text DEFAULT NULL COMMENT 'Additional notes about the venue (optional)',
  `latitude` text DEFAULT NULL COMMENT 'Latitude coordinates for mapping purposes',
  `longitude` text DEFAULT NULL COMMENT 'Longitude coordinates for mapping purposes',
  `rating` int(11) DEFAULT NULL COMMENT 'Rating of the venue from 0 to 10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EventBands`
--

CREATE TABLE `EventBands` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `band_id` int(11) NOT NULL,
  `setlist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A text field for storing the setlist of songs performed (optional)',
  `rating` int(11) NOT NULL COMMENT 'A rating for the band''s performance (e.g., a scale from 1 to 10)',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EventParticipants`
--

CREATE TABLE `EventParticipants` (
  `id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ConcertBands`
--
ALTER TABLE `ConcertBands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ConcertEvents`
--
ALTER TABLE `ConcertEvents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ConcertParticipants`
--
ALTER TABLE `ConcertParticipants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ConcertVenues`
--
ALTER TABLE `ConcertVenues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `EventBands`
--
ALTER TABLE `EventBands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `EventParticipants`
--
ALTER TABLE `EventParticipants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ConcertBands`
--
ALTER TABLE `ConcertBands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConcertEvents`
--
ALTER TABLE `ConcertEvents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConcertParticipants`
--
ALTER TABLE `ConcertParticipants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ConcertVenues`
--
ALTER TABLE `ConcertVenues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EventBands`
--
ALTER TABLE `EventBands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EventParticipants`
--
ALTER TABLE `EventParticipants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
