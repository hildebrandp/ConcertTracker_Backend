-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Jan 2026 um 18:20
-- Server-Version: 10.11.11-MariaDB
-- PHP-Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `concert_tracker`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConcertBands`
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

--
-- Daten für Tabelle `ConcertBands`
--

INSERT INTO `ConcertBands` (`id`, `name`, `genre`, `origin_country`, `rating`, `notes`, `link`, `website`) VALUES
(1, 'Solstafir', 'Metal', 'Iceland', 9, NULL, NULL, 'https://solstafir.is/'),
(2, 'Knasterbart', 'Rock', 'Germany', 9, NULL, NULL, 'https://www.knasterbart.de/'),
(6, 'Best Band Ever', '', '', 0, '', '', ''),
(7, 'Krasse Band', '', '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConcertEvents`
--

CREATE TABLE `ConcertEvents` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `datetime` datetime NOT NULL,
  `venue_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Daten für Tabelle `ConcertEvents`
--

INSERT INTO `ConcertEvents` (`id`, `name`, `datetime`, `venue_id`, `rating`, `notes`) VALUES
(1, 'Solstafir', '2024-12-05 19:00:00', 1, 8, NULL),
(2, 'Brantweihnachten', '2025-12-20 19:00:00', 1, 8, ''),
(3, 'Brantweihnachten', '2025-12-20 19:00:00', 1, 8, ''),
(4, 'foobar', '2026-01-09 19:00:00', 1, 0, ''),
(5, 'foobar', '2026-01-09 19:00:00', 1, 0, ''),
(6, 'blabla', '2026-01-08 19:00:00', 1, 6, ''),
(7, 'Ballern', '2026-01-10 19:00:00', 1, 10, ''),
(8, 'Ballern 2.0', '2026-01-10 19:00:00', 13, 4, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConcertParticipants`
--

CREATE TABLE `ConcertParticipants` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL COMMENT 'The full name of the participant',
  `notes` text DEFAULT NULL COMMENT 'A text field for additional information about the participant (optional)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConcertVenues`
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

--
-- Daten für Tabelle `ConcertVenues`
--

INSERT INTO `ConcertVenues` (`id`, `name`, `address`, `city`, `state`, `country`, `postal_code`, `type`, `indoor_outdoor`, `capacity`, `website`, `notes`, `latitude`, `longitude`, `rating`) VALUES
(1, 'Technikum', 'Speicherstraße 26', 'Munich', 'Bavaria', 'Germany', 81671, '', 'indoor', 757, 'https://www.eventfabrik-muenchen.de/technikum/#', 'Good accoustic', '48.123505', '11.606600', 6),
(2, 'Backstage Club', 'Reitknechtstraße 6', 'Munich', 'Bavaria', 'Germany', 80639, 'Club', 'indoor', 200, 'https://backstage.eu/', '', '48.144925', '11.521989', 7),
(12, 'Backstage Werk', 'Reitknechtstraße 6', 'Munich', 'Bavaria', 'Germany', 80639, 'Club', 'indoor', 1500, 'https://backstage.eu/', '', '48.144925', '11.521989', 7),
(13, 'Backstage-Werk', '', '', '', '', 0, 'Club', 'indoor', 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EventBands`
--

CREATE TABLE `EventBands` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `band_id` int(11) NOT NULL,
  `setlist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A text field for storing the setlist of songs performed (optional)',
  `rating` int(11) DEFAULT NULL COMMENT 'A rating for the band''s performance (e.g., a scale from 1 to 10)',
  `mainAct` tinyint(1) NOT NULL DEFAULT 0,
  `runningOrder` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Daten für Tabelle `EventBands`
--

INSERT INTO `EventBands` (`id`, `event_id`, `band_id`, `setlist`, `rating`, `mainAct`, `runningOrder`, `notes`) VALUES
(1, 1, 1, NULL, 9, 0, 0, NULL),
(3, 5, 6, NULL, NULL, 0, 0, NULL),
(4, 6, 7, NULL, NULL, 0, 0, NULL),
(5, 7, 2, NULL, NULL, 0, 0, NULL),
(6, 8, 2, NULL, NULL, 0, 0, NULL),
(7, 8, 1, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EventParticipants`
--

CREATE TABLE `EventParticipants` (
  `id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ConcertBands`
--
ALTER TABLE `ConcertBands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `ConcertEvents`
--
ALTER TABLE `ConcertEvents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `ConcertParticipants`
--
ALTER TABLE `ConcertParticipants`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ConcertVenues`
--
ALTER TABLE `ConcertVenues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`);

--
-- Indizes für die Tabelle `EventBands`
--
ALTER TABLE `EventBands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `EventParticipants`
--
ALTER TABLE `EventParticipants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ConcertBands`
--
ALTER TABLE `ConcertBands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `ConcertEvents`
--
ALTER TABLE `ConcertEvents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `ConcertParticipants`
--
ALTER TABLE `ConcertParticipants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ConcertVenues`
--
ALTER TABLE `ConcertVenues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `EventBands`
--
ALTER TABLE `EventBands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `EventParticipants`
--
ALTER TABLE `EventParticipants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
