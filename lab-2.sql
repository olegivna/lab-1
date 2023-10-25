-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Жов 25 2023 р., 22:20
-- Версія сервера: 10.4.28-MariaDB
-- Версія PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `інтернет-магазин`
--

-- --------------------------------------------------------

--
-- Структура таблиці `деталі_замовлення`
--

CREATE TABLE `деталі_замовлення` (
  `id` int(11) NOT NULL,
  `замовлення_id` int(11) DEFAULT NULL,
  `товар_id` int(11) DEFAULT NULL,
  `кількість` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `замовлення`
--

CREATE TABLE `замовлення` (
  `id` int(11) NOT NULL,
  `дата` date DEFAULT NULL,
  `сума` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `категорії`
--

CREATE TABLE `категорії` (
  `id` int(11) NOT NULL,
  `назва` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `клієнти`
--

CREATE TABLE `клієнти` (
  `id` int(11) NOT NULL,
  `імя` varchar(100) DEFAULT NULL,
  `електронна_пошта` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `товари`
--

CREATE TABLE `товари` (
  `id` int(11) NOT NULL,
  `назва` varchar(100) DEFAULT NULL,
  `ціна` decimal(10,2) DEFAULT NULL,
  `категорія_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `деталі_замовлення`
--
ALTER TABLE `деталі_замовлення`
  ADD PRIMARY KEY (`id`),
  ADD KEY `замовлення_id` (`замовлення_id`),
  ADD KEY `товар_id` (`товар_id`);

--
-- Індекси таблиці `замовлення`
--
ALTER TABLE `замовлення`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `категорії`
--
ALTER TABLE `категорії`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `клієнти`
--
ALTER TABLE `клієнти`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `товари`
--
ALTER TABLE `товари`
  ADD PRIMARY KEY (`id`),
  ADD KEY `категорія_id` (`категорія_id`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `деталі_замовлення`
--
ALTER TABLE `деталі_замовлення`
  ADD CONSTRAINT `деталі_замовлення_ibfk_1` FOREIGN KEY (`замовлення_id`) REFERENCES `замовлення` (`id`),
  ADD CONSTRAINT `деталі_замовлення_ibfk_2` FOREIGN KEY (`товар_id`) REFERENCES `товари` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `товари`
--
ALTER TABLE `товари`
  ADD CONSTRAINT `товари_ibfk_1` FOREIGN KEY (`категорія_id`) REFERENCES `категорії` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
