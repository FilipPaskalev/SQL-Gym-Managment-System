CREATE TABLE "PersonDetails" (
	"PersonID" INT NOT NULL,
	"PhotoID" INT NOT NULL,
	"AddressID" INT NOT NULL,
	"FirstName" VARCHAR2(25) NOT NULL,
	"MiddleName" VARCHAR2(25),
	"SureName" VARCHAR2(25) NOT NULL,
	"PhoneNumber" VARCHAR2(20),
	constraint PERSONDETAILS_PK PRIMARY KEY ("PersonID"));

CREATE TABLE "Employees" (
	"EmployeeID" INT NOT NULL,
	"ContractID" INT NOT NULL,
	"PersonID" INT UNIQUE NOT NULL,
	"PhotoID" INT NOT NULL,
	"Salary" DECIMAL NOT NULL,
	constraint EMPLOYEES_PK PRIMARY KEY ("EmployeeID"));

CREATE TABLE "Contracts" (
	"ContractID" INT NOT NULL,
	"StartDate" TIMESTAMP NOT NULL,
	"EndDate" TIMESTAMP NOT NULL,
	"Location" VARCHAR2(4000) NOT NULL,
	"Position" VARCHAR2(25) NOT NULL,
	"Note" VARCHAR2(4000),
	constraint CONTRACTS_PK PRIMARY KEY ("ContractID"));

CREATE TABLE "ClubMembers" (
	"MemberID" INT NOT NULL,
	"PersonID" INT NOT NULL,
	"StartDate" TIMESTAMP NOT NULL,
	"EndDate" TIMESTAMP NOT NULL,
	constraint CLUBMEMBERS_PK PRIMARY KEY ("MemberID"));

CREATE TABLE "Photos" (
	"PhotoID" INT NOT NULL,
	"Location" VARCHAR2(4000),
	constraint PHOTOS_PK PRIMARY KEY ("PhotoID"));

CREATE TABLE "Addresses" (
	"AddressID" INT NOT NULL,
	"Street" VARCHAR2(50) NOT NULL,
	"Postcode" VARCHAR2(12) NOT NULL,
	"Note" VARCHAR2(256) NOT NULL,
	constraint ADDRESSES_PK PRIMARY KEY ("AddressID"));

CREATE TABLE "Schedule" (
	"CourseID" INT NOT NULL,
	"EmployeeID" INT NOT NULL,
	"MemberID" INT NOT NULL,
	"StartTime" TIMESTAMP NOT NULL,
	"EndTime" TIMESTAMP NOT NULL,
	"Date" TIMESTAMP NOT NULL);

CREATE TABLE "Equipment" (
	"EquipmentID" INT NOT NULL,
	"PhotoID" INT NOT NULL,
	"DateOfBuy" TIMESTAMP NOT NULL,
	"Price" DECIMAL NOT NULL,
	constraint EQUIPMENT_PK PRIMARY KEY ("EquipmentID"));

CREATE TABLE "Sales" (
	"SaleID" INT NOT NULL,
	"ProductID" INT NOT NULL,
	"PriceAfterDiscount" DECIMAL NOT NULL,
	"Discount" DECIMAL,
	"MemberID" INT,
	constraint SALES_PK PRIMARY KEY ("SaleID"));

CREATE TABLE "Products" (
	"ProductID" INT NOT NULL,
	"Name" VARCHAR2(50) NOT NULL,
	"Price" DECIMAL NOT NULL,
	constraint PRODUCTS_PK PRIMARY KEY ("ProductID"));

CREATE TABLE "Salaries" (
	"EmployeeID" TIMESTAMP NOT NULL,
	"PayDay" TIMESTAMP NOT NULL,
	"Transaction" INT NOT NULL,
	"Amount" DECIMAL NOT NULL);

CREATE TABLE "Courses" (
	"CourseID" INT NOT NULL,
	"CourseName" VARCHAR2(255) NOT NULL,
	constraint COURSES_PK PRIMARY KEY ("CourseID"));

ALTER TABLE "PersonDetails" ADD CONSTRAINT "PersonDetails_fk0" FOREIGN KEY ("PhotoID") REFERENCES "Photos"("PhotoID");
ALTER TABLE "PersonDetails" ADD CONSTRAINT "PersonDetails_fk1" FOREIGN KEY ("AddressID") REFERENCES "Addresses"("AddressID");

ALTER TABLE "Employees" ADD CONSTRAINT "Employees_fk0" FOREIGN KEY ("ContractID") REFERENCES "Contracts"("ContractID");
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_fk1" FOREIGN KEY ("PersonID") REFERENCES "PersonDetails"("PersonID");
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_fk2" FOREIGN KEY ("PhotoID") REFERENCES "Photos"("PhotoID");

ALTER TABLE "ClubMembers" ADD CONSTRAINT "ClubMembers_fk0" FOREIGN KEY ("PersonID") REFERENCES "PersonDetails"("PersonID");

ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_fk0" FOREIGN KEY ("CourseID") REFERENCES "Courses"("CourseID");
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_fk1" FOREIGN KEY ("EmployeeID") REFERENCES "Employees"("EmployeeID");
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_fk2" FOREIGN KEY ("MemberID") REFERENCES "ClubMembers"("MemberID");

ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_fk0" FOREIGN KEY ("PhotoID") REFERENCES "Photos"("PhotoID");

ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk0" FOREIGN KEY ("ProductID") REFERENCES "Products"("ProductID");
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk1" FOREIGN KEY ("MemberID") REFERENCES "ClubMembers"("MemberID");

ALTER TABLE "Salaries" ADD CONSTRAINT "Salaries_fk0" FOREIGN KEY ("EmployeeID") REFERENCES "Employees"("EmployeeID");


