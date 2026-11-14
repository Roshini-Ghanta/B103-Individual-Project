CREATE DATABASE university;
USE university;

CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Student_Email` varchar(50) NOT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Student_Email` (`Student_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `instructors` (
  `Instructor_ID` int(11) NOT NULL,
  `Instructor_Name` varchar(50) DEFAULT NULL,
  `Office_Hours` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Instructor_Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  UNIQUE KEY `Instructor_Email` (`Instructor_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL,
  `Course_Name` varchar(50) DEFAULT NULL,
  `Credits` varchar(50) DEFAULT NULL,
  `Course_Description` varchar(200) DEFAULT NULL,
  `Instructor_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Course_ID`),
  KEY `Instructor_ID` (`Instructor_ID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE `enrollment` (
  `Student_ID` int(11) NOT NULL DEFAULT '0',
  `Course_ID` int(11) NOT NULL DEFAULT '0',
  `Enrollment_date` date NOT NULL,
  `Semester` varchar(50) DEFAULT NULL,
  `Campus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`,`Course_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1



