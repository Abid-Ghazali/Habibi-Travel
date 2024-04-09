CREATE TABLE Passenger (
PassengerID INTEGER NOT NULL,
FirstName VARCHAR(128) NOT NULL,
SecondName VARCHAR(128) NOT NULL,
Passnumber INTEGER NOT NULL,
EmailAdresse text NOT NULL,
Sex char NOT NULL,
PRIMARY KEY (PassengerID)
);



CREATE TABLE Payment (
TransactionID INTEGER,
Price DECIMAL,
PaymentStatus SMALLINT,
PassengerID INTEGER NOT NULL,
PRIMARY KEY (TRANSACTIONID),
FOREIGN KEY (PassengerID) REFERENCES Passenger (PassengerID)
ON DELETE CASCADE
);




Create table Ticket (
TicketID integer,
Class varchar(44),
Seatnumber integer,
Duration varchar(55),
PassengerID INTEGER NOT NULL,
TransactionID INTEGER,
foreign key(PassengerID) References Passenger(PassengerID),
foreign key(TransactionID) References Payment(TransactionID),	
Primary key(TicketID)
);


Create table flight(
FlightNumber integer,
DepartureTime Time,
ArrivalTime Time,
AirlineCompany varchar(88),
travlingDate date,
TicketID integer,
foreign key(TicketID) References Ticket(TicketID),
Primary Key(FlightNumber)
);

Create table Airport(
GateNumber integer,
City varchar(99),
Country varchar(88),
AirportName varchar(220),
FlightNumber integer,
foreign key(FlightNumber) References flight(FlightNumber)
);