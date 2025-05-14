-- Create and use the database
CREATE DATABASE student_portal;
USE student_portal;
-- Students Table
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Courses Table
CREATE TABLE courses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  code VARCHAR(20) NOT NULL UNIQUE,
  credits INT DEFAULT 3 CHECK (credits > 0)
);

-- enrollments table (Many-to-Many between students and courses
CREATE TABLE enrollments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
  UNIQUE (student_id, course_id) -- Prevent duplicate enrollments
);

-- Sample Data For Testing
-- Sample students
INSERT INTO students (name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '5551234567'),
('Bob Smith', 'bob@example.com', '5559876543');

-- Sample courses
INSERT INTO courses (title, code, credits) VALUES
('Mathematics', 'MATH101', 4),
('Computer Science', 'CS102', 3);

-- Sample enrollments
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1);
CREATE USER 'api_user'@'localhost' IDENTIFIED BY 'securepassword';
GRANT ALL PRIVILEGES ON student_portal.* TO 'api_user'@'localhost';
FLUSH PRIVILEGES;
USE student_portal;
SHOW TABLES;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;








