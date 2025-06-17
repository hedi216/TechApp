-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 juin 2025 à 01:10
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `id` int(11) NOT NULL,
  `reparation_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_achat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `achats`
--

INSERT INTO `achats` (`id`, `reparation_id`, `libelle`, `montant`, `date_achat`) VALUES
(3, 2, 'batterie ', 30.00, '2025-06-15 10:36:05'),
(4, 2, 'afficheur', 25.00, '2025-06-15 10:36:23'),
(13, 7, 'afficheur log', 10.00, '2025-06-15 11:12:02'),
(15, 7, 'micro', 1.00, '2025-06-15 17:52:39');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `utilisateur` varchar(100) NOT NULL,
  `action_type` enum('ajout','modification','suppression') NOT NULL,
  `target_type` enum('réparation','achat') NOT NULL,
  `detail` text DEFAULT NULL,
  `date_action` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `logs`
--

INSERT INTO `logs` (`id`, `utilisateur`, `action_type`, `target_type`, `detail`, `date_action`) VALUES
(1, 'Hassen', 'ajout', 'réparation', 'Ajout de la réparation R-0000009 (Téléphone - test log )', '2025-06-15 18:17:53'),
(2, 'Hassen', 'modification', 'réparation', 'R-0000009 (Téléphone - test log ) modifiée', '2025-06-15 18:23:10'),
(3, 'Nouha', 'suppression', 'réparation', 'R-0000009 supprimée', '2025-06-15 18:24:03'),
(4, 'Hedi', 'ajout', 'achat', 'consucteur (2.00 TND)', '2025-06-15 18:46:18'),
(5, 'Hedi', 'ajout', 'achat', 'micro (1.00 TND) : Téléphone TEST HEDI', '2025-06-15 18:52:39'),
(6, 'Saddem', 'modification', 'réparation', 'R-0000004 (PC - MSI 220 ) modifiée', '2025-06-15 18:54:10'),
(7, 'Saddem', 'modification', 'réparation', 'R-0000003 (Téléphone - iphone 13) modifiée', '2025-06-15 18:54:16'),
(8, 'Hedi', 'suppression', 'réparation', 'R-0000004 supprimée', '2025-06-16 22:35:48'),
(9, 'Hedi', 'modification', 'réparation', 'R-0000003 (Téléphone - iphone 13) modifiée', '2025-06-16 22:36:53'),
(10, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000010 (PC - MSI double 2500)', '2025-06-16 22:38:19'),
(11, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000011 (PC - iphone 7)', '2025-06-16 22:38:52'),
(12, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000012 (Téléphone - test suppression)', '2025-06-16 22:41:35'),
(13, 'Hedi', 'suppression', 'réparation', 'R-0000012 supprimée', '2025-06-16 22:46:03'),
(14, 'Hedi', 'suppression', 'réparation', 'R-0000010 supprimée', '2025-06-16 22:46:03'),
(15, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000013 (Tablette - test bum tel)', '2025-06-16 22:46:45'),
(16, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000014 (Téléphone - test 2num tel)', '2025-06-16 22:48:37'),
(17, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000015 (Téléphone - test 3 num tel)', '2025-06-16 22:50:09'),
(18, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000016 (Téléphone - test 4 num tel)', '2025-06-16 22:50:49'),
(19, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000017 (Téléphone - test 4 num tel)', '2025-06-16 22:52:00'),
(20, 'Hassen', 'ajout', 'réparation', 'Ajout de la réparation R-0000018 (Téléphone - allez)', '2025-06-16 22:53:00'),
(21, 'Hassen', 'ajout', 'réparation', 'Ajout de la réparation R-0000019 (Téléphone - allez)', '2025-06-16 22:53:07'),
(22, 'Hedi', 'ajout', 'réparation', 'Ajout de la réparation R-0000020 (Téléphone - hi)', '2025-06-16 22:56:58'),
(23, 'Hedi', 'suppression', 'réparation', 'R-0000020 supprimée', '2025-06-16 23:04:25'),
(24, 'Hedi', 'modification', 'réparation', 'R-0000019 (Téléphone - allez) modifiée', '2025-06-16 23:05:21'),
(25, 'Hedi', 'suppression', 'réparation', 'R-0000019 supprimée', '2025-06-16 23:09:23'),
(26, 'Hedi', 'suppression', 'réparation', 'R-0000018 supprimée', '2025-06-16 23:34:48'),
(27, 'Hedi', 'suppression', 'réparation', 'R-0000017 supprimée', '2025-06-17 10:19:39'),
(28, 'Hassen', 'suppression', 'réparation', 'R-0000015 supprimée', '2025-06-17 10:43:14'),
(29, 'Hassen', 'suppression', 'réparation', 'R-0000016', '2025-06-17 17:02:43'),
(30, 'Hassen', 'ajout', 'achat', 'test multi appareille (100.00 TND) : Téléphone test 2num tel', '2025-06-17 22:03:16'),
(31, 'Hassen', 'ajout', 'achat', 'test multi appareille (100.00 TND) : Téléphone test 2num tel', '2025-06-17 22:17:06'),
(32, 'Hassen', 'suppression', 'achat', 'test multi appareille supprimé : Téléphone test 2num tel', '2025-06-17 22:28:42'),
(33, 'Hassen', 'suppression', 'achat', 'test multi appareille supprimé : Téléphone test 2num tel', '2025-06-17 23:14:45'),
(34, 'Hassen', 'modification', 'achat', 'consucteur (6.00 TND) : Téléphone TEST HEDI', '2025-06-17 23:21:10'),
(35, 'Hassen', 'modification', 'achat', 'consucteur (1.00 TND) : Téléphone TEST HEDI', '2025-06-17 23:21:23'),
(36, 'Hassen', 'suppression', 'achat', 'consucteur supprimé : Téléphone TEST HEDI', '2025-06-17 23:21:33');

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE `reparations` (
  `id` int(11) NOT NULL,
  `code_reparation` varchar(20) DEFAULT NULL,
  `type_appareil` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `panne` text DEFAULT NULL,
  `modele` varchar(100) DEFAULT NULL,
  `montant_total` decimal(10,2) DEFAULT NULL,
  `acompte` decimal(10,2) DEFAULT NULL,
  `paiement_effectue` tinyint(1) DEFAULT NULL,
  `type_paiement` varchar(50) DEFAULT NULL,
  `date_enregistrement` datetime DEFAULT current_timestamp(),
  `statut` varchar(50) DEFAULT 'En attente',
  `numero_tel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reparations`
--

INSERT INTO `reparations` (`id`, `code_reparation`, `type_appareil`, `os`, `panne`, `modele`, `montant_total`, `acompte`, `paiement_effectue`, `type_paiement`, `date_enregistrement`, `statut`, `numero_tel`) VALUES
(1, 'R-0000001', 'Téléphone', 'Android', 'micro', 'Samssung a20', 100.00, 0.00, 1, 'Espèces', '2025-06-12 23:32:02', 'Diagnostiqué', '55897888'),
(2, 'R-0000002', 'Téléphone', 'iOS', 'baffle', 'iphone6', 90.00, 0.00, 1, 'Espèces', '2025-06-12 23:33:15', 'En attente', '55897883'),
(3, 'R-0000003', 'Téléphone', 'iOS', 'afficheur ', 'iphone 13', 102.00, 10.00, 1, 'Virement', '2025-06-13 19:24:50', 'En cours de réparation', '55897883'),
(7, 'R-0000007', 'Téléphone', 'Android', 'panne afficheur', 'TEST HEDI', 30.00, 0.00, 1, 'Espèces', '2025-06-15 12:10:45', 'En attente', '33666555'),
(11, 'R-0000011', 'PC', 'Linux', 'changement stockage', 'iphone 7', 245.00, 0.00, 0, 'Autre', '2025-06-16 22:38:52', 'En attente', '99886998'),
(13, 'R-0000013', 'Tablette', 'Android', 'test bum tel ', 'test bum tel', 22.00, 0.00, 1, 'Espèces', '2025-06-16 22:46:45', 'En attente', 'pzpzp'),
(14, 'R-0000014', 'Téléphone', 'Android', 'test 2num tel', 'test 2num tel', 0.00, 0.00, 1, 'Espèces', '2025-06-16 22:48:37', 'En attente', 'test 2num tel');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `nom`) VALUES
(2, 'achat'),
(4, 'gerant'),
(9, 'livreur'),
(1, 'owner'),
(3, 'reparation');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `actif` tinyint(1) DEFAULT 1,
  `telephone` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role_id`, `actif`, `telephone`) VALUES
(5, 'test', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 3, 1, '55989789'),
(6, 'Hedi', '8e1f192fe25ad49be764c3f55c68beb32f7aa66f85344e026b76cfaaa1d3d88a', 1, 1, '99511502'),
(7, 'Hassen', '3c2ea00c905c2d6de9299763ef81e9363a12f4ef5f0c7ff0a550a5b33d5df13a', 4, 1, '97865964'),
(8, 'Nouha', 'b281bc2c616cb3c3a097215fdc9397ae87e6e06b156cc34e656be7a1a9ce8839', 2, 1, '99887788'),
(9, 'Saddem', '8c9a013ab70c0434313e3e881c310b9ff24aff1075255ceede3f2c239c231623', 3, 1, '26998887'),
(12, 'testrole', '02023546b4039abe3b9f355c23dafd9119570f301a024e2fd2ff3186ae54060c', 9, 1, '65587894'),
(13, 'rehzbe', '02023546b4039abe3b9f355c23dafd9119570f301a024e2fd2ff3186ae54060c', 9, 1, '65587894');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reparation_id` (`reparation_id`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_reparation` (`code_reparation`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achats`
--
ALTER TABLE `achats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `reparations`
--
ALTER TABLE `reparations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `achats_ibfk_1` FOREIGN KEY (`reparation_id`) REFERENCES `reparations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
