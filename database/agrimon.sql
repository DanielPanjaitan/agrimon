-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 03, 2016 at 03:56 PM
-- Server version: 5.6.28-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agrimon`
--

-- --------------------------------------------------------

--
-- Table structure for table `actuator_available`
--

CREATE TABLE IF NOT EXISTS `actuator_available` (
  `id` int(11) NOT NULL,
  `actuator_name` varchar(255) DEFAULT NULL,
  `pin_name` varchar(255) DEFAULT NULL,
  `pin_assignment` text,
  `setup_code` text,
  `actuation_code` text,
  `json_code` text,
  `pin_options` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actuator_available`
--

INSERT INTO `actuator_available` (`id`, `actuator_name`, `pin_name`, `pin_assignment`, `setup_code`, `actuation_code`, `json_code`, `pin_options`, `created_at`) VALUES
(1, 'Selenoid Valve', 'aktuatorPin', 'int pinAktuator = aktuatorPin;\r\nint statusAktuator = 0;\r\n', 'pinMode(pinAktuator,OUTPUT);', ' if (kondisiAktuator && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!kondisiAktuator && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  ', 'client.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");', 'Untuk penggunaan aktuator Buzzer, hubungkan pin ground pada aktuator ke pin ground sistem dan pin vcc buzzer ke salah satu pin digital sistem. \r\nSetelah dihubungkan, tuliskan nomor pin vcc aktuator yang anda gunakan pada sistem pada kolom isian pin yang digunakan.\r\ncontohnya "8" tanpa tanda kutip', '2016-04-24 16:02:58'),
(2, 'Testing2', 'aktuatorPin', 'int pinAktuator2 = aktuatorPin;\r\nint statusAktuator2 = 0;\r\n', 'pinMode(pinAktuator2,OUTPUT);', ' if (kondisiAktuator && statusAktuator2 == 0) {\r\n    digitalWrite(pinAktuator2, HIGH);\r\n    statusAktuator2 = 1;\r\n  }\r\n  if (!kondisiAktuator && statusAktuator2 == 1 ) {\r\n    statusAktuator2 = 0;\r\n    digitalWrite(pinAktuator2, LOW);\r\n  }\r\n  ', 'client.print(",\\"Status Aktuator2\\":\\"");\r\nclient.print(statusAktuator2);\r\nclient.print("\\"");', 'Untuk penggunaan aktuator Buzzer, hubungkan pin ground pada aktuator ke pin ground sistem dan pin vcc buzzer ke salah satu pin digital sistem. \r\nSetelah dihubungkan, tuliskan nomor pin vcc aktuator yang anda gunakan pada sistem pada kolom isian pin yang digunakan.\r\ncontohnya "8" tanpa tanda kutip', '2016-04-24 16:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `actuator_in_use`
--

CREATE TABLE IF NOT EXISTS `actuator_in_use` (
  `id` int(11) NOT NULL,
  `token_id` varchar(20) DEFAULT NULL,
  `actuator_name` int(11) DEFAULT NULL,
  `pin_in_use` text
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actuator_in_use`
--

INSERT INTO `actuator_in_use` (`id`, `token_id`, `actuator_name`, `pin_in_use`) VALUES
(10, '2ab7b954b10fbdc78207', 1, '6'),
(11, '2ab7b954b10fbdc78207', 2, '5'),
(13, '9b0719f90d01aa373cdf', 1, '3'),
(14, '9e3da4a77cc9d41cd267', 1, '3'),
(15, '23dca3275c990723e1ca', 1, '8'),
(16, '96f2f3c2b2c0222b0a5b', 1, '4'),
(17, '526de117a84f3afbdf46', 1, '3'),
(18, '63c7b857238b6ff36ec4', 1, '7'),
(19, 'b886c3c762fba75f4aa3', 1, '7'),
(20, 'e950bf953b67343cbff0', 1, '8');

-- --------------------------------------------------------

--
-- Table structure for table `act_condition`
--

CREATE TABLE IF NOT EXISTS `act_condition` (
  `id` int(11) NOT NULL,
  `actuator_in_use_id` int(11) DEFAULT NULL,
  `sensor_name` varchar(255) DEFAULT NULL,
  `constraint` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `act_condition`
--

INSERT INTO `act_condition` (`id`, `actuator_in_use_id`, `sensor_name`, `constraint`) VALUES
(10, 10, 'Sensor_Suhu1', '<10'),
(11, 10, 'Sensor_Kelembaban', '>35'),
(14, 13, 'Sensor_kelembaban_tanah_bunga', '<60'),
(15, 14, 'Sensor_Kelembaban', '<40'),
(16, 15, 'Sesnsor-Kelembaban-Tanah', '<50'),
(17, 16, 'Sensor_Suhu', '> 30'),
(18, 17, 'Sensor_Suhu_1', '> 30'),
(19, 18, 'sensor_kelembaban_tanah', '< 50'),
(20, 19, 'sensor_kelembaban_tanah', '< 50'),
(21, 20, 'sensor_kelembaban_tanah', '< 50');

-- --------------------------------------------------------

--
-- Table structure for table `final_configuration`
--

CREATE TABLE IF NOT EXISTS `final_configuration` (
  `token_id` varchar(20) NOT NULL,
  `identifier` text,
  `library_list` text,
  `global_configuration` text,
  `setup_function` text,
  `open_loop_function` text,
  `close_loop_function` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `final_configuration`
--

INSERT INTO `final_configuration` (`token_id`, `identifier`, `library_list`, `global_configuration`, `setup_function`, `open_loop_function`, `close_loop_function`, `created_at`) VALUES
('23dca3275c990723e1ca', 'Testing Sensor Untuk Persiapan Sidang', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "23dca3275c990723e1ca";\nint pinAktuator = 8;\r\nint statusAktuator = 0;\r\n\nint Sesnsor-Kelembaban-Tanah;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'Sesnsor-Kelembaban-Tanah = Soil_MoistureAssignment (A2);\n if ((Sesnsor-Kelembaban-Tanah <50 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sesnsor-Kelembaban-Tanah <50 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"Sesnsor-Kelembaban-Tanah",Sesnsor-Kelembaban-Tanah);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-24 10:55:53'),
('2ab7b954b10fbdc78207', 'Sistem untuk Kebun Bunga Krisan', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\ndht DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, dht DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Temperature");\r\n  client.print("\\":\\"");\r\n  client.print(DHT.temperature);\r\n  client.print("\\"");\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT.humidity);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "2ab7b954b10fbdc78207";\nint pinAktuator = 6;\r\nint statusAktuator = 0;\r\n\nint pinAktuator2 = 5;\r\nint statusAktuator2 = 0;\r\n\ndht Sensor_Suhu1;\nint Sensor_Kelembaban;\nfloat sensor_suhu_LM35;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);\npinMode(pinAktuator2,OUTPUT);', 'sensor_suhu_LM35 = LM35Assignment (A3);\nSensor_Kelembaban = Soil_MoistureAssignment (A2);\nSensor_Suhu1 = DHT11Assignment (5);\n if ((Sensor_Suhu1 >31 ) && statusAktuator2 == 0) {\r\n    digitalWrite(pinAktuator2, HIGH);\r\n    statusAktuator2 = 1;\r\n  }\r\n  if (!(Sensor_Suhu1 >31 ) && statusAktuator2 == 1 ) {\r\n    statusAktuator2 = 0;\r\n    digitalWrite(pinAktuator2, LOW);\r\n  }\r\n  \n if ((Sensor_Suhu1 <10 && Sensor_Kelembaban >35 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sensor_Suhu1 <10 && Sensor_Kelembaban >35 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nclient.print(",\\"Status Aktuator2\\":\\"");\r\nclient.print(statusAktuator2);\r\nclient.print("\\"");\nDHT11Print(client,"Sensor_Suhu1",Sensor_Suhu1);\nSoil_MoisturePrint(client,"Sensor_Kelembaban",Sensor_Kelembaban);\nLM35Print(client,"sensor_suhu_LM35",sensor_suhu_LM35);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-12 16:09:01'),
('526de117a84f3afbdf46', 'Testing Sistem dengan 2 Sensor Suhu', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "526de117a84f3afbdf46";\nint pinAktuator = 3;\r\nint statusAktuator = 0;\r\n\nfloat Sensor_Suhu_1;\nfloat Sensor_Suhu_2;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'Sensor_Suhu_2 = LM35Assignment (A3);\nSensor_Suhu_1 = LM35Assignment (A4);\n if ((Sensor_Suhu_1 > 30 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sensor_Suhu_1 > 30 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nLM35Print(client,"Sensor_Suhu_1",Sensor_Suhu_1);\nLM35Print(client,"Sensor_Suhu_2",Sensor_Suhu_2);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-24 12:38:44'),
('63c7b857238b6ff36ec4', 'Testing Sistem Sebelum Sidang', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "63c7b857238b6ff36ec4";\nint pinAktuator = 7;\r\nint statusAktuator = 0;\r\n\nint sensor_kelembaban_tanah;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'sensor_kelembaban_tanah = Soil_MoistureAssignment (A3);\n if ((sensor_kelembaban_tanah < 50 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(sensor_kelembaban_tanah < 50 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"sensor_kelembaban_tanah",sensor_kelembaban_tanah);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-06-06 23:00:30'),
('96f2f3c2b2c0222b0a5b', 'Testing Sistem dengan Sensor Suhu dan Sensor DHT', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "96f2f3c2b2c0222b0a5b";\nint pinAktuator = 4;\r\nint statusAktuator = 0;\r\n\nfloat Sensor_Suhu;\nint Sensor_Kelembaban_DHT11;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'Sensor_Kelembaban_DHT11 = DHT11Assignment (7);\nSensor_Suhu = LM35Assignment (A2);\n if ((Sensor_Suhu > 30 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sensor_Suhu > 30 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nLM35Print(client,"Sensor_Suhu",Sensor_Suhu);\nDHT11Print(client,"Sensor_Kelembaban_DHT11",Sensor_Kelembaban_DHT11);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-24 12:07:01'),
('9b0719f90d01aa373cdf', 'Sensor Untuk Percobaan Kebun Bunga Samping Kelas ', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "9b0719f90d01aa373cdf";\nint pinAktuator = 3;\r\nint statusAktuator = 0;\r\n\nint Sensor_kelembaban_tanah_bunga;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'Sensor_kelembaban_tanah_bunga = Soil_MoistureAssignment (A3);\n if ((Sensor_kelembaban_tanah_bunga <60 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sensor_kelembaban_tanah_bunga <60 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"Sensor_kelembaban_tanah_bunga",Sensor_kelembaban_tanah_bunga);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-20 03:02:37'),
('9e3da4a77cc9d41cd267', 'Testing Sistem di GD513', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "9e3da4a77cc9d41cd267";\nint pinAktuator = 3;\r\nint statusAktuator = 0;\r\n\nint Sensor_Kelembaban;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'Sensor_Kelembaban = Soil_MoistureAssignment (A3);\n if ((Sensor_Kelembaban <40 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(Sensor_Kelembaban <40 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"Sensor_Kelembaban",Sensor_Kelembaban);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-24 10:16:15'),
('b886c3c762fba75f4aa3', 'Testing Sidang', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "b886c3c762fba75f4aa3";\nint pinAktuator = 7;\r\nint statusAktuator = 0;\r\n\nint sensor_kelembaban_tanah;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'sensor_kelembaban_tanah = Soil_MoistureAssignment (A3);\n if ((sensor_kelembaban_tanah < 50 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(sensor_kelembaban_tanah < 50 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"sensor_kelembaban_tanah",sensor_kelembaban_tanah);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-06-06 23:09:01'),
('e950bf953b67343cbff0', 'Testing Sistem untuk Sidang', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "e950bf953b67343cbff0";\nint pinAktuator = 8;\r\nint statusAktuator = 0;\r\n\nint sensor_kelembaban_tanah;\nfloat sensor_suhu;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();\npinMode(pinAktuator,OUTPUT);', 'sensor_suhu = LM35Assignment (A2);\nsensor_kelembaban_tanah = Soil_MoistureAssignment (A3);\n if ((sensor_kelembaban_tanah < 50 ) && statusAktuator == 0) {\r\n    digitalWrite(pinAktuator, HIGH);\r\n    statusAktuator = 1;\r\n  }\r\n  if (!(sensor_kelembaban_tanah < 50 ) && statusAktuator == 1 ) {\r\n    statusAktuator = 0;\r\n    digitalWrite(pinAktuator, LOW);\r\n  }\r\n  \n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nclient.print(",\\"Status Aktuator\\":\\"");\r\nclient.print(statusAktuator);\r\nclient.print("\\"");\nSoil_MoisturePrint(client,"sensor_kelembaban_tanah",sensor_kelembaban_tanah);\nLM35Print(client,"sensor_suhu",sensor_suhu);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-06-07 00:04:44'),
('fe244c8d2e25c6a5e41c', 'Testing Sistem di Sekitaran EH', '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n\nchar token[ ] = "fe244c8d2e25c6a5e41c";\nint SENSOR_LEMBAB_TANAH;', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();', 'SENSOR_LEMBAB_TANAH = Soil_MoistureAssignment (1);\n  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");\nclient.print(",\\"Token\\":\\"");\nclient.print(token);\nclient.print("\\"");\nSoil_MoisturePrint(client,"SENSOR_LEMBAB_TANAH",SENSOR_LEMBAB_TANAH);', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }', '2016-05-24 09:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `general_configuration`
--

CREATE TABLE IF NOT EXISTS `general_configuration` (
  `id` int(11) NOT NULL,
  `library_list` text NOT NULL,
  `global_configuration` text NOT NULL,
  `setup_function` text NOT NULL,
  `open_loop_function` text NOT NULL,
  `close_loop_function` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_configuration`
--

INSERT INTO `general_configuration` (`id`, `library_list`, `global_configuration`, `setup_function`, `open_loop_function`, `close_loop_function`) VALUES
(1, '#include <NewEEPROM.h>\r\n#include <NetEEPROM.h>\r\n#include <Ethernet.h>\r\n#include <EthernetServer.h>\r\n#include <SPI.h>\r\n#include <dht.h>\r\n#include <EthernetReset.h>', 'byte mac[] = {\r\n  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED\r\n};\r\nIPAddress ip(192, 168, 88, 88);\r\nEthernetServer server(177);\r\nEthernetReset reset(8989);\r\nString label;\r\n\r\n//============================================================\r\nint Soil_MoistureAssignment (int soilPin) {\r\n  int soil = 0;\r\n  int s = analogRead(soilPin);\r\n  s = constrain(s, 485, 1023);\r\n  soil = map(s, 485, 1023, 100, 0);\r\n  return soil;\r\n}\r\n\r\nvoid Soil_MoisturePrint (EthernetClient client, String label, int soil) {\r\n  client.print(",\\"");\r\n  client.print (label);\r\n  client.print ("\\":\\"");\r\n  client.print(soil);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nint DHT11Assignment (int DHT11_PIN) {\r\n  dht DHT;\r\n  DHT.read11(DHT11_PIN);\r\n  return DHT.humidity;\r\n}\r\n\r\nvoid DHT11Print(EthernetClient client, String label, int DHT) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print(" Humidity");\r\n  client.print ("\\":\\"");\r\n  client.print(DHT);\r\n  client.print("\\"");\r\n}\r\n//============================================================\r\n\r\n//============================================================\r\nfloat LM35Assignment (int LM35) {\r\n  float dataLM35;\r\n  dataLM35 = analogRead(LM35);\r\n  dataLM35 = dataLM35 * 0.48828125;\r\n  return dataLM35;\r\n}\r\n\r\nvoid LM35Print (EthernetClient client, String label, float dataLM35) {\r\n  client.print(",\\"");\r\n  client.print(label);\r\n  client.print ("\\":\\"");\r\n  client.print(dataLM35);\r\n  client.print("\\"");\r\n}\r\n\r\n//============================================================\r\n', 'Ethernet.begin(mac, ip);\r\nserver.begin();\r\nreset.begin();', '  \r\nreset.check();\r\nEthernetClient client = server.available();\r\n  if (client) {\r\n    boolean currentLineIsBlank = true;\r\n    while (client.connected()) {\r\n      if (client.available()) {\r\n        char c = client.read();\r\n        \r\n        if (c == ''\\n'' && currentLineIsBlank) {\r\n          // send a standard http response header\r\n          client.println("HTTP/1.1 200 OK");\r\n          client.println("Content-Type: application/json;charset=utf-8");\r\n          client.println("Server: Arduino");\r\n          client.println("Connnection: close");\r\n          client.println();\r\n          client.print("{\\"location\\":\\"");\r\n          client.print(Ethernet.localIP());\r\n          client.print("\\"");', ' client.print("}");\r\n          client.println();\r\n          break;\r\n        }\r\n        if (c == ''\\n'') {\r\n          currentLineIsBlank = true;\r\n        }\r\n        else if (c != ''\\r'') {\r\n          currentLineIsBlank = false;\r\n        }\r\n      }\r\n    }\r\n    delay(1);\r\n    client.stop();\r\n    Serial.println("client disconnected");\r\n  }');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1449467725),
('m130524_201442_init', 1449467729);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_available`
--

CREATE TABLE IF NOT EXISTS `sensor_available` (
  `id` int(11) NOT NULL,
  `sensor_name` varchar(255) DEFAULT NULL,
  `variable_type` varchar(12) DEFAULT NULL,
  `pin_options` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_available`
--

INSERT INTO `sensor_available` (`id`, `sensor_name`, `variable_type`, `pin_options`, `created_at`) VALUES
(3, 'Soil_Moisture', 'int', 'Untuk penggunaan sensor Soil Moisture, hubungkan pin ground dan vcc pada sensor ke pin ground dan vcc pada sistem dan pin data A0 sensor ke salah satu pin analog sistem. \r\nSetelah dihubungkan, tuliskan nomor pin data A0 sensor yang anda gunakan pada sistem pada kolom isian pin yang digunakan.\r\ncontohnya "A1" tanpa tanda kutip', '2015-12-07 10:46:04'),
(4, 'DHT11', 'int', 'Untuk penggunaan sensor DHT11, hubungkan pin ground dan vcc pada sensor ke pin ground dan vcc pada sistem dan pin data Out sensor ke salah satu pin digital sistem. \r\nSetelah dihubungkan, tuliskan nomor pin data Out sensor yang anda gunakan  pada kolom isian pin yang digunakan.\r\ncontohnya "5" tanpa tanda kutip', '2015-12-07 10:46:04'),
(5, 'LM35', 'float', 'Untuk penggunaan sensor LM35, hubungkan pin ground dan vcc pada sensor ke pin ground dan vcc pada sistem dan pin data A0 (tengah) sensor ke salah satu pin analog sistem. \r\nSetelah dihubungkan, tuliskan nomor pin data A0 sensor yang anda gunakan pada sistem pada kolom isian pin yang digunakan.\r\ncontohnya "A1" tanpa tanda kutip', '2015-12-07 10:46:04'),
(6, 'LDR', 'float', 'Informasi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data`
--

CREATE TABLE IF NOT EXISTS `sensor_data` (
  `id` int(11) NOT NULL,
  `token_id` varchar(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `token_id`, `data`, `created_at`) VALUES
(10, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_Suhu1 Temperature":"92.00","Sensor_Suhu1 Humidity":"121.00","Sensor_kelembaban_tanah_bunga":"100"}\r\n', '2016-05-19 20:11:01'),
(11, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_Suhu1 Temperature":"92.00","Sensor_Suhu1 Humidity":"121.00","Sensor_kelembaban_tanah_bunga":"100"}\r\n', '2016-05-19 20:12:01'),
(12, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_Suhu1 Temperature":"92.00","Sensor_Suhu1 Humidity":"121.00","Sensor_kelembaban_tanah_bunga":"100"}\r\n', '2016-05-19 20:13:01'),
(13, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_kelembaban_tanah_bunga":"100"}\r\n', '2016-05-19 20:14:01'),
(14, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_kelembaban_tanah_bunga":"100"}\r\n', '2016-05-19 20:15:01'),
(15, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_kelembaban_tanah_bunga":"83"}\r\n', '2016-05-19 20:16:02'),
(16, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"0","Sensor_kelembaban_tanah_bunga":"75"}\r\n', '2016-05-19 20:17:01'),
(17, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"1"}\r\n', '2016-05-19 20:18:01'),
(18, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"1"}\r\n', '2016-05-19 20:19:01'),
(19, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:20:02'),
(20, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"3"}\r\n', '2016-05-19 20:21:01'),
(21, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"10"}\r\n', '2016-05-19 20:22:01'),
(22, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:23:01'),
(23, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:24:01'),
(24, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"11"}\r\n', '2016-05-19 20:25:01'),
(25, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"5"}\r\n', '2016-05-19 20:26:01'),
(26, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:27:01'),
(27, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:28:01'),
(28, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:29:02'),
(29, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"9"}\r\n', '2016-05-19 20:30:01'),
(30, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:31:01'),
(31, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:32:01'),
(32, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"8"}\r\n', '2016-05-19 20:33:01'),
(33, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"12"}\r\n', '2016-05-19 20:34:02'),
(34, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"12"}\r\n', '2016-05-19 20:35:01'),
(35, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:36:01'),
(36, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"1"}\r\n', '2016-05-19 20:37:01'),
(37, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:38:01'),
(38, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"7"}\r\n', '2016-05-19 20:39:01'),
(39, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"10"}\r\n', '2016-05-19 20:40:01'),
(40, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"10"}\r\n', '2016-05-19 20:41:01'),
(41, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"12"}\r\n', '2016-05-19 20:42:02'),
(42, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"6"}\r\n', '2016-05-19 20:43:01'),
(43, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"11"}\r\n', '2016-05-19 20:44:01'),
(44, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"11"}\r\n', '2016-05-19 20:45:01'),
(45, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:46:01'),
(46, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"8"}\r\n', '2016-05-19 20:47:01'),
(47, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:48:01'),
(48, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"9"}\r\n', '2016-05-19 20:49:01'),
(49, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:50:01'),
(50, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:51:01'),
(51, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:52:02'),
(52, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"12"}\r\n', '2016-05-19 20:53:01'),
(53, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:54:01'),
(54, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:55:01'),
(55, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:56:01'),
(56, '9b0719f90d01aa373cdf', '{"location":"192.168.88.88","Token":"9b0719f90d01aa373cdf","Status Aktuator":"1","Sensor_kelembaban_tanah_bunga":"0"}\r\n', '2016-05-19 20:57:01'),
(57, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:27:01'),
(58, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:28:01'),
(59, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:29:01'),
(60, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:30:01'),
(61, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:31:01'),
(62, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:32:01'),
(63, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:33:01'),
(64, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:37:01'),
(65, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:38:02'),
(66, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:39:01'),
(67, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:40:01'),
(68, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:41:01'),
(69, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:42:02'),
(70, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:43:01'),
(71, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_kelembaban_tanah":"100"}\r\n', '2016-05-24 02:44:01'),
(72, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"90.82"}\r\n', '2016-05-24 02:46:04'),
(73, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"73.73"}\r\n', '2016-05-24 02:48:02'),
(74, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"39.55"}\r\n', '2016-05-24 02:49:01'),
(75, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"69.34"}\r\n', '2016-05-24 02:50:01'),
(76, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"128.91"}\r\n', '2016-05-24 02:51:04'),
(77, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"79.10"}\r\n', '2016-05-24 02:52:01'),
(78, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","sensor_suhu":"11.23"}\r\n', '2016-05-24 02:53:02'),
(79, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:54:01'),
(80, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:55:01'),
(81, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:56:01'),
(82, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:57:01'),
(83, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:58:01'),
(84, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 02:59:01'),
(85, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 03:00:01'),
(86, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 03:01:01'),
(87, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 03:03:01'),
(88, 'fe244c8d2e25c6a5e41c', '{"location":"192.168.88.88","Token":"fe244c8d2e25c6a5e41c","SENSOR_LEMBAB_TANAH":"0"}\r\n', '2016-05-24 03:04:01'),
(90, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"1"}\r\n', '2016-05-24 03:24:01'),
(91, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"0"}\r\n', '2016-05-24 03:25:01'),
(92, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"1"}\r\n', '2016-05-24 03:26:02'),
(93, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"53"}\r\n', '2016-05-24 03:27:01'),
(94, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"58"}\r\n', '2016-05-24 03:28:01'),
(95, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"60"}\r\n', '2016-05-24 03:29:01'),
(96, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"1"}\r\n', '2016-05-24 03:43:01'),
(97, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Sensor_Kelembaban":"59"}\r\n', '2016-05-24 03:44:01'),
(98, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Status Aktuator":"0","Sensor_Kelembaban":"65"}\r\n', '2016-05-24 03:45:10'),
(99, '9e3da4a77cc9d41cd267', '{"location":"192.168.88.88","Token":"9e3da4a77cc9d41cd267","Status Aktuator":"0","Sensor_Kelembaban":"45"}\r\n', '2016-05-24 03:46:02'),
(100, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"31.74","Sensor_Kelembaban_DHT11 Humidity":"36"}\r\n', '2016-05-24 05:20:01'),
(101, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"0","Sensor_Suhu":"29.79","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:21:02'),
(102, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"30.27","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:22:01'),
(103, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"30.27","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:23:01'),
(104, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"0","Sensor_Suhu":"29.79","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:24:01'),
(105, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"30.27","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:25:01'),
(106, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"0","Sensor_Suhu":"29.79","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:26:02'),
(107, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"0","Sensor_Suhu":"29.79","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:27:01'),
(108, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"0","Sensor_Suhu":"29.79","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:28:01'),
(109, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"34.18","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:29:01'),
(110, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"0"}\r\n', '2016-05-24 05:30:01'),
(111, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"48"}\n', '2016-05-24 05:31:01'),
(112, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"52"}\n', '2016-05-24 05:32:01'),
(113, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"30.76","Sensor_Kelembaban_DHT11 Humidity":"47"}\n', '2016-05-24 05:33:01'),
(114, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"30.76","Sensor_Kelembaban_DHT11 Humidity":"51"}\n', '2016-05-24 05:34:02'),
(115, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"42"}\n', '2016-05-24 05:35:16'),
(116, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"48"}\n', '2016-05-24 05:36:01'),
(117, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.69","Sensor_Kelembaban_DHT11 Humidity":"52"}\n', '2016-05-24 05:37:01'),
(118, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"49"}\n', '2016-05-24 05:38:01'),
(119, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"53"}\n', '2016-05-24 05:39:02'),
(120, '96f2f3c2b2c0222b0a5b', '{"location":"192.168.88.88","Token":"96f2f3c2b2c0222b0a5b","Status Aktuator":"1","Sensor_Suhu":"33.20","Sensor_Kelembaban_DHT11 Humidity":"52"}\n', '2016-05-24 05:40:01'),
(121, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"176.27","Sensor_Suhu_2":"172.36"}\r\n', '2016-05-24 05:42:01'),
(122, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"43.46","Sensor_Suhu_2":"34.18"}\r\n', '2016-05-24 05:43:01'),
(123, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"0","Sensor_Suhu_1":"16.60","Sensor_Suhu_2":"33.20"}\r\n', '2016-05-24 05:44:01'),
(124, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"35.16","Sensor_Suhu_2":"33.69"}\r\n', '2016-05-24 05:45:01'),
(125, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"32.23","Sensor_Suhu_2":"30.76"}\r\n', '2016-05-24 05:46:01'),
(126, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"32.23","Sensor_Suhu_2":"30.76"}\r\n', '2016-05-24 05:47:01'),
(127, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"35.16","Sensor_Suhu_2":"33.69"}\r\n', '2016-05-24 05:48:01'),
(128, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"32.23","Sensor_Suhu_2":"30.27"}\r\n', '2016-05-24 05:49:02'),
(129, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"36.13","Sensor_Suhu_2":"34.18"}\r\n', '2016-05-24 05:50:01'),
(130, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"35.16","Sensor_Suhu_2":"33.69"}\r\n', '2016-05-24 05:51:01'),
(131, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"35.16","Sensor_Suhu_2":"33.20"}\r\n', '2016-05-24 05:52:01'),
(132, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"31.74","Sensor_Suhu_2":"29.79"}\r\n', '2016-05-24 05:53:01'),
(133, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"34.67","Sensor_Suhu_2":"33.20"}\r\n', '2016-05-24 06:00:01'),
(134, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"34.67","Sensor_Suhu_2":"32.71"}\r\n', '2016-05-24 06:01:01'),
(135, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"34.67","Sensor_Suhu_2":"33.69"}\r\n', '2016-05-24 06:02:01'),
(136, '526de117a84f3afbdf46', '{"location":"192.168.88.88","Token":"526de117a84f3afbdf46","Status Aktuator":"1","Sensor_Suhu_1":"34.67","Sensor_Suhu_2":"33.69"}\r\n', '2016-05-24 06:03:02'),
(146, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","sensor_kelembaban_tanah":"65"}\r\n', '2016-06-06 16:03:01'),
(147, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","sensor_kelembaban_tanah":"69"}\r\n', '2016-06-06 16:04:01'),
(148, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","sensor_kelembaban_tanah":"71"}\r\n', '2016-06-06 16:05:01'),
(149, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","Status Aktuator":"0","sensor_kelembaban_tanah":"81"}\r\n', '2016-06-06 16:07:01'),
(150, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","Status Aktuator":"0","sensor_kelembaban_tanah":"82"}\r\n', '2016-06-06 16:08:01'),
(151, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","Status Aktuator":"0","sensor_kelembaban_tanah":"85"}\r\n', '2016-06-06 16:09:02'),
(152, '63c7b857238b6ff36ec4', '{"location":"192.168.88.88","Token":"63c7b857238b6ff36ec4","Status Aktuator":"0","sensor_kelembaban_tanah":"86"}\r\n', '2016-06-06 16:10:01'),
(153, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"87"}\r\n', '2016-06-06 16:11:01'),
(154, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"89"}\r\n', '2016-06-06 16:12:01'),
(155, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"3"}\r\n', '2016-06-06 16:13:02'),
(156, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"3"}\r\n', '2016-06-06 16:14:01'),
(157, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"81"}\r\n', '2016-06-06 16:15:01'),
(158, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:16:01'),
(159, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:29:10'),
(160, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:54:01'),
(161, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:55:01'),
(162, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:56:01'),
(163, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:57:02'),
(164, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:58:01'),
(165, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 16:59:01'),
(166, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"16"}\r\n', '2016-06-06 17:00:01'),
(167, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"37"}\r\n', '2016-06-06 17:01:01'),
(168, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 17:02:02'),
(169, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 17:03:01'),
(170, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"100"}\r\n', '2016-06-06 17:04:01'),
(171, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"5"}\r\n', '2016-06-06 17:05:01'),
(172, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"1","sensor_kelembaban_tanah":"14"}\r\n', '2016-06-06 17:06:01'),
(173, 'b886c3c762fba75f4aa3', '{"location":"192.168.88.88","Token":"b886c3c762fba75f4aa3","Status Aktuator":"0","sensor_kelembaban_tanah":"52"}\r\n', '2016-06-06 17:09:04'),
(174, 'e950bf953b67343cbff0', '{"location":"192.168.88.88","Token":"e950bf953b67343cbff0","Status Aktuator":"0","sensor_kelembaban_tanah":"50","sensor_suhu":"31.25"}\r\n', '2016-06-06 17:10:01'),
(175, 'e950bf953b67343cbff0', '{"location":"192.168.88.88","Token":"e950bf953b67343cbff0","Status Aktuator":"1","sensor_kelembaban_tanah":"46","sensor_suhu":"48.83"}\r\n', '2016-06-06 17:11:01'),
(176, 'e950bf953b67343cbff0', '{"location":"192.168.88.88","Token":"e950bf953b67343cbff0","Status Aktuator":"1","sensor_kelembaban_tanah":"6","sensor_suhu":"57.62"}\r\n', '2016-06-06 17:12:01'),
(177, 'e950bf953b67343cbff0', '{"location":"192.168.88.88","Token":"e950bf953b67343cbff0","Status Aktuator":"0","sensor_kelembaban_tanah":"92","sensor_suhu":"27.83"}\r\n', '2016-06-06 17:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_in_use`
--

CREATE TABLE IF NOT EXISTS `sensor_in_use` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `token_id` varchar(20) DEFAULT NULL,
  `sensor_name` int(11) DEFAULT NULL,
  `pin_in_use` text
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_in_use`
--

INSERT INTO `sensor_in_use` (`id`, `identifier`, `token_id`, `sensor_name`, `pin_in_use`) VALUES
(59, 'Sensor_Suhu1', '2ab7b954b10fbdc78207', 4, '5'),
(61, 'Sensor_Kelembaban', '2ab7b954b10fbdc78207', 3, 'A2'),
(62, 'sensor_suhu_LM35', '2ab7b954b10fbdc78207', 5, 'A3'),
(64, 'Sensor_kelembaban_tanah_bunga', '9b0719f90d01aa373cdf', 3, 'A3'),
(67, 'SENSOR_LEMBAB_TANAH', 'fe244c8d2e25c6a5e41c', 3, '1'),
(68, 'Sensor_Kelembaban', '9e3da4a77cc9d41cd267', 3, 'A3'),
(69, 'Sesnsor-Kelembaban-Tanah', '23dca3275c990723e1ca', 3, 'A2'),
(70, 'Sensor_Suhu', '96f2f3c2b2c0222b0a5b', 5, 'A2'),
(71, 'Sensor_Kelembaban_DHT11', '96f2f3c2b2c0222b0a5b', 4, '7'),
(72, 'Sensor_Suhu_1', '526de117a84f3afbdf46', 5, 'A4'),
(73, 'Sensor_Suhu_2', '526de117a84f3afbdf46', 5, 'A3'),
(74, 'sensor_kelembaban_tanah', '63c7b857238b6ff36ec4', 3, 'A3'),
(75, 'sensor_kelembaban_tanah', 'b886c3c762fba75f4aa3', 3, 'A3'),
(76, 'sensor_kelembaban_tanah', 'e950bf953b67343cbff0', 3, 'A3'),
(77, 'sensor_suhu', 'e950bf953b67343cbff0', 5, 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
  `updated_at` int(11) NOT NULL,
  `is_change` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `is_change`) VALUES
(1, 'admin', '7k1Nt_2eKS6QvjwBxOrMDFZXcaYgViRf', '$2y$13$VrB3ujCNFAfdVlTvV4mvkesYtUHHV1wRbPrW.PGdDeHqqoUTklgcS', NULL, 'admin@del.ac.id', 10, 1449467789, 1461048889, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actuator_available`
--
ALTER TABLE `actuator_available`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actuator_in_use`
--
ALTER TABLE `actuator_in_use`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuator_in_use_name` (`actuator_name`),
  ADD KEY `token_of_actuator` (`token_id`);

--
-- Indexes for table `act_condition`
--
ALTER TABLE `act_condition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuator_cons` (`actuator_in_use_id`);

--
-- Indexes for table `final_configuration`
--
ALTER TABLE `final_configuration`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `general_configuration`
--
ALTER TABLE `general_configuration`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_in_use_data` (`token_id`);

--
-- Indexes for table `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_in_use_name` (`sensor_name`),
  ADD KEY `token_of_sensor` (`token_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actuator_available`
--
ALTER TABLE `actuator_available`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `actuator_in_use`
--
ALTER TABLE `actuator_in_use`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `act_condition`
--
ALTER TABLE `act_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `general_configuration`
--
ALTER TABLE `general_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sensor_available`
--
ALTER TABLE `sensor_available`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actuator_in_use`
--
ALTER TABLE `actuator_in_use`
  ADD CONSTRAINT `actuator_in_use_name` FOREIGN KEY (`actuator_name`) REFERENCES `actuator_available` (`id`),
  ADD CONSTRAINT `token_of_actuator` FOREIGN KEY (`token_id`) REFERENCES `final_configuration` (`token_id`);

--
-- Constraints for table `act_condition`
--
ALTER TABLE `act_condition`
  ADD CONSTRAINT `actuator_cons` FOREIGN KEY (`actuator_in_use_id`) REFERENCES `actuator_in_use` (`id`);

--
-- Constraints for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD CONSTRAINT `token_of_data` FOREIGN KEY (`token_id`) REFERENCES `final_configuration` (`token_id`);

--
-- Constraints for table `sensor_in_use`
--
ALTER TABLE `sensor_in_use`
  ADD CONSTRAINT `sensor_in_use_name` FOREIGN KEY (`sensor_name`) REFERENCES `sensor_available` (`id`),
  ADD CONSTRAINT `token_of_sensor` FOREIGN KEY (`token_id`) REFERENCES `final_configuration` (`token_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
