-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 26 2026 г., 14:35
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `logitpv24baas`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `Category_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`idCategory`, `Category_Name`) VALUES
(1, 'elektroonika'),
(2, 'kommid');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`idCustomer`, `Name`, `Contact`) VALUES
(1, 'Milana Smolenko', 'msmil@gmail.ee'),
(2, 'Karolina Oshlakova', 'karolina@gmail.ee');

-- --------------------------------------------------------

--
-- Структура таблицы `kaup`
--

CREATE TABLE `kaup` (
  `kauba_kood` int(11) NOT NULL,
  `nimetus` varchar(50) NOT NULL,
  `liigi_kood` int(11) NOT NULL,
  `hind` decimal(10,2) DEFAULT NULL CHECK (`hind` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `kaup`
--

INSERT INTO `kaup` (`kauba_kood`, `nimetus`, `liigi_kood`, `hind`) VALUES
(1, 'Samsung', 1, 1500.00),
(2, 'šokolaad', 2, 2.50);

-- --------------------------------------------------------

--
-- Структура таблицы `liik`
--

CREATE TABLE `liik` (
  `liigi_kood` int(11) NOT NULL,
  `nimetus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `liik`
--

INSERT INTO `liik` (`liigi_kood`, `nimetus`) VALUES
(1, 'elektroonika'),
(2, 'toit');

-- --------------------------------------------------------

--
-- Структура таблицы `müük`
--

CREATE TABLE `müük` (
  `müügi_kood` int(11) NOT NULL,
  `kauba_kood` int(11) NOT NULL,
  `ostja_kood` int(11) NOT NULL,
  `arv` int(11) DEFAULT NULL CHECK (`arv` > 0),
  `kuupäev` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `Price` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`idProduct`, `Name`, `idCategory`, `Price`) VALUES
(1, 'iPhone', 1, 1200.00),
(2, 'Coca-Cola', 2, 5.50);

-- --------------------------------------------------------

--
-- Структура таблицы `sale`
--

CREATE TABLE `sale` (
  `idSale` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `Count_pr` int(11) DEFAULT NULL CHECK (`Count_pr` > 0),
  `Date_of_sale` date DEFAULT curdate(),
  `Units` varchar(20) DEFAULT 'tk'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sale`
--

INSERT INTO `sale` (`idSale`, `idProduct`, `idCustomer`, `Count_pr`, `Date_of_sale`, `Units`) VALUES
(1, 1, 1, 1, '2026-04-26', 'tk'),
(2, 2, 2, 3, '2026-04-26', 'pakk');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Индексы таблицы `kaup`
--
ALTER TABLE `kaup`
  ADD PRIMARY KEY (`kauba_kood`),
  ADD KEY `liigi_kood` (`liigi_kood`);

--
-- Индексы таблицы `liik`
--
ALTER TABLE `liik`
  ADD PRIMARY KEY (`liigi_kood`),
  ADD UNIQUE KEY `nimetus` (`nimetus`);

--
-- Индексы таблицы `müük`
--
ALTER TABLE `müük`
  ADD PRIMARY KEY (`müügi_kood`),
  ADD KEY `kauba_kood` (`kauba_kood`),
  ADD KEY `ostja_kood` (`ostja_kood`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Индексы таблицы `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`idSale`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idCustomer` (`idCustomer`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `idCustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `kaup`
--
ALTER TABLE `kaup`
  MODIFY `kauba_kood` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `liik`
--
ALTER TABLE `liik`
  MODIFY `liigi_kood` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `müük`
--
ALTER TABLE `müük`
  MODIFY `müügi_kood` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `sale`
--
ALTER TABLE `sale`
  MODIFY `idSale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `kaup`
--
ALTER TABLE `kaup`
  ADD CONSTRAINT `kaup_ibfk_1` FOREIGN KEY (`liigi_kood`) REFERENCES `liik` (`liigi_kood`);

--
-- Ограничения внешнего ключа таблицы `müük`
--
ALTER TABLE `müük`
  ADD CONSTRAINT `müük_ibfk_1` FOREIGN KEY (`kauba_kood`) REFERENCES `kaup` (`kauba_kood`),
  ADD CONSTRAINT `müük_ibfk_2` FOREIGN KEY (`ostja_kood`) REFERENCES `customer` (`idCustomer`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`);

--
-- Ограничения внешнего ключа таблицы `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
