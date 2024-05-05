
CREATE TABLE aeroplanecapacity (
  aeroplanecapacityid int NOT NULL,
  totalcapacity int NOT NULL,
  economyclasscapacity int NOT NULL,
  premiumeconomyclasscapacity int NOT NULL,
  businessclasscapacity int NOT NULL,
  firstclasscapacity int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table aeroplanes
--

CREATE TABLE aeroplanes (
  aeroplanesid int NOT NULL,
  aeroplanetype varchar(10) check(aeroplanetype in ('goods','passenger')) NOT NULL,
  aeroplanecapacityid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinecrew
--

CREATE TABLE airlinecrew (
  crewid int NOT NULL,
  crewfirstname varchar(50) NOT NULL,
  crewlastname varchar(50) NOT NULL,
  crewgender char(1) NOT NULL,
  crewcountry varchar(20) NOT NULL,
  airlineid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinecrewphonenumber
--

CREATE TABLE airlinecrewphonenumber (
  airlinecrewphonenumberid int NOT NULL,
  airlinecrewid int NOT NULL,
  phonenumber int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlines
--

CREATE TABLE airlines (
  airlineid int NOT NULL,
  airlinename varchar(50) NOT NULL,
  totalaeroplanes int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinesaeroplanes
--

CREATE TABLE airlinesaeroplanes (
  airlinesaeroplanesid int NOT NULL,
  airlineid int NOT NULL,
  aeroplaneid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airports
--

CREATE TABLE airports (
  airportid int NOT NULL,
  airportname varchar(100) NOT NULL,
  airportcity varchar(100) NOT NULL,
  airportcountry varchar(100) NOT NULL,
  totalterminals int NOT NULL,
  totalrunways int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightcrew
--

CREATE TABLE flightcrew (
  flightcrewid int NOT NULL,
  flightid int NOT NULL,
  pilotid int NOT NULL,
  copilotid int NOT NULL,
  numberofairhostesses int NOT NULL,
  headairhostessid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightcrewhostess
--

CREATE TABLE flightcrewhostess (
  flightcrewhostessid int NOT NULL,
  flightcrewid int NOT NULL,
  airelinecrewid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightsgoing
--

CREATE TABLE flightsgoing (
  flightsgoingid int NOT NULL,
  airlinesaeroplanesid int NOT NULL,
  departureairportid int NOT NULL,
  arrivalairportid int NOT NULL,
  flighttype varchar(20) check(flighttype in ('Domestic','International')) NOT NULL,
  arrivaldate timestamp NOT NULL,
  departuredate timestamp NOT NULL,
  destinationdistance int NOT NULL,
  arrivalterminalid int NOT NULL,
  departureterminalid int NOT NULL,
  arrivalrunwayid int NOT NULL,
  departurerunwayid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengers
--

CREATE TABLE passengers (
  passengersid int NOT NULL,
  passengerfirstname varchar(50) NOT NULL,
  passengerlastname varchar(50) NOT NULL,
  passengergender char(1) NOT NULL,
  passengerage int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengersgoing
--

CREATE TABLE passengersgoing (
  passengersgoingid int NOT NULL,
  passengerid int NOT NULL,
  flightid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengersphonenumber
--

CREATE TABLE passengersphonenumber (
  passengersphonenumberid int NOT NULL,
  passengerid int NOT NULL,
  phonenumber int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table runways
--

CREATE TABLE runways (
  runwaysid int NOT NULL,
  runwayno int NOT NULL,
  airportid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table terminals
--

CREATE TABLE terminals (
  terminalsid int NOT NULL,
  terminalno int NOT NULL,
  terminalname int NOT NULL,
  airportid int NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table aeroplanecapacity
--
ALTER TABLE aeroplanecapacity
  ADD PRIMARY KEY (aeroplanecapacityid);

--
-- Indexes for table aeroplanes
--
ALTER TABLE aeroplanes
  ADD PRIMARY KEY (aeroplanesid);
ALTER TABLE aeroplanes
  ADD KEY aeroplanes_ibfk_2 (aeroplanecapacityid);

--
-- Indexes for table airlinecrew
--
ALTER TABLE airlinecrew
  ADD PRIMARY KEY (crewid);
ALTER TABLE airlinecrew
  ADD KEY airlineid (airlineid);

--
-- Indexes for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  ADD PRIMARY KEY (airlinecrewphonenumberid);
ALTER TABLE airlinecrewphonenumber
  ADD KEY airlinecrewid (airlinecrewid);

--
-- Indexes for table airlines
--
ALTER TABLE airlines
  ADD PRIMARY KEY (airlineid);

--
-- Indexes for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  ADD PRIMARY KEY (airlinesaeroplanesid);
ALTER TABLE airlinesaeroplanes
  ADD KEY airlineid (airlineid);
ALTER TABLE airlinesaeroplanes
  ADD KEY aeroplaneid (aeroplaneid);

--
-- Indexes for table airports
--
ALTER TABLE airports
  ADD PRIMARY KEY (airportid);

--
-- Indexes for table flightcrew
--
ALTER TABLE flightcrew
  ADD PRIMARY KEY (flightcrewid);
ALTER TABLE flightcrew
  ADD KEY pilotid (pilotid);
ALTER TABLE flightcrew
  ADD KEY copilotid (copilotid);
ALTER TABLE flightcrew
  ADD KEY headairhostessid (headairhostessid);
ALTER TABLE flightcrew
  ADD KEY flightid (flightid);

--
-- Indexes for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  ADD PRIMARY KEY (flightcrewhostessid);
ALTER TABLE flightcrewhostess
  ADD KEY flightcrewid (flightcrewid);

ALTER TABLE flightcrewhostess
  ADD KEY airelinecrewid (airelinecrewid);

--
-- Indexes for table flightsgoing
--
ALTER TABLE flightsgoing
  ADD PRIMARY KEY (flightsgoingid);
ALTER TABLE flightsgoing
  ADD KEY arrivalairportid (arrivalairportid);
ALTER TABLE flightsgoing
  ADD KEY departureairportid (departureairportid);
ALTER TABLE flightsgoing
  ADD KEY arrivalterminalid (arrivalterminalid);
ALTER TABLE flightsgoing
  ADD KEY departureterminalid (departureterminalid);
ALTER TABLE flightsgoing
  ADD KEY arrivalrunwayid (arrivalrunwayid);
ALTER TABLE flightsgoing
  ADD KEY departurerunwayid (departurerunwayid);
ALTER TABLE flightsgoing
  ADD KEY airlinesaeroplanesid (airlinesaeroplanesid);

--
-- Indexes for table passengers
--
ALTER TABLE passengers
  ADD PRIMARY KEY (passengersid);

--
-- Indexes for table passengersgoing
--
ALTER TABLE passengersgoing
  ADD PRIMARY KEY (passengersgoingid);
ALTER TABLE passengersgoing
  ADD KEY passengerid (passengerid);
ALTER TABLE passengersgoing
  ADD KEY flightid (flightid);

--
-- Indexes for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  ADD PRIMARY KEY (passengersphonenumberid);
ALTER TABLE passengersphonenumber
  ADD KEY passengerid (passengerid);

--
-- Indexes for table runways
--
ALTER TABLE runways
  ADD PRIMARY KEY (runwaysid);
ALTER TABLE runways
  ADD KEY airportid (airportid);

--
-- Indexes for table terminals
--
ALTER TABLE terminals
  ADD PRIMARY KEY (terminalsid);
ALTER TABLE terminals
  ADD KEY airportid (airportid);

--
-- for dumped tables
--

--
-- for table aeroplanecapacity
--
ALTER TABLE aeroplanecapacity
  MODIFY aeroplanecapacityid int NOT NULL;

--
-- for table aeroplanes
--
ALTER TABLE aeroplanes
  MODIFY aeroplanesid int NOT NULL;

--
-- for table airlinecrew
--
ALTER TABLE airlinecrew
  MODIFY crewid int NOT NULL;

--
-- for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  MODIFY airlinecrewphonenumberid int NOT NULL;

--
-- for table airlines
--
ALTER TABLE airlines
  MODIFY airlineid int NOT NULL;

--
-- for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  MODIFY airlinesaeroplanesid int NOT NULL;

--
-- for table flightcrew
--
ALTER TABLE flightcrew
  MODIFY flightcrewid int NOT NULL;

--
-- for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  MODIFY flightcrewhostessid int NOT NULL;


--
-- for table flightsgoing
--
ALTER TABLE flightsgoing
  MODIFY flightsgoingid int NOT NULL;

--
-- for table passengers
--
ALTER TABLE passengers
  MODIFY passengersid int NOT NULL;

--
-- for table passengersgoing
--
ALTER TABLE passengersgoing
  MODIFY passengersgoingid int NOT NULL;

--
-- for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  MODIFY passengersphonenumberid int NOT NULL;

--
-- for table runways
--
ALTER TABLE runways
  MODIFY runwaysid int NOT NULL;

--
-- for table terminals
--
ALTER TABLE terminals
  MODIFY terminalsid int NOT NULL;

--
-- Constraints for dumped tables
--

--
-- Constraints for table aeroplanes
--
ALTER TABLE aeroplanes
  ADD CONSTRAINT aeroplanes_ibfk_2 FOREIGN KEY (aeroplanecapacityid) REFERENCES aeroplanecapacity (aeroplanecapacityid);

--
-- Constraints for table airlinecrew
--
ALTER TABLE airlinecrew
  ADD CONSTRAINT airlinecrew_ibfk_1 FOREIGN KEY (airlineid) REFERENCES airlines (airlineid);

--
-- Constraints for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  ADD CONSTRAINT airlinecrewphonenumber_ibfk_1 FOREIGN KEY (airlinecrewid) REFERENCES airlinecrew (crewid);

--
-- Constraints for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  ADD CONSTRAINT airlinesaeroplanes_ibfk_1 FOREIGN KEY (airlineid) REFERENCES airlines (airlineid);
ALTER TABLE airlinesaeroplanes
  ADD CONSTRAINT airlinesaeroplanes_ibfk_2 FOREIGN KEY (aeroplaneid) REFERENCES aeroplanes (aeroplanesid);

--
-- Constraints for table flightcrew
--
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_1 FOREIGN KEY (pilotid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_2 FOREIGN KEY (copilotid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_3 FOREIGN KEY (headairhostessid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_4 FOREIGN KEY (flightid) REFERENCES flightsgoing (flightsgoingid);

--
-- Constraints for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  ADD CONSTRAINT flightcrewhostess_ibfk_1 FOREIGN KEY (flightcrewid) REFERENCES flightcrew (flightcrewid);

ALTER TABLE flightcrewhostess
  ADD CONSTRAINT flightcrewhostess_ibfk_2 FOREIGN KEY (airelinecrewid) REFERENCES airlinecrew (crewid);
--
-- Constraints for table flightsgoing
--
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_2 FOREIGN KEY (arrivalairportid) REFERENCES airports (airportid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_3 FOREIGN KEY (departureairportid) REFERENCES airports (airportid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_4 FOREIGN KEY (arrivalterminalid) REFERENCES terminals (terminalsid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_5 FOREIGN KEY (departureterminalid) REFERENCES terminals (terminalsid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_6 FOREIGN KEY (arrivalrunwayid) REFERENCES runways (runwaysid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_7 FOREIGN KEY (departurerunwayid) REFERENCES runways (runwaysid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_8 FOREIGN KEY (airlinesaeroplanesid) REFERENCES airlinesaeroplanes (airlinesaeroplanesid);

--
-- Constraints for table passengersgoing
--
ALTER TABLE passengersgoing
  ADD CONSTRAINT passengersgoing_ibfk_1 FOREIGN KEY (passengerid) REFERENCES passengers (passengersid);
ALTER TABLE passengersgoing
  ADD CONSTRAINT passengersgoing_ibfk_2 FOREIGN KEY (flightid) REFERENCES flightsgoing (flightsgoingid);

--
-- Constraints for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  ADD CONSTRAINT passengersphonenumber_ibfk_1 FOREIGN KEY (passengerid) REFERENCES passengers (passengersid);

--
-- Constraints for table runways
--
ALTER TABLE runways
  ADD CONSTRAINT runways_ibfk_1 FOREIGN KEY (airportid) REFERENCES airports (airportid);

--
-- Constraints for table terminals
--
ALTER TABLE terminals
  ADD CONSTRAINT terminals_ibfk_1 FOREIGN KEY (airportid) REFERENCES airports (airportid);
COMMIT;

