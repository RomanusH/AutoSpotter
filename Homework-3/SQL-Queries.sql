Create table Car(##step 1 will be created some tables
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
##step 2 datas will be provided to tables
INSERT into Car(Make, Model, ManufacturyYear, Horsepower, Engine, Acceleration, TopSpeed) 
values('Audi','RS6 MTM','2013-04-02',722,4.0,3.4,340);

INSERT into Car(Make, Model, ManufacturyYear, Horsepower, Engine, Acceleration, TopSpeed) 
values('Mercedes-Benz','E63S','2013-03-09',585,5.5,3.7,250);

INSERT into Car(Make, Model, ManufacturyYear, Horsepower, Engine, Acceleration, TopSpeed) 
values('Porsche','911 GT3','2013-01-15',475,3.8,3.5,315);

INSERT into Car(Make, Model, ManufacturyYear, Horsepower, Engine, Acceleration, TopSpeed) 
values('Lexus','LFA','2012-12-10',560,4.8,3.7,325);

INSERT into Manufacturers(Make, Country) values('Audi','Germany');

INSERT into Manufacturers(Make, Country) values('Mercedes-Benz','Germany');

INSERT into Manufacturers(Make, Country) values('Porsche','Germany');

INSERT into Manufacturers(Make, Country) values('Lexus','Japan');

INSERT into User(Username, Email, Password, RegistrationDate)
values('RomanusH','samplemail12@gmail.com','1234','2023-10-30');

INSERT into User(Username, Email, Password, RegistrationDate)
values('AydinVA','samplemail12234@gmail.com','0987','2023-10-29');

INSERT into User(Username, Email, Password, RegistrationDate)
values('AbbasliSS','samplemail40@gmail.com','4023','2023-10-30');

INSERT into Review(CarID,UserID,Rating,Comment) 
values(1,1,4.9,'Excellent family car for fast Fathers:)');
INSERT into Review(CarID,UserID,Rating,Comment) 
values(3,2,4.5,'Nice handling and the best looking targa car.');
INSERT into Review(CarID,UserID,Rating,Comment)  
values(4,1,5,'Best sounding V10 of all time!');
INSERT into Review(CarID,UserID,Rating,Comment)
values(2,3,4.7,'Mercedes-Benz,The Best or Nothing!');
##step 3 sql queries will be written

##we are going to do most ranked car list amongst the users
select c.carID, c.Model, AVG(u.Rating) as average_rating
from car c
left join review u on c.carID = u.carID
group by c.carID, c.model
order by average_rating DESC;

##now we will select the highest rated car
select c.carID, c.model, AVG(u.rating) as average_rating
from car c
left join review u on c.carID = u.carID
group by c.carID, c.model
order by average_rating DESC
limit 1;
