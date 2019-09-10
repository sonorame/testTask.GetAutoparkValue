-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 10 2019 г., 18:06
-- Версия сервера: 5.7.20
-- Версия PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Cars`
--

CREATE TABLE `Cars` (
  `ID_cars` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL COMMENT 'имя машины',
  `Number` varchar(50) NOT NULL COMMENT 'гос номер',
  `ChildSeat` tinyint(1) NOT NULL COMMENT 'наличие дет.кресла',
  `MotorPower` int(11) NOT NULL COMMENT 'мощность авто',
  `SeatCount` int(11) NOT NULL COMMENT 'кол-во мест'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Cars`
--

INSERT INTO `Cars` (`ID_cars`, `Name`, `Number`, `ChildSeat`, `MotorPower`, `SeatCount`) VALUES
(1, 'BMW', 'A777AA', 1, 200, 5),
(2, 'Жигуль', 'С100ТО', 0, 70, 4),
(3, 'Трактор', 'У098РК', 0, 250, 2),
(4, 'Камаз', 'Т034ТТ', 0, 300, 5),
(5, 'Лимузин', 'В007НР', 1, 150, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `Drivers`
--

CREATE TABLE `Drivers` (
  `ID` int(11) NOT NULL,
  `Fullname` varchar(50) NOT NULL COMMENT 'фио водителя',
  `ID_cars` int(11) NOT NULL COMMENT 'id машины',
  `DrivingLicense` varchar(50) NOT NULL COMMENT 'номер ВУ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Drivers`
--

INSERT INTO `Drivers` (`ID`, `Fullname`, `ID_cars`, `DrivingLicense`) VALUES
(1, 'Иванов Иван Иванович', 1, '88005553535'),
(2, 'Петров Петр Петрович', 2, '123456789'),
(3, 'Семенов Семен Семенович', 3, '369852147'),
(4, 'Дмитрев Дмитрий Дмитриевич', 3, '123654789'),
(5, 'Камазов Камаз Камазович', 4, '225588996633'),
(6, 'Водилов Водитель Водилович', 4, '113366448877'),
(7, 'Шоферов Шофер Шоверович', 5, '7777778899'),
(8, 'Гришин Григорий Григорьевич', 5, '554477889966555'),
(9, 'Евгеньев Евгений Евгеньевич', 5, '3366552211447700');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Cars`
--
ALTER TABLE `Cars`
  ADD PRIMARY KEY (`ID_cars`),
  ADD KEY `ID` (`ID_cars`),
  ADD KEY `ID_cars` (`ID_cars`);

--
-- Индексы таблицы `Drivers`
--
ALTER TABLE `Drivers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_cars` (`ID_cars`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Cars`
--
ALTER TABLE `Cars`
  MODIFY `ID_cars` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Drivers`
--
ALTER TABLE `Drivers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Drivers`
--
ALTER TABLE `Drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`ID_cars`) REFERENCES `Cars` (`ID_cars`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
