

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SH_DATABASE`
--

-- --------------------------------------------------------

--
-- Table structure for table `ATTENDANCE`
--

CREATE TABLE `ATTENDANCE` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BEHAVIOUR`
--

CREATE TABLE `BEHAVIOUR` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `behaviour` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `EXCERCISES`
--

CREATE TABLE `EXCERCISES` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_teacher` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `score` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FINAL_EXAM`
--

CREATE TABLE `FINAL_EXAM` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `invigilator` int(11) NOT NULL,
  `exam_score` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `GENDER`
--

CREATE TABLE `GENDER` (
  `id` int(11) NOT NULL,
  `name_of_gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `STUDENTS_DATA`
--

CREATE TABLE `STUDENTS_DATA` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `date_of_birth` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `parent_mobile` text NOT NULL,
  `parent_email` text NOT NULL,
  `guardian_address` text NOT NULL,
  `guardian_email` text NOT NULL,
  `guardian_mobile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SUBJECT`
--

CREATE TABLE `SUBJECT` (
  `id` int(11) NOT NULL,
  `name_of_subject` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TEACHER`
--

CREATE TABLE `TEACHER` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `date_of_birth` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `subject` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TIMETABLE`
--

CREATE TABLE `TIMETABLE` (
  `id` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `subject_teacher` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_student_id_fk` (`student_id`);

--
-- Indexes for table `BEHAVIOUR`
--
ALTER TABLE `BEHAVIOUR`
  ADD PRIMARY KEY (`id`),
  ADD KEY `behaviour_student_id_fk` (`student_id`);

--
-- Indexes for table `EXCERCISES`
--
ALTER TABLE `EXCERCISES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_student_id_fk` (`student_id`),
  ADD KEY `exercise_teacher_id_fk` (`subject_teacher`),
  ADD KEY `exercise_subject_id_fk` (`subject`);

--
-- Indexes for table `FINAL_EXAM`
--
ALTER TABLE `FINAL_EXAM`
  ADD PRIMARY KEY (`id`),
  ADD KEY `final_exam_student_id_fk` (`student_id`),
  ADD KEY `final_exam_teacher_id_fk` (`invigilator`),
  ADD KEY `final_exam_subject_id_fk` (`subject`);

--
-- Indexes for table `GENDER`
--
ALTER TABLE `GENDER`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `STUDENTS_DATA`
--
ALTER TABLE `STUDENTS_DATA`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_data_gender_id_fk` (`gender`);

--
-- Indexes for table `SUBJECT`
--
ALTER TABLE `SUBJECT`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TEACHER`
--
ALTER TABLE `TEACHER`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_gender_id_fk` (`gender`),
  ADD KEY `teacher_subject_id_fk` (`subject`);

--
-- Indexes for table `TIMETABLE`
--
ALTER TABLE `TIMETABLE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_teacher_id_fk` (`subject_teacher`),
  ADD KEY `timetable_subject_id_fk` (`subject`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BEHAVIOUR`
--
ALTER TABLE `BEHAVIOUR`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EXCERCISES`
--
ALTER TABLE `EXCERCISES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FINAL_EXAM`
--
ALTER TABLE `FINAL_EXAM`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GENDER`
--
ALTER TABLE `GENDER`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `STUDENTS_DATA`
--
ALTER TABLE `STUDENTS_DATA`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SUBJECT`
--
ALTER TABLE `SUBJECT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TEACHER`
--
ALTER TABLE `TEACHER`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TIMETABLE`
--
ALTER TABLE `TIMETABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD CONSTRAINT `attendance_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `STUDENTS_DATA` (`id`);

--
-- Constraints for table `BEHAVIOUR`
--
ALTER TABLE `BEHAVIOUR`
  ADD CONSTRAINT `behaviour_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `STUDENTS_DATA` (`id`);

--
-- Constraints for table `EXCERCISES`
--
ALTER TABLE `EXCERCISES`
  ADD CONSTRAINT `exercise_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `STUDENTS_DATA` (`id`),
  ADD CONSTRAINT `exercise_subject_id_fk` FOREIGN KEY (`subject`) REFERENCES `SUBJECT` (`id`),
  ADD CONSTRAINT `exercise_teacher_id_fk` FOREIGN KEY (`subject_teacher`) REFERENCES `TEACHER` (`id`);

--
-- Constraints for table `FINAL_EXAM`
--
ALTER TABLE `FINAL_EXAM`
  ADD CONSTRAINT `final_exam_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `STUDENTS_DATA` (`id`),
  ADD CONSTRAINT `final_exam_subject_id_fk` FOREIGN KEY (`subject`) REFERENCES `SUBJECT` (`id`),
  ADD CONSTRAINT `final_exam_teacher_id_fk` FOREIGN KEY (`invigilator`) REFERENCES `TEACHER` (`id`);

--
-- Constraints for table `STUDENTS_DATA`
--
ALTER TABLE `STUDENTS_DATA`
  ADD CONSTRAINT `students_data_gender_id_fk` FOREIGN KEY (`gender`) REFERENCES `GENDER` (`id`);

--
-- Constraints for table `TEACHER`
--
ALTER TABLE `TEACHER`
  ADD CONSTRAINT `teacher_gender_id_fk` FOREIGN KEY (`gender`) REFERENCES `GENDER` (`id`),
  ADD CONSTRAINT `teacher_subject_id_fk` FOREIGN KEY (`subject`) REFERENCES `SUBJECT` (`id`);

--
-- Constraints for table `TIMETABLE`
--
ALTER TABLE `TIMETABLE`
  ADD CONSTRAINT `timetable_subject_id_fk` FOREIGN KEY (`subject`) REFERENCES `SUBJECT` (`id`),
  ADD CONSTRAINT `timetable_teacher_id_fk` FOREIGN KEY (`subject_teacher`) REFERENCES `TEACHER` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
