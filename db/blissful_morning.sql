-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 30 avr. 2018 à 19:26
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blissful_morning`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`activity_id`, `name`, `description`, `duration`, `user_id`) VALUES
(1, 'Read', 'Grab any book and read a little !', '00:10:00', NULL),
(2, 'Exercise', 'Get some fresh air by running a little outside, or do some yoga ! Whatever you feel like.', '00:20:00', NULL),
(3, 'Affirmations', 'Chat yourself up with some positive affirmations ! We provide you with a few good ones, or you can choose your own !', '00:01:00', NULL),
(4, 'Meditate', 'Breathe in, breathe out. Notice how the air flows through your body. If you notice your mind wandering, no worries, just bring it back to where you want it.', '00:10:00', NULL),
(5, 'Visualize', 'Imagine yourself doing the things you have to do today. You will be mentally prepared and more motivated !', '00:05:00', NULL),
(6, 'Scribe', 'Grab your journal and write whatever your spirit wants to write about today!', '00:10:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `affirmation`
--

CREATE TABLE `affirmation` (
  `affirmation_id` int(11) NOT NULL,
  `affirmation_text` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contain`
--

CREATE TABLE `contain` (
  `position` int(11) NOT NULL,
  `routine_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contain`
--

INSERT INTO `contain` (`position`, `routine_id`, `activity_id`) VALUES
(1, 1, 1),
(5, 1, 2),
(6, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `motivation`
--

CREATE TABLE `motivation` (
  `motivation_id` int(11) NOT NULL,
  `motivation_text` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `routine`
--

CREATE TABLE `routine` (
  `routine_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `routine`
--

INSERT INTO `routine` (`routine_id`, `name`, `user_id`) VALUES
(1, 'The Miracle Morning by Hal Elrod', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `signed_up` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `name`, `signed_up`) VALUES
(1, 'rantanplan', '2018-04-30');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `FK_activity_user_id` (`user_id`);

--
-- Index pour la table `affirmation`
--
ALTER TABLE `affirmation`
  ADD PRIMARY KEY (`affirmation_id`);

--
-- Index pour la table `contain`
--
ALTER TABLE `contain`
  ADD PRIMARY KEY (`routine_id`,`activity_id`),
  ADD KEY `FK_contain_activity_id` (`activity_id`);

--
-- Index pour la table `motivation`
--
ALTER TABLE `motivation`
  ADD PRIMARY KEY (`motivation_id`);

--
-- Index pour la table `routine`
--
ALTER TABLE `routine`
  ADD PRIMARY KEY (`routine_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_routine_user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `affirmation`
--
ALTER TABLE `affirmation`
  MODIFY `affirmation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motivation`
--
ALTER TABLE `motivation`
  MODIFY `motivation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `routine`
--
ALTER TABLE `routine`
  MODIFY `routine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `FK_activity_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `FK_contain_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`),
  ADD CONSTRAINT `FK_contain_routine_id` FOREIGN KEY (`routine_id`) REFERENCES `routine` (`routine_id`);

--
-- Contraintes pour la table `routine`
--
ALTER TABLE `routine`
  ADD CONSTRAINT `FK_routine_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
