-- CREATE TABLE Users(
-- 	UserID INT PRIMARY KEY,
-- 	UserName VARCHAR(50), -- RIDER, DRIVER, ADMIN
-- 	email VARCHAR(50),
-- 	PhoneNumber VARCHAR(50)
-- )

CREATE TABLE Vehicles(
	VehiclesID INT PRIMARY KEY,
	DriverID INT,
	VehiclesType VARCHAR(20),
	VehiclesModel VARCHAR(30),
	VehicleNumber VARCHAR(15),
	FOREIGN KEY (DriverID) REFERENCES Users(UserID)
);



CREATE TABLE Users(
	UserID INT PRIMARY KEY,
	UserName VARCHAR(50),
	UserType VARCHAR (50),
	Email VARCHAR(50),
	PhoneNumber VARCHAR (15)
);


	
	
CREATE table Rides(
	RideID INT PRIMARY KEY,
	RiderID INT,
	DriverID INT,
	PickupLocationID INT,
	DropofLocationID INT,
	RideStatus VARCHAR(20), --Completed, Cancelled, writting
	Fare DECIMAL(5,2),
	RideDate DATE,

	FOREIGN KEY(RiderID) REFERENCES Users(UserID),
	FOREIGN KEY(DriverID) REFERENCES Users(UserID),
	FOREIGN KEY(PickupLocationID) REFERENCES Locations(LocationID),
	FOREIGN KEY(DropofLocationID) REFERENCES Locations(LocationID)
)

CREATE TABLE Locations (
	LocationID INT PRIMARY KEY,
	LocationName VARCHAR(50),
	Latitude DECIMAL (8,6),
	Longitude DECIMAL (9,8)
);


CREATE TABLE payments (
	PaymentID INT PRIMARY KEY,
	RideID INT,
	Amount DECIMAL (5,2),
	PaymentDate DATE,
	PaymentStatus VARCHAR(20), --Paid, Pending, Fail,
	PaymentMethod VARCHAR(20), --CASH, Credit card
	FOREIGN KEY (RideID) REFERENCES Rides(RideID)
)


INSERT INTO Users (UserID, UserName, UserType, Email, PhoneNumber) VALUES
(1, 'Alice', 'Rider', 'alice@example.com', '1234567890'),
(2, 'Bob', 'Driver', 'bob@example.com', '1234567891'),
(3, 'Charlie', 'Rider', 'charlie@example.com', '1234567892'),
(4, 'David', 'Driver', 'david@example.com', '1234567893'),
(5, 'Eva', 'Rider', 'eva@example.com', '1234567894'),
(6, 'Frank', 'Driver', 'frank@example.com', '1234567895');


INSERT INTO Vehicles (VehiclesID, DriverID, VehiclesType, VehiclesModel, VehicleNumber) VALUES
(1, 2, 'Car', 'Toyota Prius', 'ABC123'),
(2, 4, 'Car', 'Honda Civic', 'XYZ789'),
(3, 6, 'Motorbike', 'Yamaha MT-15', 'LMN456');


INSERT INTO Locations (LocationID, LocationName, Latitude, Longitude) VALUES
(1, 'Downtown', 37.7749, -122.4194),
(2, 'Airport', 37.6213, -122.3790),
(3, 'Central Park', 40.7851, -73.9683),
(4, 'City Hall', 34.0522, -118.2437);


INSERT INTO Rides (RideID, RiderID, DriverID, PickupLocationID, DropoffLocationID, RideStatus, Fare, RideDate) VALUES
(1, 1, 2, 1, 2, 'Completed', 20.50, '2024-10-01'),
(2, 3, 4, 2, 3, 'Cancelled', 0.00, '2024-10-02'),
(3, 5, 6, 1, 4, 'Completed', 15.00, '2024-10-03'),
(4, 1, 2, 3, 1, 'Completed', 25.00, '2024-10-04'),
(5, 3, 6, 4, 2, 'Completed', 18.00, '2024-10-05');
(6, 5, 4, 2, 3, 'Completed', 35.00, '2024-11-11');


INSERT INTO Payments (PaymentID, RideID, Amount, PaymentDate, PaymentStatus, PaymentMethod) VALUES
(1, 1, 20.50, '2024-10-01', 'Paid', 'Credit Card'),
(2, 3, 15.00, '2024-10-03', 'Paid', 'Cash'),
(3, 4, 25.00, '2024-10-04', 'Pending', 'Credit Card'),
(4, 5, 18.00, '2024-10-05', 'Paid', 'Credit Card');


select * from Users;