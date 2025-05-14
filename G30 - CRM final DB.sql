

Create Database CRM;


-- Customer Table #Ahmed
CREATE TABLE Customer (
    Customer_ID INT NOT NULL,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Job_title VARCHAR(50),
    Status VARCHAR(50),
    Assigned_emp VARCHAR(50),
    Email VARCHAR(50),
    CONSTRAINT PK_Customer PRIMARY KEY (Customer_ID)
);
-- Department Table nadine230223
CREATE TABLE Department (
    Dept_ID INT NOT NULL,
    Manager VARCHAR(50),
    Dept_Name VARCHAR(50),
    Location VARCHAR(50),
    Manager_Start_Date DATE,
    CONSTRAINT PK_Department PRIMARY KEY (Dept_ID)
);

-- Employee Table nadine230223
CREATE TABLE Employee (
    Employee_id INT NOT NULL,
    Department VARCHAR(50),
    Hire_date DATE,
    Termination_date DATE,
    Status VARCHAR(50),
    Email VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Role VARCHAR(50),
	Salary int,
    Department_ID INT NOT NULL,
    Phone VARCHAR(50),
   
    CONSTRAINT PK_Employee PRIMARY KEY (Employee_id),
    CONSTRAINT FK_Emp_Department FOREIGN KEY (Department_ID) REFERENCES Department (Dept_ID)
);

-- Current_Customer Table #AHmed
CREATE TABLE Current_Customer (
    Customer_ID INT NOT NULL,
    Username VARCHAR(50),
    Password VARCHAR(50),
    CONSTRAINT PK_Current_Customer PRIMARY KEY (Customer_ID),
    CONSTRAINT FK_CC_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);

-- Marketer table #Nouran 235185
CREATE TABLE Marketer (
    Employee_id INT NOT NULL,
    Function_ VARCHAR(50),
    Title VARCHAR(50),
	CONSTRAINT PK_Marketer PRIMARY KEY (Employee_id),
    CONSTRAINT FK_Mark_Employee FOREIGN KEY (Employee_id) REFERENCES Employee (Employee_id)
);

-- Campaign table #Nouran 235185
CREATE TABLE Campaign (
    ID INT NOT NULL,
    Budget_Amount decimal,
    Budget_Currency VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Target VARCHAR(50),
    Type_ VARCHAR(50),
    Start_date DATE,
    End_date DATE,
    Employee_ID_ INT NOT NULL,
    CONSTRAINT PK_Campaign PRIMARY KEY (ID),
    CONSTRAINT FK_Camp_Mark FOREIGN KEY (Employee_ID_) REFERENCES Marketer (Employee_id)
);
-- Potential_customer Table #Nouran 235185
CREATE TABLE Potential_customer (
    Customer_ID INT NOT NULL,
    Source_ VARCHAR(50),
    Status_ VARCHAR(50),
    Campaign_ID INT NOT NULL,
	--CONSTRAINT PK_Customer primary key (Customer_ID),
    CONSTRAINT FK_PC_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    CONSTRAINT FK_PC_Campaign FOREIGN KEY (Campaign_ID) REFERENCES Campaign (ID)
);

-- Support_rep Table #Ahmed
CREATE TABLE Support_rep (
    Employee_id INT NOT NULL,
    Skill VARCHAR(50),
    Region VARCHAR(50),
    CONSTRAINT PK_Suport_Rep PRIMARY KEY (Employee_ID),
    CONSTRAINT FK_SR_Employee FOREIGN KEY (Employee_id) REFERENCES Employee (Employee_id)
);

-- Support_ticket Table #Ahmed
CREATE TABLE Support_ticket (
    Ticket_id INT NOT NULL,
    Description VARCHAR(255),
    Status VARCHAR(50),
    Due_date DATE,
    Title VARCHAR(50),
    Priority VARCHAR(50),
    Customer_ID INT NOT NULL,
    Emp_ID INT NOT NULL,
    CONSTRAINT PK_Support_Ticket PRIMARY KEY (Ticket_id),
    CONSTRAINT FK_ST_Customer FOREIGN KEY (Customer_ID) REFERENCES Current_Customer (Customer_ID),
    CONSTRAINT FK_ST_Support_Rep FOREIGN KEY (Emp_ID) REFERENCES Support_rep (Employee_id)
);


--- Sales_Pipeline table  Hala 236264 ---
CREATE TABLE Sales_Pipeline (
    sales_pipeline_ID INT  ,
    address VARCHAR(50),
    Opportunity_Name VARCHAR(50),
    Lead_Source VARCHAR(50),
    Stage INT,
    Opportunity_Amount INT,
    Estimated_close_Date varchar(10),
    Contact_Name VARCHAR(50),
    CONSTRAINT PK_Sales_Pipeline PRIMARY KEY (sales_pipeline_ID)
);



-- Product Table			Abdelrahman #235576
CREATE TABLE Product (
    Product_ID INT NOT NULL,
    Name VARCHAR(50),
    Price INT,
    Barcode VARCHAR(50),
    Category VARCHAR(50),
    Stock_Level VARCHAR(50),
    Expire_date DATE,
    Descriptionn VARCHAR(255),
	Weightt Varchar(50),
	Dimensions Varchar(50),
    Pipeline_ID INT,
    CONSTRAINT PK_Product PRIMARY KEY (Product_ID),
    CONSTRAINT PK_Product_Pipe FOREIGN KEY (Pipeline_ID) REFERENCES Sales_Pipeline (sales_pipeline_ID)
);







-- Supplier Table		Abdelrahman #235576
CREATE TABLE Supplier (
    Supplier_ID INT NOT NULL,
    Email VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    CONSTRAINT PK_Supplier PRIMARY KEY (Supplier_ID)
);









-- Supply Table Abdelrahman #235576
CREATE TABLE Supply (
    Supplier_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Supp_date Varchar(50),
    CONSTRAINT FK_Supply_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID),
    CONSTRAINT FK_Supply_Product FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
);

--- Sales_Rep  table Hala 236264 ---
CREATE TABLE Sales_Rep (
Commesion_rate FLOAT ,
Territory VARCHAR (35),
Quota VARCHAR (30),
    Employee_id INT ,
    sales_pipeline_ID INT  NULL,
	Constraint pk_Sales_rep Primary key (Employee_id),
    CONSTRAINT FK_Sales_Rep FOREIGN KEY (Employee_id) REFERENCES Employee (Employee_id),
    CONSTRAINT FK_SR_Sales_Pipeline FOREIGN KEY (sales_pipeline_ID) REFERENCES Sales_Pipeline (sales_pipeline_ID)
);

-- Interact_with Table for Many-to-Many Relationship		Ahmed's table shared with Abdelrahman to create nested queries
CREATE TABLE Interact_with (
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
	Purchase_date date ,
    CONSTRAINT PK_CC_Product PRIMARY KEY (Customer_ID, Product_ID),
    CONSTRAINT FK_CC_Product_Customer FOREIGN KEY (Customer_ID) REFERENCES Current_Customer (Customer_ID),
    CONSTRAINT FK_CC_Product_Product FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
);

-- Employee_Phone Table Nadine230223
CREATE TABLE Employee_Phone (
    Phone_number INT NOT NULL,
    Phone_ID INT NOT NULL,
    CONSTRAINT PK_Emp_Phone PRIMARY KEY (Phone_number),
    CONSTRAINT FK_Emp_Phone_Employee FOREIGN KEY (Phone_ID) REFERENCES Employee (Employee_id)
);

-- Supplier_Phone Table			Abdelrahman #235576
CREATE TABLE Supplier_Phone (
    Supplier_ID INT NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Supp_Phone PRIMARY KEY (Supplier_ID, Phone),
    CONSTRAINT FK_Supp_Phone_Supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID)
);



-- Campaign_Area Table #Nouran 235185
CREATE TABLE Campaign_Area (
    ID int NOT NULL,
    Area VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Camp_Area PRIMARY KEY (ID, Area),
    CONSTRAINT FK_Camp_Area_Campaign FOREIGN KEY (ID) REFERENCES Campaign (ID)
);

-------------------------------------------------------------------------------
----------------------all alters
/*Nouran's alters */

alter table Campaign 
alter column Lname varchar(10);

alter table Potential_customer
alter column status_ varchar(30);

 alter table Campaign
 alter column Fname varchar(10);
 ------------------------------------------------------
 /*Nadine's alters*/

 alter table Employee
  alter column Fname varchar(10);

 alter table Employee
  alter column email varchar(100);

  
  alter table Department
 alter column location varchar(20);



 -- Abdelrahman's Alters #235576
-----------------------------------
Alter Table Product
Alter Column Expire_date date ;

Alter Table Supply 
Alter Column Supp_date date ;

Alter Table Product
Drop Column Weightt;

Alter Table Product 
Drop Column Dimensions;

Alter Table Supplier
ADD Type VARCHAR(50);

Alter Table Supplier
ADD Industry_name VARCHAR(50);
-----------------------------------
---Hala Alter tables 236264----
ALTER TABLE  Sales_Pipeline
ADD Address1 varchar (30);

ALTER TABLE  Sales_Pipeline
DROP COLUMN  Address1;


ALTER TABLE Sales_Rep
ALTER COLUMN Quota VARCHAR (20);


----------Nadeen's insertions------------
 insert into Department 
 values('23468','fares','Sales','cairo','2020-12-3');

 insert into Department 
 values('25791','fares','marketing','alexandria','2021-12-4');

 insert into Department 
 values('23566','hussien','HR','cairo','2023-12-5');

 insert into Department  
 values('19778','sherif','IT','giza','2021-12-3');

 insert into Department  
 values('23097','fares','finance','portsaid','2019-6-8');

 insert into Department 
 values('24589','sameh','accounting','cairo','2021-2-15');

 insert into Department 
 values('21984','hossam','Management','alexandria','2021-12-4');

 
 insert into Department 
 values('10784','fares','HR','giza','2020-11-2');
 
 insert into Department
 values('19578','ahmed','PR','alexandria','2020-12-5');
 insert into Department
 values('23874','kahled','Advertising','cairo','2020-12-4');

 insert into Department
 values('14705','fares','purchasing','alexandria','2019-10-3');

 insert into Department
 values ('45038','fares','addministration','giza','2019-11-10');

 insert into Department 
 values ('23024','ahmed','service','giza','2020-10-11');
   


INSERT INTO Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values (23793,'2020-11-10','2022-10-19','single','ahmedgamal@gmail.com','gamal','ahmed','cheif marketing officer','2300','23468');

 Insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values( '19203','2022-11-22','2021-7-15','married','kamelsaeed@gmail.com','saeed','kamel','sales team leader','1900','25791');

 Insert Into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values( 12467,'2020-8-4','2020-9-22','single','saadsamer@gmail.com','samer','saad','chief marketing officer','2450','23566');

 insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values( '14789','2021-4-21','2022-10-19','married','ameromar@gmail.com','omar','amer','sales representative','2300','19778');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values( '19872','2019-2-12','2022-4-5','single','markragaee@gmail.com','ragaee','mark','sales representative','5000','23097');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values( '15798','2020-9-10','2023-10-2','single','ahmedtamer@gmail.com','tamer','ahmed','marketing consultant','2300','24589');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values( '22567','2021-4-8','2023-4-9','married','tameraly@gmail.com','aly','tamer','sales team leader','2400','21984');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values ( '23346','2020-10-11','2022-10-4','married','zyadhassan@gmail.com','hassan','zyad','sales representative','2300','10784');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values('19670','2019-3-2','2022-6-8','married','azizahmed@gmail.com','ahmed','aziz','marketing consultant','2300','19578');

 insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values ('23023','2022-4-10','2019-6-5','single','omarramy@gamil.com','ramy','omar','marketing coordinator','2400','23874');

insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values('22679','2019-2-5','2023-4-10','married','dawodbasem@gmail.com','bassem','dawood','marketing specialist','2500','14705');

 insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
 values('13564','2023-5-6','2020-7-9','married','amraly@gmail.com','aly','amr','marketing specialist','2300','45038');

 insert into Employee (Employee_id, Hire_date, Termination_date, Status, Email, Lname, Fname, Role, Salary,Department_ID )
values ('24901','2021-2-4','2020-9-7','married','selimtamer@gmail.com','tamer','selim','marketing consultant','2300','23024');
 



 insert into Employee_Phone(phone_number,phone_ID)
 values ('01289105632','23346');

 insert into Employee_Phone(phone_number,phone_ID)
 values ('01195755604','22567');

 insert into Employee_Phone(phone_number,phone_ID)
 values ('01195756802','15798');
 
 insert into Employee_Phone(phone_number,phone_ID)
 values ('01047901304','19872');


 insert into Employee_Phone(phone_number,phone_ID)
 values('01235829017','14789');
 
 insert into Employee_Phone(phone_number,phone_ID)
 values('01039701048','12467');

 insert into Employee_Phone(phone_number,phone_ID)
 values('01035200849','19203');

 insert into Employee_Phone(phone_number,phone_ID)
 values ('01157933221','23793');

 insert into Employee_Phone(phone_number,phone_ID)
 values ('01279470112','19670');

 insert into Employee_Phone(phone_number,phone_ID)
 values('01189230784','23023');

 insert into Employee_Phone(phone_number,phone_ID)
 values('01290283671','22679');


 insert into Employee_Phone(phone_number,phone_ID)
 values('01028473010','13564');

 
 insert into Employee_Phone(phone_number,phone_ID)
 values('01219382720','24901');


--------Ahmed's insertions----Ahmed's insertions
--support rep
-- support dept
insert into Department
values(102,'ALI','Support','cairo','2021-12-4');


insert into employee(Employee_id, Department, Hire_date, Termination_date, Status, Email, Fname, Lname, Role, Department_ID, Phone , Salary)
  VALUES
  -- Active Employees
(12, 'Support', '2021-03-15', NULL, 'Active', 'ahmed.Osman@co.lab.com', 'Ahmed', 'Osman', 'Support_Super_Manager', 102, '01001234567' , 1000),
(13, 'Support', '2021-03-16', NULL, 'Active', 'sara.mahmoud@co.lab.com', 'Sara', 'Mahmoud', 'Support_Team_Leader', 102, '01001112233', 2000),
(14, 'Support', '2021-03-17', NULL, 'Active', 'amr.Khalaf@co.lab.com', 'Amr', 'Khalaf', 'Support_Team_Leader', 102, '01001000100', 2000),
(15, 'Support', '2021-03-18', NULL, 'Active', 'yasmin.Abdelrahman@co.lab.com', 'Yasmin', 'Abdelrahman', 'Support_Representative', 102, '01001543210', 2500),
(16, 'Support', '2021-03-19', NULL, 'Active', 'mohammed.Gaber@co.lab.com', 'Mohammed', 'Gaber', 'Support_Representative', 102, '01001112233', 3000),
(17, 'Support', '2021-03-20', NULL, 'Active', 'nada.Ibrahim@co.lab.com', 'Nada', 'Ibrahim', 'Support_Representative', 102, '01001000100', 3200),
-- Terminated Employees
(18, 'Support', '2021-03-21', '2023-02-28', 'Inactive', 'reham.Khalil@co.lab.com', 'Reham', 'Khalil', 'Support_Department_Manager', 102, '01009998877', null),
(19, 'Support', '2021-03-22', '2023-01-15', 'Inactive', 'hany.Rizk@co.lab.com', 'Hany', 'Rizk', 'Support_Supervisor', 102, '01009997788', null),
(20, 'Support', '2021-03-23', '2023-03-31', 'Inactive', 'laila.Sayed@co.lab.com', 'Laila', 'Sayed', 'Support_Team_Leader', 102, '01009996699', null),
(21, 'Support', '2021-03-24', '2023-04-30', 'Inactive', 'tamer.Gomaa@co.lab.com', 'Tamer', 'Gomaa', 'Support_Representative', 102, '01009995500', null),
(22, 'Support', '2021-03-25', '2023-05-31', 'Inactive', 'nourhan.mahmoud@co.lab.com', 'Nourhan', 'Mahmoud', 'Support_Representative', 102, '01009994411', null);




-- Support_rep Table
INSERT INTO Support_rep (Employee_id, Skill, Region)
VALUES
-- Active Employees
(12, 'Leadership Team', 'Cairo'),
(13, 'Customer Care', 'Alexandria'),
(14, 'Customer Care', 'Giza'),
(15, 'Customer Support', 'Cairo'),
(16, 'Customer Support', 'Alexandria'),
(17, 'Customer Support', 'Giza'),
-- Terminated Employees
(18, 'Leadership Team', 'Cairo'),
(19, 'Leadership Team', 'Alexandria'),
(20, 'Customer Care', 'Giza'),
(21, 'Customer Support', 'Cairo'),
(22, 'Customer Support', 'Alexandria');






  
-- Inserting diverse and realistic data into the Customer table
/*please notice that all the nulls here should be changed to be based on the right dept and emp id to follow
the right relationshiop*/
INSERT INTO Customer (Customer_ID, Fname, Lname, Job_title, Status, Assigned_emp, Email)
VALUES 
-- Potential Customers
(1, 'Mohamed', 'Hassan', 'Engineer', 'Potential', NULL, 'mohamed.hassan@gmail.com'),
(2, 'Hala', 'Ali', 'Doctor', 'Potential', NULL, 'hala.ali@gmail.com'),
(3, 'Tarek', 'Abdullah', 'Teacher', 'Potential', NULL, 'tarek.abdullah@gmail.com'),
(4, 'Nada', 'Youssef', 'Software Developer', 'Potential', NULL, 'nada.youssef@gmail.com'),
(5, 'Ahmed', 'Mahmoud', 'Nurse', 'Potential', NULL, 'ahmed.mahmoud@gmail.com'),
(6, 'Samira', 'Gomaa', 'Architect', 'Potential', NULL, 'samira.gomaa@gmail.com'),
(7, 'Hassan', 'Sayed', 'Pharmacist', 'Potential', NULL, 'hassan.sayed@gmail.com'),
(8, 'Nour', 'Khalil', 'Accountant', 'Potential', NULL, 'nour.khalil@gmail.com'),
-- Current Customers
(9, 'Mona', 'ElMahdy', 'Engineer', 'Current', 'yasmin Abdelrahman', 'mona.elmahdy@gmail.com'),
(10, 'Omar', 'Fawzy', 'Doctor', 'Current', 'Mohamed Gaber', 'omar.fawzy@gmail.com'),
(11, 'Amina', 'Youssef', 'Teacher', 'Current', 'Nadan Ibrahim', 'amina.youssef@gmail.com'),
(12, 'Farid', 'Salem', 'Software Developer', 'Current', 'Hany rizk', 'farid.salem@gmail.com'),
(13, 'Laila', 'Gaber', 'Nurse', 'Current', 'Amr Khalaf', 'laila.gaber@gmail.com'),
(14, 'Amr', 'Hassan', 'Architect', 'Current', 'Sara Mahmoud', 'amr.hassan@gmail.com'),
(15, 'Yasmine', 'Rizk', 'Pharmacist', 'Current', 'Nadan Ibrahim', 'yasmine.rizk@gmail.com'),
(16, 'Karim', 'Sayed', 'Accountant', 'Current', 'mohamed gaber', 'karim.sayed@gmail.com');



-- Inserting data into the Current_Customer table
INSERT INTO Current_Customer (Customer_ID, Username, Password)
VALUES
(9, 'Mona_ElMahdy', 'mona_pass123'),
(10, 'Omar_Fawzy', 'omar_pass456'),
(11, 'Amina_Youssef', 'amina_pass789'),
(12, 'Farid_Salem', 'farid_pass012'),
(13, 'Laila_Gaber', 'laila_pass345'),
(14, 'Amr_Hassan', 'amr_pass678'),
(15, 'Yasmine_Rizk', 'yasmine_pass901'),
(16, 'Karim_Sayed', 'karim_pass234');

-- Support_ticket Table
INSERT INTO Support_ticket (Ticket_id, Description, Status, Due_date, Title, Priority, Customer_ID, Emp_ID)
VALUES
(1, 'Bug in co-sheets calculations', 'Open', '2023-01-10', 'Bug Report', 'High', 9, 15),
(2, 'Unable to install co-docs', 'Closed', '2023-01-15', 'Installation Issue', 'Medium', 10, 16),
(3, 'Billing discrepancy for co-calendar', 'Open', '2023-01-20', 'Billing Inquiry', 'Low', 11, 17),
(4, 'Error in co-note features', 'Closed', '2023-01-25', 'Bug Report', 'High', 12, 15),
(5, 'Technical support for co-forms', 'Open', '2023-01-30', 'Technical Support', 'Medium', 13, 16),
(6, 'Unable to present using co-present', 'Closed', '2023-02-05', 'Presentation Issue', 'Low', 14, 17),
(7, 'Login issue with co-sheets', 'Open', '2023-02-10', 'Login Issue', 'High', 15, 15),
(8, 'Video Chat Service not working', 'Closed', '2023-02-15', 'Service Outage', 'Medium', 16, 16),
(9, 'Cloud Services storage problem', 'Open', '2023-02-20', 'Technical Support', 'High', 9, 15),
(10, 'Feature request for co-docs', 'Closed', '2023-02-25', 'Feature Request', 'Medium', 10, 16),
(11, 'Question about co-forms usage', 'Open', '2023-03-01', 'Product Inquiry', 'Low', 11, 17),
(12, 'Bug in co-calendar notifications', 'Closed', '2023-03-06', 'Bug Report', 'High', 12, 15);








 --------------------Marketer #Nouran 235185--------------------
insert into Marketer
values(12467,'Manager',' Chief marketing officer');

insert into Marketer
values(15798,'Employee','Marketing Consultant');

insert into Marketer
values(19670,'Employee','Marketing Consultant');

insert into Marketer
values(23023,'Employee','Marketing Coordinator');

insert into Marketer
values(22679,'Employee','Marketing Specialist');

insert into Marketer
values(13564,'Employee','Marketing Specialist');

insert into Marketer
values(24901,'Employee','Marketing Consultant ');



------------------------Campaign #Nouran 235185-------------------------


insert into Campaign
 values ( 130,100000000,'eg-EG','samer','saad','Youth','Social Media','2023-11-15','2023-11-30',12467);
 insert into Campaign
 values ( 120,50000000,'us-US','samer','saad','Youth','Social Media','2022-12-16','2022-12-29',12467);

 insert into Campaign
 values ( 100,200000000,'us-US','tamer','ahmed','Gen Z','Email Marketing','2021-4-2','2021-5-2',15798);

  insert into Campaign
 values ( 122,200000000,'us-US','samer','saad','Youth','Paid advertisements','2022-2-2','2022-4-2',12467);

  insert into Campaign
 values ( 125,20000000,'fr-FR','tamer','ahmed','Teens','PR','2022-4-13','2022-5-2',15798);

  insert into Campaign
 values ( 127,230000000,'fr-FR','tamer','ahmed','Teens','Social Media','2022-5-2','2022-7-13',15798);

  insert into Campaign
 values ( 99,20000000,'eg-EG','mohamed','ahmed','Teens','PR','2021-1-2','2021-2-2',24901);

 
 ----------------------------Potential_Customer #Nouran 235185-------------------------------------
 
 
insert into potential_customer
values ( 1,'Social Media ','Lead','130');
 
insert into potential_customer
 values ( 2,'Referral ','Opportunity','125');
 
insert into potential_customer
values ( 3,'Social Media','Lead','127');
 
insert into potential_customer
values ( 4,'Referral ','Qualified Lead','125');
 
   insert into potential_customer
 values ( 5,'Referral ','Lead','99');
 
   insert into potential_customer
 values ( 6,'Email','Lead','100');
 
   insert into potential_customer
 values ( 7,'Social Media','Oppurtunity','120');
 
 
 --------------------------Campaign_Area #Nouran 235185--------------------------------------------

insert into Campaign_Area
 values ('130','Nasr City');
 
  insert into Campaign_Area
 values ('120','Madinaty');
 
  insert into Campaign_Area
 values ('100','Sheraton');
 
  insert into Campaign_Area
 values ('122','ElNozha');
 
  insert into Campaign_Area
 values ('125','Nasr City');
 
  insert into Campaign_Area
 values ('127','Maadi');
 
  insert into Campaign_Area
 values ('99','ElNozha');
 

 ---Sales_Pipeline table Hala236264 -----
 
INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,   sales_pipeline_ID )
Values ('Ahmed Hassan', '02-4-2009', 'Referral', 'Type A', 50,  1   ,23793);

INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,  sales_pipeline_ID  )
Values('Mohamed hussein', '010-7-2007', 'Online', 'Type B', 75, 2  ,19203);

INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,  sales_pipeline_ID  )
Values('Hany Abdelaziz', '09-8-2022', 'Cold Call', 'Type C ', 100,  3   ,12467);

INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,   sales_pipeline_ID )
Values('Nada Ali', '25-12-2001', 'Event', 'Type D', 80,  4  ,14789);

 INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,  sales_pipeline_ID  )
Values('Amr Samir', '10-12-2000', 'Social Media', 'Type E', 120,   5    ,19872);

INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,   sales_pipeline_ID )
Values('Basant Amr', '011-1-2004','offline', 'Type F',30,  6  ,15798);

 INSERT INTO Sales_Pipeline( Contact_name, Estimated_close_date,  Lead_source , Opportunity_name ,Opportunity_amount ,Stage ,  sales_pipeline_ID  )
Values('Nadine Kareem','010-4-2001','Confreneces','Type G', 65, 7 ,22567);

--------------------

--- Sales Rep Hala236264 Table-----

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values (0.20, 'Cairo', 'Quarter 1', '23793');

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values   (0.30, 'Alexandria', 'Quarter 2', '19203');

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values (0.42, 'Luxor', 'Quarter 3', '12467');

INSERT INTO Sales_Rep(Commesion_rate,Territory,Quota,Employee_ID )
Values   (0.78, 'Sharm El Sheikh', 'Quarter 4', '14789');

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values   (0.99, 'Aswan', 'Quarter 5', '19872'); 

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values (0.73, 'Port Said', 'Quarter 6', '15798');

INSERT INTO Sales_Rep (Commesion_rate,Territory,Quota,Employee_ID )
Values (0.45,'Sharqia','Quarter 7','22567');




-- Abdelrahman #235576 insertions

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (1, 'abdelrahman@gmail.com', 'Abdelrahman', 'Almakhzangy', 'Software', 'Networking');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (2, 'mahmoud@gmail.com', 'Mahmoud', 'Mohamed', 'Software', 'IT');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (3, 'sara@gmail.com', 'Sara', 'Ahmed', 'Cloud', 'IT');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (4, 'khaled@gmail.com', 'Khaled', 'Omar', 'Software', 'Networking');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (5, 'noor@gmail.com', 'Noor', 'Amr', 'Software', 'IT');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (6, 'abdallah@gmail.com', 'Abdallah', 'Ali', 'Cloud', 'IT');

INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname, Type, Industry_name)
VALUES (7, 'noha@gmail.com', 'Noha', 'Hussien', 'Software', 'Networking');


INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname)
VALUES (8, 'omar@gmail.com', 'Omar', 'Emad');


INSERT INTO Supplier (Supplier_ID, Email, Fname, Lname)
VALUES (9, 'ashraf@gmail.com', 'Ashraf', 'Rezk');



-- Abdelrahman #235576 insertions



INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (1, '010012312300');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (2, '010098798700');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (3, '010056756700');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (4, '010045678900');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (5, '010091291200');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (6, '010094394300');

INSERT INTO Supplier_Phone (Supplier_ID, Phone)
VALUES (7, '010073473400');




















-- Abdelrahman #235576 insertions



INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (23793, 'Co-Sheets', 1500, 'CS12345', 'CSV Editing', 'Available', '2023-12-31', 'Sheets for Organizing data');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (19203, 'Co-Docs', 2000, 'CD67890', 'Word Editing', 'Under Maintenance', '2023-06-30', 'Documents for Editing Files');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (12467, 'Co-Calendar', 1000, 'CC11223', 'Calendar', 'Available', '2024-03-31', 'Calender for Managing Time');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (14789, 'Co-Note', 3000, 'CN44556', 'Note-Taking', 'Terminated', '2022-12-15', 'Notes for Brainstorming');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (1, 'Co-Sheets', 1000, '1234567A', 'CSV Editing', 'Available', '2023-12-31', 'Sheets for Organizing Data');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (2, 'Co-Docs', 2000, '1234567B', 'Word Editing', 'Under Maintenance', '2023-06-30', 'Documents for Editing Files');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (3, 'Co-Calendar', 5000, '1234567C', 'Calendar', 'Available', '2024-03-31', 'Calender for Managing Time');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (4, 'Co-Note', 8000, '1234567D', 'Note-Taking', 'Not Available', '2022-12-15', 'Notes for Brainstorming');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (5, 'Co-Forms', 1500, '1234567E', 'Form Creation', 'Available', '2024-09-30', 'Forms for Collecting Data');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (6, 'Co-Present', 2500, '1234567F', 'Presentation', 'Under Maintenance', '2023-02-28', 'Making Presentations');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (7, 'Chat Service', 5000, '1234567G', 'Communication', 'Not Available', '2022-12-15', 'Chat with Friends');


INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (8, 'Video Call Service', 7000, '1234567H', 'Communication', 'Available', '2024-12-31', 'Video Call with Friends');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (9, 'Cloud Services', 3000, '1234567J', 'Cloud Computing', 'Available', '2025-06-30', 'Cloud Services for Storing Data');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (10, 'Cloud Services', 2000, '1234567K', 'Cloud Computing', 'Available', '2024-06-30', 'Cloud Services for Storing Data');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (11, 'Co-Calendar', 5000, '1234567L', 'Calendar', 'Available', '2024-03-31', 'Calender for Managing Time');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (12, 'Co-Maps', 4000, '1234567M', 'Maps', 'Available', '2024-04-28', 'Maps for Getting Directions');

INSERT INTO Product (Product_ID, Name, Price, Barcode, Category, Stock_Level, Expire_date, Descriptionn)
VALUES (13, 'Co-Weather', 1000, '1234567N', 'Weather', 'Available', '2024-04-25', 'Weather for Getting Temperature');



-- Abdelrahman #235576 insertions



INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
VALUES (1, 1 , '2020-12-31');

INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
Values (3 ,9 , '2020-11-02'); 

INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
Values (3 ,10 , '2020-10-27'); 

INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
Values (4 ,3 , '2020-11-26'); 

INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
Values (5 ,4 , '2020-11-25'); 

INSERT INTO Supply (Supplier_ID, Product_ID , Supp_date )
Values (6 ,2 , '2020-11-21'); 


-- Abdelrahman #235576 insertions

INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (9, 1 , '2023-10-19');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (9, 5, '2023-10-18');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (10, 2, '2023-10-17');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (10, 6, '2023-10-16');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (12, 4, '2023-10-15');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (12, 8, '2023-10-14');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (13, 6, '2023-10-13');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (13, 7, '2023-10-12');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (15, 7, '2023-10-11');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (15, 8, '2023-10-10');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (16, 8, '2023-11-19');
INSERT INTO Interact_with (Customer_ID, Product_ID , Purchase_date)
VALUES (16, 9, '2023-11-18');



----------------Ahmed's Alters------------------------------- Ahmed's Alters
-- dropping is_active
ALTER TABLE customer
DROP column Assigned_emp;

ALTER TABLE Support_ticket
ALTER COLUMN Due_date  DATE;

ALTER TABLE Support_rep
ADD Is_active varchar(12) DEFAULT 'TRUEE';

/*
UPDATE Support_rep
Is_active = 'falsee'
WHERE Employee_id IN (18, 19, 20, 21, 22);
*/


ALTER TABLE Current_Customer
ADD UNIQUE (Username);


ALTER TABLE Current_Customer
ADD UNIQUE (Customer_ID);

/*
ALTER TABLE Support_ticket
ADD INDEX Due_date_idx (Due_date);
*/

UPDATE Support_ticket
SET Status = 'Resolved'
WHERE Ticket_id IN (2, 5);

UPDATE Support_ticket
SET Description = 'Technical support for co-forms integration'
WHERE Ticket_id = 5;


UPDATE Support_rep
SET Region = 'Cairo'
WHERE Employee_id = 16;


UPDATE Current_Customer
SET Username = 'Randa_Yousef'
WHERE Customer_ID = 11;









---Hala 236264 work----


---Hala 236264 Queries---

------ First Query -> Hala #236264-----

Create View H AS

SELECT DISTINCT Contact_name, stage AS 'The contact name is'
FROM Sales_Pipeline
where stage <'3';

Select * From H;

-- Second Query -> Hala #236264
SELECT Fname,Lname 
FROM Employee E, Sales_Rep  S
Where E.Employee_id = S.Employee_id AND Territory BETWEEN 'A' AND 'S'
Order by Territory;

-- Third Query -> Hala #236264

SELECT COUNT(P.sales_pipeline_ID),  Fname,Lname ,E.Employee_ID
FROM Sales_Pipeline P JOIN Sales_Rep R on P.sales_pipeline_ID= R.Employee_id JOIN Employee E on E.Employee_id = R.Employee_id
group by E.Employee_ID,Fname,Lname;


-- Forth Query -> Hala #236264

SELECT Email
FROM Customer
WHERE Customer_ID IN 
(SELECT Customer_ID
FROM Potential_customer
WHERE Campaign_ID IN (
SELECT ID
FROM Campaign
WHERE Employee_ID_ IN 
(SELECT Employee_ID_
FROM Sales_Pipeline
WHERE Stage= 3))
);

-- Fifth Query�->�Hala�#236264
--DISPLAY THE FIRST AND THE LAST NAME OF CUSTOMERS THAT HAVE SALES PIPELINE WHICH HAVE AN OPPORTUINTY AMOUNT LESS THAN 100---
SELECT Fname, Lname
FROM Customer
WHERE Customer_ID IN 
(SELECT Customer_ID
 FROM Potential_customer
 WHERE Campaign_ID IN 
 (SELECT ID
 FROM Campaign
 WHERE Employee_ID_ IN 
 (SELECT Employee_ID_
 FROM Sales_Pipeline
 WHERE Opportunity_Amount > 100))
);


-------------------------------Abdelrahman's #235576 queries & Views----------------------------
-- First Query -> Abdelrahman #235576		Aggregate
Create View v AS
Select 
COUNT (*) AS "No. of Products",
MAX(Price) AS "Highest Price" ,
MIN(Price) AS "Lowest Price" ,
AVG (Price) AS "Average" ,
SUM (Price) AS "Total Prices",
MAX (Expire_date) AS "Maximum Expiration  Date" ,
MIN (Expire_date) AS "Minimum Expiration Date" 
From Product;

Select * From  v;

-- Second Query -> Abdelrahman #235576		INNER JOIN

Select s.Supplier_ID , s.Fname + ' ' + s.Lname AS "Supplier Name", s.Email, s.Type, s.Industry_name , p.Product_ID, p.Name , p.Price 
from Supplier s
inner join supply u on s.Supplier_ID = u.Supplier_ID
inner join Product p on u.Product_ID = p.Product_ID
Order by s.Supplier_ID ;


-- Third Query -> Abdelrahman #235576		RIGHT OUTER JOIN

Select s.Supplier_ID , s.Fname + ' ' + s.Lname AS "Supplier Name", s.Email , s.Type, s.Industry_name , p.Product_ID, p.Name , p.Price 
from Supplier s
right outer join supply u on s.Supplier_ID = u.Supplier_ID
right outer join Product p on u.Product_ID = p.Product_ID
Order BY s.supplier_ID DESC;


-- Fourth Query -> Abdelrahman #235576		LEFT OUTER JOIN

Select s.Supplier_ID , s.Fname + ' ' + s.Lname AS "Supplier Name", s.Email , s.Type, s.Industry_name , p.Product_ID, p.Name , p.Price 
from Supplier s 
left outer join supply u on s.Supplier_ID = u.Supplier_ID
left outer join Product p on u.Product_ID = p.Product_ID
Order BY s.supplier_ID DESC;


-- Fifth Query -> Abdelrahman #235576		FULL OUTER JOIN

Select s.Supplier_ID , s.Fname + ' ' + s.Lname AS "Supplier Name", s.Email , s.Type, s.Industry_name , p.Product_ID, p.Name , p.Price 
from Supplier s
full outer join supply u on s.Supplier_ID = u.Supplier_ID
full outer join Product p on u.Product_ID = p.Product_ID
Order By s.Supplier_ID DESC;


-- Sixth Query -> Abdelrahman #235576		Nested Query

Select Supplier_ID , Fname + ' ' + Lname AS "Supplier Name", Email , Type, Industry_name 
From Supplier 
where Supplier_ID in 
(
	Select Product_ID
	From Product
	Where Industry_name = 'IT'
);


-- Seventh Query -> Abdelrahman #235576		Nested Query

Create View X AS

Select  Product_ID , Name
From Product
Where Product_ID not IN 
(
	Select  Product_ID 
	From Interact_with
);

Select * From X ;

-- Eighth Query -> Abdelrahman #235576		Nested Query

Create View I AS

Select Distinct Name , Product_ID
From Product
Where Product_ID not IN 
(
	Select  Product_ID 
	From Interact_with
);

Select * From I ;

-------------------------------------------------------------------------------------------------------------------


             --Nadine's queries--

--Query 1--


/*this query retrieves all the employees who are their manager is fares  */

Create View J AS

 select e.employee_id,e.Fname,e.Department_ID, d.Dept_ID,d.Manager
 from Employee e left join Department d 
 on e.Department_ID=d.Dept_ID
 where d.Manager='fares';

 Select * From J ;

 --Query 2--
 /*this query retrieves  the IDs and the names and the ID 
of the department that they are working on and the phone numbers of all the employees*/ 
SELECT e.employee_id, e.Fname, e.Lname, d.Dept_ID,
 (
  SELECT p.phone_number 
  FROM Employee_Phone p
  WHERE  e.employee_id = p.phone_ID
)as phone_number 
FROM Employee e
full JOIN Department d
ON e.Department_ID = d.Dept_ID;

--Query 3--
/*this query retrieves the id and the name of each employee works as a marketing consultant*/
 
select e.employee_id,e.Fname,e.Lname ,e.email,e.Role,d.Dept_Name
from employee e inner join Department d
on e.Department_ID=d.Dept_ID
where e.Role='Marketing consultant';

--Query 4--
/*this query retrieves the name and the id and the department 
 and the status to get the employees who are married */
select e.employee_id, e.Fname, e.status, d.Dept_Name,d.dept_ID
FROM Employee e inner join Department d
on e.Department_ID=d.Dept_ID
where e.employee_id in(select e2.employee_id
from employee e2
where e2.status='married');
--Query 5--
/*this query retrieves the salary of each employee who has a salary avg more than 1900*/

select e.salary, e.Fname,e.employee_id,e.department_id
from Employee e
where Salary>(select avg(1900)
from Employee
where Department_ID= Employee.Department_ID);

--Query 6--
/*this query retrieves the name and the phone number of the employees who have a salary more than 3000*/
select e.Fname,p.phone_number,e.salary
from employee e right join employee_phone p
on e.employee_id=p.phone_ID
where e.salary>3000;




----------------------Nouran's Queries ---------------------------------
-----Query 1       Order by query  -This query return The campaign id , Type and budget amount with its currency sign (Budget_currency )Using the format function 
----and order by the budget_amount--

 Select ID,FORMAT(Budget_Amount, 'C',Budget_Currency) as Budget ,Type_
 from campaign
 order by Budget_Amount asc ;

 ------Query 2 Nested join query -This query uses nested join to retrieve information about the employee,marketer and the camapign who have specific attributes as
 ----mentioned in the where condition--
 Select  e.employee_id,e.Fname ,e.Lname,Title ,Target,Area
 from employee e  join marketer 
 On e.employee_id=marketer.employee_id join Campaign 
 on marketer.employee_id=campaign.Employee_ID_  join campaign_area
 on campaign_area.id=campaign.ID 
 where Title='Marketing Consultant' and Target='Teens' and Area='Maadi';
 
 ------Query 3  inner join query --This query Retrives information about the campaign and the campaign area and also the marketers that are working on each campaign--
 Select c.ID as 'Campaign id',Area,Fname,Lname,Type_
 from Campaign c  inner join Campaign_Area 
 on c.ID=Campaign_Area.ID;

 --------Query 4 Datediif query --This query retrives The id and the strat and the end date of the campaigns on which its duration is more than one month 
 --and also retrives the number of months on which it lasts (using datediff function)--
 
 Create View Q AS

 Select ID,Start_date,End_date ,datediff(MONTH,Start_date,End_date) as 'Campign duration in months'
 from Campaign 
  where  datediff(MONTH,Start_date,End_date) >1;

  Select * From Q ;
 
 ------Query 5 Nested query --This query Returns the first and the last name of the Employees(marketers)who target at least one customer using the no.
 -- of campaigns he is working on (without repetition ) --
 --using Exists --
SELECT Distinct Fname, Lname
FROM Campaign 
WHERE EXISTS (SELECT *
FROM Potential_customer
WHERE ID = Campaign_ID);

---Query 6 Nested query --This query retrieves the IDs and the first and the last name of the employees(Marketers) who are not working on any campaign using 
---Not IN --
select employee.Employee_id,Fname,Lname
from Marketer,employee
where employee.Employee_id= Marketer.Employee_id and marketer.Employee_id not IN (Select Employee_ID_
from campaign ) ;


------------------------------- Ahmed's queries 234742----------------------------------------------------------------
-----------Ahmed's queries and views are split as follows:   from A to A3 are views and the rest are regular queries
------qery 1 as view
--This query retrieves all data from the Support_rep table for employees located in the 'Cairo'region and their salary is above 2000.
-------created as view
create view A as 
SELECT Support_rep.Employee_id, Employee.Fname, Employee.Lname, Support_rep.Skill, Support_rep.Region
FROM Support_rep
INNER JOIN Employee ON Support_rep.Employee_id = Employee.Employee_id
WHERE Region = 'Cairo' and Salary > 2000;

select * from A;

-------query two / view
--This query counts the number of open tickets for each customer and returns only customers with more than two open tickets.
---------created as view
create view A2 AS
SELECT Customer_ID, COUNT(*) AS Ticket_count
FROM Support_ticket
WHERE Status = 'Open'
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

select * From A2;

--- third query / view
-- This query joins the `Support_rep` and `Support_ticket` tables based on the `Emp_ID` and retrieves the skills of support representatives who are assigned to high-priority tickets.
create view A3 as 
SELECT Support_rep.Skill, Support_ticket.Title
FROM Support_rep
INNER JOIN Support_ticket ON Support_rep.Employee_id = Support_ticket.Emp_ID
WHERE Support_ticket.Priority = 'High';


select *from A3


--- query four regular query
--This query joins three tables to retrieve the usernames, job titles, and descriptions of support tickets containing the phrase "Bug Report" in their titles.

SELECT customer.customer_id,Current_Customer.Username, Customer.Job_title, Support_ticket.Description,Support_ticket.Status
FROM Current_Customer
INNER JOIN Customer ON Current_Customer.Customer_ID = Customer.Customer_ID
INNER JOIN Support_ticket ON Customer.Customer_ID = Support_ticket.Customer_ID
WHERE Support_ticket.Title LIKE '%Bug Report%';



--- fifth query
-- This query uses a neste query to find the Emp_ID of the support representative who closed the most recent ticket, then retrieves the first and last name of that representative
-- it saves those and full name., their ID, and the number of tickets they have recently closed

SELECT Employee.employee_id, Employee.Fname + ' ' + Employee.Lname AS 'Employee Name', COUNT(Support_ticket.Emp_ID) AS 'Number of Closed Tickets'
FROM Employee
INNER JOIN Support_rep ON Employee.Employee_id = Support_rep.Employee_id
INNER JOIN Support_ticket ON Support_ticket.Emp_ID = Support_rep.Employee_id
WHERE Support_ticket.Status = 'Closed'
GROUP BY Employee.employee_id, Employee.Fname + ' ' + Employee.Lname, Employee.Lname
ORDER BY Employee.Lname ASC;



-------sixth  query
-- this query Find customers with open tickets assigned to support representatives with specific skills
/*This query uses a nested method to find the Employee_ids of support representatives who have customer support in their 
skillset and then retrieves the details of customers with open tickets assigned to those representatives.*/

SELECT Customer.Fname, Customer.Lname, Support_ticket.Title, Support_ticket.Priority,Support_ticket.Due_date
FROM Customer
INNER JOIN Support_ticket ON Customer.Customer_ID = Support_ticket.Customer_ID
WHERE Support_ticket.Status = 'Open' AND Support_ticket.Emp_ID IN (
    SELECT Employee_id
    FROM Support_rep
    WHERE Skill LIKE '%Customer Support%'
);


----- seventh query 
-- this query finds customers who have the most open tickets assigned to support representatives with the highest average resolution time
SELECT c.Fname + ' ' + c.Lname AS 'Full Name', COUNT(st.Ticket_id) AS Open_ticket_count, c.Customer_ID
from Customer c
INNER JOIN Support_ticket st ON  c.Customer_ID = st.Customer_ID
WHERE st.Status = 'Open'
GROUP BY c.Fname, c.Lname, c.Customer_ID
ORDER BY Open_ticket_count DESC;


------------------ query eight  is used to get the employee_id and full names (‘Employee Name’) of employees
---who are support representatives and have closed support tickets, sorted by their last names in ascending order.
---- it shows also the priority of tickets they have worked on and the tickets ID as
---- this query is going to be used to promote the person with works the most on high priority tickets to a supervisor

SELECT Employee.employee_id ,Employee.Fname+ ' ' + Employee.Lname as 'Employee Name' , Support_ticket.priority, Support_ticket.Ticket_id
FROM Employee
INNER JOIN Support_rep ON Employee.Employee_id = Support_rep.Employee_id
inner join Support_ticket on employee.employee_id = Support_ticket.Emp_ID
WHERE Support_rep.Employee_id IN (
    SELECT Support_ticket.Emp_ID
    FROM Support_ticket
    WHERE Status = 'closed' 
)
ORDER BY Employee.Lname ASC;











