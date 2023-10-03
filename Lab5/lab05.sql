DROP DATABASE IF EXISTS flying_carpets;
CREATE DATABASE flying_carpets;
USE flying_carpets;

CREATE TABLE CustomerState (
    PRIMARY KEY (Customer_State),
    Customer_State  VARCHAR(50)
);

CREATE TABLE CustomerInfo (
    PRIMARY KEY             (CustomerID),
    CustomerID              INT AUTO_INCREMENT,
    Customer_FirstName      VARCHAR(50),
    Customer_LastName       VARCHAR(50),
    Customer_StreetAddress  VARCHAR(50),
    Customer_City           VARCHAR(50),
    Customer_State          VARCHAR(50),
    Customer_Zipcode        VARCHAR(50),
    Customer_Phone          VARCHAR(50),
    FOREIGN KEY (Customer_State) REFERENCES CustomerState(Customer_State)
);

CREATE TABLE CarpetStyle (
    PRIMARY KEY (Carpet_Style),
    Carpet_Style    VARCHAR(50)
);

CREATE TABLE CarpetMaterial (
    PRIMARY KEY (Carpet_Material),
    Carpet_Material     VARCHAR(50)
);

CREATE TABLE CarpetCountry (
    PRIMARY KEY (Carpet_Country),
    Carpet_Country      VARCHAR(50)
);


CREATE TABLE Carpet_Inventory (
    PRIMARY KEY             (CarpetID),
    CarpetID                INT,
    Carpet_Style            VARCHAR(50),
    Carpet_Material         VARCHAR(50),
    Carpet_Country          VARCHAR(50),
    Carpet_Date_Made        VARCHAR(50),
    Carpet_Length           INT,
    Carpet_Width            INT,
    Carpet_Purchase_Price   INT,
    Date_Aquired            VARCHAR(50),
    Carpet_Markup           VARCHAR(50),
    Carpet_List_Price       INT,
    FOREIGN KEY (Carpet_Style) REFERENCES CarpetStyle(Carpet_Style),
    FOREIGN KEY (Carpet_Material) REFERENCES CarpetMaterial(Carpet_Material),
    FOREIGN KEY (Carpet_Country) REFERENCES CarpetCountry(Carpet_Country)
);

CREATE TABLE Purchases (
    PRIMARY KEY (CustomerID, CarpetID),
    CustomerID              INT,
    CarpetID                INT,
    Purchase_Date           VARCHAR(50),
    Purchase_Return_Date    VARCHAR(50),
    Customer_Purchase_Price INT,
    FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID),
    FOREIGN KEY (CarpetID)   REFERENCES Carpet_Inventory(CarpetID)
);

CREATE TABLE Carpet_Trials (
    PRIMARY KEY (CustomerID, CarpetID),
    CustomerID                      INT,
    CarpetID                        INT,
    Reservation_Start_Date          VARCHAR(50),
    Reservation_Exp_Return_Date     VARCHAR(50),
    Reservation_Act_Return_Date    VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID),
    FOREIGN KEY (CarpetID) REFERENCES Carpet_Inventory(CarpetID)
);  




INSERT INTO CustomerState (Customer_State)
VALUES  ('MI'),
        ('OH'),
        ('GA'),
        ('CA'),
        ('PA');

INSERT INTO CarpetStyle (Carpet_Style)
VALUES  ('Ushak'),
        ('Tabriz'),
        ('Agra');

INSERT INTO CarpetMaterial (Carpet_Material)
VALUES  ('Wool'),
        ('Silk');
        

INSERT INTO CarpetCountry (Carpet_Country)
VALUES  ('Turkey'),
        ('Iran'),
        ('India');

INSERT INTO CustomerInfo (Customer_FirstName,Customer_LastName,Customer_StreetAddress,
Customer_City,Customer_State,Customer_Zipcode,Customer_Phone)
VALUES  ('Ikira',   'Ingram',   '68 Country Drive',         'Roseville',        'MI','48066','926-252-6716'),
        ('Meredith','Spencer',  '9044 Piper Lane',          'North Royalton',   'OH','44133','817-530-5994'),
        ('Marco',   'Page',     '747 East Harrison Lane',   'Atlanta',          'GA','30303','588-799-6535'),
        ('Sandra',  'Page',     '47 East Harrison Lane',    'Atlanta',          'GA','30303','997-697-2666'),
        ('Gloria',  'Gomez',    '78 Corona Rd',             'Fullerton',        'CA','92831','000-000-0000'),
        ('Bira',    'Le',       '386 Silver Spear Ct',      'Coraopolis',       'PA','15108','000-000-0001');

INSERT INTO Carpet_Inventory (CarpetID,Carpet_Style,Carpet_Material,Carpet_Country,Carpet_Date_Made,Carpet_Length,
Carpet_Width,Carpet_Purchase_Price,Date_Aquired,Carpet_Markup,Carpet_List_Price)
VALUES  ('1214','Ushak',    'Wool','Turkey','1925','5', '7',    '625',  '4/6/17',   '100',  '1250'),
        ('1219','Tabriz',   'Silk','Iran',  '1910','10','14',   '28000','4/6/17',   '75',   '49000'),
        ('1277','Agra',     'Wool','India', '2017','8', '10',   '1200', '6/15/17',  '100',  '2400'),
        ('1278','Agra',     'Wool','India', '2017','4', '6',    '450',  '6/15/17',  '120',  '990'),
        ('1200','Agra',     'Wool','India', '2017','4', '6',    '450',  '6/15/17',  '120',  '990'),
        ('1201','Agra',     'Wool','India', '2017','4', '6',    '450',  '6/15/17',  '120',  '990'),
        ('1202','Agra',     'Wool','India', '2017','4', '6',    '450',  '6/15/17',  '120',  '990');

INSERT INTO Purchases (CustomerID,CarpetID,Purchase_Date,Purchase_Return_Date,Customer_Purchase_Price)
VALUES  ('5','1214','12/14/17','',         '990'),
        ('6','1277','12/24/17','',         '2400'),
        ('2','1219','12/24/17','12/26/17', '40000');

INSERT INTO Carpet_Trials (CustomerID, CarpetID,Reservation_Start_Date,Reservation_Exp_Return_Date,Reservation_Act_Return_Date)
VALUES  ('1','1200','10/1/23','10/31/23','10/15/23'),
        ('2','1201','11/1/23','11/30/23','11/20/23'),
        ('3','1202','12/1/23','12/30/23','12/26/23');
