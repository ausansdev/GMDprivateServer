-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2025 at 06:44 PM
-- Server version: 10.11.6-MariaDB-0+deb12u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `template_empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `acccomments`
--

CREATE TABLE IF NOT EXISTS `acccomments` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `comment` longtext NOT NULL,
  `secret` varchar(10) NOT NULL DEFAULT 'unused',
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `isSpam` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`commentID`),
  KEY `userID` (`userID`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gjp2` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `accountID` int(11) NOT NULL,
  `isAdmin` int(11) NOT NULL DEFAULT 0,
  `mS` int(11) NOT NULL DEFAULT 0,
  `frS` int(11) NOT NULL DEFAULT 0,
  `cS` int(11) NOT NULL DEFAULT 0,
  `youtubeurl` varchar(255) NOT NULL DEFAULT '',
  `twitter` varchar(255) NOT NULL DEFAULT '',
  `twitch` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(255) NOT NULL DEFAULT '',
  `registerDate` int(11) NOT NULL DEFAULT 0,
  `friendsCount` int(11) NOT NULL DEFAULT 0,
  `discordID` bigint(20) NOT NULL DEFAULT 0,
  `discordLinkReq` bigint(20) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `userName` (`userName`),
  KEY `isAdmin` (`isAdmin`),
  KEY `frS` (`frS`),
  KEY `discordID` (`discordID`),
  KEY `discordLinkReq` (`discordLinkReq`),
  KEY `friendsCount` (`friendsCount`),
  KEY `isActive` (`isActive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `value2` varchar(255) NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT 0,
  `value4` int(11) NOT NULL DEFAULT 0,
  `value5` int(11) NOT NULL DEFAULT 0,
  `value6` int(11) NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `IP` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  PRIMARY KEY (`ID`),
  KEY `type` (`type`),
  KEY `value` (`value`),
  KEY `value2` (`value2`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actions_downloads`
--

CREATE TABLE IF NOT EXISTS `actions_downloads` (
  `id` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `levelID` (`levelID`,`ip`,`uploadDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actions_likes`
--

CREATE TABLE IF NOT EXISTS `actions_likes` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `isLike` tinyint(4) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `levelID` (`itemID`,`type`,`isLike`,`ip`,`uploadDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bannedips`
--

CREATE TABLE IF NOT EXISTS `bannedips` (
  `IP` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `ID` int(11) NOT NULL,
  `person1` int(11) NOT NULL,
  `person2` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `person1` (`person1`),
  KEY `person2` (`person2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `comment` longtext NOT NULL,
  `secret` varchar(10) NOT NULL DEFAULT 'none',
  `levelID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `percent` int(11) NOT NULL DEFAULT 0,
  `isSpam` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`commentID`),
  KEY `levelID` (`levelID`),
  KEY `userID` (`userID`),
  KEY `likes` (`likes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cpshares`
--

CREATE TABLE IF NOT EXISTS `cpshares` (
  `shareID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`shareID`),
  KEY `levelID` (`levelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dailyfeatures`
--

CREATE TABLE IF NOT EXISTS `dailyfeatures` (
  `feaID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friendreqs`
--

CREATE TABLE IF NOT EXISTS `friendreqs` (
  `accountID` int(11) NOT NULL,
  `toAccountID` int(11) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `isNew` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE IF NOT EXISTS `friendships` (
  `ID` int(11) NOT NULL,
  `person1` int(11) NOT NULL,
  `person2` int(11) NOT NULL,
  `isNew1` int(11) NOT NULL,
  `isNew2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gauntlets`
--

CREATE TABLE IF NOT EXISTS `gauntlets` (
  `ID` int(11) NOT NULL,
  `level1` int(11) NOT NULL,
  `level2` int(11) NOT NULL,
  `level3` int(11) NOT NULL,
  `level4` int(11) NOT NULL,
  `level5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `gameVersion` int(11) NOT NULL,
  `binaryVersion` int(11) NOT NULL DEFAULT 0,
  `userName` mediumtext NOT NULL,
  `levelID` int(11) NOT NULL,
  `levelName` varchar(255) NOT NULL,
  `levelDesc` mediumtext NOT NULL,
  `levelVersion` int(11) NOT NULL,
  `levelLength` int(11) NOT NULL DEFAULT 0,
  `audioTrack` int(11) NOT NULL,
  `auto` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `original` int(11) NOT NULL,
  `twoPlayer` int(11) NOT NULL DEFAULT 0,
  `songID` int(11) NOT NULL DEFAULT 0,
  `songIDs` varchar(2048) DEFAULT '',
  `sfxIDs` varchar(2048) DEFAULT '',
  `objects` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `requestedStars` int(11) NOT NULL DEFAULT 0,
  `extraString` mediumtext NOT NULL,
  `levelString` longtext DEFAULT NULL,
  `levelInfo` mediumtext NOT NULL,
  `secret` mediumtext NOT NULL,
  `starDifficulty` int(11) NOT NULL DEFAULT 0 COMMENT '0=N/A 10=EASY 20=NORMAL 30=HARD 40=HARDER 50=INSANE 50=AUTO 50=DEMON',
  `downloads` int(11) NOT NULL DEFAULT 300,
  `likes` int(11) NOT NULL DEFAULT 100,
  `starDemon` int(1) NOT NULL DEFAULT 0,
  `starAuto` tinyint(4) NOT NULL DEFAULT 0,
  `starStars` int(11) NOT NULL DEFAULT 0,
  `uploadDate` bigint(20) NOT NULL,
  `updateDate` bigint(20) NOT NULL,
  `rateDate` bigint(20) NOT NULL DEFAULT 0,
  `starCoins` int(11) NOT NULL DEFAULT 0,
  `starFeatured` int(11) NOT NULL DEFAULT 0,
  `starHall` int(11) NOT NULL DEFAULT 0,
  `starEpic` int(11) NOT NULL DEFAULT 0,
  `starDemonDiff` int(11) NOT NULL DEFAULT 0,
  `userID` int(11) NOT NULL,
  `extID` varchar(255) NOT NULL,
  `unlisted` int(11) NOT NULL,
  `originalReup` int(11) NOT NULL DEFAULT 0 COMMENT 'used for levelReupload.php',
  `hostname` varchar(255) NOT NULL,
  `isCPShared` int(11) NOT NULL DEFAULT 0,
  `isDeleted` int(11) NOT NULL DEFAULT 0,
  `isLDM` int(11) NOT NULL DEFAULT 0,
  `unlisted2` int(11) NOT NULL DEFAULT 0,
  `wt` int(11) NOT NULL DEFAULT 0,
  `wt2` int(11) NOT NULL DEFAULT 0,
  `ts` int(11) NOT NULL DEFAULT 0,
  `settingsString` mediumtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levelscores`
--

CREATE TABLE IF NOT EXISTS `levelscores` (
  `scoreID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `progresses` text NOT NULL,
  `dailyID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `ID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `targetAccountID` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `targetUserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE IF NOT EXISTS `lists` (
  `listID` int(11) NOT NULL,
  `listName` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `listDesc` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `listVersion` int(11) NOT NULL DEFAULT 1,
  `accountID` int(11) NOT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `starDifficulty` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `starFeatured` int(11) NOT NULL DEFAULT 0,
  `starStars` int(11) NOT NULL DEFAULT 0,
  `listlevels` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `countForReward` int(11) NOT NULL DEFAULT 0,
  `uploadDate` int(11) NOT NULL DEFAULT 0,
  `updateDate` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `unlisted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mappacks`
--

CREATE TABLE IF NOT EXISTS `mappacks` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `levels` varchar(512) NOT NULL COMMENT 'entered as "ID of level 1, ID of level 2, ID of level 3" for example "13,14,15" (without the "s)',
  `stars` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `rgbcolors` varchar(11) NOT NULL COMMENT 'entered as R,G,B',
  `colors2` varchar(11) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `subject` longtext NOT NULL,
  `accID` int(11) NOT NULL,
  `messageID` int(11) NOT NULL,
  `toAccountID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `secret` varchar(25) NOT NULL DEFAULT 'unused',
  `isNew` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modactions`
--

CREATE TABLE IF NOT EXISTS `modactions` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `value2` varchar(255) NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT 0,
  `value4` varchar(255) NOT NULL DEFAULT '0',
  `value5` int(11) NOT NULL DEFAULT 0,
  `value6` int(11) NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `value7` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modipperms`
--

CREATE TABLE IF NOT EXISTS `modipperms` (
  `categoryID` int(11) NOT NULL,
  `actionFreeCopy` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modips`
--

CREATE TABLE IF NOT EXISTS `modips` (
  `ID` int(11) NOT NULL,
  `IP` varchar(69) NOT NULL,
  `isMod` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `modipCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `platscores`
--

CREATE TABLE IF NOT EXISTS `platscores` (
  `ID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL DEFAULT 0,
  `levelID` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE IF NOT EXISTS `quests` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `levelID` int(11) NOT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roleassign`
--

CREATE TABLE IF NOT EXISTS `roleassign` (
  `assignID` bigint(20) NOT NULL,
  `roleID` bigint(20) NOT NULL,
  `accountID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `roleID` bigint(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `roleName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `commandRate` int(11) NOT NULL DEFAULT 0,
  `commandFeature` int(11) NOT NULL DEFAULT 0,
  `commandEpic` int(11) NOT NULL DEFAULT 0,
  `commandUnepic` int(11) NOT NULL DEFAULT 0,
  `commandVerifycoins` int(11) NOT NULL DEFAULT 0,
  `commandDaily` int(11) NOT NULL DEFAULT 0,
  `commandWeekly` int(11) NOT NULL DEFAULT 0,
  `commandDelete` int(11) NOT NULL DEFAULT 0,
  `commandSetacc` int(11) NOT NULL DEFAULT 0,
  `commandRenameOwn` int(11) NOT NULL DEFAULT 1,
  `commandRenameAll` int(11) NOT NULL DEFAULT 0,
  `commandPassOwn` int(11) NOT NULL DEFAULT 1,
  `commandPassAll` int(11) NOT NULL DEFAULT 0,
  `commandDescriptionOwn` int(11) NOT NULL DEFAULT 1,
  `commandDescriptionAll` int(11) NOT NULL DEFAULT 0,
  `commandPublicOwn` int(11) NOT NULL DEFAULT 1,
  `commandPublicAll` int(11) NOT NULL DEFAULT 0,
  `commandUnlistOwn` int(11) NOT NULL DEFAULT 1,
  `commandUnlistAll` int(11) NOT NULL DEFAULT 0,
  `commandSharecpOwn` int(11) NOT NULL DEFAULT 1,
  `commandSharecpAll` int(11) NOT NULL DEFAULT 0,
  `commandSongOwn` int(11) NOT NULL DEFAULT 1,
  `commandSongAll` int(11) NOT NULL DEFAULT 0,
  `profilecommandDiscord` int(11) NOT NULL DEFAULT 1,
  `actionRateDemon` int(11) NOT NULL DEFAULT 0,
  `actionRateStars` int(11) NOT NULL DEFAULT 0,
  `actionRateDifficulty` int(11) NOT NULL DEFAULT 0,
  `actionRequestMod` int(11) NOT NULL DEFAULT 0,
  `actionSuggestRating` int(11) NOT NULL DEFAULT 0,
  `actionDeleteComment` int(11) NOT NULL DEFAULT 0,
  `toolLeaderboardsban` int(11) NOT NULL DEFAULT 0,
  `toolPackcreate` int(11) NOT NULL DEFAULT 0,
  `toolQuestsCreate` int(11) NOT NULL DEFAULT 0,
  `toolModactions` int(11) NOT NULL DEFAULT 0,
  `toolSuggestlist` int(11) NOT NULL DEFAULT 0,
  `dashboardModTools` int(11) NOT NULL DEFAULT 0,
  `modipCategory` int(11) NOT NULL DEFAULT 0,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `commentColor` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '000,000,000',
  `modBadgeLevel` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `authorID` int(11) NOT NULL,
  `authorName` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `download` varchar(1337) NOT NULL,
  `hash` varchar(256) NOT NULL DEFAULT '',
  `isDisabled` int(11) NOT NULL DEFAULT 0,
  `levelsCount` int(11) NOT NULL DEFAULT 0,
  `reuploadTime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggest`
--

CREATE TABLE IF NOT EXISTS `suggest` (
  `ID` int(11) NOT NULL,
  `suggestBy` int(11) NOT NULL DEFAULT 0,
  `suggestLevelId` int(11) NOT NULL DEFAULT 0,
  `suggestDifficulty` int(11) NOT NULL DEFAULT 0 COMMENT '0 - NA 10 - Easy 20 - Normal 30 - Hard 40 - Harder 50 - Insane/Demon/Auto',
  `suggestStars` int(11) NOT NULL DEFAULT 0,
  `suggestFeatured` int(11) NOT NULL DEFAULT 0,
  `suggestAuto` int(11) NOT NULL DEFAULT 0,
  `suggestDemon` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `isRegistered` int(11) NOT NULL,
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `extID` varchar(100) NOT NULL,
  `userName` varchar(69) NOT NULL DEFAULT 'undefined',
  `stars` int(11) NOT NULL DEFAULT 0,
  `demons` int(11) NOT NULL DEFAULT 0,
  `icon` int(11) NOT NULL DEFAULT 0,
  `color1` int(11) NOT NULL DEFAULT 0,
  `color2` int(11) NOT NULL DEFAULT 3,
  `color3` int(11) NOT NULL DEFAULT 0,
  `iconType` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `userCoins` int(11) NOT NULL DEFAULT 0,
  `special` int(11) NOT NULL DEFAULT 0,
  `gameVersion` int(11) NOT NULL DEFAULT 0,
  `secret` varchar(69) NOT NULL DEFAULT 'none',
  `accIcon` int(11) NOT NULL DEFAULT 0,
  `accShip` int(11) NOT NULL DEFAULT 0,
  `accBall` int(11) NOT NULL DEFAULT 0,
  `accBird` int(11) NOT NULL DEFAULT 0,
  `accDart` int(11) NOT NULL DEFAULT 0,
  `accRobot` int(11) DEFAULT 0,
  `accGlow` int(11) NOT NULL DEFAULT 0,
  `accSwing` int(11) NOT NULL DEFAULT 0,
  `accJetpack` int(11) NOT NULL DEFAULT 0,
  `dinfo` varchar(100) DEFAULT '',
  `sinfo` varchar(100) DEFAULT '',
  `pinfo` varchar(100) DEFAULT '',
  `creatorPoints` double NOT NULL DEFAULT 0,
  `IP` varchar(69) NOT NULL DEFAULT '127.0.0.1',
  `lastPlayed` int(11) NOT NULL DEFAULT 0,
  `diamonds` int(11) NOT NULL DEFAULT 0,
  `moons` int(11) NOT NULL DEFAULT 0,
  `orbs` int(11) NOT NULL DEFAULT 0,
  `completedLvls` int(11) NOT NULL DEFAULT 0,
  `accSpider` int(11) NOT NULL DEFAULT 0,
  `accExplosion` int(11) NOT NULL DEFAULT 0,
  `chest1time` int(11) NOT NULL DEFAULT 0,
  `chest2time` int(11) NOT NULL DEFAULT 0,
  `chest1count` int(11) NOT NULL DEFAULT 0,
  `chest2count` int(11) NOT NULL DEFAULT 0,
  `isBanned` int(11) NOT NULL DEFAULT 0,
  `isCreatorBanned` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userID`),
  KEY `userID` (`userID`),
  KEY `userName` (`userName`),
  KEY `stars` (`stars`),
  KEY `demons` (`demons`),
  KEY `coins` (`coins`),
  KEY `userCoins` (`userCoins`),
  KEY `gameVersion` (`gameVersion`),
  KEY `creatorPoints` (`creatorPoints`),
  KEY `diamonds` (`diamonds`),
  KEY `orbs` (`orbs`),
  KEY `completedLvls` (`completedLvls`),
  KEY `isBanned` (`isBanned`),
  KEY `isCreatorBanned` (`isCreatorBanned`),
  KEY `extID` (`extID`),
  KEY `IP` (`IP`),
  KEY `isRegistered` (`isRegistered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
