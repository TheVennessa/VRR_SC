-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 07 Eyl 2023, 22:18:03
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `altislife`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deactivateTempGangs` ()  BEGIN
	UPDATE `gangs` SET `active`= 0 WHERE `type`='0';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles` ()  BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldContainers` ()  BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs` ()  BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses` ()  BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldWanted` ()  BEGIN
  DELETE FROM `wanted` WHERE `active` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles` ()  BEGIN
  UPDATE `vehicles` SET `active`= 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bourse`
--

CREATE TABLE `bourse` (
  `id` int(11) NOT NULL,
  `itemName` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `containers`
--

CREATE TABLE `containers` (
  `id` int(6) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `copihbar`
--

CREATE TABLE `copihbar` (
  `id` int(6) NOT NULL,
  `fromID` varchar(17) NOT NULL,
  `toID` varchar(17) NOT NULL,
  `message` varchar(100) NOT NULL,
  `fromName` varchar(35) NOT NULL,
  `toName` varchar(35) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gangs`
--

CREATE TABLE `gangs` (
  `id` int(6) NOT NULL,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `bank` int(100) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level` int(2) NOT NULL DEFAULT '1',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hq` int(11) NOT NULL DEFAULT '-1',
  `hq_upgrades` text NOT NULL,
  `permission` text NOT NULL,
  `tax` int(100) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `perm_int` int(11) NOT NULL DEFAULT '1',
  `tax_sum` int(11) NOT NULL DEFAULT '0',
  `hq_garage` varchar(100) NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gang_info`
--

CREATE TABLE `gang_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gearloadouts`
--

CREATE TABLE `gearloadouts` (
  `id` int(11) NOT NULL,
  `pid` varchar(30) NOT NULL DEFAULT '0',
  `side` varchar(30) NOT NULL DEFAULT '0',
  `gearname` varchar(128) NOT NULL DEFAULT '0',
  `gearitems` longtext NOT NULL,
  `yitems` longtext NOT NULL,
  `tmp` int(2) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `houses`
--

CREATE TABLE `houses` (
  `id` int(6) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lisans`
--

CREATE TABLE `lisans` (
  `id` int(11) NOT NULL,
  `serialKey` varchar(50) NOT NULL,
  `activated` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lisanstime`
--

CREATE TABLE `lisanstime` (
  `ID` int(11) NOT NULL,
  `aktiflik` text NOT NULL,
  `isim` text NOT NULL,
  `tarih` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log`
--

CREATE TABLE `log` (
  `logid` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(64) DEFAULT NULL,
  `action` varchar(900) DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medihbar`
--

CREATE TABLE `medihbar` (
  `id` int(6) NOT NULL,
  `fromID` varchar(17) NOT NULL,
  `toID` varchar(17) NOT NULL,
  `message` varchar(100) NOT NULL,
  `fromName` varchar(35) NOT NULL,
  `toName` varchar(35) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(6) NOT NULL,
  `fromID` varchar(17) NOT NULL,
  `toID` varchar(17) NOT NULL,
  `message` varchar(100) NOT NULL,
  `fromName` varchar(35) NOT NULL,
  `toName` varchar(35) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL COMMENT 'auto incrementing note_id of each user, unique index',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note_text` varchar(255) NOT NULL,
  `warning` enum('1','2','3','4') NOT NULL,
  `note_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `players`
--

CREATE TABLE `players` (
  `uid` int(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `pid` varchar(17) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `civ_alive` tinyint(1) NOT NULL DEFAULT '0',
  `civ_position` varchar(64) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dn_bitis_suresi` date DEFAULT NULL,
  `gang_id` int(11) NOT NULL DEFAULT '-1',
  `gang_perm_id` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `update_app`
--

CREATE TABLE `update_app` (
  `id` int(11) NOT NULL,
  `versiyon` varchar(255) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `file_names` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `ID` mediumint(9) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(80) NOT NULL,
  `adminlvl` text NOT NULL,
  `kbilirlik` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(6) NOT NULL,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tuning_data` varchar(300) NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wanted`
--

CREATE TABLE `wanted` (
  `wantedID` varchar(64) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bourse`
--
ALTER TABLE `bourse`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `containers`
--
ALTER TABLE `containers`
  ADD PRIMARY KEY (`id`,`pid`);

--
-- Tablo için indeksler `copihbar`
--
ALTER TABLE `copihbar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`id`) USING BTREE;

--
-- Tablo için indeksler `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `gang_info`
--
ALTER TABLE `gang_info`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `gearloadouts`
--
ALTER TABLE `gearloadouts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`,`pid`);

--
-- Tablo için indeksler `lisans`
--
ALTER TABLE `lisans`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `lisanstime`
--
ALTER TABLE `lisanstime`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`logid`),
  ADD UNIQUE KEY `logid` (`logid`),
  ADD KEY `logid_2` (`logid`);

--
-- Tablo için indeksler `medihbar`
--
ALTER TABLE `medihbar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`id`) USING BTREE;

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`id`) USING BTREE;

--
-- Tablo için indeksler `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD UNIQUE KEY `note_id` (`note_id`);

--
-- Tablo için indeksler `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `name` (`name`),
  ADD KEY `blacklist` (`blacklist`);

--
-- Tablo için indeksler `update_app`
--
ALTER TABLE `update_app`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `side` (`side`),
  ADD KEY `pid` (`pid`),
  ADD KEY `type` (`type`);

--
-- Tablo için indeksler `wanted`
--
ALTER TABLE `wanted`
  ADD PRIMARY KEY (`wantedID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bourse`
--
ALTER TABLE `bourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `containers`
--
ALTER TABLE `containers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `copihbar`
--
ALTER TABLE `copihbar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `gangs`
--
ALTER TABLE `gangs`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `gang_info`
--
ALTER TABLE `gang_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `gearloadouts`
--
ALTER TABLE `gearloadouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `log`
--
ALTER TABLE `log`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `medihbar`
--
ALTER TABLE `medihbar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing note_id of each user, unique index';

--
-- Tablo için AUTO_INCREMENT değeri `players`
--
ALTER TABLE `players`
  MODIFY `uid` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `update_app`
--
ALTER TABLE `update_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
