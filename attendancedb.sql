-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2026 at 06:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Admin_id` varchar(50) NOT NULL,
  `Admin_name` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`Admin_id`, `Admin_name`, `Username`, `Password`) VALUES
('1', 'Susmitha', 'susmitha', '12');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `Period` varchar(10) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `student_name`, `semester`, `section`, `subject`, `attendance_date`, `Period`, `status`) VALUES
(1, '1220', 'Bhanu', '1-2', 'IT-A', 'Physics', '2026-08-10', 'P2', 'Absent'),
(2, '1203', 'Bhavitha', '1-2', 'IT-A', 'Physics', '2026-08-10', 'P2', 'Absent'),
(3, '1232', 'Kanmai', '1-2', 'IT-A', 'Physics', '2026-08-10', 'P2', 'Absent'),
(4, '1240', 'Susmitha', '1-2', 'IT-A', 'Physics', '2026-08-10', 'P2', 'Present'),
(5, '1218', 'Teja', '1-2', 'IT-A', 'Physics', '2026-08-10', 'P2', 'Absent');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_id` varchar(50) NOT NULL,
  `Course_name` varchar(50) NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_id`, `Course_name`, `Duration`) VALUES
('C001', 'B.Tech', 4),
('C002', 'M.Tech', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `Dept_id` varchar(50) NOT NULL,
  `Dept_name` varchar(50) NOT NULL,
  `Course_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`Dept_id`, `Dept_name`, `Course_id`) VALUES
('D001', 'IT', 'C001'),
('D002', 'CSE', 'C001'),
('D003', 'CSM', 'C001'),
('D004', 'CSD', 'C001'),
('D005', 'CST', 'C001'),
('D006', 'CIVIL', 'C001'),
('D007', 'MECH', 'C001');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `Faculty_id` varchar(50) NOT NULL,
  `Faculty_name` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Dept_id` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Faculty_id`, `Faculty_name`, `Gender`, `Dept_id`, `Mail`, `Mobile`, `Username`, `Password`) VALUES
('A001', 'Priya ', 'Female', 'D001', 'priya@gmail.com', '8328391515', 'priya', '12'),
('A002', 'Susmitha', 'Female', 'D001', 'susmitha@gmail.com', '9390499072', 'susmitha', '2007'),
('A003', 'Bhanu', 'Male', 'D002', 'bhanu@gmail', '1234567890', 'bhanu', '123'),
('A004', 'Ram', 'Male', 'D003', 'ram@gmail.com', '9293849928', 'ram', '1234'),
('A005', 'Sita', 'Female', 'D003', 'sita@gmail', '9293849929', 'sita', '321');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_section`
--

CREATE TABLE `faculty_section` (
  `Assignment_id` int(11) NOT NULL,
  `Faculty_id` varchar(50) NOT NULL,
  `Semester` varchar(50) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_section`
--

INSERT INTO `faculty_section` (`Assignment_id`, `Faculty_id`, `Semester`, `Section`, `Subject`) VALUES
(2, 'A001', '1-2', 'IT-A', 'Physics'),
(13, 'A003', '1-2', 'IT-A', 'Drawing'),
(14, 'A003', '1-2', 'IT-A', 'English'),
(15, 'A004', '2-2', 'IT-B', 'ES'),
(20, 'A002', '2-2', 'IT-A', 'UHV');

-- --------------------------------------------------------

--
-- Table structure for table `regulation`
--

CREATE TABLE `regulation` (
  `Regulation_id` varchar(50) NOT NULL,
  `Regulation_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regulation`
--

INSERT INTO `regulation` (`Regulation_id`, `Regulation_name`) VALUES
('R20', 'R20 regulation'),
('R23', 'R23 regulation');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_id` varchar(50) NOT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Regulation_id` varchar(50) NOT NULL,
  `Course_id` varchar(50) NOT NULL,
  `Dept_id` varchar(50) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Section` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Student_name`, `Gender`, `DOB`, `Regulation_id`, `Course_id`, `Dept_id`, `Mail`, `Mobile`, `Address`, `Semester`, `Section`, `Password`) VALUES
('1203', 'Bhavitha', 'Female', '2006-06-12', 'R23', 'C002', 'D001', 'bhavitha@gmail.com', '9293849929', 'palkollu', '1-2', 'IT-A', '123'),
('1204', 'Kavya', 'Female', '2006-11-12', 'R23', 'C001', 'D001', 'kavya@sasi.ac.in', '8328391515', 'Ballipadu', '2-2', 'IT-A', '2006'),
('1218', 'Teja', 'Female', '2006-06-09', 'R23', 'C001', 'D001', 'teja@gmail.com', '8328391515', 'Aswaraopeta', '1-2', 'IT-A', '122'),
('1220', 'Bhanu', 'Female', '2007-07-28', 'R23', 'C001', 'D001', 'bhanu@gmail.com', '9390499072', 'Bhimavaram', '1-2', 'IT-A', '1234'),
('1232', 'Kanmai', 'Female', '2007-02-10', 'R23', 'C001', 'D001', 'kanmai@gmail.com', '8328391515', 'Vizag', '1-2', 'IT-A', '1234'),
('1240', 'Susmitha', 'Female', '2007-07-05', 'R20', 'C001', 'D001', 'susmitha@gmail.com', '2147483647', 'Kothapalle,garugubilli', '1-2', 'IT-A', 'susmitha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`Dept_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`Faculty_id`),
  ADD KEY `Dept_id` (`Dept_id`);

--
-- Indexes for table `faculty_section`
--
ALTER TABLE `faculty_section`
  ADD PRIMARY KEY (`Assignment_id`),
  ADD KEY `Faculty_id` (`Faculty_id`);

--
-- Indexes for table `regulation`
--
ALTER TABLE `regulation`
  ADD PRIMARY KEY (`Regulation_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Course_id` (`Course_id`),
  ADD KEY `Dept_id` (`Dept_id`),
  ADD KEY `Regulation_id` (`Regulation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faculty_section`
--
ALTER TABLE `faculty_section`
  MODIFY `Assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept`
--
ALTER TABLE `dept`
  ADD CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`Dept_id`) REFERENCES `dept` (`Dept_id`);

--
-- Constraints for table `faculty_section`
--
ALTER TABLE `faculty_section`
  ADD CONSTRAINT `faculty_section_ibfk_1` FOREIGN KEY (`Faculty_id`) REFERENCES `faculty` (`Faculty_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Dept_id`) REFERENCES `dept` (`Dept_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`Regulation_id`) REFERENCES `regulation` (`Regulation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
