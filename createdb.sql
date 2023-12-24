CREATE TABLE Customer (
  CustomerID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Street VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  State VARCHAR(255) NOT NULL,
  Zipcode INT NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Package (
  PackageID INT NOT NULL AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  Weight NUMERIC NOT NULL,
  Dimensions VARCHAR(255) NOT NULL,
  TransportationID INT NOT NULL,
  SenderID INT NOT NULL,
  ReceiverID INT NOT NULL,
 PRIMARY KEY (PackageID),
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
  FOREIGN KEY (TransportationID) REFERENCES Transportation (TransportationID),
  FOREIGN KEY (SenderID) REFERENCES Customer (CustomerID),
  FOREIGN KEY (ReceiverID) REFERENCES Customer (CustomerID)
);

CREATE TABLE Transportation (
  TransportationID INT NOT NULL AUTO_INCREMENT,
  Type VARCHAR(255) NOT NULL,
  LicenseNumber VARCHAR(255) NOT NULL,
  PRIMARY KEY (TransportationID)
);

CREATE TABLE Location (
  LocationID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
 Type VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  PRIMARY KEY (LocationID)
);

CREATE TABLE PackageHistory (
  LocationID INT NOT NULL,
  PackageID INT NOT NULL,
  ArrivalTime DATETIME NOT NULL,
  DepartureTime DATETIME NOT NULL,
  FOREIGN KEY (LocationID) REFERENCES Location (LocationID),
  FOREIGN KEY (PackageID) REFERENCES Package (PackageID)
);
