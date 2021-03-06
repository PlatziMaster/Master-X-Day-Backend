CREATE TABLE Users
    (IDUser INT NOT NULL ,
    UserName VARCHAR(40) ,
    PassWord VARCHAR (15) ,
    Email VARCHAR(30) ,
    CONSTRAINT PK_Users PRIMARY KEY (IDUser));

CREATE TABLE Airports
    (IDAirport INT NOT NULL ,
    IataCode VARCHAR (15) NOT NULL ,
    AirportName VARCHAR (100) ,
    CONSTRAINT PK_Airports PRIMARY KEY (IDAirport) ,
    CONSTRAINT UK_IataCode UNIQUE (IataCode));

CREATE TABLE Status
    (IDStatus INT NOT NULL ,
    Name VARCHAR (5),
    Description VARCHAR(30) ,
    CONSTRAINT PK_Status PRIMARY KEY (IDStatus));

CREATE TABLE Routes
    (IDRoute INT NOT NULL ,
    IDDepartured INT NOT NULL ,
    IDArrieved INT NOT NULL ,
    Name VARCHAR (30) ,
    CONSTRAINT PK_Routes PRIMARY KEY (IDRoute) ,
    CONSTRAINT FK_Departured FOREIGN KEY (IDDepartured) REFERENCES Airports (IDAirport) ,
    CONSTRAINT FK_Arrieved FOREIGN KEY (IDArrieved) REFERENCES Airports (IDAirport));

CREATE TABLE Flights
    (IDFlight INT NOT NULL ,
    IDRoute INT NOT NULL ,
    IDStatus INT NOT NULL ,
    ArrievedTime TIMESTAMP ,
    DeparturedTime TIMESTAMP ,
    BordingGate VARCHAR (10) ,
    PassengerNumber INT ,
    CONSTRAINT PK_Flights PRIMARY KEY (IDFlight) ,
    CONSTRAINT FK_Route FOREIGN KEY (IDRoute) REFERENCES Routes (IDRoute) ,
    CONSTRAINT FK_Status FOREIGN KEY (IDStatus) REFERENCES Status (IDStatus));

CREATE TABLE Bookings
    (IDBooking INT NOT NULL ,
    IDUser INT NOT NULL ,
    IDFlight INT NOT NULL ,
    ReservationDate TIMESTAMP ,
    CONSTRAINT PK_Bookings PRIMARY KEY (IDBooking) ,
    CONSTRAINT FK_User FOREIGN KEY (IDUser) REFERENCES Users (IDUser) ,
    CONSTRAINT FK_Flight FOREIGN KEY (IDFlight) REFERENCES Flights (IDFlight));