DROP DATABASE IF EXISTS campus_placement;
CREATE DATABASE campus_placement;
USE campus_placement;


CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    usn VARCHAR(20) UNIQUE,
    department VARCHAR(50),
    cgpa DECIMAL(3,2),
    email VARCHAR(100)
);


CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    location VARCHAR(100),
    industry VARCHAR(100)
);


CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    role VARCHAR(100),
    package_lpa DECIMAL(4,1),
    eligibility_cgpa DECIMAL(3,2),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);


CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(20) DEFAULT 'Applied',
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);


CREATE TABLE interviews (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    interview_date DATE,
    result VARCHAR(20),
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    role VARCHAR(30)
);

-- Insert 100 students
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Karthik Das', '4SF23AI001', 'ECE', 9.78, 'karthik.das1@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aman Gowda', '4SF23AI002', 'AI & ML', 9.69, 'aman.gowda2@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Lokesh Rao', '4SF23AI003', 'ISE', 8.37, 'lokesh.rao3@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kunal Fernandes', '4SF23AI004', 'AI & ML', 7.3, 'kunal.fernandes4@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Varsha Das', '4SF23AI005', 'EEE', 7.62, 'varsha.das5@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kavitha Das', '4SF23AI006', 'ECE', 8.47, 'kavitha.das6@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sahana Hegde', '4SF23AI007', 'ISE', 7.22, 'sahana.hegde7@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nikita Menon', '4SF23AI008', 'ISE', 8.0, 'nikita.menon8@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Janani Kumar', '4SF23AI009', 'ISE', 6.25, 'janani.kumar9@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Priya Chauhan', '4SF23AI010', 'Civil', 6.56, 'priya.chauhan10@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Palak Patel', '4SF23AI011', 'AI & ML', 6.4, 'palak.patel11@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kunal Chauhan', '4SF23AI012', 'ME', 6.73, 'kunal.chauhan12@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Akhila Shetty', '4SF23AI013', 'EEE', 8.5, 'akhila.shetty13@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Saurabh Chauhan', '4SF23AI014', 'ISE', 9.64, 'saurabh.chauhan14@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Bharath Bhat', '4SF23AI015', 'EEE', 7.37, 'bharath.bhat15@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nihal Khan', '4SF23AI016', 'ECE', 6.8, 'nihal.khan16@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pranav Bhat', '4SF23AI017', 'Civil', 8.79, 'pranav.bhat17@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Ritu Nair', '4SF23AI018', 'CSE', 9.28, 'ritu.nair18@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sujith Reddy', '4SF23AI019', 'CSE', 9.96, 'sujith.reddy19@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Yogesh Nair', '4SF23AI020', 'EEE', 8.17, 'yogesh.nair20@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nitin Varma', '4SF23AI021', 'ISE', 6.14, 'nitin.varma21@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Esha Shetty', '4SF23AI022', 'CSE', 8.55, 'esha.shetty22@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Bharath Menon', '4SF23AI023', 'AI & ML', 7.58, 'bharath.menon23@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pavan Das', '4SF23AI024', 'ME', 9.98, 'pavan.das24@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Vihan Das', '4SF23AI025', 'EEE', 9.19, 'vihan.das25@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kalyan Bhat', '4SF23AI026', 'Civil', 7.73, 'kalyan.bhat26@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pooja Sharma', '4SF23AI027', 'ME', 6.77, 'pooja.sharma27@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Manisha Menon', '4SF23AI028', 'ISE', 8.27, 'manisha.menon28@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Leena Menon', '4SF23AI029', 'EEE', 6.38, 'leena.menon29@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kunal Das', '4SF23AI030', 'CSE', 9.86, 'kunal.das30@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Bindu Naik', '4SF23AI031', 'EEE', 8.37, 'bindu.naik31@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Shruthi Iyer', '4SF23AI032', 'ISE', 7.04, 'shruthi.iyer32@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nivedita Kumar', '4SF23AI033', 'EEE', 6.43, 'nivedita.kumar33@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Karthik Prasad', '4SF23AI034', 'ME', 8.12, 'karthik.prasad34@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Vihan Hegde', '4SF23AI035', 'ME', 9.54, 'vihan.hegde35@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aditya Varma', '4SF23AI036', 'ISE', 6.37, 'aditya.varma36@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Venkat Naik', '4SF23AI037', 'ECE', 8.87, 'venkat.naik37@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Priya Fernandes', '4SF23AI038', 'ME', 6.77, 'priya.fernandes38@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Divya Bhat', '4SF23AI039', 'ME', 7.49, 'divya.bhat39@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Dhruv Hegde', '4SF23AI040', 'ECE', 9.88, 'dhruv.hegde40@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pooja Rao', '4SF23AI041', 'AI & ML', 7.26, 'pooja.rao41@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Tarun Hegde', '4SF23AI042', 'EEE', 9.56, 'tarun.hegde42@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sameer Prasad', '4SF23AI043', 'ISE', 8.29, 'sameer.prasad43@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pavan Pillai', '4SF23AI044', 'EEE', 8.43, 'pavan.pillai44@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Ramesh Chauhan', '4SF23AI045', 'CSE', 8.52, 'ramesh.chauhan45@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Yash Naik', '4SF23AI046', 'ISE', 8.37, 'yash.naik46@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Janani Sharma', '4SF23AI047', 'ECE', 8.96, 'janani.sharma47@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kalyan Iyer', '4SF23AI048', 'CSE', 9.73, 'kalyan.iyer48@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Venkat Shetty', '4SF23AI049', 'Civil', 8.72, 'venkat.shetty49@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Saurabh Fernandes', '4SF23AI050', 'CSE', 7.36, 'saurabh.fernandes50@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kumar Fernandes', '4SF23AI051', 'CSE', 9.32, 'kumar.fernandes51@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Naina Chauhan', '4SF23AI052', 'CSE', 9.55, 'naina.chauhan52@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Pooja Sharma', '4SF23AI053', 'EEE', 8.9, 'pooja.sharma53@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Naina Naik', '4SF23AI054', 'EEE', 6.85, 'naina.naik54@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Shanaya Chauhan', '4SF23AI055', 'ME', 7.32, 'shanaya.chauhan55@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Vihan Patel', '4SF23AI056', 'CSE', 6.22, 'vihan.patel56@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aisha Menon', '4SF23AI057', 'ISE', 7.36, 'aisha.menon57@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Janani Bhat', '4SF23AI058', 'Civil', 9.75, 'janani.bhat58@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aman Reddy', '4SF23AI059', 'ECE', 7.96, 'aman.reddy59@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kunal Pillai', '4SF23AI060', 'Civil', 6.08, 'kunal.pillai60@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sahana Kumar', '4SF23AI061', 'CSE', 6.18, 'sahana.kumar61@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nirali Fernandes', '4SF23AI062', 'EEE', 9.18, 'nirali.fernandes62@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Uma Patel', '4SF23AI063', 'ECE', 9.43, 'uma.patel63@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Shanaya Varma', '4SF23AI064', 'AI & ML', 7.6, 'shanaya.varma64@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Arjun Menon', '4SF23AI065', 'ME', 6.69, 'arjun.menon65@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Gita Hegde', '4SF23AI066', 'Civil', 8.38, 'gita.hegde66@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sowmya Iyer', '4SF23AI067', 'Civil', 9.71, 'sowmya.iyer67@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Janani Prasad', '4SF23AI068', 'ECE', 7.84, 'janani.prasad68@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Lalit Shetty', '4SF23AI069', 'ISE', 6.82, 'lalit.shetty69@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Akhila Fernandes', '4SF23AI070', 'Civil', 9.41, 'akhila.fernandes70@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nihal Das', '4SF23AI071', 'ECE', 6.06, 'nihal.das71@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Bharath Varma', '4SF23AI072', 'EEE', 7.87, 'bharath.varma72@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Rohini Fernandes', '4SF23AI073', 'EEE', 7.65, 'rohini.fernandes73@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Keerthi Gowda', '4SF23AI074', 'EEE', 8.54, 'keerthi.gowda74@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Lokesh Kumar', '4SF23AI075', 'EEE', 7.34, 'lokesh.kumar75@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Venkat Hegde', '4SF23AI076', 'EEE', 7.76, 'venkat.hegde76@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sneha Nair', '4SF23AI077', 'AI & ML', 6.78, 'sneha.nair77@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aditya Chauhan', '4SF23AI078', 'AI & ML', 9.06, 'aditya.chauhan78@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Hema Patel', '4SF23AI079', 'ECE', 7.38, 'hema.patel79@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kalyan Rao', '4SF23AI080', 'EEE', 8.03, 'kalyan.rao80@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Charan Rao', '4SF23AI081', 'ECE', 9.75, 'charan.rao81@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Ritu Reddy', '4SF23AI082', 'CSE', 8.81, 'ritu.reddy82@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Esha Menon', '4SF23AI083', 'ME', 6.21, 'esha.menon83@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Mira Kumar', '4SF23AI084', 'CSE', 6.5, 'mira.kumar84@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Bharath Das', '4SF23AI085', 'ISE', 7.46, 'bharath.das85@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Lakshmi Kumar', '4SF23AI086', 'ISE', 6.72, 'lakshmi.kumar86@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Harsha Varma', '4SF23AI087', 'CSE', 7.27, 'harsha.varma87@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Mira Fernandes', '4SF23AI088', 'ISE', 8.33, 'mira.fernandes88@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Kumar Rao', '4SF23AI089', 'AI & ML', 8.8, 'kumar.rao89@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Charan Khan', '4SF23AI090', 'EEE', 8.8, 'charan.khan90@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Shreyas Iyer', '4SF23AI091', 'ME', 6.17, 'shreyas.iyer91@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sana Hegde', '4SF23AI092', 'Civil', 7.41, 'sana.hegde92@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Ritika Prasad', '4SF23AI093', 'CSE', 9.6, 'ritika.prasad93@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Arnav Naik', '4SF23AI094', 'AI & ML', 6.89, 'arnav.naik94@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Aditya Iyer', '4SF23AI095', 'ECE', 7.94, 'aditya.iyer95@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Rachana Prasad', '4SF23AI096', 'EEE', 9.28, 'rachana.prasad96@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nitin Kumar', '4SF23AI097', 'ME', 9.32, 'nitin.kumar97@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Sowmya Iyer', '4SF23AI098', 'Civil', 6.5, 'sowmya.iyer98@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Arjun Shetty', '4SF23AI099', 'ECE', 9.89, 'arjun.shetty99@sahyadri.edu');
INSERT INTO students(name, usn, department, cgpa, email) VALUES ('Nihal Chauhan', '4SF23AI100', 'CSE', 6.37, 'nihal.chauhan100@sahyadri.edu');

-- Insert 100 companies
INSERT INTO companies(name, location, industry) VALUES ('InfoWorks 1', 'Goa', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('VertexLabs 2', 'Kochi', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('GlobalEnterprises 3', 'Chennai', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('NetTechnologies 4', 'Chennai', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('SoftTechnologies 5', 'Noida', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('VertexWorks 6', 'Goa', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('AISystems 7', 'Mangalore', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('CloudStudios 8', 'Hyderabad', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('SysDynamics 9', 'Mumbai', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('VertexLabs 10', 'Delhi', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('AIEnterprises 11', 'Chennai', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('DataDynamics 12', 'Bangalore', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('BlueServices 13', 'Hyderabad', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('DataDynamics 14', 'Goa', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('InfoSystems 15', 'Kochi', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('DataLabs 16', 'Pune', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('SigmaEnterprises 17', 'Pune', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('DataDynamics 18', 'Mumbai', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('SigmaServices 19', 'Kochi', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('AIConsulting 20', 'Goa', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('PrimeWorks 21', 'Mumbai', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('VertexConsulting 22', 'Mumbai', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('ApexLabs 23', 'Pune', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('InfoSystems 24', 'Pune', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('TechWorks 25', 'Hyderabad', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('InnoTechnologies 26', 'Bangalore', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('BlueSystems 27', 'Pune', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('ApexStudios 28', 'Mumbai', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('CoreDynamics 29', 'Kochi', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('BlueStudios 30', 'Bangalore', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('TechLabs 31', 'Mumbai', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('NextConsulting 32', 'Kochi', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('NetStudios 33', 'Hyderabad', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('ApexConsulting 34', 'Mumbai', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('OrbitEnterprises 35', 'Mumbai', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('InfoTechnologies 36', 'Goa', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('InnoDynamics 37', 'Noida', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('NetStudios 38', 'Kochi', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('SoftSolutions 39', 'Noida', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('InfoStudios 40', 'Bangalore', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('SigmaEnterprises 41', 'Hyderabad', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('SigmaSystems 42', 'Hyderabad', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('VertexConsulting 43', 'Mangalore', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('SysDynamics 44', 'Delhi', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('SoftLabs 45', 'Bangalore', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('SoftConsulting 46', 'Chennai', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('SysTechnologies 47', 'Bangalore', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('SigmaConsulting 48', 'Chennai', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('OrbitWorks 49', 'Mumbai', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('VertexSolutions 50', 'Noida', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('CloudLabs 51', 'Delhi', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('TechEnterprises 52', 'Chennai', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('BlueWorks 53', 'Hyderabad', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('CoreStudios 54', 'Kochi', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('TechSolutions 55', 'Noida', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('InnoConsulting 56', 'Hyderabad', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('SoftDynamics 57', 'Hyderabad', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('InnoSolutions 58', 'Mumbai', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('VertexSystems 59', 'Mangalore', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('BlueWorks 60', 'Goa', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('SigmaConsulting 61', 'Delhi', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('InnoSolutions 62', 'Kochi', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('GreenServices 63', 'Bangalore', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('BrightStudios 64', 'Mumbai', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('CoreDynamics 65', 'Delhi', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('InfoStudios 66', 'Chennai', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('ApexTechnologies 67', 'Pune', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('CoreServices 68', 'Goa', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('SoftServices 69', 'Mangalore', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('PrimeSolutions 70', 'Kochi', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('InfoServices 71', 'Hyderabad', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('PrimeConsulting 72', 'Goa', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('AIDynamics 73', 'Kochi', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('TechStudios 74', 'Goa', 'Fintech');
INSERT INTO companies(name, location, industry) VALUES ('InfoWorks 75', 'Pune', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('GreenConsulting 76', 'Mangalore', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('ApexWorks 77', 'Hyderabad', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('GreenConsulting 78', 'Goa', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('SigmaLabs 79', 'Mumbai', 'Manufacturing');
INSERT INTO companies(name, location, industry) VALUES ('NetTechnologies 80', 'Mangalore', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('TechSystems 81', 'Chennai', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('CloudLabs 82', 'Goa', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('InfoEnterprises 83', 'Chennai', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('InfoConsulting 84', 'Noida', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('CoreLabs 85', 'Noida', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('BrightSystems 86', 'Kochi', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('BrightStudios 87', 'Pune', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('BlueSystems 88', 'Bangalore', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('CoreEnterprises 89', 'Pune', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('GreenLabs 90', 'Kochi', 'IT Services');
INSERT INTO companies(name, location, industry) VALUES ('BlueEnterprises 91', 'Noida', 'Research');
INSERT INTO companies(name, location, industry) VALUES ('SigmaStudios 92', 'Bangalore', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('CoreStudios 93', 'Hyderabad', 'EdTech');
INSERT INTO companies(name, location, industry) VALUES ('ApexSolutions 94', 'Goa', 'Healthcare');
INSERT INTO companies(name, location, industry) VALUES ('GreenStudios 95', 'Mangalore', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('InfoEnterprises 96', 'Delhi', 'E-commerce');
INSERT INTO companies(name, location, industry) VALUES ('NetEnterprises 97', 'Chennai', 'Automotive');
INSERT INTO companies(name, location, industry) VALUES ('GlobalDynamics 98', 'Kochi', 'IT');
INSERT INTO companies(name, location, industry) VALUES ('InnoSolutions 99', 'Pune', 'Consulting');
INSERT INTO companies(name, location, industry) VALUES ('GlobalConsulting 100', 'Noida', 'Manufacturing');

-- Insert 100 jobs
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (1, 'Cybersecurity Analyst', 14.9, 8.07);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (2, 'Fullstack Developer', 22.5, 8.56);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (3, 'Platform Engineer', 18.3, 8.74);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (4, 'Product Engineer', 9.9, 8.43);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (5, 'Technical Support', 8.4, 6.92);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (6, 'Frontend Developer', 12.1, 8.72);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (7, 'System Administrator', 18.2, 8.81);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (8, 'Data Analyst', 23.7, 8.73);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (9, 'Cloud Engineer', 7.6, 8.05);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (10, 'DevOps Engineer', 23.2, 6.64);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (11, 'QA Engineer', 6.3, 7.72);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (12, 'Machine Learning Engineer', 5.8, 7.43);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (13, 'Technical Support', 10.9, 7.03);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (14, 'Product Engineer', 5.3, 7.6);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (15, 'Fullstack Developer', 23.2, 6.84);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (16, 'Product Engineer', 24.6, 8.77);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (17, 'Cloud Engineer', 16.0, 7.18);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (18, 'Cybersecurity Analyst', 16.8, 7.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (19, 'Data Analyst', 19.1, 6.93);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (20, 'Fullstack Developer', 11.3, 8.91);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (21, 'Machine Learning Engineer', 15.1, 7.59);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (22, 'Database Administrator', 9.0, 8.52);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (23, 'AI Intern', 23.9, 8.51);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (24, 'Platform Engineer', 12.6, 8.34);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (25, 'Platform Engineer', 15.9, 8.78);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (26, 'Platform Engineer', 20.7, 7.31);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (27, 'Machine Learning Engineer', 24.8, 6.99);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (28, 'Data Analyst', 3.7, 8.99);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (29, 'Cybersecurity Analyst', 12.6, 8.2);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (30, 'Product Engineer', 19.8, 7.0);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (31, 'Platform Engineer', 11.3, 8.36);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (32, 'Business Analyst', 20.1, 7.82);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (33, 'AI Intern', 18.2, 7.49);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (34, 'Data Scientist', 24.6, 6.86);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (35, 'Data Analyst', 20.4, 8.97);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (36, 'Backend Developer', 15.5, 7.28);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (37, 'Cloud Engineer', 22.6, 8.92);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (38, 'Platform Engineer', 18.7, 8.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (39, 'AI Intern', 11.8, 8.69);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (40, 'Backend Developer', 9.4, 8.32);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (41, 'Cloud Engineer', 9.5, 8.29);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (42, 'AI Intern', 19.2, 7.83);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (43, 'Fullstack Developer', 21.7, 7.46);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (44, 'Data Scientist', 8.9, 6.92);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (45, 'Cloud Engineer', 5.6, 7.01);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (46, 'Backend Developer', 22.7, 7.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (47, 'Platform Engineer', 17.3, 8.43);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (48, 'Research Intern', 14.3, 7.42);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (49, 'Technical Support', 15.5, 7.14);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (50, 'Cybersecurity Analyst', 22.9, 7.16);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (51, 'Technical Support', 7.3, 8.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (52, 'Data Scientist', 7.8, 6.8);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (53, 'Backend Developer', 8.1, 7.57);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (54, 'Fullstack Developer', 13.9, 8.01);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (55, 'DevOps Engineer', 20.9, 8.71);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (56, 'Mobile Developer', 14.2, 8.75);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (57, 'Database Administrator', 5.7, 8.07);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (58, 'Data Analyst', 7.1, 7.05);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (59, 'Platform Engineer', 6.2, 8.88);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (60, 'Technical Support', 22.8, 7.7);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (61, 'QA Engineer', 15.4, 7.47);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (62, 'Research Intern', 8.6, 7.72);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (63, 'Frontend Developer', 7.2, 7.79);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (64, 'Machine Learning Engineer', 21.8, 7.02);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (65, 'AI Intern', 22.5, 8.61);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (66, 'Technical Support', 23.4, 8.09);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (67, 'QA Engineer', 23.6, 7.18);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (68, 'Research Intern', 15.9, 8.51);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (69, 'Machine Learning Engineer', 23.6, 7.17);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (70, 'Platform Engineer', 12.3, 8.15);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (71, 'Platform Engineer', 9.1, 6.96);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (72, 'Fullstack Developer', 10.9, 7.42);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (73, 'AI Intern', 16.4, 8.0);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (74, 'Database Administrator', 4.9, 7.19);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (75, 'System Administrator', 18.5, 7.65);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (76, 'Business Analyst', 8.2, 7.16);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (77, 'Frontend Developer', 5.8, 8.18);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (78, 'Database Administrator', 19.6, 7.09);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (79, 'DevOps Engineer', 10.2, 6.59);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (80, 'Data Analyst', 4.7, 8.31);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (81, 'Technical Support', 20.0, 8.09);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (82, 'Database Administrator', 10.5, 8.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (83, 'Backend Developer', 17.9, 8.35);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (84, 'Technical Support', 3.4, 7.74);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (85, 'Backend Developer', 24.5, 7.4);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (86, 'Product Engineer', 3.5, 7.26);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (87, 'Mobile Developer', 16.1, 8.69);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (88, 'Data Analyst', 7.8, 7.74);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (89, 'Product Engineer', 15.5, 8.55);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (90, 'Mobile Developer', 20.8, 6.64);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (91, 'AI Intern', 17.9, 7.13);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (92, 'AI Intern', 13.7, 7.72);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (93, 'Backend Developer', 23.5, 8.66);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (94, 'Platform Engineer', 6.6, 8.71);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (95, 'Backend Developer', 16.3, 6.78);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (96, 'Database Administrator', 18.2, 8.26);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (97, 'Software Engineer', 5.6, 6.75);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (98, 'Research Intern', 21.5, 7.37);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (99, 'Data Analyst', 8.7, 7.29);
INSERT INTO jobs(company_id, role, package_lpa, eligibility_cgpa) VALUES (100, 'Product Engineer', 17.4, 7.75);

-- Insert 100 applications
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (66, 27, '2025-05-21', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (27, 67, '2025-03-01', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (4, 94, '2025-11-09', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (77, 3, '2025-08-18', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (72, 5, '2025-05-19', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (24, 20, '2025-02-26', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (3, 30, '2025-08-11', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (27, 88, '2025-06-17', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (5, 32, '2025-03-02', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (58, 62, '2025-09-23', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (51, 30, '2025-08-16', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (93, 95, '2025-11-14', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (14, 67, '2025-03-15', 'Withdrawn');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (31, 25, '2025-06-09', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (23, 48, '2025-06-17', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (88, 46, '2025-09-18', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (93, 46, '2025-04-28', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (65, 75, '2025-08-09', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (24, 5, '2025-07-18', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (8, 44, '2025-07-12', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (33, 54, '2025-03-08', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (66, 44, '2025-01-19', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (55, 53, '2025-01-01', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (67, 51, '2025-10-12', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (91, 38, '2025-09-21', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (32, 29, '2025-04-22', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (83, 30, '2025-07-28', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (50, 66, '2025-04-04', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (11, 24, '2025-11-16', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (87, 44, '2025-04-26', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (23, 76, '2025-08-30', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 58, '2025-09-22', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (49, 48, '2025-09-09', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (51, 90, '2025-06-10', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (23, 9, '2025-03-23', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (85, 34, '2025-03-26', 'Withdrawn');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 78, '2025-01-25', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (58, 81, '2025-03-02', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (53, 88, '2025-01-12', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (38, 78, '2025-05-31', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (14, 3, '2025-02-11', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (79, 21, '2025-08-24', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (83, 17, '2025-06-04', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (27, 78, '2025-10-10', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (81, 26, '2025-03-13', 'Withdrawn');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (13, 19, '2025-09-24', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (53, 1, '2025-07-07', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (37, 58, '2025-10-02', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (57, 50, '2025-06-02', 'Withdrawn');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 44, '2025-05-26', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (31, 52, '2025-07-13', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (28, 12, '2025-09-19', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (38, 89, '2025-06-27', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (64, 71, '2025-03-22', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (68, 81, '2025-08-17', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (65, 91, '2025-02-16', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (22, 84, '2025-10-14', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (37, 12, '2025-06-05', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (49, 53, '2025-08-03', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 31, '2025-08-30', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (51, 56, '2025-06-19', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (90, 91, '2025-07-12', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (75, 53, '2025-09-21', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (82, 96, '2025-05-25', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (28, 17, '2025-02-18', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (67, 57, '2025-03-24', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 51, '2025-03-26', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (32, 16, '2025-04-15', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (10, 71, '2025-07-21', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (28, 24, '2025-08-07', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (6, 40, '2025-06-08', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (9, 30, '2025-11-16', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (8, 69, '2025-11-13', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (13, 90, '2025-07-03', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (100, 100, '2025-08-31', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (6, 96, '2025-02-03', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (13, 70, '2025-01-05', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (82, 48, '2025-06-05', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (98, 17, '2025-08-16', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (33, 72, '2025-05-17', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (52, 72, '2025-01-28', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (43, 50, '2025-07-19', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (4, 59, '2025-04-12', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (84, 37, '2025-02-04', 'Rejected');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (92, 51, '2025-05-31', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (43, 17, '2025-04-04', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (8, 19, '2025-02-26', 'Withdrawn');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (22, 59, '2025-09-03', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (18, 71, '2025-08-01', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (18, 41, '2025-08-15', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (35, 88, '2025-06-01', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (65, 74, '2025-04-04', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (10, 73, '2025-03-28', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (10, 61, '2025-03-27', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (57, 44, '2025-10-01', 'Shortlisted');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (1, 74, '2025-01-22', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (34, 50, '2025-07-19', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (81, 37, '2025-07-25', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (49, 80, '2025-07-31', 'Applied');
INSERT INTO applications(student_id, job_id, application_date, status) VALUES (46, 36, '2025-10-03', 'Applied');

-- Insert 100 interviews
INSERT INTO interviews(application_id, interview_date, result) VALUES (1, '2025-02-19', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (2, '2025-02-08', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (3, '2025-01-22', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (4, '2025-11-04', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (5, '2025-06-07', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (6, '2025-08-09', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (7, '2025-07-31', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (8, '2025-09-09', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (9, '2025-01-28', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (10, '2025-03-12', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (11, '2025-03-24', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (12, '2025-07-02', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (13, '2025-11-20', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (14, '2025-04-06', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (15, '2025-10-29', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (16, '2025-08-05', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (17, '2025-08-28', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (18, '2025-07-13', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (19, '2025-01-11', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (20, '2025-07-26', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (21, '2025-06-13', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (22, '2025-07-30', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (23, '2025-08-21', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (24, '2025-05-15', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (25, '2025-03-12', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (26, '2025-10-15', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (27, '2025-07-25', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (28, '2025-01-16', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (29, '2025-08-14', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (30, '2025-01-29', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (31, '2025-03-15', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (32, '2025-11-17', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (33, '2025-08-27', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (34, '2025-02-14', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (35, '2025-05-16', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (36, '2025-06-16', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (37, '2025-01-23', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (38, '2025-11-15', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (39, '2025-02-01', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (40, '2025-08-06', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (41, '2025-11-03', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (42, '2025-01-21', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (43, '2025-03-12', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (44, '2025-05-23', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (45, '2025-11-03', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (46, '2025-03-24', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (47, '2025-01-05', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (48, '2025-01-24', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (49, '2025-03-03', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (50, '2025-11-19', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (51, '2025-03-11', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (52, '2025-09-30', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (53, '2025-03-08', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (54, '2025-07-24', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (55, '2025-01-14', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (56, '2025-08-01', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (57, '2025-03-26', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (58, '2025-07-12', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (59, '2025-10-20', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (60, '2025-02-06', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (61, '2025-07-30', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (62, '2025-08-28', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (63, '2025-10-03', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (64, '2025-03-07', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (65, '2025-08-17', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (66, '2025-05-14', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (67, '2025-01-24', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (68, '2025-01-28', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (69, '2025-10-09', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (70, '2025-10-02', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (71, '2025-04-14', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (72, '2025-09-27', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (73, '2025-05-17', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (74, '2025-01-10', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (75, '2025-10-17', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (76, '2025-04-17', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (77, '2025-09-29', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (78, '2025-08-25', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (79, '2025-05-22', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (80, '2025-05-17', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (81, '2025-07-18', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (82, '2025-04-25', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (83, '2025-06-25', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (84, '2025-08-16', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (85, '2025-11-14', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (86, '2025-05-21', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (87, '2025-07-19', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (88, '2025-01-12', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (89, '2025-09-02', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (90, '2025-07-10', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (91, '2025-10-25', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (92, '2025-07-05', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (93, '2025-10-02', 'Hold');
INSERT INTO interviews(application_id, interview_date, result) VALUES (94, '2025-01-26', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (95, '2025-06-21', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (96, '2025-01-04', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (97, '2025-06-16', 'Selected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (98, '2025-08-25', 'Rejected');
INSERT INTO interviews(application_id, interview_date, result) VALUES (99, '2025-04-30', 'Pending');
INSERT INTO interviews(application_id, interview_date, result) VALUES (100, '2025-05-30', 'Rejected');

-- Insert 10 users
INSERT INTO users(username, password, role) VALUES ('user1', 'admin123', 'admin');
INSERT INTO users(username, password, role) VALUES ('user2', 'pass223', 'staff');
INSERT INTO users(username, password, role) VALUES ('user3', 'pass323', 'placement_coordinator');
INSERT INTO users(username, password, role) VALUES ('user4', 'pass423', 'faculty');
INSERT INTO users(username, password, role) VALUES ('user5', 'pass523', 'staff');
INSERT INTO users(username, password, role) VALUES ('user6', 'pass623', 'placement_coordinator');
INSERT INTO users(username, password, role) VALUES ('user7', 'pass723', 'staff');
INSERT INTO users(username, password, role) VALUES ('user8', 'pass823', 'faculty');
INSERT INTO users(username, password, role) VALUES ('user9', 'pass923', 'faculty');
INSERT INTO users(username, password, role) VALUES ('user10', 'pass1023', 'placement_coordinator');

DELIMITER //
CREATE TRIGGER trg_auto_interview
AFTER UPDATE ON applications
FOR EACH ROW
BEGIN
    IF NEW.status = 'Shortlisted' THEN
        INSERT INTO interviews(application_id, interview_date, result)
        VALUES (NEW.application_id, CURDATE(), 'Pending');
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE get_eligible_students(IN job INT)
BEGIN
    SELECT s.name, s.usn, s.cgpa
    FROM students s
    JOIN jobs j ON j.job_id = job
    WHERE s.cgpa >= j.eligibility_cgpa;
END //
DELIMITER ;
