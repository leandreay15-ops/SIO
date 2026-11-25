-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 nov. 2026 à 13:18
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agence_loc2`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero_permis` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_permis` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `prenom`, `date_naissance`, `email`, `telephone`, `ville`, `code_postal`, `numero_permis`, `date_permis`) VALUES
(1, 'Benali', 'Karim', '1990-04-12', 'k.benali@exemple.fr', '+33 6 01 02 03 04', 'Paris', '75011', '12AB34567', '2010-06-20'),
(2, 'Martin', 'Sophie', '1985-09-30', 's.martin@exemple.fr', '0611223344', 'Versailles', '78000', '23CD45678', '2005-03-14'),
(3, 'Haddad', 'Yasmine', '1998-01-15', 'y.haddad@exemple.fr', '0622334455', 'Rueil-Malmaison', '92500', '34EF56789', '2017-09-02'),
(4, 'Dubois', 'Lucas', '2001-07-08', 'l.dubois@exemple.fr', '0633445566', 'Saint-Denis', '93200', '45GH67890', '2020-01-27');

-- --------------------------------------------------------

--
-- Structure de la table `garages`
--

CREATE TABLE `garages` (
  `id_garages` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `téléphone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `garages`
--

INSERT INTO `garages` (`id_garages`, `nom`, `ville`, `téléphone`) VALUES
(1, 'Garage Central', 'Paris', '0140000001'),
(2, 'Auto Vitre Plus', 'Nanterre', '0140000002'),
(3, 'Pneus Express', 'Saint-Denis', '0140000003');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_location` int NOT NULL,
  `id_client` int NOT NULL,
  `id_voiture` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `km_depart` int NOT NULL,
  `km_retour` int DEFAULT NULL,
  `montant_total` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id_location`, `id_client`, `id_voiture`, `date_debut`, `date_fin`, `km_depart`, `km_retour`, `montant_total`) VALUES
(1, 1, 1, '2026-09-01', '2026-09-05', 37800, 38200, 159.60),
(2, 2, 2, '2026-09-10', '2026-09-18', 51200, 51900, 280.00),
(3, 3, 4, '2026-10-02', '2026-10-04', 28500, 28800, 90.00),
(4, 4, 3, '2026-11-14', '2026-11-21', 21000, 21480, 483.00),
(5, 1, 5, '2026-10-20', '2026-10-23', 73500, 73900, 127.50);

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE `reparations` (
  `id_reparation` int NOT NULL,
  `id_voiture` int NOT NULL,
  `date_reparation` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cout` decimal(8,2) NOT NULL,
  `id_garage` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reparations`
--

INSERT INTO `reparations` (`id_reparation`, `id_voiture`, `date_reparation`, `description`, `cout`, `id_garage`) VALUES
(1, 2, '2026-02-10', 'Remplacement des plaquettes de frein', 180.00, 1),
(2, 5, '2026-03-18', 'Vidange et changement des filtres', 120.50, 1),
(3, 3, '2026-05-05', 'Remplacement du pare-brise', 450.00, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type_voiture`
--

CREATE TABLE `type_voiture` (
  `id_type` int NOT NULL,
  `désignation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_voiture`
--

INSERT INTO `type_voiture` (`id_type`, `désignation`) VALUES
(1, 'utlitaire'),
(2, 'luxe'),
(3, 'tourisme');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `id_voiture` int NOT NULL,
  `immatriculation` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `modele` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `annee_circulation` smallint NOT NULL,
  `kilometrage` int NOT NULL,
  `nombre_places` tinyint NOT NULL DEFAULT '5',
  `boite_vitesse` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carburant` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_type` int DEFAULT NULL,
  `tarif_jour` decimal(6,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`id_voiture`, `immatriculation`, `marque`, `modele`, `annee_circulation`, `kilometrage`, `nombre_places`, `boite_vitesse`, `carburant`, `id_type`, `tarif_jour`, `disponible`) VALUES
(1, 'AB-123-CD', 'Peugeot', '208', 2022, 38500, 5, 'Manuelle', 'Essence', 3, 39.90, 1),
(2, 'EF-456-GH', 'Renault', 'Clio', 2021, 52650, 5, 'Manuelle', 'Diesel', 3, 35.00, 1),
(3, 'IJ-789-KL', 'Mercedes', 'Classe A', 2023, 21480, 5, 'Auto', 'Hybride', 2, 69.00, 1),
(4, 'MN-012-OP', 'Renault', 'Zoé', 2022, 29000, 5, 'Auto', 'Électrique', 3, 45.00, 1),
(5, 'QR-345-ST', 'Peugeot', '308', 2020, 74000, 5, 'Manuelle', 'Diesel', 3, 44.00, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_permis` (`numero_permis`);

--
-- Index pour la table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id_garages`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_voiture` (`id_voiture`);

--
-- Index pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD PRIMARY KEY (`id_reparation`),
  ADD KEY `id_voiture` (`id_voiture`),
  ADD KEY `id_garage` (`id_garage`);

--
-- Index pour la table `type_voiture`
--
ALTER TABLE `type_voiture`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`id_voiture`),
  ADD UNIQUE KEY `immatriculation` (`immatriculation`),
  ADD KEY `id_type` (`id_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `garages`
--
ALTER TABLE `garages`
  MODIFY `id_garages` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id_location` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `reparations`
--
ALTER TABLE `reparations`
  MODIFY `id_reparation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_voiture`
--
ALTER TABLE `type_voiture`
  MODIFY `id_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `voitures`
--
ALTER TABLE `voitures`
  MODIFY `id_voiture` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `reparations_ibfk_2` FOREIGN KEY (`id_garage`) REFERENCES `garages` (`id_garages`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `voitures_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_voiture` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
