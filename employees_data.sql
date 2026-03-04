-- =====================================================
-- Replace all employee data from DTI6 Employees.kml
-- Generated: 2026-03-04 14:41:47
-- Total employee records: 259
-- =====================================================

SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing employee_locations
TRUNCATE TABLE `employee_locations`;

-- Delete all non-admin users (preserve admin accounts)
DELETE FROM `users` WHERE `is_admin` = 0 OR `is_admin` IS NULL;

SET FOREIGN_KEY_CHECKS = 1;

-- Employee 1: Janice T. Abellar
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Janice T. Abellar', 'janice.t.abellar.6.013@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-013', '14, Osmeña, Sta. Filomena, Iloilo, Iloilo', 10.6897014, 122.5153592, '915602185', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 2: Florenda Octoberiana C. Abian
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Florenda Octoberiana C. Abian', 'florenda.octoberiana.c.abian.6.156@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-156', '41, Mansaya, Lapuz, Iloilo City, Iloilo', 10.700095, 122.5846401, '9173016657', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 3: Charlene Joy A. Adeja
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Charlene Joy A. Adeja', 'charlene.joy.a.adeja.6.045@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-045', 'Magbato, Lambunao, Iloilo', 11.0338813, 122.4707839, '9502045750', 'Negosyo Center', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 4: Gabriel I. Advincula
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Gabriel I. Advincula', 'gabriel.i.advincula.6.067@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-067', 'Blk. 4 Lot 1, Natures Village, Alijis, Bacolod City, Negros Occidental', 10.6344115, 122.9522179, '9279243860', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 5: Daniel S. Agan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Daniel S. Agan', 'daniel.s.agan.6.162@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-162', 'Jalandoni Street, Brgy. Lady Of Lourdes, Jaro, Iloilo City, Iloilo', 10.72319, 122.5568484, '9954997095', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 6: Aurora Teresa J. Alisen
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Aurora Teresa J. Alisen', 'aurora.teresa.j.alisen.6.041@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-041', '10, Liberation Road, San Agustin, Iloilo City, Iloilo', 10.7001134, 122.5634341, '9950841162', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 7: Mary Ann -. Alteros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mary Ann -. Alteros', 'mary.ann.alteros.cos.il.030@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-030', 'Batuan Ilaud, Oton, Iloilo', 10.718897, 122.4283212, '9608584772', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 8: Romel L. Amihan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Romel L. Amihan', 'romel.l.amihan.6.027@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-027', 'Lot 6, Block 9, Ecc Villas, Alijis, Bacolod, Negros Occidental', 10.6684373, 122.97369, '9228258782', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 9: He Jean C. Antonio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('He Jean C. Antonio', 'he.jean.c.antonio.2024.ilo.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '2024-ILO-004', 'Cabulo-an Sur, Oton, Iloilo', 10.7240176, 122.4562615, '9461097184', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 10: Anelyn L. Apiag
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Anelyn L. Apiag', 'anelyn.l.apiag.6.053@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-053', 'Melliza St., Ilawod Poblacion, Zarraga, Iloilo', 10.8213606, 122.6099832, '9498051680', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 11: Roxanne B. Arbatin
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Roxanne B. Arbatin', 'roxanne.b.arbatin.6.025@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-025', 'Arce Street, Poblacion, Pilar, Capiz', 11.4847885, 122.9958715, '(+63) 0916 277 8095 / (+63) 0919 949 1691', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 12: May Ann S. Arca
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('May Ann S. Arca', 'may.ann.s.arca.cos6.002@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS6-002', 'Ulong, Guihaman, Leganes, Iloilo', 10.7821169, 122.5811061, '9503278365', 'Jo/cos', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 13: Merian A. Asas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Merian A. Asas', 'merian.a.asas.6.082@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-082', 'Brgy. Cagay, Roxas City, Capiz', 11.5683009, 122.7356733, '9498993956', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 14: Maria Victoria D. Aspera
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Maria Victoria D. Aspera', 'maria.victoria.d.aspera.6.157@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-157', 'Progress Subdivision, Dulonan, Arevalo, Iloilo City, Iloilo', 10.6852929, 122.527374, '9089357495', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 15: Mia A. Aujero
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mia A. Aujero', 'mia.a.aujero.6.049@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-049', 'Blk 6b Lot 16, Regina Townhomes, Brgy. Singcang-airport, Bacolod City, Negros Occidental', 10.6526712, 122.9283332, '9205318564', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 16: Ma. Bianka Lou M. Ayon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Bianka Lou M. Ayon', 'ma.bianka.lou.m.ayon.6.069@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-069', 'Atabay, San Jose, Antique', 10.7593863, 121.9487331, '9954334374', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 17: Judy Ann P. Bandiola - Rendon N/a.
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Judy Ann P. Bandiola - Rendon N/a.', 'judy.ann.p.bandiola.rendon.na.6.019@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-019', 'Alimbo Iraya, Buenavisata, Nabas, Aklan', 11.8186268, 122.0912378, '9090405451', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 18: Ma. Aurora E. Bangcaya
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Aurora E. Bangcaya', 'ma.aurora.e.bangcaya.6.158@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-158', '3rd St., San Jose Subdivision, Tagbac Jaro, Iloilo City, Iloilo', 10.7662232, 122.5805089, '9164628939', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 19: Rowena D. Barcelona
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rowena D. Barcelona', 'rowena.d.barcelona.c6.003@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-003', 'Milibili, Roxas City, Capiz', 11.5620489, 122.7661258, '9504876385', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 20: Ma. Rona T. Bartolay
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Rona T. Bartolay', 'ma.rona.t.bartolay.6.071@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-071', 'Buenavista, Tubungan, Iloilo', 10.7758373, 122.2979953, '09560437748 / 09202613470', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 21: Frauleine B. Bautista
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Frauleine B. Bautista', 'frauleine.b.bautista.6.029@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-029', 'Blk 5lot 17, Accco Housing, Brgy. Alijis, Bacolod City, Negros Occidental', 10.6816036, 122.9556291, '9324295174', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 22: Ma. Neipi Jane A. Bautista
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Neipi Jane A. Bautista', 'ma.neipi.jane.a.bautista.6.065@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-065', 'Corner Confesor Drive And San Agustin Street, Poblacion Zone V, Cabatuan, Iloilo', 10.8809803, 122.4813325, '9198154803', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 23: Marianne T. Bebit
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Marianne T. Bebit', 'marianne.t.bebit.2023.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '2023-004', 'Block 2, Lot 5 Brgy. San Rafael, Mandurriao, Farm Workers Subdivision, Iloilo City, Iloilo', 10.7090854, 122.5470377, '0922-833-3913', 'Ipophl', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 24: Verna A. Belegera
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Verna A. Belegera', 'verna.a.belegera.c6.145@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-145', 'Malublub, Badiangan, Iloilo', 10.9741783, 122.5683826, '9285417273', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 25: Grace M. Benedicto
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Grace M. Benedicto', 'grace.m.benedicto.6.138@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-138', 'Block 11/ Lot 8, Ciudad De Iloilo, Calumpang, Molo, Iloilo City, Iloilo', 10.6843067, 122.5358599, '9094775983', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 26: Jose Jonathan B. Benedicto
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jose Jonathan B. Benedicto', 'jose.jonathan.b.benedicto.6.077@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-077', 'Nanga, Guimbla, Iloilo', 10.6777774, 122.3376767, '9203968610', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 27: Jomar B. Benedicto
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jomar B. Benedicto', 'jomar.b.benedicto.6.009@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-009', '#32, Torreblanca, Calaparan, Arevallo, Guimbal, Iloilo', 10.6809166, 122.5280812, '909484397', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 28: John Mchale C. Benid
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('John Mchale C. Benid', 'john.mchale.c.benid.6.037@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-037', 'Sitio Cansonsing, Rizal, Poblacion, San Enrique, Negros Occidental', 10.4190992, 122.8496523, '9554237256', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 29: Juvy D. Benliro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Juvy D. Benliro', 'juvy.d.benliro.6.083@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-083', 'Dayao, Roxas, Capiz', 11.5882549, 122.7350771, '9611708041', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 30: Mariecon A. Burla
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mariecon A. Burla', 'mariecon.a.burla.6.026@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-026', 'Zone 5, Ungka 1, Pavia, Iloilo', 10.7622006, 122.5415167, '09996553587 / 09454601772', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 31: Sherlyn Y. Canales
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Sherlyn Y. Canales', 'sherlyn.y.canales.cos.il.001@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-001', 'Rizal, Jordan, Guimaras', 10.6662011, 122.5966549, '9993902066', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 32: Lynna Joy B. Cardinal
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lynna Joy B. Cardinal', 'lynna.joy.b.cardinal.6.072@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-072', 'Funda-dalipe, San Jose, Antique', 10.7624097, 121.9330894, '9950590910', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 33: Ma. Dorita D. Chavez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Dorita D. Chavez', 'ma.dorita.d.chavez.6.046@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-046', 'B5 L8, Ciudad De Iloilo, Calumpang, Molo, Iloilo', 10.6843067, 122.5358599, '9177946522', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 34: Florielee S. Clavel
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Florielee S. Clavel', 'florielee.s.clavel.c6.040@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-040', 'Abilay Sur, Oton, Iloilo', 10.7215581, 122.5004975, '9178797009', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 35: Dicof D. Cofreros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Dicof D. Cofreros', 'dicof.d.cofreros.c6.014@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-014', 'Bachao Sur, Kalibo, Aklan', 11.6892241, 122.367428, '09286981673 / 09778468437', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 36: Bemy John A. Collado
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Bemy John A. Collado', 'bemy.john.a.collado.6.038@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-038', 'Zone 5, San Isidro, Jaro, Iloilo City, Iloilo', 10.7391088, 122.5500014, '9177993986', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 37: Juan Carlos V. Corros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Juan Carlos V. Corros', 'juan.carlos.v.corros.6.043@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-043', 'Lot 19, Lawaan St., Graceville Subd., Tiza, Roxas City, Capiz', 11.5742817, 122.7632036, '9290874942', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 38: Ken Queenie R. CuÑada
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ken Queenie R. CuÑada', 'ken.queenie.r.cuñada.6.087@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-087', 'Sitio Sumiga, Milibili, Roxas City, Capiz', 11.5620489, 122.7661258, '9778771000', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 39: Sheryl E. Dioteles
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Sheryl E. Dioteles', 'sheryl.e.dioteles.6.155@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-155', 'Orosa, Zone 12, Talisay City, Negros Occidental', 10.7382441, 122.973343, '9460762242', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 40: Althone L. Dy
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Althone L. Dy', 'althone.l.dy.6.070@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-070', '2-231, Lopez Jaena, Ii, Pontevedra, Negros Occidental', 10.3526591, 122.9212265, '9175455927', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 41: Rheyzia Marie V. Elgario
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rheyzia Marie V. Elgario', 'rheyzia.marie.v.elgario.dticosmonitors.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'DTICOSMONITORS-004', '129, Jota Villa, Maria Cristina, Jaro, Iloilo City, Iloilo', 10.7289769, 122.555304, '0929 7025 478 / 0995 6645 015', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 42: Joy Anne S. Erazo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Joy Anne S. Erazo', 'joy.anne.s.erazo.c6.007@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-007', 'Block 16 Lot 14, Nha Mandurraio, Block 22, Iloilo City, Iloilo', 10.7292221, 122.5404487, '9154989709', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 43: Tathiana Bianca E. Espinal
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Tathiana Bianca E. Espinal', 'tathiana.bianca.e.espinal.cos6.006@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS6-006', 'Lot 10, Blk 8, Molave, Manuela Subdivision, Cagamutan Sur, Leganes, Iloilo', 10.7886254, 122.5960956, '9999447860', 'Jo/cos', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 44: Mutya D. Eusores
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mutya D. Eusores', 'mutya.d.eusores.6.154@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-154', 'Block 6 Lot 5, Eon Centannial Townhomes, Jibao-an, Pavia, Iloilo', 10.7537005, 122.5102578, '09189511403/09176248178', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 45: Rosie Y. Evangelista
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rosie Y. Evangelista', 'rosie.y.evangelista.6.105@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-105', 'Lot 22 Block 5 Phase 3, Cookie Street, Celine Homes, Estefania, Bacolod City, Negros Occidental', 10.6716117, 122.9881249, '9438457623', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 46: Cheryl D. Fernandez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Cheryl D. Fernandez', 'cheryl.d.fernandez.6.128@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-128', 'Tabucan, Dumangas, Iloilo', 10.8214643, 122.7054309, '9162576049', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 47: Dessa Anh T. Flores
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Dessa Anh T. Flores', 'dessa.anh.t.flores.6.050@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-050', 'Bacan, Banga, Aklan', 11.6316732, 122.3305918, '9509028888', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 48: Ariane L. Fuentespina
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ariane L. Fuentespina', 'ariane.l.fuentespina.6.016@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-016', 'Sta. Clara, Oton, Iloilo', 10.7632105, 122.4382307, '9612436034', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 49: Dan Alfrei C. Fuerte
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Dan Alfrei C. Fuerte', 'dan.alfrei.c.fuerte.cos6.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS6-004', '4-b, Zamora, Concepcion, Iloilo City, Iloilo', 10.695991, 122.578334, '9818098637', 'Jo/cos', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 50: Jenny Ann J. Gabucay N/a.
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jenny Ann J. Gabucay N/a.', 'jenny.ann.j.gabucay.na.6.060@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-060', 'Roosevelt, Poblacion, Tapaz, Capiz', 11.260858, 122.5368428, '9636241960', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 51: Normel E. Galvan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Normel E. Galvan', 'normel.e.galvan.6.076@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-076', 'Alaguisoc, Jordan, Guimaras', 10.6193039, 122.5994817, '9514397883', 'Negosyo Center', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 52: Mary Jade R. Gonzales
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mary Jade R. Gonzales', 'mary.jade.r.gonzales.6.031@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-031', 'Blk 49, Lot 8, Bolilao, Mandurriao, Iloilo City, Iloilo', 10.7133715, 122.5549505, '9209466013', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 53: Grace Trisha T. Hisanan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Grace Trisha T. Hisanan', 'grace.trisha.t.hisanan.2024.ilo.006@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '2024-ILO-006', 'Zone 1, Santa Rosa, Iloilo City, Iloilo', 10.7120649, 122.5782351, '9950633872', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 54: Reginald S. Hudierez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Reginald S. Hudierez', 'reginald.s.hudierez.6.047@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-047', 'Block 12 Lot 20, Regent Pearl Subdivision, Alijis, Bacolod City, Negros Occidental', 10.6267764, 122.9622969, '9213426412', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 55: Gelimae I. Invina
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Gelimae I. Invina', 'gelimae.i.invina.6.084@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-084', 'Kalibo, Aklan', 11.6892241, 122.367428, '9292455147', NULL, 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 56: Daryl Mae Lorene S. Jacar
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Daryl Mae Lorene S. Jacar', 'daryl.mae.lorene.s.jacar.c6.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-004', 'Zone 4, Nabitasan, La Paz, Iloilo City, Iloilo', 10.7140934, 122.5586281, '9159872017', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 57: Ma. Rose C. Jayona
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Rose C. Jayona', 'ma.rose.c.jayona.dtinccos.062@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'DTINCCOS-062', 'Magsaysay Village, Lapaz, Iloilo City, Iloilo', 10.71132, 122.5620202, '9076144659', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 58: Rhea B. Jocsing
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rhea B. Jocsing', 'rhea.b.jocsing.6.134@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-134', '016, General Luna St., Poblacion West, Oton, Iloilo', 10.6924868, 122.4750284, '09477684788/099546521342', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 59: Shayne G. Jornadal
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Shayne G. Jornadal', 'shayne.g.jornadal.6.014@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-014', 'PiÑa, Buenavista, Guimaras', 10.6434574, 122.6447001, '0916-2566-343', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 60: Kristopher Gerard P. Jovero
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kristopher Gerard P. Jovero', 'kristopher.gerard.p.jovero.cos6.05@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS6-05', '22a, Democracia, Ma. Cristina, Iloilo City, Iloilo', 10.7297628, 122.5556206, '9776869662', 'Jo/cos', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 61: Judith G. Kelly
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Judith G. Kelly', 'judith.g.kelly.6.008@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-008', 'Lot 8 Block 6, Sto. Domingo Subdivision, Arevalo, Iloilo City, Iloilo', 10.731701, 122.5525753, '9399508636', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 62: Michelle C. Ladigohon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Michelle C. Ladigohon', 'michelle.c.ladigohon.6.007@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-007', 'Block 7 Lot 10, Augustine Grove, Sambag, Jaro,iloilo, Iloilo', 10.7364765, 122.5382011, '9176232585', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 63: Kristel Joyce L. Laudenorio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kristel Joyce L. Laudenorio', 'kristel.joyce.l.laudenorio.6.068@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-068', 'Had. Ideal, Xiii, Victorias City, Negros Occidental', 10.8930869, 123.0449788, '9216520289', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 64: Catherine P. Layes
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Catherine P. Layes', 'catherine.p.layes.cos.il.006@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-006', 'Block 01 Lot 56, Phase P, Parc Regency, Aganan, Pavia, Iloilo', 10.7566235, 122.5285606, '9750097349', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 65: Rhea Jepee L. Legario
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rhea Jepee L. Legario', 'rhea.jepee.l.legario.6.015@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-015', 'Alugmawa, Lambunao, Iloilo', 11.1041822, 122.5118148, '9303325798', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 66: Glenda S. Loloy
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Glenda S. Loloy', 'glenda.s.loloy.6.057@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-057', '#15, San Miguel, Iloilo', 10.7823601, 122.463708, '9152640243', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 67: Pristine Ellaine D. Magdaug
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Pristine Ellaine D. Magdaug', 'pristine.ellaine.d.magdaug.6.059@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-059', '224, Sambag, Jaro, Iloilo', 10.7346586, 122.5408096, '9176249722', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 68: Joseph Marc C. Maguad
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Joseph Marc C. Maguad', 'joseph.marc.c.maguad.2024.ilo.005@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '2024-ILO-005', 'Talacu-an, Leon, Iloilo', 10.7691498, 122.3872576, '6.39E+11', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 69: Rl G. Marco
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rl G. Marco', 'rl.g.marco.6.063@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-063', 'Cabatac, Maasin, Iloilo', 10.8943329, 122.4424773, '9280344433', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 70: Therese Grace J. Marla
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Therese Grace J. Marla', 'therese.grace.j.marla.6.160@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-160', 'Block 3 Lot 20, Carmen J. Ledesma Village, Tacas, Jaro, Iloilo City, Iloilo', 10.7475615, 122.5564093, '9177052844', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 71: Romil F. Maro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Romil F. Maro', 'romil.f.maro.6.032@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-032', 'Supang, Buenavista, Guimaras', 10.70666, 122.6701267, '9991572670', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 72: Lyndy Exzyle D. Miranda
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lyndy Exzyle D. Miranda', 'lyndy.exzyle.d.miranda.6.064@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-064', 'Block 19, Lot 7, Zone 1, Salas Real Subdivision, Quintin Salas, Jaro, Iloilo City, N/a', 10.7417345, 122.5623329, '9277720006', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 73: Jazer P. Miranda
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jazer P. Miranda', 'jazer.p.miranda.6.020@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-020', 'Block 1 Lot 4, Lessandra C, Jibao-an, Pavia, Iloilo', 10.7473308, 122.514457, '9215365566', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 74: Johna Raf M. Montalvo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Johna Raf M. Montalvo', 'johna.raf.m.montalvo.6.021@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-021', 'Bn349, Orbe St., Baybay Norte, Miagao, Iloilo', 10.64078, 122.2384143, '9267497755', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 75: Jeanne Renee V. Nedula N/a.
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jeanne Renee V. Nedula N/a.', 'jeanne.renee.v.nedula.na.6.055@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-055', '22, M.h.del Pilar Street, M.h. Del Pilar Jaro, Iloilo City, Iloilo', 10.6992488, 122.5504014, '9634465066', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 76: Rachel N. Nufable
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rachel N. Nufable', 'rachel.n.nufable.6.054@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-054', '11, Tajanlangit St., Tacas, Miagao, Iloilo', 10.642171, 122.2345279, '09177169395/09224318055', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 77: Arnel B. Oliveros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Arnel B. Oliveros', 'arnel.b.oliveros.6.023@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-023', 'Purok 7, Funda-dalipe, San Jose De Buenavista, Antique', 10.7624595, 121.9331315, '9177063939', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 78: Rejoice S. Orquia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rejoice S. Orquia', 'rejoice.s.orquia.6.044@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-044', 'Purok 3, New Poblacion, Buenavista, Guimaras', 10.7099659, 122.6418745, '9151518702', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 79: Honey Mae F. Osimco
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Honey Mae F. Osimco', 'honey.mae.f.osimco.6.119@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-119', 'Block 35, Lot 1, Tuna Street, Village 2, Pandac, Pavia, Iloilo', 10.7477261, 122.5287884, '9757465208', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 80: Rosalie A. Panganiban
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rosalie A. Panganiban', 'rosalie.a.panganiban.6.143@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-143', '0424, Luis Barrios St., Poblacion, Kalibo, Aklan', 11.7097775, 122.3654276, '09206214738/09955216057', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 81: Emily S. Pasaporte
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Emily S. Pasaporte', 'emily.s.pasaporte.6.062@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-062', 'Rizal Street, Ilaya, Zarraga, Iloilo', 10.8235701, 122.6092145, '9183399368', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 82: Angelo G. Patrimonio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Angelo G. Patrimonio', 'angelo.g.patrimonio.6.006@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-006', 'Simon Ledesma, Simon Ledesma Jaro, Iloilo City, Iloilo', 10.7303872, 122.5563645, '9353222798', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 83: Eden Grace A. Perez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Eden Grace A. Perez', 'eden.grace.a.perez.cos.il.008@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-008', 'Balibagan Oeste, Sta. Barbara, Iloilo', 10.8072847, 122.5132294, '9519132844', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 84: Jane Russel B. Prudente
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jane Russel B. Prudente', 'jane.russel.b.prudente.6.137@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-137', 'Block 21 Lot 5, 21st, Westwoods Subdivision, Dungon, Mandurriao, Iloilo City, Iloilo', 10.7308259, 122.538076, '9176307647', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 85: John Cris M. Puertas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('John Cris M. Puertas', 'john.cris.m.puertas.cos.il.004@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-004', 'Batuan Ilaud, Oton, Iloilo', 10.718897, 122.4283212, '9485907196', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 86: Marimae C. Pueyo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Marimae C. Pueyo', 'marimae.c.pueyo.c6.037@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-037', 'Sta. Teresa, Jordan, Guimaras', 10.5951295, 122.5542435, '09066300203/09309725712', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 87: Sealbia Y. Quilino
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Sealbia Y. Quilino', 'sealbia.y.quilino.6.028@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-028', '#1 Sunset Subdivision, Funda-dalipe, San Jose, Antique', 10.7624097, 121.9330894, '9557806424', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 88: Lakambini T. Regalado
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lakambini T. Regalado', 'lakambini.t.regalado.6.121@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-121', '1548, Zone 5, San Jose, San Miguel, Iloilo', 10.7664324, 122.4948384, '9088893834', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 89: Billy B. Regondon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Billy B. Regondon', 'billy.b.regondon.6.079@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-079', 'Sitio Oring-oring, Barangay 8, San Jose, Antique', 10.7489069, 121.9412608, '9058156698', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 90: Andrea S. Reyes
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Andrea S. Reyes', 'andrea.s.reyes.6.056@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-056', '26-b, Calubihan, Jaro, Iloilo City, Iloilo', 10.7209314, 122.5519457, '9121370673', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 91: Belinda B. Roldan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Belinda B. Roldan', 'belinda.b.roldan.6.066@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-066', '0409, L. Barrios Street, Poblacion, Kalibo, Aklan', 11.7100497, 122.3655607, '9338642262', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 92: Pamela S. Roldan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Pamela S. Roldan', 'pamela.s.roldan.6.010@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-010', '604, Divinagracia Street, Brgy. Aguinaldo, La Paz, Iloilo City, Iloilo', 10.7088511, 122.5711658, '9984511714', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 93: Ma. Kristine B. Rosaldes
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Kristine B. Rosaldes', 'ma.kristine.b.rosaldes.6.034@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-034', 'Bermejo Street, Barangay Zone 3, Cabatuan, Iloilo', 10.8255871, 122.5329503, '9462204754', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 94: Judy Mae M. Sajo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Judy Mae M. Sajo', 'judy.mae.m.sajo.6.024@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-024', 'Bungca, Barotac Nuevo, Iloilo', 10.9032163, 122.7096666, '9688571450', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 95: Iris Mae I. Sarabia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Iris Mae I. Sarabia', 'iris.mae.i.sarabia.6.039@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-039', 'Ugsod, Banga, Aklan', 11.6320237, 122.3178379, '9272473485', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 96: Wilma N. Semillano
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Wilma N. Semillano', 'wilma.n.semillano.cos.il.007@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-007', 'Buenavista Norte, Miagao, Iloilo', 10.6510947, 122.1845382, '9702067317', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 97: Leo L. Siwagan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Leo L. Siwagan', 'leo.l.siwagan.cos.il.002@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'COS-IL-002', 'Blk 3k, 2nd. St., Manuela Subdivision, Cagamutan Sur, Leganes, Iloilo', 10.7886254, 122.5960956, '9509448125', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 98: Amiel P. Sumait
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Amiel P. Sumait', 'amiel.p.sumait.6.036@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-036', 'Cubay Sur, Malay, Aklan', 11.8999507, 121.9316672, '9163371127', 'Aklan Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 99: Jenny May B. Tabalanza
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jenny May B. Tabalanza', 'jenny.may.b.tabalanza.6.042@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-042', 'Odiong, Sibalom, Antique', 10.7776951, 121.982857, '9087946895', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 100: Rohel P. Tabayay
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rohel P. Tabayay', 'rohel.p.tabayay.6.081@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-081', 'Hda. San Bernabe 2, Salvacion, Murcia, Negros Occidental', 10.6078373, 123.0535774, '0961-739-1828', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 101: Kent Novie T. Tacsagon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kent Novie T. Tacsagon', 'kent.novie.t.tacsagon.6.052@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-052', 'Baldan, Teniente Benito, Tubungan, Iloilo', 10.7665575, 122.3249236, '9127992225', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 102: Elnar R. Talibong
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Elnar R. Talibong', 'elnar.r.talibong.2024.ilo.007@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '2024-ILO-007', 'Zone Ii, Tagsing, Santa Barbabra, Iloilo', 10.8299024, 122.5351527, '9560768971', 'Jo/cos - Iloilo', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 103: Ma. Dinda R. Tamayo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Dinda R. Tamayo', 'ma.dinda.r.tamayo.6.033@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-033', '<![CDATA[Lotn 12 Blk 4, Queen\'s Road, Imperial Homes Ii, Quintin Salas, Jaro Iloilo City, Iloilo]]>', 10.7418013, 122.562248, '6.19E+11', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 104: May Angeli V. Tayona
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('May Angeli V. Tayona', 'may.angeli.v.tayona.6.035@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-035', '<![CDATA[Block 85 Lot 7 & 9, Ana Ros Village, Brgy. Calahunan, Mandurriao, Iloilo City, Iloilo]]>', 10.7185883, 122.52238, '9257390212', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 105: Reynaldo T. Tejero
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Reynaldo T. Tejero', 'reynaldo.t.tejero.6.131@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-131', 'Igbantang, Sta Teresa, Jordan, Guimaras', 10.5951295, 122.5542435, '9454762140', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 106: Jonathan T. Tejida
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jonathan T. Tejida', 'jonathan.t.tejida.6.147@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-147', 'Tigbauan-leon Rd,, Cordova Norte, Tigbauan, Iloilo', 10.7376671, 122.4042514, '09222926310/09279509247', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 107: Marjorie F. Tendras
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Marjorie F. Tendras', 'marjorie.f.tendras.6.017@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-017', 'Casa Sofia, Crossing Seminary, Lawaan, Roxas, Capiz', 11.5585253, 122.7548364, '9060618445', 'Capiz Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 108: Kher Jake Martin A. Trayco
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kher Jake Martin A. Trayco', 'kher.jake.martin.a.trayco.c6.009@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), 'C6-009', 'De La Rama, Lag-asan, Bago, Negros Occidental', 10.5299199, 122.8391205, '9432490613', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 109: Kurt Maurice S. Tugaff
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kurt Maurice S. Tugaff', 'kurt.maurice.s.tugaff.6.089@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-089', '63-b, Guzman Street, Guzman Jesena, Mandurriao, Iloilo City, Iloilo', 10.7244272, 122.5294691, '9190011463', 'Iloilo Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 110: Engiemar B. Tupas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Engiemar B. Tupas', 'engiemar.b.tupas.6.113@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-113', 'Block 9 Lot 29, Grandville 3 Subdivision, Mansilingan, Bacolod City, Negros Occidental', 10.6244035, 122.9698225, '9399159596', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 111: Aisel Joyce M. Tupas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Aisel Joyce M. Tupas', 'aisel.joyce.m.tupas.6.051@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-051', 'Block 35 Lot 2 And 4, Mallery Homes Subdivision, Barangay Rizal, Silay City, Negros Occidental', 10.8076361, 122.9861277, '9612041324', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 112: Gerin E. Vergara
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Gerin E. Vergara', 'gerin.e.vergara.6.117@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-117', 'Block 10 Lot 6, Charito Heights Phase 2, Barangay Granada, Bacolod City, Negros Occidental', 10.6686925, 123.037203, '(0915)4496866/(0968)8571063', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 113: Gevi Kristina S. Villafuerte
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Gevi Kristina S. Villafuerte', 'gevi.kristina.s.villafuerte.6.012@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-012', 'Villa Julita, Badiang, San Jose De Buenavista, Antique', 10.7671182, 121.945889, '9175198668', 'Antique Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 114: Kenneth C. Villarosa
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kenneth C. Villarosa', 'kenneth.c.villarosa.6.030@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-030', 'Prk. Santan, Villarosa St., Cansilayan, Murcia, Negros Occidental', 10.5719797, 123.0057261, '9937916377', 'Negros Occidental Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 115: Rossel T. Virtuoso
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rossel T. Virtuoso', 'rossel.t.virtuoso.6.078@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-078', 'Sto. Niño Sur, Arevalo Iloilo City, Iloilo', 10.6836699, 122.4990828, '9452549079', 'Regional Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 116: Nesgen Rhea C. Zerrudo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Nesgen Rhea C. Zerrudo', 'nesgen.rhea.c.zerrudo.6.011@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), '6-011', 'Proper, Santa Teresa, Jordan, Guimaras', 10.5951295, 122.5542435, '9185476245', 'Guimaras Provincial Office', 'DTI6', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 117: Judy Ann P. Bandiola-Rendon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Judy Ann P. Bandiola-Rendon', 'judy.ann.p.bandiola.rendon@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Alimbo Iraya, Buenavista, Nabas, Aklan', 11.8186268, 122.0912378, '(036) 268-3485', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 118: Judy Ann P. Bandiola-Rendon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Judy Ann P. Bandiola-Rendon', 'judy.ann.p.bandiola.rendon.2@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Alimbo Iraya, Buenavista, Nabas, Aklan', 11.8186268, 122.0912378, '(036) 268-3485', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 119: Euna Belle R. Ratay
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Euna Belle R. Ratay', 'euna.belle.r.ratay@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Bacan, Banga, Aklan', 11.6316732, 122.3305918, '09709320059 / 09453423459', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 120: Beda Josel D. Zaulda
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Beda Josel D. Zaulda', 'beda.josel.d.zaulda@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'D.Maagma, Poblacion, Kalibo, Aklan', 11.7056247, 122.3634274, '9613225131', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 121: Christine Mae H. Jaurique
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Christine Mae H. Jaurique', 'christine.mae.h.jaurique@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Talangban, Camaligan, Batan Aklan', 11.589503, 122.4068716, '9125268768', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 122: Lurijane B. Andrade
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lurijane B. Andrade', 'lurijane.b.andrade@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 2 C. Laserna Street, Poblacion, Kalibo, Aklan', 11.7067632, 122.3634578, '9185653742', 'Aklan: Kalibo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 123: May Ann Gregorio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('May Ann Gregorio', 'may.ann.gregorio@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Ginictan, Altavas, Aklan', 11.5235411, 122.4707839, '9464488998', 'Aklan: Altavas', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 124: Jecel T. Pranuelas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jecel T. Pranuelas', 'jecel.t.pranuelas@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Ondoy, Ibajay, Aklan', 11.8185109, 122.1220856, '9122190378', 'Aklan: Ibajay', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 125: Trisha Aura C. Alfaro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Trisha Aura C. Alfaro', 'trisha.aura.c.alfaro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'New Buswang,Kalibo,Aklan', 11.7112491, 122.380176, '9562468199', 'Aklan: Lezo', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 126: Queena Althea N. Villorente-Aguirre
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Queena Althea N. Villorente-Aguirre', 'queena.althea.n.villorente.aguirre@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Rizal Street, Poblacion, Libacao, Aklan', 11.4109251, 122.2880726, '9567061878', 'Aklan: Libacao', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 127: Zhasnay Nicole A. Iquiña
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Zhasnay Nicole A. Iquiña', 'zhasnay.nicole.a.iquiña@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Centro Cayangwan, Makato, Aklan', 11.6920802, 122.2852374, '09942013074', 'Aklan: Makato', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 128: Izrah Jane D. Custodio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Izrah Jane D. Custodio', 'izrah.jane.d.custodio@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Iwisan, Cabugao, Batan, Aklan', 11.5627812, 122.439013, '09077007669', 'Aklan: Malay', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 129: Mica Marie A. Tala-oc
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mica Marie A. Tala-oc', 'mica.marie.a.tala.oc@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Tagas, Tangalan, Aklan', 11.7668039, 122.2455364, '9639713494', 'Aklan: Caticlan (Satellite office)', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 130: DJ S. Tambong
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('DJ S. Tambong', 'dj.s.tambong@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Puntat Bukid, San Dimas, Malinao, Aklan', 11.6686091, 122.2639708, '9101616707', 'Aklan: Malinao', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 131: Shemaiah Queeny Shua A. Bautista
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Shemaiah Queeny Shua A. Bautista', 'shemaiah.queeny.shua.a.bautista@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Andagao, Kalibo, Aklan', 11.7016563, 122.3773433, '9300912288', 'Aklan: Balete', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 132: Zillah F. Alfaro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Zillah F. Alfaro', 'zillah.f.alfaro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Bay-ang, Batan, Aklan', 11.5919492, 122.4495547, '9101254554', 'Aklan: New Washington', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 133: Roby Job V. Nabong
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Roby Job V. Nabong', 'roby.job.v.nabong@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Bay-ang, Batan, Aklan', 11.5919492, 122.4495547, '9489375419', 'Aklan: Banga', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 134: John Donel D. Tumbagahan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('John Donel D. Tumbagahan', 'john.donel.d.tumbagahan@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Centro, Toledo, Nabas, Aklan', 11.8402859, 122.0581762, '9638026255', 'Aklan: Nabas', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 135: Rodene C. Panganiban
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rodene C. Panganiban', 'rodene.c.panganiban@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Panayakan, Tangalan, Aklan', 11.7618267, 122.2256803, '9611544886', 'Aklan: Tangalan', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 136: Renz Kenneth G. Agapito
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Renz Kenneth G. Agapito', 'renz.kenneth.g.agapito@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Napnot, Madalag, Aklan', 11.5088474, 122.319255, '9283396580', 'Aklan: Madalag', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 137: Keeny Lyn F. Dumalaog
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Keeny Lyn F. Dumalaog', 'keeny.lyn.f.dumalaog@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Balusbos, Buruanga, Aklan', 11.8559738, 121.8932592, '9155037447', 'Aklan: Buruanga', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 138: Arnicole B. Luces
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Arnicole B. Luces', 'arnicole.b.luces@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Datu Magsugod Street, Poblacion, Batan, Aklan', 11.5845053, 122.4990828, '9128018208', 'Aklan: Batan', 'NC Aklan', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 139: Rhoda Valkyrie H. Aban
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rhoda Valkyrie H. Aban', 'rhoda.valkyrie.h.aban@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Binirayan, Brgy. 5, San Jose, Antique', 10.7489069, 121.9412608, '0916-8233-655/ 0927-819-6178', 'Antique: San Jose', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 140: Krizzia Marie S. Entrina
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Krizzia Marie S. Entrina', 'krizzia.marie.s.entrina@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Malabor, Tibiao, Antique', 11.2788889, 122.0468106, '0927-038-6389', 'Antique: San Jose', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 141: Crispino Ross M. Lacatan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Crispino Ross M. Lacatan', 'crispino.ross.m.lacatan@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Poblacion 2, Hamtic, Antique', 10.6957397, 121.9821462, '0961-065-1272', 'Antique: Caluya', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 142: Kristel V. Unilongo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kristel V. Unilongo', 'kristel.v.unilongo@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Centro Weste, Libertad, Antique', 11.7720393, 121.9145986, '0967-224-2594', 'Antique: Libertad', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 143: Aimee B. Opeña
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Aimee B. Opeña', 'aimee.b.opeña@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 8, Aureliana, Patnongon, Antique', 10.8843244, 121.9899648, '0997-887-2636', 'Antique: Patnongon', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 144: Prince M. Calawag
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Prince M. Calawag', 'prince.m.calawag@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 1, Poblacion, Tibiao, Antique', 12.6678893, 123.9881393, '0976-003-1192', 'Antique: Tibiao', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 145: Clark Iven R. Espraguera
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Clark Iven R. Espraguera', 'clark.iven.r.espraguera@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Ducado St., Ubos, Valderrama, Antique', 11.0111117, 122.1320237, '0935-927-8003', 'Antique: Valderrama', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 146: Hena Joy G. Riomalos
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Hena Joy G. Riomalos', 'hena.joy.g.riomalos@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Callan, Sebaste, Antique', 11.6633562, 122.1004583, '0945-094-1554', 'Antique: Sebaste', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 147: Emily T. Maniba
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Emily T. Maniba', 'emily.t.maniba@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Casay Viejo, Anini-y, Antique', 10.4487921, 121.9942293, '9058954025', 'Antique: Hamtic', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 148: Mary Luz F. Salazar
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mary Luz F. Salazar', 'mary.luz.f.salazar@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Malacañang, Culasi, Antique', 11.4056139, 122.0567556, '0907-290-6545/0927-038-5892', 'Antique: Culasi', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 149: Aaron G. Basañes
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Aaron G. Basañes', 'aaron.g.basañes@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Esperanza 1st Sibalom, Antique', 10.7833455, 122.0166723, '09293253117/09351719958', 'Antique: Sibalom', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 150: Julie Ann Moquerio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Julie Ann Moquerio', 'julie.ann.moquerio@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Igpalge, Anini-y, Antique', 10.4609636, 121.9842786, '09480494559/ 09650523659', 'Antique: Anini-y', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 151: Fritzie Mae N. Tandoy
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Fritzie Mae N. Tandoy', 'fritzie.mae.n.tandoy@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 4, Aureliana, Patnongon, Antique', 10.8654543, 121.9714835, '0935-330-5633', 'Antique: Belison', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 152: Jenny Vi Rizardo-Cabayao
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jenny Vi Rizardo-Cabayao', 'jenny.vi.rizardo.cabayao@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Ilaya, Bugasong, Antique', 11.1016314, 122.1405413, '0919-224-9290', 'Antique: Bugasong', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 153: Olive Mae A. Tumugdan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Olive Mae A. Tumugdan', 'olive.mae.a.tumugdan@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Catmon, Sibalom, Antique', 10.7777359, 122.0254969, '9266253826', 'Antique: San Remegio', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 154: Cassandra E. Bulala
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Cassandra E. Bulala', 'cassandra.e.bulala@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Poblacion, Barbaza, Antique', 11.1938032, 122.0425482, '0930-193-1526', 'Antique: Barbaza', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 155: Noveliza L. Samulde
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Noveliza L. Samulde', 'noveliza.l.samulde@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Intao, Laua-an, Antique', 11.1562766, 122.0453898, '0916-157-9102/09938738900', 'Antique: Laua an', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 156: Nikko Jon T. Rubite
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Nikko Jon T. Rubite', 'nikko.jon.t.rubite@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Paciencia, Tobias Fornier, Antique', 10.5017484, 121.9274003, '0921-5704792', 'Antique: Tobias Fornier', 'NC Antique', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 157: Juan Carlos V. Corros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Juan Carlos V. Corros', 'juan.carlos.v.corros@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Bgry. Tiza, Roxas City, Capiz', 11.5789658, 122.7600012, '9290874942', 'Capiz: Roxas City', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 158: Rudylyn Demandaco
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rudylyn Demandaco', 'rudylyn.demandaco@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Baybay, Roxas City, Capiz', 11.5995647, 122.7435459, '9959454785', 'Capiz: Roxas City', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 159: Celeene Bautigas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Celeene Bautigas', 'celeene.bautigas@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Cagay, Roxas City, Capiz', 11.5683009, 122.7356733, '9151533160', 'Capiz: Roxas City', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 160: Jennifer Jore
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jennifer Jore', 'jennifer.jore@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Cagay, Roxas City, Capiz', 11.5683009, 122.7356733, '9176553092', 'Capiz: Roxas City', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 161: Diether B. Dela Torre
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Diether B. Dela Torre', 'diether.b.dela.torre@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bato-Bato Mambusao, Capiz', 11.4227804, 122.6037218, '9564138647', 'Capiz: Mambusao', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 162: Shaina Jade A. Arcega
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Shaina Jade A. Arcega', 'shaina.jade.a.arcega@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Sibaguan, Roxas City, Capiz', 11.5465366, 122.7392341, '9913249993', 'Capiz: Pontevedra', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 163: Raymund Q. Santuyo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Raymund Q. Santuyo', 'raymund.q.santuyo@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bangonbangon Sigma Capiz', 11.4327379, 122.7124903, '9439138371', 'Capiz: Sigma', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 164: Richie L. Losaria
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Richie L. Losaria', 'richie.l.losaria@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bag-ong Barrio, Tapaz, Capiz', 11.2537341, 122.5736842, '9487468536', 'Capiz: Tapaz', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 165: Jesrel S. Ocampo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jesrel S. Ocampo', 'jesrel.s.ocampo@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Poblacion Proper,Mambusao,Capiz', 11.4312573, 122.5952415, '9661684372', 'Capiz: Dao', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 166: Florie John I. Ucag
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Florie John I. Ucag', 'florie.john.i.ucag@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Lucero, Jamindan, Capiz', 11.5315294, 122.3620341, '9465560940', 'Capiz: Jamindan', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 167: May Ann C. de Pedro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('May Ann C. de Pedro', 'may.ann.c.de.pedro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Poblacion, Sapian, Capiz', 11.4963355, 122.5994817, '9301161575', 'Capis: Sapian', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 168: Joseph R. Badoles
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Joseph R. Badoles', 'joseph.r.badoles@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'San Esteban Village Phase 1, Brgy. Rizal, Pontevedra, Capiz', 12.6678893, 123.9881393, '9764288184', 'Capiz: Pilar', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 169: Ella Marie Escamilla
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ella Marie Escamilla', 'ella.marie.escamilla@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Candual, Panay, Capiz', 11.5319913, 122.7788248, '9128222185', 'Capiz: Panit-an', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 170: Liezel Joy Haberle Dellava
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Liezel Joy Haberle Dellava', 'liezel.joy.haberle.dellava@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Concepcion, Dumalag, Capiz', 11.2998658, 122.6079616, '9385674432', 'Capiz: Dumalag', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 171: Michelle F. Felasol
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Michelle F. Felasol', 'michelle.f.felasol@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Concepcion, Dumalag, Capiz', 11.2998658, 122.6079616, '9317665885', 'Capiz: Dumarao', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 172: Camille H. Albaña
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Camille H. Albaña', 'camille.h.albaña@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Intampilan, Panitan, Capiz', 11.48289, 122.7661258, '9485192545', 'Capiz: Ivisan', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 173: Hugo Andreas Sebastian F. Almasol
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Hugo Andreas Sebastian F. Almasol', 'hugo.andreas.sebastian.f.almasol@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Poblacion, Dumalag, Capiz', 11.3076625, 122.6249195, NULL, 'Capiz: Maayon', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 174: Marny Bagamasbad
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Marny Bagamasbad', 'marny.bagamasbad@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Oducado Compound, Brgy. Lawa-an, Roxas City, Capiz', 11.554595, 122.7585426, '9480272478', 'Capiz: Cuartero', 'NC Capiz', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 175: Normel E. Galvan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Normel E. Galvan', 'normel.e.galvan@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Alaguisoc, Jordan, Guimaras', 10.6193039, 122.5994817, '09514397883', 'Guimaras: Jordan (DTI)', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 176: Rosemarie G. Gajete
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rosemarie G. Gajete', 'rosemarie.g.gajete@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Calaya, Nueva Valencia, Guimaras', 10.4737199, 122.588174, '09303148653', 'Guimaras: Jordan (DTI)', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 177: Rhea G. Morada
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rhea G. Morada', 'rhea.g.morada@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'San Roque, Buenavista, Guimaras', 10.6813483, 122.6560016, '09474646589', 'Guimaras: Jordan (DTI)', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 178: Fe B. Tumangan
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Fe B. Tumangan', 'fe.b.tumangan@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Dagubdob Concordia, Sibunag, Guimaras', 10.5008371, 122.650351, '09275902285', 'Guimaras: Jordan (DTI)', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 179: Michelle G. Toledano
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Michelle G. Toledano', 'michelle.g.toledano@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Buluangan, Jordan, Guimaras', 10.5636051, 122.5514155, '09100792865', 'Guimaras: Nueva Valencia', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 180: Glory Ann P. Ganancial
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Glory Ann P. Ganancial', 'glory.ann.p.ganancial@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Poblacion, Jordan, Guimaras', 10.6487124, 122.5994817, '09305319847', 'Guimaras: Jordan (LGU)', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 181: Ruth G. Penuela
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ruth G. Penuela', 'ruth.g.penuela@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'San Miguel, Jordan, Guimaras', 10.5912127, 122.588174, '9128127458', 'Guimaras: Buenavista', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 182: Ghea E. Rodriguez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ghea E. Rodriguez', 'ghea.e.rodriguez@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sapal, San Lorenzo, Guimaras', 10.5525337, 122.6475256, '9075079085', 'Guimaras: San Lorenzo', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 183: Jessa Marie P. Tibajares
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jessa Marie P. Tibajares', 'jessa.marie.p.tibajares@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sabang, Sibunag, Guimaras', 10.496595, 122.6447001, '9958066704', 'Guimaras: Sibunag', 'NC Guimaras', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 184: Charlene Joy Altillero-Adeja
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Charlene Joy Altillero-Adeja', 'charlene.joy.altillero.adeja@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Magbato, Lambunao, Iloilo', 11.0332009, 122.4732685, '09502045750', 'Iloilo: Iloilo City (DTI)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 185: Mary Ann Alteros
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mary Ann Alteros', 'mary.ann.alteros@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Botong, Oton, Iloilo', 10.6944099, 122.4382307, '09608584772', 'Iloilo: Iloilo City (DTI)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 186: Wilma N. Semillano
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Wilma N. Semillano', 'wilma.n.semillano@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Buenavista Norte Miagao, Iloilo', 10.6510947, 122.1845382, '09702067317', 'Iloilo: Iloilo City (DTI)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 187: Catherine P. Layes
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Catherine P. Layes', 'catherine.p.layes@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Aganan, Pavia, Iloilo', 10.7667125, 122.5344456, '9750097349', 'Iloilo: Iloilo City (DTI)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 188: Gerard Steven T. Montero
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Gerard Steven T. Montero', 'gerard.steven.t.montero@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Magsaysay Village, La Paz, Iloilo City', 10.71132, 122.5620202, '9166104916', 'Iloilo: City of Passi', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 189: Queennie Hope S. Legaste
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Queennie Hope S. Legaste', 'queennie.hope.s.legaste@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Tapikan, San Joaquin, Iloilo', 10.6103438, 122.1660332, '09063328810', 'Iloilo: Concepcion', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 190: Sherlyn Y. Canales
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Sherlyn Y. Canales', 'sherlyn.y.canales@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Rizal, Jordan, Guimaras', 10.6662011, 122.5966549, '9993902066', 'Iloilo: Iloilo City (Provincial Capitol)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 191: Daisy Joy T. Darroca
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Daisy Joy T. Darroca', 'daisy.joy.t.darroca@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Misi, Lambunao, Iloilo', 11.0528933, 122.4578307, '0998-3362-190', 'Iloilo: Lambunao', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 192: Jamie Anne V. Sermonia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jamie Anne V. Sermonia', 'jamie.anne.v.sermonia@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, '17 Quezon St., Miagao, Iloilo', 10.646659, 122.2330963, '9553412009', 'Iloilo: Miagao', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 193: Era Jane G. Gonzales
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Era Jane G. Gonzales', 'era.jane.g.gonzales@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Cagbang, Oton', 10.701258, 122.5061563, '09125143232', 'Iloilo: Oton', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 194: Myra Lee C. Panganiban
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Myra Lee C. Panganiban', 'myra.lee.c.panganiban@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Deca 2 Ph 1 Blk 33 Lot 23 Jibao-an, Pavia, Iloilo', 10.7546216, 122.5118148, '0907-1427863', 'Iloilo: Pavia', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 195: Marian B. Magno
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Marian B. Magno', 'marian.b.magno@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Cabolo-an Sur, Oton, Iloilo', 10.742122, 122.4821044, '9505152724', 'Iloilo: San Miguel', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 196: Rosa Mae F. Cabangal
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rosa Mae F. Cabangal', 'rosa.mae.f.cabangal@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bularan, Banate, Iloilo', 11.0028578, 122.8236113, '9064856463', 'Iloilo: Banate', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 197: Liezene C. Vega
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Liezene C. Vega', 'liezene.c.vega@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Apelo, Sara, Iloilo', 11.2496252, 122.9747512, '9929190471', 'Iloilo: Ajuy', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 198: Krizzielle Mhae D. Dayon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Krizzielle Mhae D. Dayon', 'krizzielle.mhae.d.dayon@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, '183-E Brgy. Bonifacio Tanza, Iloilo City', 10.6924504, 122.5581319, '9388776538', 'Iloilo: Zarraga', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 199: Ram Ydnar Ely S. Tribulete
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ram Ydnar Ely S. Tribulete', 'ram.ydnar.ely.s.tribulete@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Allera Street, Tigbauan, Iloilo', 10.6729689, 122.3770357, '9691346437', 'Iloilo: Guimbal', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 200: Leo L. Siwanag
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Leo L. Siwanag', 'leo.l.siwanag@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Cagamutan Sur, Leganes, Iloilo', 10.7933991, 122.5895875, '9509448125', 'Iloilo: Barotac Nuevo', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 201: Airesh Q. Castor
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Airesh Q. Castor', 'airesh.q.castor@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Macatol, Pototan, Iloilo', 10.9716688, 122.6305715, '9501419897', 'Iloilo: Pototan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 202: Trisha D. De Julian
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Trisha D. De Julian', 'trisha.d.de.julian@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Bat-os, Tambaliza, Concepcion, Iloilo', 11.2777607, 123.1632665, '9814960156', 'Iloilo: Estancia', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 203: Scotch Mendel C. Gimoto
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Scotch Mendel C. Gimoto', 'scotch.mendel.c.gimoto@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, '29 C Arguelles st. Jaro Iloilo City', 10.7262609, 122.5551061, '9073386987', 'Iloilo: Santa Barbara', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 204: Claire M. Sobreguel
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Claire M. Sobreguel', 'claire.m.sobreguel@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Baluyan Cabatuan, Iloilo', 10.9082119, 122.4922683, '9485049616', 'Iloilo: Cabatuan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 205: Charie Joy T. Taganos
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Charie Joy T. Taganos', 'charie.joy.t.taganos@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Z-5 Molo Boulevard, Iloilo City', 10.6882652, 122.5492944, '9094343660', 'Iloilo: Leon', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 206: Jeryl C. Glory
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jeryl C. Glory', 'jeryl.c.glory@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bliss Site, Dalid, Calinog, Iloilo', 11.1097275, 122.5323242, '9663151753', 'Iloilo: Calinog', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 207: Vic Alizon P. Morena
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Vic Alizon P. Morena', 'vic.alizon.p.morena@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Santiago, Barotac Viejo, Iloilo', 11.0541855, 122.904318, '9278167436', 'Iloilo: Barotac Viejo', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 208: Crisian Rex P. Casiple
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Crisian Rex P. Casiple', 'crisian.rex.p.casiple@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Villa Carolina, Arevalo, Iloilo City', 10.6828635, 122.5192411, '9489219929', 'Iloilo: Dingle', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 209: Stephanie E. Robles
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Stephanie E. Robles', 'stephanie.e.robles@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Ubos Ilaya, Miagao Iloilo', 10.6459481, 122.2348997, '9298853031', 'Iloilo: San Joaquin', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 210: Ehvonne B. Cañete
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ehvonne B. Cañete', 'ehvonne.b.cañete@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Zerrudo, Sara, Iloilo', 11.2319512, 123.0314287, '9309378193', 'Iloilo: Sara', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 211: Daniellee D. Hortillas
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Daniellee D. Hortillas', 'daniellee.d.hortillas@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, '2nd St., Manuela Subd., Brgy. Cagamutan Sur, Leganes, Iloilo', 10.7886254, 122.5960956, '9397161100', 'Iloilo: Leganes', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 212: Tasha Marie B. Mondia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Tasha Marie B. Mondia', 'tasha.marie.b.mondia@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Santa Monica, Oton, Iloilo', 10.7443565, 122.4523855, '9465250947', 'Iloilo: Tigbauan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 213: Niño  Anthony V. Eder
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Niño  Anthony V. Eder', 'niño.anthony.v.eder@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Barangay Tabat, Tubungan, Iloilo', 10.753766, 122.307917, '9480478042', 'Iloilo: Tubungan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 214: Lady Joy M. Haro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lady Joy M. Haro', 'lady.joy.m.haro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Lambuyao Oton,Iloilo', 10.6943049, 122.4877987, '9457096850', 'ILOILO: Alimodian', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 215: Albert C. Mabuhay
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Albert C. Mabuhay', 'albert.c.mabuhay@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Don T. Lutero Center, Janiuay, Iloilo', 10.9505405, 122.5045648, '9179023191', 'ILOILO: Janiuay', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 216: Genipearl Myrvic R. Paulino
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Genipearl Myrvic R. Paulino', 'genipearl.myrvic.r.paulino@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Jardin Dumangas, Iloilo', 10.8152189, 122.7167257, '9187619301', 'ILOILO: Dumangas', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 217: Radzmy Philip J. Fernandez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Radzmy Philip J. Fernandez', 'radzmy.philip.j.fernandez@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Poblacion, San Dionisio, Iloilo', 11.2704009, 123.0943734, '9162786299', 'ILOILO: San Dionisio', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 218: Disa B. Bretaña
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Disa B. Bretaña', 'disa.b.bretaña@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Cubay, San Dionisio, Iloilo', 11.3414107, 123.0951664, '9811571495', 'ILOILO: Carles', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 219: Janine D. Salanio
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Janine D. Salanio', 'janine.d.salanio@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Singay, Mina, Iloilo', 10.9246739, 122.5811061, '9617954231', 'ILOILO: Mina', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 220: Hannah Grace L. Barrato
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Hannah Grace L. Barrato', 'hannah.grace.l.barrato@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Budiaue, Badiangan, Iloilo', 10.9677644, 122.549252, '9165444758', 'ILOILO: Badiangan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 221: Rouella O. Suarez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Rouella O. Suarez', 'rouella.o.suarez@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Zone 4 Brgy. Daja, Maasin, Iloilo', 10.9143949, 122.4366235, '09506217131/09919648385', 'ILOILO: Maasin', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 222: Joella M. Opina
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Joella M. Opina', 'joella.m.opina@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Baclayan, New Lucena, Iloilo', 10.8688397, 122.5853469, '09151773815/09511355216', 'ILOILO: New Lucena', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 223: Eden Grace A. Perez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Eden Grace A. Perez', 'eden.grace.a.perez@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Balibagan Oeste, Sta. Barbara, Iloilo', 10.8072847, 122.5132294, '9519132844', 'ILOILO: Iloilo City (City Hall BRC)', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 224: Kitchie Jardeliza
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kitchie Jardeliza', 'kitchie.jardeliza@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Gaub, Cabatuan, Iloilo', 10.8450981, 122.4948384, '9350367290', 'ILOILO: Bingawan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 225: Francine B. Demasis
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Francine B. Demasis', 'francine.b.demasis@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Janipaan Olo Cabatuan, Iloiilo', 10.9267516, 122.5118148, '9514260469', 'ILOILO: Dueñas', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 226: Christian N. Torreflores
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Christian N. Torreflores', 'christian.n.torreflores@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Tabunacan, Miagao, Iloilo', 10.6383559, 122.1937611, '9266524773', 'ILOILO: Igbaras', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 227: Ruthchel M. Villanueva II
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ruthchel M. Villanueva II', 'ruthchel.m.villanueva.ii@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Alinsolong, Batad, Iloilo', 11.3979673, 123.1365586, '9300350013', 'Iloilo: Batad', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 228: Claire B. Villaruel
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Claire B. Villaruel', 'claire.b.villaruel@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Bagacay, San Rafael, Iloilo', 11.1749368, 122.8620343, '9095541949', 'Iloilo: San Enrique', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 229: Jashen B. Eduque
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jashen B. Eduque', 'jashen.b.eduque@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy. Nalumsan, Carles, Iloilo', 11.4966079, 123.0873408, '9307300283', 'Iloilo: Balasan', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 230: Meriza B. Avanceña
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Meriza B. Avanceña', 'meriza.b.avanceña@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Brgy.Calaigang, San Rafael, Iloilo', 11.1812454, 122.8507557, '9486511378', 'Iloilo: San Rafael', 'NC Iloilo', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 231: Maybel R. Obcena
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Maybel R. Obcena', 'maybel.r.obcena@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'San Juan St., Barangay 10, Bacolod City, Negros Occidental', 10.6735095, 122.9468651, '9481351612', 'Negros Occidental: Bacolod City (DTI)', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 232: Liza F. Ganchoon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Liza F. Ganchoon', 'liza.f.ganchoon@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Alunan Avenue, Brgy. 35, Bacolod City, Negros Occidental', 10.6658736, 122.9368427, '09293581534', 'Negros Occidental: Bacolod City (DTI)', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 233: Harklee D. Granada
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Harklee D. Granada', 'harklee.d.granada@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Blk 51 Lot14 Deca Homes South, Brgy.Cabug, Bacolod City, Negros Occoidental', 10.5954912, 122.9486755, '9053070285', 'Negros Occidental: Bacolod City (DTI)', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 234: Jann Ronan E. Serfino
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jann Ronan E. Serfino', 'jann.ronan.e.serfino@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Blk 4 Lot 2 Villasor Subd., Brgy. Handumanan, Bacolod City, Negros Occidental', 10.6283354, 122.9288601, '9617393594', 'Negros Occidental: Bacolod City (Provincial Capitol)', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 235: Zarrah Jane Desbaro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Zarrah Jane Desbaro', 'zarrah.jane.desbaro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Rafael Salas Dr, Brgy. Sampinit, Bago City, Negros Occidental', 10.503405, 122.9663018, '9952615233', 'Negros Occidental: Bago City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 236: Victor Ed Anthony G. Alamon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Victor Ed Anthony G. Alamon', 'victor.ed.anthony.g.alamon@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 2, Brgy. Linao, Kabankalan City, Negros Occidental', 9.983241, 122.7915222, '9707424479', 'Negros Occidental: City of Kabankalan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 237: Jermilyn U. Pollenza
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jermilyn U. Pollenza', 'jermilyn.u.pollenza@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 11, Brgy. Poblacion, Cauayan, Negros Occidental', 9.9532504, 122.6220934, '09774904151/09385246385', 'Negros Occidental: City of Sipalay', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 238: Raquel C. Hernando
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Raquel C. Hernando', 'raquel.c.hernando@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Zone 4, VMC Site, Brgy. VI-A, Victorias City, 6119, Negros Occidental', 10.9066613, 123.0739775, '9196148981', 'Negros Occidental: City of Victorias', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 239: Mary Ann Raymundo Moran
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Mary Ann Raymundo Moran', 'mary.ann.raymundo.moran@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Relocation Site 1, Proper, Barangay Batuan, La Carlota City, Negros Occidental', 10.4457669, 122.9066572, '9924346416', 'Negros Occidental: La Carlota City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 240: Loreme Ongsuco Geaga
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Loreme Ongsuco Geaga', 'loreme.ongsuco.geaga@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Julita Drive, Villa Julita Subdivision, Brgy. IV Pob., Himamaylan City, Negros Occidental', 10.0966796, 122.8845878, '9178965751/09262004283', 'Negros Occidental: Himamaylan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 241: Glynes L. Suarez
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Glynes L. Suarez', 'glynes.l.suarez@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 1, Brgy. Tiling Cauayan, Negros Occidental', 12.6678893, 123.9881393, '09278900903/09916779962', 'Negros Occidental: Cauayan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 242: Kiara C. Lorezco
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kiara C. Lorezco', 'kiara.c.lorezco@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 1, Brgy. 2 Poblacion, Hinoba-an, Negros Occidental', 9.6004912, 122.472093, '9102728705', 'Negros Occidental: Hinobaan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 243: Kimberly Fajardo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kimberly Fajardo', 'kimberly.fajardo@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Crossing Moises, Brgy. Camangcamang, Isabela, Negros Occidental', 10.1717729, 122.9936717, '9388900363', 'Negros Occidental: Isabela', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 244: John Paul U. Montano
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('John Paul U. Montano', 'john.paul.u.montano@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Rizal St., Brgy. 3 (Pob.), San Carlos City, Negros Occidental', 10.4825015, 123.4213351, '9662365358', 'Negros Occidental: San Carlos City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 245: Ma. Bernadette Clare F. Casidsid
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ma. Bernadette Clare F. Casidsid', 'ma.bernadette.clare.f.casidsid@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok Golden Rosary, Brgy. Enclaro, Binalbagan, Negros Occ.', 10.177002, 122.8583166, '9108064313', 'Negros Occidental: Binalbagan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 246: Dexter S. Casumpang
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Dexter S. Casumpang', 'dexter.s.casumpang@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Narra Heights, Brgy. Tinampa-an, Cadiz City, Negros Occidental', 10.9263475, 123.309328, '0956 4014 666', 'Negros Occidental: Cadiz City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 247: Lyka Joyce Obello
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Lyka Joyce Obello', 'lyka.joyce.obello@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Varca St. Toril, Brgy. Balintawak, Escalante City, Neg. Occ.', 10.8394993, 123.4969707, '9392440680', 'Negros Occidental: Escalante City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 248: Kenny Perylyn M. Abuyon
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kenny Perylyn M. Abuyon', 'kenny.perylyn.m.abuyon@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 1 Brgy. Palaka Valladolid, Negros Occidental', 10.4749625, 122.8218594, '9203993299', 'Negros Occidental: San Enrique', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 249: Ariesha Monica U. Espinosa
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Ariesha Monica U. Espinosa', 'ariesha.monica.u.espinosa@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok Ipil-Ipil, Brgy. San Juan, Pontevedra, Negros Occidental', 10.3526591, 122.9212265, '9942523568', 'Negros Occidental: Pontevedra', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 250: Kathrine Bianca V. Laguna
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kathrine Bianca V. Laguna', 'kathrine.bianca.v.laguna@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 1, Brgy. Magallon Cadre, Moises Padilla Negros Occidental', 10.2901888, 123.0845277, '9508950393', 'Negros Occidental: Talisay City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 251: Jamaica D. Unabia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jamaica D. Unabia', 'jamaica.d.unabia@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok Rambutan, Brgy. Bunga, Salvador Benedicto, Negros Occidental', 10.5419806, 123.2504913, '9851386054', 'Negros Occidental: Silay City', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 252: Kenneth D. Cubero
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Kenneth D. Cubero', 'kenneth.d.cubero@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Barangay Buenavista, Calatrava, Negros Occidental. 6126', 10.5473808, 123.4411559, '9155812126', 'NEGROS OCCIDENTAL: Toboso', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 253: Dale Lewis Belarma
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Dale Lewis Belarma', 'dale.lewis.belarma@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Blk 99 Lot 31, Phase 1, Cedric St., Celine Homes Subd., Brgy. Estefania, Bacolod City, Neg. Occ.', 10.6709646, 122.9944636, '09916774838/09474224195', 'NEGROS OCCIDENTAL: Valladolid', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 254: Karla Lu B. Delima
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Karla Lu B. Delima', 'karla.lu.b.delima@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, '<![CDATA[Lot 1 & 3 Blk. 5 San Esteban Phase 1, Brgy. Lag-asan, Bago City, Neg. Occ. 6101]]>', 17.3273706, 120.4530456, '09154992277', 'NEGROS OCCIDENTAL: Pulupandan', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 255: David John R. Rubido
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('David John R. Rubido', 'david.john.r.rubido@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok 6, Brgy. IX Daan Banwa, Victorias City, Negros Occidental', 10.9057608, 123.06624, '09567415383', 'NEGROS OCCIDENTAL: Manapla', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 256: Symon Angelo C. Albino
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Symon Angelo C. Albino', 'symon.angelo.c.albino@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Sitio Bumba, Brgy. Calampisawan, Calatrava, Negros Occidental', 10.610739, 123.4803889, '09667345842', 'NEGROS OCCIDENTAL: Calatrava', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 257: Niño R. Embodo
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Niño R. Embodo', 'niño.r.embodo@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok Tan-ag, Brgy. Damsite, Murcia, Negros Occidental 6129, Philippines', 10.5524636, 123.0057261, '9153670443/09650250839', 'NEGROS OCCIDENTAL: Murcia', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 258: Georitch Jude R. Bacarro
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Georitch Jude R. Bacarro', 'georitch.jude.r.bacarro@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Purok Caimito, Brgy. Bunga Don Salvador Benedicto Negros Occidental', 10.5419806, 123.2504913, '9478453657', 'NEGROS OCCIDENTAL: Don Salvador Benedicto', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Employee 259: Jerwin B. Garcia
INSERT INTO `users` (`name`, `email`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES ('Jerwin B. Garcia', 'jerwin.b.garcia@dti6.gov.ph', '$2y$12$LQv3c1yqBo9SkvXS7QTJde3TlKX.eBqz6Uxm6G5dE6anSHFcA.Gji', 0, '2026-03-04 14:41:47', '2026-03-04 14:41:47');
INSERT INTO `employee_locations` (`user_id`, `employee_id_no`, `address`, `latitude`, `longitude`, `mobile_no`, `office`, `employee_type`, `recorded_at`, `created_at`, `updated_at`) VALUES (LAST_INSERT_ID(), NULL, 'Q. Manzano St., Purok Rose, Brgy. East, Candoni, Negros Occidental', 9.8278553, 122.6440338, '9971676498', 'NEGROS OCCIDENTAL: Candoni', 'NC Negros Occidental', '2026-03-04 14:41:47', '2026-03-04 14:41:47', '2026-03-04 14:41:47');

-- Total: 259 users + 259 employee_locations