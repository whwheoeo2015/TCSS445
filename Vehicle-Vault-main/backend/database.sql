-- SQL Script 
/*  ********************************  
    Project Phase III 
    Group "Vehicle Vault"   
    @ Author: Anthony Pinke, Aly Badr, Johyun Jo
    This SQL Script was tested on MySQLWorkbench  
    ********************************  
*/  

-- ************************************ --
--               Part A                 --
-- There are 6 tables for our database --
-- ************************************ --
CREATE DATABASE exoticcars2;
USE exoticcars2;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exoticcars2`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_time_garage`
--

CREATE TABLE `all_time_garage` (
  `model` varchar(20) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--
CREATE TABLE `wishlist` (
  `model` varchar(20) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Table structure for table `enginetype`
--
CREATE TABLE `enginetype`(
    `enginetype` varchar(20) NOT NULL
   )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
 -- data
 INSERT INTO `enginetype` (`enginetype`) VALUES
('I3'),
('I4'),
('I5'),
('I6'),
('V4'),
('V6'),
('V10'),
('V12'),
('H4'),
('H6'),
('Electric');
   
--
-- Table structure for table `bodytype`
--
CREATE TABLE `bodytype` (
  `bodytype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bodytype`
--

INSERT INTO `bodytype` (`bodytype`) VALUES
('Convertible'),
('Coupe'),
('Hatchback'),
('Roadster'),
('Sedan'),
('SUV'),
('Truck'),
('Van');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand`) VALUES
('Acura'),
('Alfa Romeo'),
('Audi'),
('BMW'),
('Citroen'),
('Dodge'),
('Ferrai'),
('Fiat'),
('Ford'),
('Honda'),
('Hyundai'),
('Jaguar'),
('Lamborghini'),
('Lancia'),
('Lotus'),
('Maserati'),
('Mazda'),
('Mercedes'),
('Mitsubishi'),
('Nissan'),
('Peugeot'),
('Porsche'),
('Renault'),
('Subaru'),
('Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `current_garage`
--

CREATE TABLE `current_garage` (
  `model` varchar(20) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `brand` varchar(20) DEFAULT NULL,
  `model` varchar(40) NOT NULL,
  `bodytype` varchar(20) DEFAULT NULL,
  `enginename` varchar(20) DEFAULT NULL,
  `enginetype` varchar(20) DEFAULT NULL,
  `top_speed` int(11) DEFAULT NULL,
  `bhp` int(11) DEFAULT NULL,
  `torque` int(11) DEFAULT NULL,
  `info` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`brand`, `model`, `bodytype`, `enginename`, `enginetype`, `top_speed`, `bhp`, `torque`, `info`) VALUES
('BMW', '128i', 'Convertible', 'N52', 'I6', 130, 235, 200, 'The best chasis for the N52. Light weight and nimble.'),
('BMW', '128i *2008*', 'Convertible', 'N52', 'I6', 130, 135, 200, 'no convertible.'),
('BMW', '135i', 'Convertible', 'N54', 'I6', 155, 300, 300, 'One of BMWs most famous engine allowing you to turn the beautiful small car into an absolute monster on the track and put up impressive numbers on the dyno.'),
('Alfa Romeo', '156', 'Sedan', '1.6L Twin Spark', 'I4', 124, 118, 144, 'The 156 1.6 Twin Spark 16v is a front wheel drive saloon (sedan) automobile with a front located engine, sold by Alfa Romeo. The power is produced by a naturally aspirated engine of 1.6 litre capacity. This unit features double overhead camshaft valve gear, 4 cylinder layout, and 4 valves per cylinder. It develops 118 bhp (120 PS/88 kW) of power at 6300 rpm, and maximum torque of 144 N·m (106 lb·ft/14.7 kgm) at 4500 rpm. A 5 speed manual \'box transmits the power to the wheels. Claimed kerb weight is 1230 kg. It is said to be able to achieve a top speed of 200 km/h (124 mph), official fuel consumption is 11.4/6.4/8.2 l/100km urban/extra-urban/combined.'),
('BMW', '1564', 'convertible', '1.8L VTEC', 'V6', 1234, 1324, 12234, 'dghdgshdfghj'),
('Peugeot', '208', 'Hatchback', '1.2L', 'I3', 190, 130, 230, 'The Peugeot 208 is a compact hatchback with a 1.2 litre inline-three engine. It produces 130 bhp (132 PS/97 kW) and 230 N·m of torque. It features a 6-speed manual transmission and has a top speed of 190 km/h. Fuel consumption figures are 30/40/34 US MPG EPA city/highway/combined.'),
('BMW', '3.0 CSL', 'Coupe', '2.5-3.2L M30', 'I6', 137, 206, 90, 'the CSL sported a 3,153-cc engine that could produce a whopping 206 horsepower and reach a top speed of 137 mph. While the engine remained one of the key reasons behind this success, the build of the car, with lightweight materials, remained the most significant factor for its impressive performance. In fact, the \"L\" from CSL stood for \"Lightweight.\"  Read More: https://www.slashgear.com/745730/the-15-best-bmws-of-all-time/'),
('Mitsubishi', '3000GT VR4', 'Coupe', '3.0L', 'V6', 250, 300, 407, 'The Mitsubishi 3000GT VR4 is a high-performance sports coupe with a 3.0 litre twin-turbo V6 engine. It produces 300 bhp (304 PS/224 kW) and 407 N·m of torque. It features a 6-speed manual transmission and has a top speed of 250 km/h. Fuel consumption figures are 17/23/19 US MPG EPA city/highway/combined.'),
('Peugeot', '3008', 'SUV', '1.6L', 'I4', 210, 177, 250, 'The Peugeot 3008 is a compact SUV with a 1.6 litre inline-four engine. It produces 177 bhp (179 PS/132 kW) and 250 N·m of torque. It features a 6-speed automatic transmission and has a top speed of 210 km/h. Fuel consumption figures are 26/34/29 US MPG EPA city/highway/combined.'),
('bmw', '328i', 'sedan', 'n52', 'I6', 155, 241, 310, 'One of BMWs most reliable engines to be made. This naturally aspirated inline 6 is the last BMW engine of its kind.'),
('Alfa Romeo', '33', 'Sedan', '1.4L Boxer', 'H4', 104, 79, 111, 'This car has a 4 door saloon (sedan) body style with a front located engine delivering its power to the front wheels. The 1.4 litre engine is a naturally aspirated, single overhead camshaft, 4 cylinder that produces 79 bhp (80 PS/59 kW) of power at 6000 rpm, and maximum torque of 111 N·m (82 lb·ft/11.3 kgm) at 3200 rpm. This power is supplied to the wheels through a 5 speed manual gearbox. Its claimed kerb weight is 890 kg. The Alfa Romeo 33 1.4 is said to be able to manage a maxiumum speed of 167 km/h (104 mph).'),
('Nissan', '370Z', 'Coupe', '3.7L', 'V6', 250, 332, 365, 'The Nissan 370Z is a sports coupe with a 3.7 litre V6 engine. It produces 332 bhp (335 PS/246 kW) and 365 N·m of torque. It features a 6-speed manual or 7-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 18/26/21 US MPG EPA city/highway/combined.'),
('Ferrari', '488 GTB', 'Coupe', '3.9L', 'V8', 330, 661, 760, 'The Ferrari 488 GTB is a high-performance sports car with a 3.9 litre V8 engine. It produces 661 bhp (670 PS/493 kW) and 760 N·m of torque. It features a 7-speed dual-clutch automatic transmission and has a top speed of 330 km/h. Official fuel consumption figures are 15/22/18 US MPG EPA city/highway/combined.'),
('Alfa Romeo', '4C', 'Coupe', '1.75 L 1750 TBi turb', 'I6', 160, 237, 350, 'The Alfa Romeo 4C is a 2 door coupé-bodied automobile with a mid positioned engine supplying power to the rear wheels. Power is supplied by a double overhead camshaft, 1.7 litre turbocharged 4 cylinder engine, with 4 valves per cylinder that develops power and torque figures of 237 bhp (240 PS/177 kW) at 6000 rpm and 350 N·m (258 lb·ft/35.7 kgm) at 2250-4250 rpm respectively. A 6 speed manual transmission delivers the power to the wheels. The quoted weight at the kerb is 1118 kg.'),
('Fiat', '500', 'Hatchback', '1.4L', 'I4', 190, 135, 230, 'The Fiat 500 is a compact hatchback with a 1.4 litre inline-four engine. It produces 135 bhp (136 PS/100 kW) and 230 N·m of torque. It features a 6-speed manual transmission and has a top speed of 190 km/h. Fuel consumption figures are 27/34/30 US MPG EPA city/highway/combined.'),
('Fiat', '500X', 'SUV', '1.3L', 'I4', 190, 177, 270, 'Fiat 500X is a compact SUV with a 1.3 litre inline-four turbocharged engine. It produces 177 bhp (180 PS/134 kW) and 270 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 190 km/h. Official fuel consumption is 23/30/26 US MPG EPA city/highway/combined.'),
('Peugeot', '508', 'Sedan', '2.0L', 'I4', 240, 221, 300, 'The Peugeot 508 is a mid-size sedan with a 2.0 litre inline-four engine. It produces 221 bhp (224 PS/165 kW) and 300 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 240 km/h. Official fuel consumption is 23/32/27 US MPG EPA city/highway/combined.'),
('Porsche', '718 Boxster', 'Roadster', '2.5L', 'I4', 265, 350, 420, 'The Porsche 718 Boxster is a convertible roadster with a 2.5 litre turbocharged inline-four engine. It produces 350 bhp (354 PS/261 kW) and 420 N·m of torque. It features a 6-speed manual transmission and has a top speed of 265 km/h. Fuel consumption figures are 20/26/22 US MPG EPA city/highway/combined.'),
('Porsche', '718 Cayman', 'Coupe', '2.0L', 'I4', 260, 300, 380, 'The Porsche 718 Cayman is a sports coupe with a 2.0 litre turbocharged inline-four engine. It produces 300 bhp (304 PS/224 kW) and 380 N·m of torque. It features a 6-speed manual transmission and has a top speed of 260 km/h. Fuel consumption figures are 21/28/24 US MPG EPA city/highway/combined.'),
('Ferrari', '812 Superfast', 'Coupe', '6.5L', 'V12', 340, 789, 718, 'Ferrari 812 Superfast is a high-end sports coupe equipped with a 6.5 litre V12 engine. It produces 789 bhp (800 PS/588 kW) and 718 N·m of torque. It comes with a 7-speed dual-clutch automatic transmission and has a top speed of 340 km/h. Its official fuel consumption is 12/16/14 US MPG EPA city/highway/combined.'),
('Porsche', '911 Carrera', 'Coupe', '3.0L', 'H6', 290, 379, 450, 'The Porsche 911 Carrera is a high-performance sports coupe with a 3.0 litre flat-six engine. It produces 379 bhp (383 PS/282 kW) and 450 N·m of torque. It features an 8-speed dual-clutch automatic transmission and has a top speed of 290 km/h. Fuel consumption figures are 20/30/24 US MPG EPA city/highway/combined.'),
('Porsche', '911 GT3', 'Coupe', '4.0L', 'H6', 320, 502, 470, 'The Porsche 911 GT3 is a track-focused sports coupe with a 4.0 litre naturally aspirated flat-six engine. It produces 502 bhp (507 PS/373 kW) and 470 N·m of torque. It features a 6-speed manual transmission and has a top speed of 320 km/h. Fuel consumption figures are 16/23/19 US MPG EPA city/highway/combined.'),
('Porsche', '911 Speedster', 'Coupe', '4.0L', 'H6', 310, 502, 470, 'The Porsche 911 Speedster is a limited-edition sports coupe with a 4.0 litre naturally aspirated flat-six engine. It produces 502 bhp (507 PS/373 kW) and 470 N·m of torque. It features a 6-speed manual transmission and has a top speed of 310 km/h. Fuel consumption figures are 16/23/19 US MPG EPA city/highway/combined.'),
('Porsche', '911 Targa', 'Coupe', '3.0L', 'H6', 280, 379, 450, 'The Porsche 911 Targa is a distinctive coupe with a removable roof panel and a 3.0 litre flat-six engine. It produces 379 bhp (383 PS/282 kW) and 450 N·m of torque. It features an 8-speed dual-clutch automatic transmission and has a top speed of 280 km/h. Fuel consumption figures are 20/30/24 US MPG EPA city/highway/combined.'),
('Porsche', '911 Turbo', 'Coupe', '3.8L', 'H6', 320, 572, 750, 'The Porsche 911 Turbo is a high-performance sports coupe with a 3.8 litre twin-turbo flat-six engine. It produces 572 bhp (580 PS/426 kW) and 750 N·m of torque. It features an 8-speed dual-clutch automatic transmission and has a top speed of 320 km/h. Official fuel consumption is 18/25/21 US MPG EPA city/highway/combined.'),
('Honda', 'Accord', 'Sedan', '1.5L', 'I4', 210, 192, 260, 'The Honda Accord is a mid-size sedan with a 1.5 litre turbocharged inline-four engine. It produces 192 bhp (194 PS/143 kW) and 260 N·m of torque. The car features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Official fuel consumption is 30/38/33 US MPG EPA city/highway/combined.'),
('Alfa Romeo', 'Alfasud', 'Sedan', '1.3L Boxer', 'H4', 94, 62, 83, 'The Alfa Romeo Alfasud Berlina is a front wheel drive motor vehicle, with its engine placed in the front, and a 2 door saloon body. Its 4 cylinder, single overhead camshaft naturally aspirated engine has 2 valves per cylinder and a volume of 1.2 litres. It develops power and torque figures of 62 bhp (63 PS/46 kW) at 6000 rpm and 83 Nm (61 lbft/8.5 kgm) at 3500 rpm respectively. A 4 speed manual transmission supplies the power to the wheels. It weighs a stated 810 kg at the kerb. Its maximum speed stated is 152 km/h or 94 mph.'),
('Nissan', 'Altima', 'Sedan', '2.5L', 'I4', 210, 188, 244, 'The Nissan Altima is a mid-size sedan with a 2.5 litre inline-four engine. It produces 188 bhp (190 PS/140 kW) and 244 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 28/39/32 US MPG EPA city/highway/combined.'),
('Mercedes-Benz', 'AMG GT', 'Coupe', '4.0L', 'V8', 315, 523, 650, 'The Mercedes-Benz AMG GT is a high-performance sports coupe with a 4.0 litre twin-turbo V8 engine. It produces 523 bhp (530 PS/389 kW) and 650 N·m of torque. The car features a 7-speed dual-clutch automatic transmission and has a top speed of 315 km/h. Official fuel consumption is 15/21/17 US MPG EPA city/highway/combined.'),
('Subaru', 'Ascent', 'SUV', '2.4L', 'I4', 200, 260, 277, 'The Subaru Ascent is a full-size SUV with a 2.4 litre turbocharged inline-four engine. It produces 260 bhp (264 PS/195 kW) and 277 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 21/27/23 US MPG EPA city/highway/combined.'),
('Mitsubishi', 'ASX', 'SUV', '2.0L', 'I4', 190, 148, 197, 'The Mitsubishi ASX is a compact SUV with a 2.0 litre inline-four engine. It produces 148 bhp (150 PS/110 kW) and 197 N·m of torque. It features a 5-speed manual or 6-speed automatic transmission and has a top speed of 190 km/h. Fuel consumption figures are 23/30/26 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Aventador', 'Coupe', '6.5L', 'V12', 350, 730, 690, 'The Lamborghini Aventador is a flagship supercar with a 6.5 litre V12 engine. It produces 730 bhp (740 PS/544 kW) and 690 N·m of torque. It comes with a 7-speed automated manual transmission and has a top speed of 350 km/h. Official fuel consumption is 9/15/11 US MPG EPA city/highway/combined.'),
('Citroën', 'Berlingo', 'Van', '1.5L', 'I4', 170, 130, 300, 'Citroën Berlingo is a versatile van equipped with a 1.5 litre inline-four engine. It produces 130 bhp (132 PS/98 kW) and 300 N·m of torque. It features a 6-speed manual gearbox and has a top speed of 170 km/h. Its fuel consumption is 30/40/34 US MPG EPA city/highway/combined.'),
('Mercedes-Benz', 'C-Class', 'Sedan', '2.0L', 'I4', 250, 255, 370, 'The Mercedes-Benz C-Class is a luxury sedan with a 2.0 litre inline-four engine. It produces 255 bhp (258 PS/190 kW) and 370 N·m of torque. The car features a 9-speed automatic transmission and has a top speed of 250 km/h. Fuel consumption figures are 24/35/28 US MPG EPA city/highway/combined.'),
('Citroën', 'C3', 'Hatchback', '1.2L', 'I3', 185, 110, 190, 'The Citroën C3 is a subcompact hatchback with a 1.2 litre inline-three engine. It produces 110 bhp (111 PS/82 kW) and 190 N·m of torque. The car comes with a 6-speed manual transmission and has a top speed of 185 km/h. Fuel consumption figures are 25/35/29 US MPG EPA city/highway/combined.'),
('Citroën', 'C4', 'Hatchback', '1.6L', 'I4', 190, 120, 260, 'Citroën C4 is a compact hatchback with a 1.6 litre inline-four engine. It produces 120 bhp (121 PS/89 kW) and 260 N·m of torque. It features a 5-speed manual transmission and has a top speed of 190 km/h. Fuel consumption figures are 21/32/25 US MPG EPA city/highway/combined.'),
('Citroën', 'C5 Aircross', 'SUV', '1.6L', 'I4', 205, 180, 250, 'The Citroën C5 Aircross is a mid-size SUV with a 1.6 litre inline-four turbocharged engine. It produces 180 bhp (182 PS/135 kW) and 250 N·m of torque. It comes with an 8-speed automatic transmission and has a top speed of 205 km/h. Official fuel consumption is 22/31/26 US MPG EPA city/highway/combined.'),
('Toyota', 'Camry', 'Sedan', '2.5L', 'I4', 210, 203, 250, 'The Toyota Camry is a mid-size sedan with a 2.5 litre inline-four engine. It produces 203 bhp (206 PS/152 kW) and 250 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 210 km/h. Fuel consumption figures are 28/39/32 US MPG EPA city/highway/combined.'),
('Renault', 'Captur', 'SUV', '1.3L', 'I4', 200, 155, 250, 'The Renault Captur is a compact SUV with a 1.3 litre turbocharged inline-four engine. It produces 155 bhp (157 PS/116 kW) and 250 N·m of torque. It features a 7-speed dual-clutch automatic transmission and has a top speed of 200 km/h. Fuel consumption figures are 26/32/28 US MPG EPA city/highway/combined.'),
('Porsche', 'Cayenne', 'SUV', '3.0L', 'V6', 250, 335, 450, 'The Porsche Cayenne is a luxury SUV with a 3.0 litre V6 engine. It produces 335 bhp (340 PS/250 kW) and 450 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 250 km/h. Fuel consumption figures are 20/26/22 US MPG EPA city/highway/combined.'),
('Dodge', 'Challenger', 'Coupe', '5.7L', 'V8', 270, 370, 536, 'Dodge Challenger is a classic muscle car with a 5.7 litre V8 engine. It produces 370 bhp (374 PS/276 kW) and 536 N·m of torque. It features a 6-speed manual transmission and has a top speed of 270 km/h. Its fuel consumption figures are 16/25/19 US MPG EPA city/highway/combined.'),
('Dodge', 'Charger', 'Sedan', '3.6L', 'V6', 250, 292, 353, 'The Dodge Charger is a full-size sedan equipped with a 3.6 litre V6 engine. It produces 292 bhp (296 PS/219 kW) and 353 N·m of torque. The car features an 8-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 19/30/22 US MPG EPA city/highway/combined.'),
('Honda', 'Civic', 'Sedan', '2.0L', 'I4', 210, 158, 187, 'The Honda Civic is a compact sedan with a 2.0 litre inline-four engine. It produces 158 bhp (160 PS/118 kW) and 187 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 30/38/33 US MPG EPA city/highway/combined.'),
('Renault', 'Clio', 'Hatchback', '1.0L', 'I3', 190, 100, 160, 'The Renault Clio is a compact hatchback with a 1.0 litre inline-three engine. It produces 100 bhp (101 PS/75 kW) and 160 N·m of torque. It features a 5-speed manual transmission and has a top speed of 190 km/h. Fuel consumption figures are 30/40/35 US MPG EPA city/highway/combined.'),
('Toyota', 'Corolla', 'Sedan', '1.8L', 'I4', 190, 139, 173, 'The Toyota Corolla is a compact sedan with a 1.8 litre inline-four engine. It produces 139 bhp (141 PS/104 kW) and 173 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 190 km/h. Fuel consumption figures are 30/38/33 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Countach', 'Coupe', '4.0L', 'V12', 300, 455, 500, 'The Lamborghini Countach is a legendary sports car with a 4.0 litre V12 engine. It produces 455 bhp (460 PS/335 kW) and 500 N·m of torque. The car features a 5-speed manual transmission and has a top speed of 300 km/h. Official fuel consumption figures are 11/18/14 US MPG EPA city/highway/combined.'),
('Honda', 'CR-V', 'SUV', '1.5L', 'I4', 200, 190, 243, 'Honda CR-V is a compact SUV with a 1.5 litre turbocharged inline-four engine. It produces 190 bhp (192 PS/141 kW) and 243 N·m of torque. It comes with a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 28/34/30 US MPG EPA city/highway/combined.'),
('Mazda', 'CX-5', 'SUV', '2.5L', 'I4', 200, 187, 252, 'The Mazda CX-5 is a compact SUV with a 2.5 litre inline-four engine. It produces 187 bhp (190 PS/140 kW) and 252 N·m of torque. It features a 6-speed automatic transmission and has a top speed of 200 km/h. Fuel consumption figures are 24/30/26 US MPG EPA city/highway/combined.'),
('Mazda', 'CX-9', 'SUV', '2.5L', 'I4', 210, 250, 420, 'The Mazda CX-9 is a mid-size SUV with a 2.5 litre turbocharged inline-four engine. It produces 250 bhp (253 PS/186 kW) and 420 N·m of torque. It features a 6-speed automatic transmission and has a top speed of 210 km/h. Official fuel consumption is 20/26/23 US MPG EPA city/highway/combined.'),
('Lancia', 'Delta', 'Hatchback', '1.6L', 'I4', 200, 200, 320, 'The Lancia Delta is a compact hatchback with a 1.6 litre inline-four engine. It produces 200 bhp (203 PS/150 kW) and 320 N·m of torque. It features a 6-speed manual transmission and has a top speed of 200 km/h. Fuel consumption figures are 23/31/26 US MPG EPA city/highway/combined.'),
('Fiat', 'Doblo', 'Van', '1.6L', 'I4', 170, 105, 240, 'Fiat Doblo is a practical van equipped with a 1.6 litre inline-four engine. It produces 105 bhp (107 PS/79 kW) and 240 N·m of torque. The van features a 5-speed manual transmission and has a top speed of 170 km/h. Fuel consumption figures are 30/38/34 US MPG EPA city/highway/combined.'),
('Citroën', 'DS7 Crossback', 'SUV', '2.0L', 'I4', 240, 300, 400, 'The Citroën DS7 Crossback is a luxury SUV featuring a 2.0 litre inline-four turbocharged engine. It produces 300 bhp (303 PS/223 kW) and 400 N·m of torque. It is equipped with an 8-speed automatic transmission and can reach a top speed of 240 km/h. Official fuel consumption is 20/28/23 US MPG EPA city/highway/combined.'),
('Dodge', 'Durango', 'SUV', '3.6L', 'V6', 220, 295, 350, 'The Dodge Durango is a mid-size SUV powered by a 3.6 litre V6 engine. It produces 295 bhp (299 PS/221 kW) and 350 N·m of torque. The car comes with an 8-speed automatic transmission and has a top speed of 220 km/h. Official fuel consumption is 20/27/23 US MPG EPA city/highway/combined.'),
('Mercedes-Benz', 'E-Class', 'Sedan', '3.0L', 'V6', 250, 362, 500, 'The Mercedes-Benz E-Class is a mid-size luxury sedan with a 3.0 litre V6 engine. It produces 362 bhp (367 PS/271 kW) and 500 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 21/30/24 US MPG EPA city/highway/combined.'),
('Jaguar', 'E-Pace', 'SUV', '2.0L', 'I4', 220, 246, 365, 'The Jaguar E-Pace is a compact luxury SUV with a 2.0 litre inline-four engine. It produces 246 bhp (250 PS/184 kW) and 365 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 220 km/h. Official fuel consumption is 21/28/24 US MPG EPA city/highway/combined.'),
('Mitsubishi', 'Eclipse Cross', 'SUV', '1.5L', 'I4', 200, 152, 250, 'The Mitsubishi Eclipse Cross is a compact SUV with a 1.5 litre turbocharged inline-four engine. It produces 152 bhp (154 PS/114 kW) and 250 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 26/29/27 US MPG EPA city/highway/combined.'),
('Lotus', 'Elan', 'Convertible', '2.0L', 'I4', 240, 130, 180, 'The Lotus Elan is a classic convertible with a 2.0 litre inline-four engine. It produces 130 bhp (132 PS/98 kW) and 180 N·m of torque. It features a 5-speed manual transmission and has a top speed of 240 km/h. Fuel consumption figures are 22/30/25 US MPG EPA city/highway/combined.'),
('Hyundai', 'Elantra', 'Sedan', '2.0L', 'I4', 210, 147, 180, 'The Hyundai Elantra is a compact sedan with a 2.0 litre inline-four engine. It produces 147 bhp (149 PS/110 kW) and 180 N·m of torque. The car features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 33/43/37 US MPG EPA city/highway/combined.'),
('Lotus', 'Elise', 'Roadster', '1.8L', 'I4', 250, 220, 250, 'The Lotus Elise is a lightweight roadster with a 1.8 litre inline-four engine. It produces 220 bhp (221 PS/163 kW) and 250 N·m of torque. The car features a 6-speed manual transmission and has a top speed of 250 km/h. Fuel consumption figures are 20/26/22 US MPG EPA city/highway/combined.'),
('Lotus', 'Emira', 'Coupe', '3.5L', 'V6', 290, 400, 430, 'The Lotus Emira is a new generation sports coupe with a 3.5 litre V6 engine. It produces 400 bhp (406 PS/298 kW) and 430 N·m of torque. It features a 6-speed manual transmission and has a top speed of 290 km/h. Official fuel consumption is 17/23/19 US MPG EPA city/highway/combined.'),
('Ferrari', 'Enzo', 'Coupe', '6.0L', 'V12', 355, 651, 657, 'The Ferrari Enzo is a high-performance supercar with a 6.0 litre V12 engine. It produces 651 bhp (660 PS/485 kW) and 657 N·m of torque. It features a 6-speed semi-automatic transmission and has a top speed of 355 km/h. Official fuel consumption figures are 9/14/11 US MPG EPA city/highway/combined.'),
('Ford', 'Escape', 'SUV', '1.5L', 'I4', 200, 180, 240, 'The Ford Escape is a compact SUV with a 1.5 litre inline-four engine. It produces 180 bhp (182 PS/135 kW) and 240 N·m of torque. The SUV features an 8-speed automatic transmission and has a top speed of 200 km/h. Fuel consumption figures are 23/31/26 US MPG EPA city/highway/combined.'),
('Lotus', 'Evora', 'Coupe', '3.5L', 'V6', 280, 400, 410, 'The Lotus Evora is a mid-size sports coupe with a 3.5 litre V6 engine. It produces 400 bhp (406 PS/298 kW) and 410 N·m of torque. It features a 6-speed manual transmission and has a top speed of 280 km/h. Official fuel consumption is 18/25/21 US MPG EPA city/highway/combined.'),
('Lotus', 'Exige', 'Coupe', '1.8L', 'I4', 275, 345, 400, 'The Lotus Exige is a high-performance coupe with a 1.8 litre inline-four engine. It produces 345 bhp (350 PS/260 kW) and 400 N·m of torque. The car features a 6-speed manual transmission and has a top speed of 275 km/h. Fuel consumption figures are 18/24/20 US MPG EPA city/highway/combined.'),
('Ford', 'Explorer', 'SUV', '2.3L', 'I4', 210, 300, 420, 'Ford Explorer is a mid-size SUV with a 2.3 litre inline-four engine. It produces 300 bhp (304 PS/225 kW) and 420 N·m of torque. It features a 10-speed automatic transmission and has a top speed of 210 km/h. Official fuel consumption is 20/27/23 US MPG EPA city/highway/combined.'),
('Ford', 'F-150', 'Truck', '3.5L', 'V6', 200, 400, 640, 'The Ford F-150 is a full-size pickup truck with a 3.5 litre V6 engine. It produces 400 bhp (405 PS/298 kW) and 640 N·m of torque. It comes with a 10-speed automatic transmission and has a top speed of 200 km/h. Official fuel consumption is 17/24/20 US MPG EPA city/highway/combined.'),
('Jaguar', 'F-Type', 'Coupe', '5.0L', 'V8', 300, 575, 700, 'The Jaguar F-Type is a high-performance sports coupe with a 5.0 litre V8 engine. It produces 575 bhp (578 PS/425 kW) and 700 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 300 km/h. Fuel consumption figures are 16/24/19 US MPG EPA city/highway/combined.'),
('Ferrari', 'F8 Tributo', 'Coupe', '3.9L', 'V8', 340, 710, 770, 'The Ferrari F8 Tributo is a performance-oriented coupe with a 3.9 litre V8 engine. It produces 710 bhp (720 PS/530 kW) and 770 N·m of torque. It features a 7-speed dual-clutch automatic transmission and has a top speed of 340 km/h. Official fuel consumption figures are 15/22/18 US MPG EPA city/highway/combined.'),
('Honda', 'Fit', 'Hatchback', '1.5L', 'I4', 200, 130, 155, 'The Honda Fit is a subcompact hatchback with a 1.5 litre inline-four engine. It produces 130 bhp (132 PS/98 kW) and 155 N·m of torque. It comes with a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 33/40/36 US MPG EPA city/highway/combined.'),
('Lancia', 'Flavia', 'Convertible', '2.0L', 'I4', 190, 118, 170, 'The Lancia Flavia is a stylish convertible with a 2.0 litre inline-four engine. It produces 118 bhp (120 PS/88 kW) and 170 N·m of torque. It features a 4-speed automatic transmission and has a top speed of 190 km/h. Official fuel consumption is 20/28/23 US MPG EPA city/highway/combined.'),
('Ford', 'Focus', 'Hatchback', '2.0L', 'I4', 210, 252, 370, 'The Ford Focus is a compact hatchback featuring a 2.0 litre inline-four engine. It produces 252 bhp (255 PS/189 kW) and 370 N·m of torque. It features a 6-speed manual transmission and has a top speed of 210 km/h. Fuel consumption figures are 22/30/25 US MPG EPA city/highway/combined.'),
('Subaru', 'Forester', 'SUV', '2.5L', 'I4', 210, 182, 239, 'The Subaru Forester is a compact SUV with a 2.5 litre inline-four engine. It produces 182 bhp (185 PS/137 kW) and 239 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 26/33/29 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Gallardo', 'Coupe', '5.2L', 'V10', 315, 520, 510, 'The Lamborghini Gallardo is a former flagship sports coupe with a 5.2 litre V10 engine. It produces 520 bhp (523 PS/386 kW) and 510 N·m of torque. The car features a 6-speed manual or 6-speed automated manual transmission and has a top speed of 315 km/h. Official fuel consumption figures are 12/18/14 US MPG EPA city/highway/combined.'),
('Maserati', 'Ghibli', 'Sedan', '2.5L', 'V6', 250, 345, 500, 'The Maserati Ghibli is a luxury sedan with a 3.0 litre V6 engine. It produces 345 bhp (350 PS/257 kW) and 500 N·m of torque. The car features an 8-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 17/25/20 US MPG EPA city/highway/combined.'),
('Alfa Romeo', 'Giulia Quadrifoglio', 'Sedan', '2.9 690T Twin Turbo', 'V6', 191, 513, 600, 'The Alfa Romeo Giulia Quadrifoglio is a saloon (sedan) with 4 doors and a front mounted engine which delivers its power to the rear wheels. Power is supplied by a double overhead camshaft, 2.9 litre turbocharged 6 cylinder engine, with 4 valves per cylinder that develops power and torque figures of 513 bhp (520 PS/383 kW) at 6500 rpm and 600 N·m (443 lb·ft/61.2 kgm) at 2500 rpm respectively. The engine powers the wheels compliments of an 8 speed automatic transmission. Stated weight at the kerb is 1735 kg. The Alfa Romeo Giulia Quadrifoglio is said to be able to attain a top speed of 307 km/h or 191 mph.'),
('Mercedes-Benz', 'GLC', 'SUV', '2.0L', 'I4', 220, 255, 370, 'The Mercedes-Benz GLC is a compact luxury SUV with a 2.0 litre inline-four engine. It produces 255 bhp (258 PS/190 kW) and 370 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 220 km/h. Fuel consumption figures are 22/29/25 US MPG EPA city/highway/combined.'),
('Maserati', 'GranTurismo', 'Coupe', '4.7L', 'V8', 300, 454, 520, 'The Maserati GranTurismo is a grand tourer coupe with a 4.7 litre V8 engine. It produces 454 bhp (460 PS/335 kW) and 520 N·m of torque. It features a 6-speed automatic transmission and has a top speed of 300 km/h. Fuel consumption figures are 14/21/17 US MPG EPA city/highway/combined.'),
('Nissan', 'GT-R', 'Coupe', '3.8L', 'V6', 315, 565, 637, 'The Nissan GT-R is a high-performance sports coupe with a 3.8 litre twin-turbo V6 engine. It produces 565 bhp (570 PS/419 kW) and 637 N·m of torque. It features a 6-speed dual-clutch automatic transmission and has a top speed of 315 km/h. Fuel consumption figures are 16/22/18 US MPG EPA city/highway/combined.'),
('Toyota', 'Highlander', 'SUV', '3.5L', 'V6', 220, 295, 356, 'The Toyota Highlander is a mid-size SUV with a 3.5 litre V6 engine. It produces 295 bhp (299 PS/221 kW) and 356 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 220 km/h. Fuel consumption figures are 21/29/24 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Huracán', 'Coupe', '5.2L', 'V10', 325, 631, 600, 'The Lamborghini Huracán is a high-performance sports coupe with a 5.2 litre V10 engine. It produces 631 bhp (640 PS/470 kW) and 600 N·m of torque. The car features a 7-speed dual-clutch automatic transmission and has a top speed of 325 km/h. Fuel consumption figures are 13/18/15 US MPG EPA city/highway/combined.'),
('Jaguar', 'I-Pace', 'SUV', 'Electric', 'Electric', 200, 394, 696, 'The Jaguar I-Pace is an all-electric SUV with dual electric motors. It produces a combined 394 bhp (400 PS/295 kW) and 696 N·m of torque. The vehicle features a single-speed automatic transmission and has a top speed of 200 km/h. Fuel consumption equivalent is 76/80/78 MPGe city/highway/combined.'),
('Subaru', 'Impreza', 'Hatchback', '2.0L', 'I4', 210, 152, 196, 'The Subaru Impreza is a compact hatchback with a 2.0 litre inline-four engine. It produces 152 bhp (154 PS/114 kW) and 196 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 23/31/26 US MPG EPA city/highway/combined.'),
('Acura', 'Integra', 'Coupe', '1.8L VTEC', 'I6', 141, 198, 175, '*1998 Model* This vehicle has a 2 door coupé type body with a front located engine driving through the front wheels. The Acura Integra Type R\'s engine is a naturally aspirated petrol, 1.8 litre, double overhead camshaft 4 cylinder with 4 valves per cylinder. In this application it has an output of 195 bhp (198 PS/145 kW) of power at 8000 rpm, and maximum torque of 176 N·m (130 lb·ft/17.9 kgm) at 7500 rpm. The engine drives the wheels via a 5 speed manual set of gears. Quoted weight at the kerb is 1170 kg.'),
('Dodge', 'Journey', 'SUV', '2.4L', 'I4', 200, 173, 220, 'The Dodge Journey is a mid-size SUV with a 2.4 litre inline-four engine. It produces 173 bhp (175 PS/129 kW) and 220 N·m of torque. It features a 4-speed automatic transmission and has a top speed of 200 km/h. Official fuel consumption is 19/25/21 US MPG EPA city/highway/combined.'),
('Renault', 'Kadjar', 'SUV', '1.5L', 'I4', 210, 130, 320, 'The Renault Kadjar is a mid-size SUV with a 1.5 litre diesel inline-four engine. It produces 130 bhp (132 PS/97 kW) and 320 N·m of torque. It features a 6-speed manual transmission and has a top speed of 210 km/h. Official fuel consumption is 30/40/35 US MPG EPA city/highway/combined.'),
('Hyundai', 'Kona', 'SUV', '1.6L', 'I4', 210, 195, 265, 'The Hyundai Kona is a subcompact SUV with a 1.6 litre turbocharged inline-four engine. It produces 195 bhp (198 PS/146 kW) and 265 N·m of torque. The SUV features a 7-speed dual-clutch automatic transmission and has a top speed of 210 km/h. Fuel consumption figures are 27/33/30 US MPG EPA city/highway/combined.'),
('Ferrari', 'LaFerrari', 'Coupe', '6.3L', 'V12', 352, 950, 900, 'Ferrari LaFerrari is a hybrid hypercar featuring a 6.3 litre V12 engine paired with an electric motor. It produces a combined 950 bhp (963 PS/708 kW) and 900 N·m of torque. It comes with a 7-speed dual-clutch automatic transmission and has a top speed of 352 km/h. Its official fuel consumption is 12/18/15 US MPG EPA city/highway/combined.'),
('Mitsubishi', 'Lancer Evolution', 'Sedan', '2.0L', 'I4', 250, 291, 400, 'The Mitsubishi Lancer Evolution is a high-performance sedan with a 2.0 litre turbocharged inline-four engine. It produces 291 bhp (295 PS/220 kW) and 400 N·m of torque. It features a 5-speed manual transmission and has a top speed of 250 km/h. Official fuel consumption is 17/23/19 US MPG EPA city/highway/combined.'),
('Maserati', 'Levante', 'SUV', '3.0L', 'V6', 260, 345, 500, 'The Maserati Levante is a luxury SUV with a 3.0 litre V6 engine. It produces 345 bhp (350 PS/257 kW) and 500 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 260 km/h. Fuel consumption figures are 18/24/20 US MPG EPA city/highway/combined.'),
('BMW', 'M1', 'Coupe', '3.5L M88', 'I6', 162, 277, 200, 'Regarded as one of the most iconic BMWs ever produced according to CarBuzz, the M1 was an excellent machine, both for the road and tracks. It carried the powerful character of a sportscar and contributed immensely to BMW\'s racing journey. Interestingly, it was the first BMW to wear the \'M\' badge and all the 460 copies ever produced from 1978 to 1981 were hand-built (via Hot Cars). This makes the M1 one of the rarest BMWs of all time.  Read More: https://www.slashgear.com/745730/the-15-best-bmws-of-all-time/'),
('Porsche', 'Macan', 'SUV', '2.0L', 'I4', 230, 265, 400, 'The Porsche Macan is a compact luxury SUV with a 2.0 litre turbocharged inline-four engine. It produces 265 bhp (270 PS/199 kW) and 400 N·m of torque. It features a 7-speed dual-clutch automatic transmission and has a top speed of 230 km/h. Fuel consumption figures are 21/25/23 US MPG EPA city/highway/combined.'),
('Mazda', 'Mazda3', 'Sedan', '2.5L', 'I4', 210, 186, 252, 'The Mazda3 is a compact sedan with a 2.5 litre inline-four engine. It produces 186 bhp (188 PS/139 kW) and 252 N·m of torque. The car features a 6-speed automatic transmission and has a top speed of 210 km/h. Fuel consumption figures are 26/35/30 US MPG EPA city/highway/combined.'),
('Mazda', 'Mazda6', 'Sedan', '2.5L', 'I4', 210, 250, 372, 'The Mazda6 is a mid-size sedan with a 2.5 litre inline-four engine. It produces 250 bhp (253 PS/186 kW) and 372 N·m of torque. It features a 6-speed automatic transmission and has a top speed of 210 km/h. Fuel consumption figures are 26/35/30 US MPG EPA city/highway/combined.'),
('Maserati', 'MC20', 'Coupe', '3.0L', 'V6', 325, 621, 730, 'The Maserati MC20 is a high-performance supercar with a 3.0 litre twin-turbo V6 engine. It produces 621 bhp (630 PS/463 kW) and 730 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 325 km/h. Fuel consumption figures are 15/24/18 US MPG EPA city/highway/combined.'),
('Acura', 'MDX', 'SUV', '3.5L VTEC', 'V6', 112, 290, 267, 'This vehicle has a 5 door suv/sports utility vehicle type body with a front mounted engine driving through the front wheels. Powering the Acura MDX is a single overhead camshaft, 3.5 litre naturally aspirated 6 cylinder powerplant, with 4 valves per cylinder that develops power and torque figures of 290 bhp (294 PS/216 kW) at 6200 rpm and 362 N·m (267 lb·ft/36.9 kgm) at 4700 rpm respectively. The engine powers the wheels via a 9 speed automatic transmission. The Acura MDX weighs a claimed 1829 kg at the kerb.'),
('Renault', 'Megane', 'Hatchback', '1.8L', 'I4', 220, 250, 300, 'The Renault Megane is a mid-size hatchback with a 1.8 litre turbocharged inline-four engine. It produces 250 bhp (253 PS/186 kW) and 300 N·m of torque. It features a 6-speed manual transmission and has a top speed of 220 km/h. Fuel consumption figures are 25/35/28 US MPG EPA city/highway/combined.'),
('Nissan', 'Murano', 'SUV', '3.5L', 'V6', 210, 260, 325, 'The Nissan Murano is a mid-size SUV with a 3.5 litre V6 engine. It produces 260 bhp (265 PS/196 kW) and 325 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 210 km/h. Fuel consumption figures are 20/28/23 US MPG EPA city/highway/combined.'),
('Ford', 'Mustang', 'Coupe', '5.0L', 'V8', 250, 450, 529, 'The Ford Mustang is a classic muscle car with a 5.0 litre V8 engine. It produces 450 bhp (456 PS/335 kW) and 529 N·m of torque. It features a 6-speed manual transmission and has a top speed of 250 km/h. Fuel consumption figures are 15/24/18 US MPG EPA city/highway/combined.'),
('Mazda', 'MX-5 Miata', 'Roadster', '2.0L', 'I4', 220, 181, 205, 'The Mazda MX-5 Miata is a lightweight roadster with a 2.0 litre inline-four engine. It produces 181 bhp (183 PS/135 kW) and 205 N·m of torque. It features a 6-speed manual or 6-speed automatic transmission and has a top speed of 220 km/h. Fuel consumption figures are 26/34/29 US MPG EPA city/highway/combined.'),
('Acura', 'NSX', 'Coupe', '3.5L VTEC', 'V6', 168, 270, 285, 'The Honda NSX is a 2 door coupé style road car with a mid mounted engine powering the rear wheels. Its 3 litre engine is a naturally aspirated, double overhead camshaft, 6 cylinder unit that produces 270 bhp (274 PS/201 kW) of power at 7300 rpm, and maximum torque of 285 N·m (210 lb·ft/29.1 kgm) at 6500 rpm. A 5 speed manual gearbox delivers the power to the wheels. Quoted kerb weight is 1365 kg. Maximum stated speed is 270 km/h (168 mph).'),
('Acura', 'NSX *2021*', 'Coupe', '1.8L VTEC', 'I6', 2342345, 3452345, 2345345, 'cool.'),
('Subaru', 'Outback', 'SUV', '2.5L', 'I4', 200, 182, 239, 'The Subaru Outback is a mid-size SUV with a 2.5 litre inline-four engine. It produces 182 bhp (185 PS/137 kW) and 239 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 26/33/29 US MPG EPA city/highway/combined.'),
('Mitsubishi', 'Outlander', 'SUV', '2.5L', 'I4', 200, 181, 245, 'The Mitsubishi Outlander is a mid-size SUV with a 2.5 litre inline-four engine. It produces 181 bhp (183 PS/135 kW) and 245 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 200 km/h. Fuel consumption figures are 24/30/26 US MPG EPA city/highway/combined.'),
('Mitsubishi', 'Pajero', 'SUV', '3.2L', 'I4', 180, 189, 441, 'The Mitsubishi Pajero is a full-size SUV with a 3.2 litre inline-four engine. It produces 189 bhp (192 PS/141 kW) and 441 N·m of torque. It features a 5-speed automatic transmission and has a top speed of 180 km/h. Fuel consumption figures are 20/27/23 US MPG EPA city/highway/combined.'),
('Porsche', 'Panamera', 'Sedan', '4.0L', 'V8', 305, 550, 770, 'The Porsche Panamera is a luxury sedan with a 4.0 litre twin-turbo V8 engine. It produces 550 bhp (556 PS/410 kW) and 770 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 305 km/h. Official fuel consumption is 15/23/18 US MPG EPA city/highway/combined.'),
('Fiat', 'Panda', 'Hatchback', '1.2L', 'I4', 160, 69, 102, 'Fiat Panda is a versatile hatchback with a 1.2 litre inline-four engine. It produces 69 bhp (70 PS/51 kW) and 102 N·m of torque. The car features a 5-speed manual transmission and has a top speed of 160 km/h. Official fuel consumption is 34/50/40 US MPG EPA city/highway/combined.'),
('Peugeot', 'Partner', 'Van', '1.5L', 'I4', 170, 130, 300, 'The Peugeot Partner is a versatile van with a 1.5 litre inline-four engine. It produces 130 bhp (132 PS/97 kW) and 300 N·m of torque. It features a 6-speed manual transmission and has a top speed of 170 km/h. Fuel consumption figures are 28/36/31 US MPG EPA city/highway/combined.'),
('Honda', 'Pilot', 'SUV', '3.5L', 'V6', 210, 280, 355, 'The Honda Pilot is a mid-size SUV featuring a 3.5 litre V6 engine. It produces 280 bhp (282 PS/209 kW) and 355 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 210 km/h. Official fuel consumption is 20/27/23 US MPG EPA city/highway/combined.'),
('Ferrari', 'Portofino', 'Convertible', '3.9L', 'V8', 320, 591, 760, 'The Ferrari Portofino is a luxury convertible with a 3.9 litre V8 engine. It produces 591 bhp (600 PS/441 kW) and 760 N·m of torque. The car features an 8-speed dual-clutch automatic transmission and has a top speed of 320 km/h. Fuel consumption figures are 16/24/19 US MPG EPA city/highway/combined.'),
('Audi', 'Q5', 'SUV', '3.0L TFSI Quattro', 'V6', 130, 268, 400, 'The Audi Q5 3.0T is an all wheel drive road car, with its engine located in the front, and a 5 door suv/sports utility vehicle bodyshell. The Audi Q5 3.0T\'s engine is a supercharged petrol, 3 litre, double overhead camshaft 6 cylinder with 4 valves per cylinder. This powerplant produces 268 bhp (272 PS/200 kW) of power at 4780 rpm, and maximum torque of 400 N·m (295 lb·ft/40.8 kgm) at 2150 rpm. The engine powers the wheels via an 8 speed automatic gearbox. The quoted kerb weight is 1975 kg. It is said to be able to achieve a top speed of 209 km/h, or 130 mph, officially quoted fuel consumption figures are 18/26/21 US MPG EPA city/highway/combined.'),
('Audi', 'Quattro', 'Coupe', '2.1L SOHC', 'I5', 138, 197, 270, 'The Quattro is a car from Audi, with all wheel drive, a front mounted engine and a 2 door coupé body style. The Audi Quattro\'s engine is a turbocharged petrol, 2.2 litre, single overhead camshaft 5 cylinder with 2 valves per cylinder. It produces 197 bhp (200 PS/147 kW) of power at 5800 rpm, and maximum torque of 270 N·m (199 lb·ft/27.5 kgm) at 3000 rpm. The power is supplied to the wheels through a 5 speed manual gearbox. Its stated kerb weight is 1300 kg. It is claimed to manage a maxiumum speed of 222 km/h (138 mph), manufacturer claimed fuel consumption figures are 7.6/9.7/13.4 l/100km 90 km/h / 120 km/h / urban.'),
('Maserati', 'Quattroporte', 'Sedan', '3.8L', 'V8', 290, 523, 730, 'The Maserati Quattroporte is a high-performance luxury sedan with a 3.8 litre V8 engine. It produces 523 bhp (530 PS/389 kW) and 730 N·m of torque. The car features an 8-speed automatic transmission and has a top speed of 290 km/h. Official fuel consumption is 15/22/18 US MPG EPA city/highway/combined.'),
('Audi', 'R8', 'Sedan', '3.6L PT/4.2L ABH', 'V8', 152, 247, 340, 'This car has a 4 door saloon (sedan) type body with a front located engine powering all four wheels. Its 8 cylinder, double overhead camshaft naturally aspirated engine has 4 valves per cylinder and a displacement of 3.6 litres. For this model it musters power and torque figures of 247 bhp (250 PS/184 kW) at 5800 rpm and 340 Nm (251 lbft/34.7 kgm) at 4000 rpm respectively. A 5 speed manual gearbox transfers the power to the wheels. With a claimed kerb weight of 1710 kg, the Audi V8 dispatches the 0-100 km/h yardstick in 7.6 seconds and the standing kilometre in 28.4 seconds. Top claimed speed is 244 km/h (152 mph), officially quoted fuel consumption figures are 8.7/10.5/17.5 l/100km 90 km/h / 120 km/h / urban per ECE.'),
('Toyota', 'RAV4', 'SUV', '2.5L', 'I4', 200, 203, 250, 'The Toyota RAV4 is a compact SUV with a 2.5 litre inline-four engine. It produces 203 bhp (206 PS/152 kW) and 250 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 200 km/h. Fuel consumption figures are 27/35/30 US MPG EPA city/highway/combined.'),
('Peugeot', 'RCZ', 'Coupe', '1.6L', 'I4', 250, 263, 330, 'The Peugeot RCZ is a sporty coupe with a 1.6 litre turbocharged inline-four engine. It produces 263 bhp (266 PS/196 kW) and 330 N·m of torque. It features a 6-speed manual transmission and has a top speed of 250 km/h. Fuel consumption figures are 22/30/25 US MPG EPA city/highway/combined.'),
('Acura', 'RDX', 'SUV', '2.0L VTEC Turbo', 'I4', 113, 272, 280, 'The Acura RDX is a front wheel drive road car, with its powerplant placed in the front, and a 5 door suv/sports utility vehicle bodyshell. Power is supplied by a double overhead camshaft, 2 litre turbocharged 4 cylinder powerplant, with 4 valves per cylinder that develops power and torque figures of 272 bhp (276 PS/203 kW) at 6500 rpm and 380 N·m (280 lb·ft/38.8 kgm) at 1600-4500 rpm respectively. A 10 speed automatic transmission transfers the power to the wheels. Its quoted weight at the kerb is 1716 kg.'),
('Nissan', 'Rogue', 'SUV', '2.5L', 'I4', 190, 201, 291, 'The Nissan Rogue is a compact SUV with a 2.5 litre inline-four engine. It produces 201 bhp (204 PS/150 kW) and 291 N·m of torque. It features a continuously variable transmission (CVT) and has a top speed of 190 km/h. Fuel consumption figures are 27/35/30 US MPG EPA city/highway/combined.'),
('Mercedes-Benz', 'S-Class', 'Sedan', '4.0L', 'V8', 250, 496, 700, 'The Mercedes-Benz S-Class is a full-size luxury sedan with a 4.0 litre V8 engine. It produces 496 bhp (503 PS/373 kW) and 700 N·m of torque. It features a 9-speed automatic transmission and has a top speed of 250 km/h. Fuel consumption figures are 16/25/20 US MPG EPA city/highway/combined.'),
('Audi', 'S2', 'Coupe', '2.2L Turbo 20v', 'I5', 154, 216, 309, 'The Audi S2 is an all wheel drive automobile, with its engine placed in the front, and a 2 door coupé body. The Audi S2\'s engine is a turbocharged petrol, 2.2 litre, double overhead camshaft 5 cylinder with 4 valves per cylinder. In this application it produces 216.5 bhp (220 PS/161 kW) of power at 5900 rpm, and maximum torque of 309 N·m (228 lb·ft/31.5 kgm) at 1950 rpm. The engine delivers its power through to the wheels via a 5 speed manual transmission. The stated weight at the kerb is 1420 kg. Its maximum speed claimed is 248 km/h, which is 154 mph, officially quoted fuel consumption is 7.6/9.3/14.3 l/100km 90km/h / 120km/h / urban.'),
('Hyundai', 'Santa Fe', 'SUV', '2.5L', 'I4', 210, 191, 247, 'The Hyundai Santa Fe is a mid-size SUV featuring a 2.5 litre inline-four engine. It produces 191 bhp (193 PS/142 kW) and 247 N·m of torque. It comes with an 8-speed automatic transmission and has a top speed of 210 km/h. Official fuel consumption is 22/28/25 US MPG EPA city/highway/combined.'),
('Ferrari', 'SF90 Stradale', 'Coupe', '4.0L', 'V8', 340, 986, 800, 'Ferrari SF90 Stradale is a cutting-edge hybrid sports car with a 4.0 litre V8 engine combined with electric motors. It produces a combined 986 bhp (1000 PS/735 kW) and 800 N·m of torque. It features an 8-speed dual-clutch automatic transmission and has a top speed of 340 km/h. Fuel consumption is 15/18/16 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Sián', 'Coupe', '6.5L', 'V12', 350, 819, 720, 'The Lamborghini Sián is a hybrid supercar with a 6.5 litre V12 engine combined with a 48-volt electric motor. It produces a combined 819 bhp (819 PS/600 kW) and 720 N·m of torque. It features a 7-speed automated manual transmission and has a top speed of 350 km/h. Fuel consumption is not officially rated due to its hybrid nature.'),
('Hyundai', 'Sonata', 'Sedan', '2.5L', 'I4', 220, 191, 245, 'The Hyundai Sonata is a mid-size sedan with a 2.5 litre inline-four engine. It produces 191 bhp (193 PS/142 kW) and 245 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 220 km/h. Official fuel consumption is 28/38/32 US MPG EPA city/highway/combined.'),
('Alfa Romeo', 'Stelvio Quadrifoglio', 'SUV', '2.9 690T Twin Turbo', 'V6', 177, 520, 600, 'The Alfa Romeo Stelvio Quadrifoglio is a 5 door suv/sports utility vehicle-bodied car with a front mounted engine powering all four wheels. Its engine is a turbocharged petrol, 2.9 litre, double overhead camshaft 90 degree V 6 cylinder with 4 valves per cylinder. In this application it produces 513 bhp (520 PS/383 kW) of power at 6500 rpm, and maximum torque of 600 N·m (443 lb·ft/61.2 kgm) at 2500 rpm. The engine supplies its power through to the wheels by means of an 8 speed automatic \'box. The Alfa Romeo Stelvio Quadrifoglio weighs a claimed 1925 kg at the kerb. The Alfa Romeo Stelvio Quadrifoglio is said to be able to achieve a top speed of 285 km/h, or 177 mph.'),
('Lancia', 'Stratos', 'Coupe', '2.4L', 'V6', 220, 190, 240, 'The Lancia Stratos is a legendary sports coupe with a 2.4 litre V6 engine. It produces 190 bhp (192 PS/141 kW) and 240 N·m of torque. It features a 5-speed manual transmission and has a top speed of 220 km/h. Fuel consumption figures are 15/22/18 US MPG EPA city/highway/combined.'),
('Toyota', 'Supra', 'Coupe', '3.0L', 'I6', 250, 382, 500, 'The Toyota Supra is a sports coupe with a 3.0 litre inline-six engine. It produces 382 bhp (387 PS/286 kW) and 500 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 24/31/27 US MPG EPA city/highway/combined.'),
('Renault', 'Talisman', 'Sedan', '2.0L', 'I4', 240, 200, 300, 'The Renault Talisman is a luxury sedan with a 2.0 litre turbocharged inline-four engine. It produces 200 bhp (202 PS/150 kW) and 300 N·m of torque. It features a 7-speed dual-clutch automatic transmission and has a top speed of 240 km/h. Fuel consumption figures are 22/32/26 US MPG EPA city/highway/combined.'),
('Lancia', 'Thema', 'Sedan', '3.6L', 'V6', 250, 286, 340, 'The Lancia Thema is a full-size sedan with a 3.6 litre V6 engine. It produces 286 bhp (290 PS/213 kW) and 340 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 250 km/h. Fuel consumption figures are 18/27/22 US MPG EPA city/highway/combined.'),
('Fiat', 'Tipo', 'Sedan', '1.6L', 'I4', 200, 120, 152, 'The Fiat Tipo is a mid-size sedan with a 1.6 litre inline-four engine. It produces 120 bhp (122 PS/90 kW) and 152 N·m of torque. It comes with a 6-speed manual transmission and has a top speed of 200 km/h. Fuel consumption figures are 27/38/32 US MPG EPA city/highway/combined.'),
('Acura', 'TLX', 'Sedan', '2.0L VTEC Turbo', 'I4', 131, 272, 280, 'The Acura TLX is a saloon (sedan) with 4 doors and a front mounted powerplant which delivers the power through the front wheels. It\'s powered courtesy of a naturally aspirated engine of 2.4 litre capacity. This unit features double overhead camshaft valve gear, 4 cylinder layout, and 4 valves per cylinder. It produces 206 bhp (209 PS/154 kW) of power at 6800 rpm, and maximum torque of 247 N·m (182 lb·ft/25.2 kgm) at 4500 rpm. An 8 speed automatic \'box supplies the power to the driven wheels. Claimed weight at the kerb is 1590 kg.');
INSERT INTO `model` (`brand`, `model`, `bodytype`, `enginename`, `enginetype`, `top_speed`, `bhp`, `torque`, `info`) VALUES
('Audi', 'TT RS', 'Coupe', '2.L TFSI', 'I5', 155, 394, 480, 'Audi TT RS is an automobile that has a 2 door coupé body style with a front positioned engine powering all four wheels. The power is produced by a turbocharged engine of 2 litre capacity. This unit features double overhead camshaft valve gear, 5 cylinder layout, and 4 valves per cylinder. It produces 394 bhp (399 PS/294 kW) of power, and maximum torque of 480 N·m (354 lb·ft/48.9 kgm). Power is transferred to the wheels via a 7 speed automatic gearbox. Maximum speed claimed is 250 km/h, which is 155 mph, officially stated fuel consumption figures are 19/29/23 US MPG EPA city/highway/combined.'),
('Hyundai', 'Tucson', 'SUV', '2.5L', 'I4', 200, 187, 241, 'The Hyundai Tucson is a compact SUV with a 2.5 litre inline-four engine. It produces 187 bhp (189 PS/140 kW) and 241 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 200 km/h. Fuel consumption figures are 26/33/29 US MPG EPA city/highway/combined.'),
('Lamborghini', 'Urus', 'SUV', '4.0L', 'V8', 305, 641, 850, 'The Lamborghini Urus is a high-performance luxury SUV with a 4.0 litre twin-turbo V8 engine. It produces 641 bhp (650 PS/478 kW) and 850 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 305 km/h. Fuel consumption figures are 12/17/14 US MPG EPA city/highway/combined.'),
('aston martin', 'VANTAGE', 'COUPE', '5.0l', 'v8', 210, 670, 600, 'Very fast.'),
('Dodge', 'Viper', 'Coupe', '8.4L', 'V10', 330, 645, 813, 'Dodge Viper is a high-performance sports car featuring an 8.4 litre V10 engine. It produces 645 bhp (652 PS/479 kW) and 813 N·m of torque. It comes with a 6-speed manual transmission and has a top speed of 330 km/h. Fuel consumption figures are 12/19/15 US MPG EPA city/highway/combined.'),
('Subaru', 'WRX', 'Sedan', '2.4L', 'I4', 250, 271, 350, 'The Subaru WRX is a high-performance sedan with a 2.4 litre turbocharged inline-four engine. It produces 271 bhp (274 PS/202 kW) and 350 N·m of torque. It features a 6-speed manual transmission and has a top speed of 250 km/h. Official fuel consumption is 19/26/22 US MPG EPA city/highway/combined.'),
('Jaguar', 'XE', 'Sedan', '2.0L', 'I4', 250, 247, 365, 'The Jaguar XE is a compact luxury sedan with a 2.0 litre inline-four engine. It produces 247 bhp (250 PS/184 kW) and 365 N·m of torque. The car features an 8-speed automatic transmission and has a top speed of 250 km/h. Official fuel consumption is 25/34/29 US MPG EPA city/highway/combined.'),
('Jaguar', 'XF', 'Sedan', '3.0L', 'V6', 250, 380, 450, 'The Jaguar XF is a mid-size luxury sedan equipped with a 3.0 litre V6 engine. It produces 380 bhp (385 PS/283 kW) and 450 N·m of torque. It features an 8-speed automatic transmission and has a top speed of 250 km/h. Fuel consumption figures are 20/30/24 US MPG EPA city/highway/combined.'),
('Lancia', 'Ypsilon', 'Hatchback', '1.2L', 'I4', 180, 69, 102, 'The Lancia Ypsilon is a small hatchback with a 1.2 litre inline-four engine. It produces 69 bhp (70 PS/51 kW) and 102 N·m of torque. It features a 5-speed manual transmission and has a top speed of 180 km/h. Official fuel consumption is 35/50/42 US MPG EPA city/highway/combined.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_time_garage`
--
ALTER TABLE `all_time_garage`
  ADD PRIMARY KEY (`model`);
--
-- Indexes for table `bodytype`
--
ALTER TABLE `bodytype`
  ADD PRIMARY KEY (`bodytype`);
--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand`);
  --
-- Indexes for table `enginetype`
--
ALTER TABLE `enginetype`
  ADD PRIMARY KEY (`enginetype`);
--
-- Indexes for table `current_garage`
--
ALTER TABLE `current_garage`
  ADD PRIMARY KEY (`model`);


-- indexes for table wishlist
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`model`);
--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model`,`brand`,`enginetype`);
--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_time_garage`
--
ALTER TABLE `all_time_garage`
  ADD CONSTRAINT `all_time_garage_ibfk_1` FOREIGN KEY (`model`) REFERENCES `model` (`model`);
  
--
-- Constraints for table `current_garage`
--
ALTER TABLE `current_garage`
  ADD CONSTRAINT `current_garage_ibfk_1` FOREIGN KEY (`model`) REFERENCES `model` (`model`);
  
  --
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`model`) REFERENCES `model` (`model`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- ************************************ --
--               Part C                 --
--        Designing SQL Queries         --
-- ************************************ --

-- SQL Query 1: Computes a join of at least three tables (must use JOIN ON)
-- Purpose: display vehicles with atributes
-- Expected: It displays the vehicle model, brand name, body type, and engine type.
SELECT m.model, b.brand, bt.bodytype, e.enginetype
FROM model m
JOIN brands b ON m.brand = b.brand
JOIN bodytype bt ON m.bodytype = bt.bodytype
JOIN enginetype e ON m.enginetype = e.enginetype
ORDER BY m.model ASC;

-- SQL Query 2: Uses nested queries with the IN, ANY or ALL operator and uses a GROUP BY clause 
-- Purpose:Find all vehicles that have a top speed greater than the average of all vehicles
-- Expected: return the brand, body-type, engine type and average top speed for those vehicles
SELECT m.brand, m.bodytype, m.enginetype, AVG(m.top_speed) AS average_speed
FROM model m
WHERE m.top_speed > (
    SELECT AVG(top_speed) 
    FROM model
)
GROUP BY m.brand, m.bodytype, m.enginetype
ORDER BY average_speed DESC;

-- SQL Query 3: A correlated nested query with proper aliasing applied alter
-- Purpose: Find all vehicles where the vehicle's top speed is greater than the average top speed of vehicles with the same engine type.
-- Expected: Returns the list of vehicles, their brand, and top speed, ordered by top speed.
SELECT m1.model, m1.brand, m1.top_speed
FROM model m1
WHERE m1.top_speed > (
    SELECT AVG(m2.top_speed)
    FROM model m2
    WHERE m2.enginetype = m1.enginetype
)
ORDER BY m1.top_speed DESC;

-- SQL Query 4: Uses a FULL OUTER JOIN
-- Purpose: Find all models in current_garage and wishlist.
-- Expected:  Returns models, indicating whether they are in the current garage, wishlist, or both.
SELECT COALESCE(cg.model, wl.model) AS model, 
       cg.model AS in_current_garage, 
       wl.model AS in_wishlist
FROM current_garage cg
LEFT JOIN wishlist wl ON cg.model = wl.model

UNION

SELECT COALESCE(cg.model, wl.model) AS model, 
       cg.model AS in_current_garage, 
       wl.model AS in_wishlist
FROM wishlist wl
LEFT JOIN current_garage cg ON cg.model = wl.model;

-- SQL Query 5: Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT*  
-- Purpose:Find all vehicles that are either SUV or Coupe and have a top speed over 200 mph.
-- Expected: Returns vehicle models that are either SUV or Coupe and exceed 200 mph.
SELECT model, top_speed
FROM model
WHERE bodytype = 'SUV' AND top_speed > 200

UNION

SELECT model, top_speed
FROM model
WHERE bodytype = 'Coupe' AND top_speed > 200;

-- SQL Query 6: Create your  own non-trivial SQL query (must use at least two tables in FROM clause) 
-- Purpose:Find the top 3 fastest cars.
-- Expected:List of the top 3 fastest vehicles
SELECT m.model, m.brand, m.top_speed
FROM model m
ORDER BY m.top_speed DESC
LIMIT 3;

-- SQL Query 7: Create your  own non-trivial SQL query (must use at least two tables in FROM clause) 
-- Purpose:calculates the average price for each combination,
-- Expected: returns a lisr of car with average price and orders the results by average of the price in descending.
SELECT m.enginetype, m.bodytype, AVG(m.bhp) AS average_horsepower
FROM model m
GROUP BY m.enginetype, m.bodytype
ORDER BY average_horsepower DESC;

-- SQL Query 8: Create your  own non-trivial SQL query (must use at least two tables in FROM clause)  
-- Purpose:Find all vehicles with a top speed over 250 mph and group by brand.
-- Expected: Show all vehicles over 250 mph, grouped by brand.
SELECT m.brand, COUNT(*) AS NumberOfVehicles
FROM model m
WHERE m.top_speed > 250
GROUP BY m.brand;

-- SQL Query 9: Create your  own non-trivial SQL query (must use at least three tables in FROM clause) 
-- Purpose: Find the vehicle with the best horsepower for each brand.
-- Expected: Displays the vehicle with the best horsepower for each brand.
WITH BestHPPerBrand AS (
    SELECT brand, MAX(bhp) AS best_bhp
    FROM model
    GROUP BY brand
)
SELECT m.model, m.brand, m.bhp
FROM model m
JOIN BestHPPerBrand bhp ON m.brand = bhp.brand AND m.bhp = bhp.best_bhp
ORDER BY m.brand;

-- SQL Query 10: Create your own non-trivial SQL query 
-- 					-> must use at least three tables in FROM clause  
-- 					-> must use aliasing or renaming at least once 
-- 				throughout SQL query    
-- Purpose:Find the highest horsepower car per engine type and body type.
-- Expected:  A list of the top horsepower cars, grouped by engine type and body type.
WITH MaxHPPerType AS (
    SELECT enginetype, bodytype, MAX(bhp) AS max_bhp
    FROM model
    GROUP BY enginetype, bodytype
)
SELECT m.model, m.brand, m.enginetype, m.bodytype, m.bhp
FROM model m
JOIN MaxHPPerType maxhp ON m.enginetype = maxhp.enginetype AND m.bodytype = maxhp.bodytype AND m.bhp = maxhp.max_bhp
ORDER BY m.bhp DESC;
