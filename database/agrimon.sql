-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 25 Jan 2016 pada 05.39
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `agrimon`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1449467725),
('m130524_201442_init', 1449467729);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor_available`
--

CREATE TABLE IF NOT EXISTS `sensor_available` (
  `id` int(11) NOT NULL,
  `sensor_name` varchar(255) DEFAULT NULL,
  `main_code` text,
  `pin_options` text,
  `measurement_desc` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sensor_available`
--

INSERT INTO `sensor_available` (`id`, `sensor_name`, `main_code`, `pin_options`, `measurement_desc`, `created_at`) VALUES
(2, 'DHT11', '#include <dht.h>\r\n\r\ndht DHT;\r\n\r\n#define DHT11_PIN variable0\r\n  \r\nvoid setup(){\r\n  Serial.begin(9600);\r\n}\r\n\r\nvoid loop()\r\n{\r\n  int chk = DHT.read11(DHT11_PIN);\r\n  Serial.print("Temperature = ");\r\n  Serial.println(DHT.temperature);\r\n  Serial.print("Humidity = ");\r\n  Serial.println(DHT.humidity);\r\n  delay(1000);\r\n}', 'Choose DHT11_PIN from digital pin available in system\r\nJust type the number of the pin for DHT11_PIN that you use to change variable0\r\ne.g "12"  without quotation mark', 'celcius and %', '2015-12-07 10:46:04'),
(3, 'LDR (Light Dependent Resistor)', 'int LDR =variable0;\r\nint LDRValue = 0;\r\nvoid setup()\r\n{\r\n  Serial.begin(9600);\r\n  }\r\n\r\n  void loop(){\r\n    LDRValue = analogRead(LDR);\r\n    Serial.println(LDRValue);\r\n    delay(50);\r\n    }', 'Change variable0 with pin of LDR in arduino\r\njust type the number of the pin.\r\ne.g "8" without quotation', '%', '2015-12-07 10:54:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor_data`
--

CREATE TABLE IF NOT EXISTS `sensor_data` (
  `id` int(11) NOT NULL,
  `sensor_in_use_name` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor_in_use`
--

CREATE TABLE IF NOT EXISTS `sensor_in_use` (
  `id` int(11) NOT NULL,
  `sensor_name` int(11) DEFAULT NULL,
  `pin_in_use` text,
  `code_in_use` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sensor_in_use`
--

INSERT INTO `sensor_in_use` (`id`, `sensor_name`, `pin_in_use`, `code_in_use`) VALUES
(3, 2, '9', '#include <dht.h>\r\n\r\ndht DHT;\r\n\r\n#define DHT11_PIN 9\r\n  \r\nvoid setup(){\r\n  Serial.begin(9600);\r\n}\r\n\r\nvoid loop()\r\n{\r\n  int chk = DHT.read11(DHT11_PIN);\r\n  Serial.print("Temperature = ");\r\n  Serial.println(DHT.temperature);\r\n  Serial.print("Humidity = ");\r\n  Serial.println(DHT.humidity);\r\n  delay(1000);\r\n}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '7k1Nt_2eKS6QvjwBxOrMDFZXcaYgViRf', '$2y$13$NNhnGaTRf/qx1z.mTrEiSud2yXqfSENNHhhVxuP3hQAyMU9n3tzmK', NULL, 'admin@del.ac.id', 10, 1449467789, 1449467789);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `sensor_available`
--
ALTER TABLE `sensor_available`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`), ADD KEY `sensor_in_use_data` (`sensor_in_use_name`);

--
-- Indexes for table `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
  ADD PRIMARY KEY (`id`), ADD KEY `sensor_in_use_name` (`sensor_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensor_available`
--
ALTER TABLE `sensor_available`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sensor_data`
--
ALTER TABLE `sensor_data`
ADD CONSTRAINT `sensor_in_use_data` FOREIGN KEY (`sensor_in_use_name`) REFERENCES `sensor_in_use` (`id`);

--
-- Ketidakleluasaan untuk tabel `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
ADD CONSTRAINT `sensor_in_use_name` FOREIGN KEY (`sensor_name`) REFERENCES `sensor_available` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
