Create table Car(
    CarID INT auto_increment,
    Make VARCHAR(20) NOT NULL,
    Model VARCHAR(10) NOT NULL,
    ManufacturyYear DATE,
    Horsepower INT,
    Engine DOUBLE,
    Acceleration DOUBLE,
    TopSpeed INT,
    Primary key (CarID)
);

Create table Manufacturers(
    ManufacturyID INT auto_increment,
    Make VARCHAR(20) NOT NULL,
    Country VARCHAR(15) NOT NULL,
    Primary key (ManufacturyID)
);

Create table User(
    UserID INT auto_increment,
    Username VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(20) NOT NULL,
    RegistrationDate DATE,
    Primary key (UserID)
);

Create table Review(
    ReviewID INT auto_increment,
    CarID INT,
    UserID INT,
    Rating Double,
    Comment TEXT,
    Primary key (ReviewID),
    Foreign key (CarID) references Car(CarID),
    Foreign key (UserID) references User(UserID) 
);

