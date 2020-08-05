-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2017 at 07:17 AM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techyjus_hotel_cleaning`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

DROP TABLE IF EXISTS `banned_users`;
CREATE TABLE `banned_users` (
  `banned_id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'Philosophy');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_tasks`
--

DROP TABLE IF EXISTS `claimed_tasks`;
CREATE TABLE `claimed_tasks` (
  `claimed_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `claimed_date` datetime NOT NULL,
  `claimed_expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claimed_tasks`
--

INSERT INTO `claimed_tasks` (`claimed_id`, `task_id`, `student_id`, `claimed_date`, `claimed_expiration`) VALUES
(10, 4, 123456789, '2017-11-14 03:13:46', '2017-11-21 00:00:00'),
(12, 5, 1234156, '2017-11-15 12:33:47', '2017-11-22 00:00:00'),
(14, 6, 10923, '2017-11-15 03:16:17', '2017-11-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_tasks_bridge`
--

DROP TABLE IF EXISTS `claimed_tasks_bridge`;
CREATE TABLE `claimed_tasks_bridge` (
  `task_id` int(10) UNSIGNED NOT NULL,
  `claimed_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clicks`
--

DROP TABLE IF EXISTS `clicks`;
CREATE TABLE `clicks` (
  `click_id` bigint(100) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(10) UNSIGNED NOT NULL,
  `document_loc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`document_id`, `document_loc`) VALUES
(1, 'AstroCHARM_Equation_Notes_2_wCRP.pdf'),
(6, 'pdf-sample5.pdf'),
(7, 'pdf-sample6.pdf'),
(8, 'Don WIne.pdf'),
(9, 'Copperplate-Practice-sheet-w-letters.pdf'),
(10, 'doc2.doc'),
(11, 'doc1.docx'),
(12, 'Doc1.docx'),
(13, 'sample.docx'),
(14, 'pdf-sample7.pdf'),
(15, 'pdf-sample8.pdf'),
(16, 'pdf-sample9.pdf'),
(17, 'weasdasd.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `flagged_task`
--

DROP TABLE IF EXISTS `flagged_task`;
CREATE TABLE `flagged_task` (
  `flag_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `flag_comment` text NOT NULL,
  `flag_date` datetime NOT NULL,
  `flag_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flagged_task`
--

INSERT INTO `flagged_task` (`flag_id`, `task_id`, `user_id`, `flag_comment`, `flag_date`, `flag_status`) VALUES
(1, 6, 10923, 'test', '2017-11-15 15:12:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `personalised_stream`
--

DROP TABLE IF EXISTS `personalised_stream`;
CREATE TABLE `personalised_stream` (
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personalised_stream`
--

INSERT INTO `personalised_stream` (`category_id`, `user_id`, `total`) VALUES
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 123456789, 4),
(1, 1234156, 25),
(1, 1000000, 4),
(1, 100000022, 3),
(1, 10923, 9),
(1, 12323, 1),
(1, 123456790, 1),
(1, 123456791, 1),
(1, 500, 1),
(1, 123456792, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(32) NOT NULL,
  `subject_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag`, `subject_id`) VALUES
(1, 'productive', 1),
(2, 'loop', 2),
(3, 'ye', 3),
(4, 'yas', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `task_id` int(10) UNSIGNED NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `task_title` varchar(128) NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `task_description` text,
  `word_count` int(11) NOT NULL,
  `page_count` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `status_id` int(11) NOT NULL,
  `file_format` varchar(250) DEFAULT NULL,
  `tag` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `creator_id`, `task_title`, `subject_id`, `category_id`, `file_id`, `task_description`, `word_count`, `page_count`, `created_date`, `expiration_date`, `status_id`, `file_format`, `tag`) VALUES
(2, 123456789, 'tesst', 0, 1, 7, 'test', 34, 2, '2017-11-08', '2017-11-15', 1, 'pdf', ''),
(3, 123456789, 'test task', 0, 1, 8, 'task', 900, 7, '2017-11-14', '2017-11-21', 2, 'pdf', 'ye'),
(4, 1234156, 'test', 0, 1, 9, 'this is a test', 700, 5, '2017-11-14', '2017-11-21', 2, 'pdf', ''),
(5, 123456789, 'Task Title', 0, 1, 10, 'This is a task test', 400, 8, '2017-11-15', '2017-11-22', 2, 'doc', 'loop'),
(6, 123456789, 'Task Title', 0, 1, 11, 'This is a task test 2', 400, 8, '2017-11-15', '2017-11-22', 2, 'docx', 'loop'),
(7, 123456789, 'Test ', 0, 1, 12, 'This is a test', 400, 2, '2017-11-15', '2017-11-22', 1, 'pdf', 'loop'),
(8, 12323, 'blah', 0, 1, 13, 'blah', 100, 13, '2017-11-16', '2017-11-23', 1, 'docx', 'productive'),
(9, 123456789, 'tests', 0, 1, 14, 'test', 23, 43, '2017-11-20', '2017-11-27', 1, 'pdf', 'productive'),
(10, 123456789, 'test', 0, 0, 15, 'test', 23, 43, '2017-11-20', '2017-11-27', 1, 'pdf', 'productive'),
(11, 123456789, 'test', 0, 1, 16, 'test', 23, 43, '2017-11-20', '2017-11-27', 1, 'pdf', 'ye');

-- --------------------------------------------------------

--
-- Table structure for table `task_intermediate_tag`
--

DROP TABLE IF EXISTS `task_intermediate_tag`;
CREATE TABLE `task_intermediate_tag` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_intermediate_tag`
--

INSERT INTO `task_intermediate_tag` (`id`, `tag_id`, `task_id`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 2, 0),
(6, 1, 0),
(7, 4, 0),
(8, 3, 0),
(9, 1, 2),
(10, 3, 2),
(11, 2, 2),
(12, 4, 2),
(13, 1, 2),
(14, 2, 2),
(15, 3, 2),
(16, 4, 2),
(17, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status` (
  `status_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`status_id`, `status`) VALUES
(1, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `task_status_bridge`
--

DROP TABLE IF EXISTS `task_status_bridge`;
CREATE TABLE `task_status_bridge` (
  `status_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_tag_info`
--

DROP TABLE IF EXISTS `task_tag_info`;
CREATE TABLE `task_tag_info` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `subject_id` int(10) DEFAULT NULL,
  `reputation` int(10) DEFAULT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `first_name`, `last_name`, `email`, `subject_id`, `reputation`, `password`) VALUES
(1, 'Nial', 'Niall', 'Tim', 'neil44@yahoo.co.uk', 2, 40, 'Holly123.'),
(2, 'fdef', 'we', 'fwe', 'fwef', 0, NULL, 'ewfew'),
(3, 'ewqfdewqf', 'ewfwe', 'fwe', 'fwef', 0, NULL, 'wefwef'),
(4, 'tes', 't', 't', 'ete@UL.ie', 0, 0, 'test'),
(5, 'test', 't', 't', 'ewte@UL.ie', 0, 0, 'test'),
(6, 'testt', 't', 't', 'ewtee@UL.ie', 0, 0, 'test'),
(500, 'test500', 'test', 'test', 'test505@ul.ie', 0, 0, '$2y$12$kVmbwOppOtDxewT7TolvlOtvjOcIMq.Pty84NZXZvUeq0PkU59nDK'),
(10923, 'mrtest', 'test1', 'test11', 'test111@ul.ie', 0, 12, '$2y$12$m.ELERbWXGrIlMrdlZecHem8/vzV9borcyg4AvQPdcyVarZ/dZ..O'),
(12323, 'blah', 'blah', 'blah', 'blah@ul.ie', 0, 0, '$2y$12$TbWPpgk1ekmOs6ieg.SuQOuCL5sM2VJVZZWfHPwJBQ3kA3SwxvTwy'),
(1000000, 'test100', 'test', 'test', 'test1@ul.ie', 0, 10, '$2y$12$gxY0lD6L/FpK7LvhtQrkPOugjvUhe3FZrXRVfMtVpuprLzjAIjBpm'),
(1234156, 'testtest', 'Justin', 'test', 'test@ul.ie', 0, 120, '$2y$12$TgxQRNTxwfg5ctm8w444P.oq5D225WL7H2pFJPYaiQ.Ev6dVSK5LO'),
(100000022, 'tester', 'tester', 'tester', 'tester@ul.ie', 0, 0, '$2y$12$/IrQPdaCpFxe73UH6434jefMB2fVVt.5j8UQHiIhYYbGWNpUR60Uq'),
(123456789, 'justinx', 'justintest', 'testtest', 'justitesn@ul.ie', 0, 10, ''),
(123456790, 'test2', 'tetasd', 'tes', 'testee@ul.ie', 0, 0, '$2y$12$hP9Tmm/x0/O3yXrsF6fejeHZUfKhb2BYrCJ6rMXypr4lUIwFkRWhC'),
(123456791, 'testtt', 'test', 'test', 'testttttttt@ul.ie', 0, 0, '$2y$12$BtowybT2ykwtIecdxPDAvOKLvtV7qYglQSDisZw/9H5g7T3Io8qsW'),
(123456792, 'te', 't', 't', 't@ul.ie', 0, 0, '$2y$12$my0thT4smMHojx11GdBnEu1YPyuULbO5810vgA4JEIzbl4Y0Cplki');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banned_users`
--
ALTER TABLE `banned_users`
  ADD PRIMARY KEY (`banned_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD PRIMARY KEY (`claimed_id`);

--
-- Indexes for table `claimed_tasks_bridge`
--
ALTER TABLE `claimed_tasks_bridge`
  ADD PRIMARY KEY (`task_id`,`claimed_id`);

--
-- Indexes for table `clicks`
--
ALTER TABLE `clicks`
  ADD PRIMARY KEY (`click_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `flagged_task`
--
ALTER TABLE `flagged_task`
  ADD PRIMARY KEY (`flag_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `task_intermediate_tag`
--
ALTER TABLE `task_intermediate_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `task_status_bridge`
--
ALTER TABLE `task_status_bridge`
  ADD PRIMARY KEY (`status_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `task_tag_info`
--
ALTER TABLE `task_tag_info`
  ADD PRIMARY KEY (`tag_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banned_users`
--
ALTER TABLE `banned_users`
  MODIFY `banned_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  MODIFY `claimed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `clicks`
--
ALTER TABLE `clicks`
  MODIFY `click_id` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `flagged_task`
--
ALTER TABLE `flagged_task`
  MODIFY `flag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `task_intermediate_tag`
--
ALTER TABLE `task_intermediate_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `status_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456793;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `banned_users`
--
ALTER TABLE `banned_users`
  ADD CONSTRAINT `banned_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tasks` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD CONSTRAINT `claimed_tasks_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `claimed_tasks_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `claimed_tasks_bridge` (`task_id`) ON UPDATE CASCADE;

--
-- Constraints for table `claimed_tasks_bridge`
--
ALTER TABLE `claimed_tasks_bridge`
  ADD CONSTRAINT `claimed_tasks_bridge_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clicks`
--
ALTER TABLE `clicks`
  ADD CONSTRAINT `clicks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `clicks_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON UPDATE CASCADE;

--
-- Constraints for table `flagged_task`
--
ALTER TABLE `flagged_task`
  ADD CONSTRAINT `flagged_task_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `task_status_bridge`
--
ALTER TABLE `task_status_bridge`
  ADD CONSTRAINT `task_status_bridge_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `task_status_bridge_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `task_status` (`status_id`) ON UPDATE CASCADE;

--
-- Constraints for table `task_tag_info`
--
ALTER TABLE `task_tag_info`
  ADD CONSTRAINT `task_tag_info_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `task_tag_info_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
