-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 19 2024 г., 09:18
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
-- База данных: `examen`
--

-- --------------------------------------------------------

--
-- Структура таблицы `apteka`
--

CREATE TABLE `apteka` (
  `id_Apteki` int(11) NOT NULL,
  `Naimenovanie` varchar(20) NOT NULL,
  `Adres` varchar(30) NOT NULL,
  `Telefon` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `apteka`
--

INSERT INTO `apteka` (`id_Apteki`, `Naimenovanie`, `Adres`, `Telefon`) VALUES
(1, 'Живика', 'улица Урицкого, 9, Ярославль', '+ 8 920 118 22');

-- --------------------------------------------------------

--
-- Структура таблицы `lekarstvo`
--

CREATE TABLE `lekarstvo` (
  `id_Lekarstva` int(11) NOT NULL,
  `Naimenovanie` varchar(50) NOT NULL,
  `Forma_vipuska` varchar(30) NOT NULL,
  `Dozirovka` varchar(20) NOT NULL,
  `Kol_vo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lekarstvo`
--

INSERT INTO `lekarstvo` (`id_Lekarstva`, `Naimenovanie`, `Forma_vipuska`, `Dozirovka`, `Kol_vo`) VALUES
(1, 'Фарингосепт', 'Таблетки', '10 миллилитров', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `polzovatel`
--

CREATE TABLE `polzovatel` (
  `id` int(11) NOT NULL,
  `Familia` varchar(150) NOT NULL,
  `Ima` varchar(150) NOT NULL,
  `Otchestvo` varchar(150) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Parol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `polzovatel`
--

INSERT INTO `polzovatel` (`id`, `Familia`, `Ima`, `Otchestvo`, `Login`, `Parol`) VALUES
(14, 'Емельянов', 'Иван', 'Алексеевич', 'sabakaRaiz@gmail.com', 'perKuleks'),
(15, 'Емельянов', 'Иван', 'Алексеевич', 'kURCHATOV@gmail.com', 'perKuleks'),
(16, 'Груздев', 'Егор', 'Никалаевич', 'dwad@gmail.com', '123456gg');

-- --------------------------------------------------------

--
-- Структура таблицы `postavchik`
--

CREATE TABLE `postavchik` (
  `id_Postavchika` int(11) NOT NULL,
  `Familia` varchar(20) NOT NULL,
  `Imya` varchar(30) NOT NULL,
  `Otchestvo` varchar(20) DEFAULT NULL,
  `Login` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `postavchik`
--

INSERT INTO `postavchik` (`id_Postavchika`, `Familia`, `Imya`, `Otchestvo`, `Login`) VALUES
(1, 'Карпов', 'Никита', 'Сергеевич', 'karpov@yand');

-- --------------------------------------------------------

--
-- Структура таблицы `prodaja`
--

CREATE TABLE `prodaja` (
  `id_Prodaji` int(11) NOT NULL,
  `id Lekarstva` int(11) NOT NULL,
  `id Apteki` int(11) NOT NULL,
  `Kolvo` int(11) NOT NULL,
  `Data` date NOT NULL,
  `id Polzov` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `prodaja`
--

INSERT INTO `prodaja` (`id_Prodaji`, `id Lekarstva`, `id Apteki`, `Kolvo`, `Data`, `id Polzov`) VALUES
(1, 1, 1, 2, '2024-03-19', 14);

-- --------------------------------------------------------

--
-- Структура таблицы `thaiavka`
--

CREATE TABLE `thaiavka` (
  `id_Thaiavki` int(11) NOT NULL,
  `id Postavchika` int(11) NOT NULL,
  `Kolichestvo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `thaiavka`
--

INSERT INTO `thaiavka` (`id_Thaiavki`, `id Postavchika`, `Kolichestvo`) VALUES
(1, 1, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `thaiavki_na_postavku`
--

CREATE TABLE `thaiavki_na_postavku` (
  `id_Thaiavki_na_postavku` int(11) NOT NULL,
  `id Thaiavki` int(11) NOT NULL,
  `id Lekarstva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `thaiavki_na_postavku`
--

INSERT INTO `thaiavki_na_postavku` (`id_Thaiavki_na_postavku`, `id Thaiavki`, `id Lekarstva`) VALUES
(0, 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `apteka`
--
ALTER TABLE `apteka`
  ADD PRIMARY KEY (`id_Apteki`);

--
-- Индексы таблицы `lekarstvo`
--
ALTER TABLE `lekarstvo`
  ADD PRIMARY KEY (`id_Lekarstva`);

--
-- Индексы таблицы `polzovatel`
--
ALTER TABLE `polzovatel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `postavchik`
--
ALTER TABLE `postavchik`
  ADD PRIMARY KEY (`id_Postavchika`);

--
-- Индексы таблицы `prodaja`
--
ALTER TABLE `prodaja`
  ADD PRIMARY KEY (`id_Prodaji`),
  ADD KEY `id_Lekarstva` (`id Lekarstva`,`id Apteki`,`id Polzov`),
  ADD KEY `id Apteki` (`id Apteki`),
  ADD KEY `id Lekarstva` (`id Lekarstva`),
  ADD KEY `id Polzov` (`id Polzov`);

--
-- Индексы таблицы `thaiavka`
--
ALTER TABLE `thaiavka`
  ADD PRIMARY KEY (`id_Thaiavki`),
  ADD KEY `id_Postavchika` (`id Postavchika`);

--
-- Индексы таблицы `thaiavki_na_postavku`
--
ALTER TABLE `thaiavki_na_postavku`
  ADD KEY `id_Thaiavki` (`id Thaiavki`,`id Lekarstva`),
  ADD KEY `id Lekarstva` (`id Lekarstva`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `apteka`
--
ALTER TABLE `apteka`
  MODIFY `id_Apteki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `lekarstvo`
--
ALTER TABLE `lekarstvo`
  MODIFY `id_Lekarstva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `polzovatel`
--
ALTER TABLE `polzovatel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `postavchik`
--
ALTER TABLE `postavchik`
  MODIFY `id_Postavchika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `prodaja`
--
ALTER TABLE `prodaja`
  MODIFY `id_Prodaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `thaiavka`
--
ALTER TABLE `thaiavka`
  MODIFY `id_Thaiavki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `apteka`
--
ALTER TABLE `apteka`
  ADD CONSTRAINT `apteka_ibfk_1` FOREIGN KEY (`id_Apteki`) REFERENCES `prodaja` (`id Apteki`);

--
-- Ограничения внешнего ключа таблицы `lekarstvo`
--
ALTER TABLE `lekarstvo`
  ADD CONSTRAINT `lekarstvo_ibfk_1` FOREIGN KEY (`id_Lekarstva`) REFERENCES `prodaja` (`id Lekarstva`),
  ADD CONSTRAINT `lekarstvo_ibfk_2` FOREIGN KEY (`id_Lekarstva`) REFERENCES `thaiavki_na_postavku` (`id Lekarstva`);

--
-- Ограничения внешнего ключа таблицы `prodaja`
--
ALTER TABLE `prodaja`
  ADD CONSTRAINT `prodaja_ibfk_1` FOREIGN KEY (`id Polzov`) REFERENCES `polzovatel` (`id`);

--
-- Ограничения внешнего ключа таблицы `thaiavka`
--
ALTER TABLE `thaiavka`
  ADD CONSTRAINT `thaiavka_ibfk_1` FOREIGN KEY (`id Postavchika`) REFERENCES `postavchik` (`id_Postavchika`),
  ADD CONSTRAINT `thaiavka_ibfk_2` FOREIGN KEY (`id_Thaiavki`) REFERENCES `thaiavki_na_postavku` (`id Thaiavki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
