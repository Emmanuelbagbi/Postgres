CREATE TABLE UsersX(
    UserID INT PRIMARY KEY,
	UserName VARCHAR(50),
	UserType VARCHAR(50),
	email VARCHAR(50),
	PhoneNumber VARCHAR(15)
)

CREATE TABLE VehiclesX (
    VehicleID INT PRIMARY KEY,
	DriverID INT,
	VehicleType VARCHAR(20),
	VehicleModel VARCHAR(30),
	VehicleNumber VARCHAR(15),
	FOREIGN KEY(DriverID) REFERENCES Users(UserID)
)

CREATE TABLE RidesX(
    RideID INT PRIMARY KEY,
	RiderID INT,
	DriverID INT,
	PickupLocationID INT,
	DropOffLocationID INT,
	RideStatus VARCHAR(20),  -- Completed, cancelled, waiting
	Fare DECIMAL(5, 2),
	RideDate DATE,
	FOREIGN KEY(RiderID) REFERENCES Users(UserID),
	FOREIGN KEY(DriverID) REFERENCES Users(UserID),
	FOREIGN KEY(PickupLocationID) REFERENCES Locations(LocationID),
	FOREIGN KEY(DropOffLocationID) REFERENCES Locations(LocationID)
)

CREATE TABLE LocationsX(
    LocationID INT PRIMARY KEY,
	LocationName VARCHAR(50),
	Latitude DECIMAL (8, 6),
	Longitude DECIMAL (9, 6)
)

CREATE TABLE PaymentsX(
    PaymentID INT PRIMARY KEY,
	RideID INT,
	Amount DECIMAL (5, 2),
	PaymentDate DATE,
	PaymentStatus VARCHAR(20), -- paid, pending, fail
	PaymentMethod VARCHAR(20), -- Cash, Credit card
	FOREIGN KEY (RideID) REFERENCES Rides(RideID)
)

INSERT INTO Users (UserID, UserName, UserType, Email, PhoneNumber) VALUES
(1, 'Alice', 'Rider', 'alice@example.com', '1234567890'),
(2, 'Bob', 'Driver', 'bob@example.com', '1234567891'),
(3, 'Charlie', 'Rider', 'charlie@example.com', '1234567892'),
(4, 'David', 'Driver', 'david@example.com', '1234567893'),
(5, 'Eva', 'Rider', 'eva@example.com', '1234567894'),
(6, 'Frank', 'Driver', 'frank@example.com', '1234567895');


INSERT INTO VehiclesX (VehicleID, DriverID, VehicleType, VehicleModel, VehicleNumber) VALUES
(1, 2, 'Car', 'Toyota Prius', 'ABC123'),
(2, 4, 'Car', 'Honda Civic', 'XYZ789'),
(3, 6, 'Motorbike', 'Yamaha MT-15', 'LMN456');


INSERT INTO Locations (LocationID, LocationName, Latitude, Longitude) VALUES
(1, 'Downtown', 37.7749, -122.4194),
(2, 'Airport', 37.6213, -122.3790),
(3, 'Central Park', 40.7851, -73.9683),
(4, 'City Hall', 34.0522, -118.2437);


INSERT INTO RidesX (RideID, RiderID, DriverID, PickupLocationID, DropoffLocationID, RideStatus, Fare, RideDate) VALUES
(1, 1, 2, 1, 2, 'Completed', 20.50, '2024-10-01'),
(2, 3, 4, 2, 3, 'Cancelled', 0.00, '2024-10-02'),
(3, 5, 6, 1, 4, 'Completed', 15.00, '2024-10-03'),
(4, 1, 2, 3, 1, 'Completed', 25.00, '2024-10-04'),
(5, 3, 6, 4, 2, 'Completed', 18.00, '2024-10-05'),
(6, 5, 4, 2, 3, 'Completed', 35.00, '2024-11-11');

-- drop table Rides CASCADE

INSERT INTO Payments (PaymentID, RideID, Amount, PaymentDate, PaymentStatus, PaymentMethod) VALUES
(1, 1, 20.50, '2024-10-01', 'Paid', 'Credit Card'),
(2, 3, 15.00, '2024-10-03', 'Paid', 'Cash'),
(3, 4, 25.00, '2024-10-04', 'Pending', 'Credit Card'),
(4, 5, 18.00, '2024-10-05', 'Paid', 'Credit Card');


select * from ridesX
select * from users

select DRIVERS.UserName AS DriverName, Riders.UserName AS RiderName,
Rides.rideid, Rides.RideStatus,Rides.fare, Rides.RideDate
FROM rides
INNER JOIN Users as drivers ON DRIVERS.userID =Rides.driverID
INNER JOIN Users as Riders ON Riders.userID =Rides.RiderID
where RIDES.rideStatus ='completed'


-- QUESTION 1
SELECT DRIVERS.UserName as DriverName, Riders.UserName as RiderName, 
Rides.rideid, Rides.RideStatus, Rides.fare, Rides.RideDate from Rides
INNER JOIN Users as DRIVERS ON DRIVERS.UserID = Rides.driverID
INNER JOIN USERS AS Riders ON Riders.userID = Rides.riderID
where RIDES.rideStatus = 'Completed'


-- QUESTION 2
select pickup.locationName as PickupLocation, dropOff.locationName as DropoffLocation,
Rides.rideid, Rides.fare from Rides
inner join Locations as pickup ON pickup.locationID = Rides.pickupLocationID
inner join Locations as dropoff on dropOff.locationID = Rides.dropoffLocationID


INSERT INTO UsersX (UserID, UserName, UserType, Email, PhoneNumber) VALUES
(1, 'Alice', 'Rider', 'alice@example.com', '1234567890'),
(2, 'Bob', 'Driver', 'bob@example.com', '1234567891'),
(3, 'Charlie', 'Rider', 'charlie@example.com', '1234567892'),
(4, 'David', 'Driver', 'david@example.com', '1234567893'),
(5, 'Eva', 'Rider', 'eva@example.com', '1234567894'),
(6, 'Frank', 'Driver', 'frank@example.com', '1234567895');


INSERT INTO Vehicles (VehicleID, DriverID, VehicleType, VehicleModel, VehicleNumber) VALUES
(1, 2, 'Car', 'Toyota Prius', 'ABC123'),
(2, 4, 'Car', 'Honda Civic', 'XYZ789'),
(3, 6, 'Motorbike', 'Yamaha MT-15', 'LMN456');


INSERT INTO LocationsX (LocationID, LocationName, Latitude, Longitude) VALUES
(1, 'Downtown', 37.7749, -122.4194),
(2, 'Airport', 37.6213, -122.3790),
(3, 'Central Park', 40.7851, -73.9683),
(4, 'City Hall', 34.0522, -118.2437);


INSERT INTO RidesX (RideID, RiderID, DriverID, PickupLocationID, DropoffLocationID, RideStatus, Fare, RideDate) VALUES
-- (1, 1, 2, 1, 2, 'Completed', 20.50, '2024-10-01'),
-- (2, 3, 4, 2, 3, 'Cancelled', 0.00, '2024-10-02'),
-- (3, 5, 6, 1, 4, 'Completed', 15.00, '2024-10-03'),
-- (4, 1, 2, 3, 1, 'Completed', 25.00, '2024-10-04'),
-- (5, 3, 6, 4, 2, 'Completed', 18.00, '2024-10-05');
(6, 5, 4, 2, 3, 'Completed', 35.00, '2024-11-11');


INSERT INTO PaymentsX (PaymentID, RideID, Amount, PaymentDate, PaymentStatus, PaymentMethod) VALUES
(1, 1, 20.50, '2024-10-01', 'Paid', 'Credit Card'),
(2, 3, 15.00, '2024-10-03', 'Paid', 'Cash'),
(3, 4, 25.00, '2024-10-04', 'Pending', 'Credit Card'),
(4, 5, 18.00, '2024-10-05', 'Paid', 'Credit Card');

select * from PaymentsX